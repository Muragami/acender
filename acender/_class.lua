-- class table implementation lua side
local util = require 'acender/util.lua'
local tinsert = table.insert
local clone = util.clone
local cloneInto = util.cloneInto

-- table of all classes
local classTable = {}

local className = function(self)
    return self.__name
end

local classSuperType = function(self)
    return self.__supertype
end

local classNew = function(name, from)
    if classTable[name] then
        error("class [" .. name .. '] already exists')
    else
        local ret = {
            __name = name,
            __supertype = from,
            __type = 'Class'
        }
        classTable[name] = ret
        return ret
    end
end

local classBuild = function(class)
    -- build all class definitions by walking their class heirarchy
    local srcs = { class }
    local super = class.supertype()
    while super do
        tinsert(srcs, super)
        super = super.supertype()
    end
    -- we have the pedigree, so now copy it downward
    local final = {}
    local i = #srcs
    while i > 0 do
        cloneInto(srcs[i], final)
        i = i - 1
    end
    -- we have the final built version, so replace it in the master table
    classTable[class.__name] = final
    return final
end

local classType = function(self)
    return self.__type
end

local classIs = function(self, other)
    return self.__type == other.__type
end

local classAll = function(self)
    return classTable
end

return {
    name = className,
    supertype = classSuperType,
    new = classNew,
    build = classBuild,
    type = classType,
    is = classIs,
    all = classAll
}