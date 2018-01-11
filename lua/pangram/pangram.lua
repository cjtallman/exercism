
return function(str)
    local strlower = str:lower()
    for ch in string.gmatch("abcdefghijklmnopqrstuvwxyz", ".") do
        if not strlower:find(ch) then
            return false
        end
    end
    return true
end
