
return function(str)
    local map = {
        {3, "Pling"},
        {5, "Plang"},
        {7, "Plong"},
    }

    local result
    local num = tostring(str)
    for _, v in ipairs(map) do
        if num % v[1] == 0 then
            result = (result or "") .. v[2]
        end
    end

    return result or num
end
