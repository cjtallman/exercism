function is_degenerate(sides)
    any(v->(v == 0), sides) ||
    sides[1] + sides[2] < sides[3] ||
    sides[2] + sides[3] < sides[1] ||
    sides[3] + sides[1] < sides[2]
end

function num_unique(sides)
    length(unique(sides))
end

function is_equilateral(sides)
    !is_degenerate(sides) &&
    num_unique(sides) == 1
end

function is_isosceles(sides)
    !is_degenerate(sides) &&
    num_unique(sides) <= 2
end

function is_scalene(sides)
    !is_degenerate(sides) &&
    num_unique(sides) == 3
end
