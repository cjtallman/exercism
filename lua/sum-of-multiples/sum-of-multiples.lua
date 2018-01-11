
return function(numbers)
    return {
        to = function(limit)
            local multiples = {}
            for _, num in ipairs(numbers) do
                local m = num
                while m < limit do
                    multiples[m] = true
                    m = m + num
                end
            end

            local result = 0
            for m in pairs(multiples) do
                result = result + m
            end
            return result
        end,
    }
end
