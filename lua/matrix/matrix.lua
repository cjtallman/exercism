
return function(s)
    assert(type(s) == "string", "Expected single string argument.")

    local rows = {}
    local cols = {}
    local current_row = 1
    local current_col = 1

    -- Get each number. Look for newlines.
    for num, nl in s:gmatch("(%d+)(\n*)") do
        rows[current_row] = rows[current_row] or {}
        cols[current_col] = cols[current_col] or {}

        -- If we found a number, add it to the current row and column.
        num = tonumber(num)
        if num then
            table.insert(rows[current_row], num)
            table.insert(cols[current_col], num)

            -- Next number should go into the next column.
            current_col = current_col + 1
        end

        -- Newlines signal a new row.
        if nl == "\n" then
            current_row = current_row + 1
            current_col = 1
        end
    end

    return {
        row = function(row)
            return rows[row] or {}
        end,
        column = function(col)
            return cols[col] or {}
        end,
    }
end
