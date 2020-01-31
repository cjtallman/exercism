
pattern_uppercase = r"[A-Z]+"
pattern_question = r"\?\s*$"
pattern_empty = r"^\s*$"

function bob(stimulus::AbstractString)
    if occursin(pattern_empty, stimulus)
        "Fine. Be that way!"
    elseif occursin(pattern_uppercase, stimulus) && uppercase(stimulus) == stimulus
        if occursin(pattern_question, stimulus)
            "Calm down, I know what I'm doing!"
        else
            "Whoa, chill out!"
        end
    elseif occursin(pattern_question, stimulus)
        "Sure."
    else
        "Whatever."
    end
end
