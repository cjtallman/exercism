
return function(str)
    local letters = {}
    for ch in str:gmatch("%w") do
        if letters[ch:lower()] then
            return false
        else
            letters[ch:lower()] = true
        end
    end
    return true
end
