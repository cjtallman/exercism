local function sorted_anagram(word)
    -- Dump letters into a table so we can sort.
    local res = {}
    for c in word:lower():gmatch("[a-z]") do
        table.insert(res, c)
    end

    table.sort(res)

    -- Rebuild as a string.
    return table.concat(res, "")
end

local function memoize_anagram(t, word)
    if t._anagrams[word] == nil then
        t._anagrams[word] = sorted_anagram(word)
    end
    return t._anagrams[word]
end

return {
    new = function(_, input)
        return {
            -- Store sorted anagrams.
            _anagrams = {},

            -- Look for anagram matches.
            match = function(t, opts)
                -- This is what we're testing against.
                local truth = memoize_anagram(t, input)

                -- This table will contain any matches found.
                local result = {}
                for _, word in pairs(opts) do
                    -- Check if sorted anagrams match.
                    if memoize_anagram(t, word) == truth then
                        table.insert(result, word)
                    end
                end
                return result
            end,
        }
    end,
}
