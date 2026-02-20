-- object table implementation lua side
local util = require 'acender/util.lua'
local tinsert = table.insert
local cloneInto = util.cloneInto
local clone = util.clone

local function objNew(class, name)
    local ret = clone(class)
    ret.__class = class
    ret.__name = name
    return ret
end

local function objSame(self, other)
    return self == other
end

local function objIs(self, class)
    if self.__class == class then
        return true
    end
    if self.__super then
        return self.__super.is(class)
    end
    return false
end

local function objType(self)
    return self.__class
end

local function objToString(self)
    if self.toString then
        return self:toString()
    else
        error('object [' .. self.__name .. '] of class [' .. self.__class .. '] does not implement toString()')
    end
end

return {
    new = objNew,
    same = objSame,
    is = objIs,
    type = objType,
    toString = objToString
}