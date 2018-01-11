
local codon_map = {
    AUG = "Methionine",
    UUU = "Phenylalanine",
    UUC = "Phenylalanine",
    UUA = "Leucine",
    UUG = "Leucine",
    UCU = "Serine",
    UCC = "Serine",
    UCA = "Serine",
    UCG = "Serine",
    UAU = "Tyrosine",
    UAC = "Tyrosine",
    UGU = "Cysteine",
    UGC = "Cysteine",
    UGG = "Tryptophan",
    UAA = "STOP",
    UAG = "STOP",
    UGA = "STOP",
}

local function translate_codon(codon)
    return assert(codon_map[codon])
end

local function translate_rna(rna)
    local proteins = {}
    for codon in rna:gmatch("(...)") do
        local protein = translate_codon(codon)
        if protein == "STOP" then
            break
        else
            table.insert(proteins, protein)
        end
    end
    return assert(#proteins > 0 and proteins)
end

return {
    codon = translate_codon,
    rna_strand = translate_rna,
}
