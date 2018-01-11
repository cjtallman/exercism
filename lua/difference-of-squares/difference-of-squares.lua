
local function square_of_sums(num)
    local sum = 0
    for i = 1, num do
        sum = sum + i
    end
    return sum * sum
end

local function sum_of_squares(num)
    local sum = 0
    for i = 1, num do
        sum = sum + i * i
    end
    return sum
end

local function difference_of_squares(num)
    return square_of_sums(num) - sum_of_squares(num)
end

return {
    square_of_sums = square_of_sums,
    sum_of_squares = sum_of_squares,
    difference_of_squares = difference_of_squares,
}
