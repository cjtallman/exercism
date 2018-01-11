
return function(dna)
    local to_rna = {
        G = "C",
        C = "G",
        T = "A",
        A = "U",
    }

    return dna:gsub(".", to_rna)
end
