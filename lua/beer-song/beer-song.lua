
local verse_tmpl =
{
    [0] = "No more bottles of beer on the wall, no more bottles of beer.\n"..
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    [1] = "1 bottle of beer on the wall, 1 bottle of beer.\n"..
          "Take it down and pass it around, no more bottles of beer on the wall.\n",
    [2] = "2 bottles of beer on the wall, 2 bottles of beer.\n"..
          "Take one down and pass it around, 1 bottle of beer on the wall.\n",
    x   = "%d bottles of beer on the wall, %d bottles of beer.\n" ..
          "Take one down and pass it around, %d bottles of beer on the wall.\n",
}

local function verse(num)
    return verse_tmpl[num] or verse_tmpl.x:format(num, num, num-1)
end

local function sing(num_start, num_end)
    local result = verse(num_start)
    for i = num_start-1, num_end or 0, -1 do
        result = result .. "\n" .. verse(i)
    end
    return result
end

return {
    verse = verse,
    sing = sing
}
