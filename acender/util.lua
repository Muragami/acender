
-- simple clone that does not recurse
local function _clone(t)
    local ret = {}
    for key, value in pairs(t) do
        ret.key = value        
    end
    return ret
end

-- same, but clone into an existing table
local function _cloneInto(from, to)
    for key, value in pairs(from) do
        to.key = value        
    end
end

return {
    clone = _clone,
    cloneInto = _cloneInto
}