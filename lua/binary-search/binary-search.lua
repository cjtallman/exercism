return function (arr, n)

    local lo, hi = 1, #arr

    -- Empty array.
    if hi == 0 then
        return -1
    end

    repeat
        -- Calculate middle index.
        local mid = math.floor((lo + hi) / 2)

        local val = arr[mid]

        -- Found it
        if val == n then
            return mid

        -- Too high
        elseif val > n then
            hi = mid - 1

        -- Too low
        else
            lo = mid + 1
        end
    until lo > hi

    -- Not found.
    return -1
end
