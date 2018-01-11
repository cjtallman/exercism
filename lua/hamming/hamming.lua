
local is_string = function(x) return type(x) == "string" end
local is_same_length = function(x, y) return #x == #y end

return
{
    compute = function(x, y)
        -- Validate arguments.
        --  Both should be strings.
        --  Both should have same length.
        if is_string(x) and is_string(y) and is_same_length(x, y) then

            -- Initally, assume no differences.
            local diff = 0

            -- Iterate over each character.
            for i = 1, #x do
                -- Compare character at same offset from inputs.
                if x:byte(i) ~= y:byte(i) then
                    -- If different, count it.
                    diff = diff + 1
                end
            end

            -- Return the accumulated difference count.
            return diff
        else
            -- Signal invalid usage.
            return -1, "Invalid argment(s). Expected two strings of equal length."
        end
    end,
}
