
return {
    transform = function(old)
        local new = {}

        for score, tab in pairs(old) do
            for _, letter in pairs(tab) do
                new[letter:lower()] = score
            end
        end

        return new
    end,
}
