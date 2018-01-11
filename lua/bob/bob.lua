
return {
    hey = function(str)
        -- Empty string.
        if not str or #str == 0 then
            return "Fine, be that way."

        -- Question mark present.
        elseif str:find("%?") then
            return "Sure"

        -- Two or more repetitions of uppercase.
        elseif str:find("%u%u") then
            return "Whoa, chill out!"

        -- Not caught by another rule.
        else
            return "Whatever"
        end
    end,
}
