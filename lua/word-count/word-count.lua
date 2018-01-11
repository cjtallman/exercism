
return {
    word_count = function(str)
        local counts = {}
        for k in str:gmatch("%w+") do
            local word = k:lower()
            counts[word] = (counts[word] or 0) + 1
        end
        return counts
    end,
}
