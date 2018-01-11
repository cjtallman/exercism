
local function flatten(t,r)
    if type(t) == "table" then
        for _, v in ipairs(t) do
            -- Recurse for sub-tables.
            if type(v) == "table" then
                flatten(v, r)
            else
                table.insert(r, v)
            end
        end
    end
    return r
end

return function(t) return flatten(t,{}) end
