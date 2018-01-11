local function encode(nums)
    local results = {}

    for _, v in ipairs(nums) do
        local groups = {}

        -- Convert to base 128.
        repeat
            table.insert(groups, 1, math.floor(v) % 128)
            v = v / 128
        until v < 1

        -- Encode 7-bit bytes.
        for i, byte in ipairs(groups) do
            -- Set bit 7 if more data follows.
            if i < #groups then
                byte = byte + 128
            end

            table.insert(results, byte)
        end
    end

    return results
end

local function decode(nums)
    local results = {}
    local group = {}

    for _, v in ipairs(nums) do
        -- Test bit 7
        local more = v % 256 >= 128

        -- Get bits 0-6
        local byte = more and (v - 128) or v

        table.insert(group, 1, byte)

        -- Decode by combining 7-bit bytes.
        if not more then
            local byte = 0
            for i = 1, #group do
                byte = byte + group[i] * (128 ^ (i - 1))
            end
            table.insert(results, byte)
            group = {}
        end
    end

    -- Test that we weren't expecting more data.
    assert(#group == 0, "incomplete byte sequence")

    return results
end

return
{
    decode = decode,
    encode = encode,
}
