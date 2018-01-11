
return function(oct)
    return {
        to_decimal = function()
            if oct:find("[^0-7]") then
                return 0
            end

            local result = 0
            local mult = 1
            for i = #oct, 1, -1 do
                result = result + mult * oct:sub(i,i)
                mult = mult * 8
            end

            return result
        end,
    }
end
