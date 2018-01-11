
local verses = {
    [1] = {
        animal = "fly",
        ending = "I don't know why she swallowed the fly. Perhaps she'll die."
    },
    [2] = {
        animal = "spider",
        comment = "It wriggled and jiggled and tickled inside her.",
        fact = " that wriggled and jiggled and tickled inside her", -- I got lazy here. :P
    },
    [3] = {
        animal = "bird",
        comment = "How absurd to swallow a bird!",
    },
    [4] = {
        animal = "cat",
        comment = "Imagine that, to swallow a cat!",
    },
    [5] = {
        animal = "dog",
        comment = "What a hog, to swallow a dog!",
    },
    [6] = {
        animal = "goat",
        comment = "Just opened her throat and swallowed a goat!",
    },
    [7] = {
        animal = "cow",
        comment = "I don't know how she swallowed a cow!",
    },
    [8] = {
        animal = "horse",
        ending = "She's dead, of course!",
    },
}

-- Get one verse.
local function get_verse(num)
    local curr_verse = verses[num]
    if curr_verse then
        local beginning = "I know an old lady who swallowed a %s.\n"
        local to_catch = "She swallowed the %s to catch the %s%s.\n"

        -- Start with the beginning phrase.
        local result = beginning:format(assert(curr_verse.animal, "Missing the 'animal' field!"))

        if curr_verse.comment then
            result = result .. curr_verse.comment .. "\n"
        end

        -- Go until we find an ending verse.
        while not curr_verse.ending do
            num = num - 1
            assert(num > 0, "No ending verse!")

            local next_verse = assert(verses[num], "No next verse!")
            result = result .. to_catch:format(curr_verse.animal, next_verse.animal, next_verse.fact or "")
            curr_verse = verses[num]
        end

        -- End with the final phrase.
        return result .. curr_verse.ending .. "\n"
    end
end

-- Get verse inclusively between from and to
local function get_verses(from, to)
    local result = ""
    for i = from, to do
        result = result .. get_verse(i) .. "\n"
    end

    return result
end

-- Get all the verses.
local function get_song()
    return get_verses(1, #verses)
end

return {
    verse = get_verse,
    verses = get_verses,
    sing = get_song,
}
