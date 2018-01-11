
return {
    new = function()
        return setmetatable({}, {
            __index = {
                add = function(self, name, grade)
                    self[grade] = self:grade(grade)
                    table.insert(self[grade], name)
                    table.sort(self[grade])
                end,
                grade = function(self, grade)
                    return self[grade] or {}
                end,
                roster = function(self)
                    return self
                end,
            }
        })
    end
}
