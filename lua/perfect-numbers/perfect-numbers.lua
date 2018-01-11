
local function is_factor(num, factor)
    return num // factor == num / factor
end

local function aliquot_sum(num)
    local sum = 0
    for i = 1, num / 2 do
        if is_factor(num, i) then
            sum = sum + i
        end
    end

    return sum
end

local function classify(num)
    local sum = aliquot_sum(num)
    if sum > num then
        return "abundant"
    elseif sum < num then
        return "deficient"
    else
        return "perfect"
    end
end

return {
    aliquot_sum = aliquot_sum,
    classify = classify,
}
