
local function is_open(ch)
    local valid =
    {
        ["("] = true,
        ["["] = true,
        ["{"] = true,
    }

    return valid[ch or false] or false
end

local function get_matching(ch)
    local bracket = {
        ["("] = ")",
        [")"] = "(",
        ["["] = "]",
        ["]"] = "[",
        ["{"] = "}",
        ["}"] = "{",
    }

    return bracket[ch or false] or nil
end

local function is_valid(str)
    -- Remove everything that's not a bracket.
    local sanitized = str:gsub("[^%(%)%{%}%[%]]", "")
    local stack = {}
    for i = 1, #sanitized do
        -- Get first character.
        local ch = sanitized:sub(i,i)

        -- Push open brackets onto stack.
        if is_open(ch) then
            table.insert(stack, ch)
        else
            -- There should be an open bracket in the stack. If not, then we're
            -- unbalanced.
            if #stack == 0 then
                return false
            end

            -- Get the matching bracket we're trying to close.
            local open = assert(get_matching(ch))

            -- If the top element doesn't match, then we're improperly nested
            -- or potentially unbalanced.
            if table.remove(stack, #stack) ~= open then
                return false
            end
        end
    end

    if #stack ~= 0 then
        return false
    end

    return true
end

local m = {
    valid = is_valid,
}

return m
