
return {
    new = function(_, input)
        local whole, areaCode, exchangeCode, subscriberNumber
            = input:gsub("%D", ""):match("^1?((...)(...)(....))$")
        local formatted = string.format("(%s) %s-%s", areaCode, exchangeCode, subscriberNumber)

        return setmetatable({
                number = whole or string.rep("0", 10),
                areaCode = function() return areaCode end
            },
            {
                __tostring = function() return formatted end,
            }
        )
    end
}
