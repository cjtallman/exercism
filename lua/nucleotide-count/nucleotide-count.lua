

local m = {}

local function new(_, str)
    local counts =
    {
        A = 0,
        C = 0,
        G = 0,
        T = 0,
    }

    for ch in str:gmatch("[ACGT]") do
        counts[ch] = counts[ch] + 1
    end

    return setmetatable(
        {
            nucleotideCounts = counts
        },
        {
            __index = m,
        }
    )
end

function m:count(nucleotide)
    return assert(self.nucleotideCounts[nucleotide], "Invalid Nucleotide")
end

return {
    new = new,
}
