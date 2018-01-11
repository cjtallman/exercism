
local lines = {
    [1] = {"house", nil, "Jack built."},
    [2] = {"malt", nil, "lay in the"},
    [3] = {"rat", nil, "ate the"},
    [4] = {"cat", nil, "killed the"},
    [5] = {"dog", nil, "worried the"},
    [6] = {"cow", "with the crumpled horn", "tossed the"},
    [7] = {"maiden", "all forlorn", "milked the"},
    [8] = {"man", "all tattered and torn", "kissed the"},
    [9] = {"priest", "all shaven and shorn", "married the"},
    [10] = {"rooster", "that crowed in the morn", "woke the"},
    [11] = {"farmer", "sowing his corn", "kept the"},
    [12] = {"horse and the hound and the horn", nil, "belonged to the"},
}

local verse = function(i)
    local verse = "This is the"
    while i > 0 do
        verse = verse .. " " .. lines[i][1]

        -- Not all lines include premodifier.
        if lines[i][2] then
            verse = verse .. " " .. lines[i][2]
        end

        -- Initial verse should be on one line.
        if i > 1 then
            verse = verse .. "\nthat " .. lines[i][3]
        else
            verse = verse .. " that " .. lines[i][3]
        end

        i = i - 1
    end

    return verse
end

local recite = function()
    local verses = {}
    for i = 1, #lines do
        verses[i] = verse(i)
    end
    return table.concat(verses, "\n")
end

return {
    verse = verse,
    recite = recite,
}
