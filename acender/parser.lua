
-- the root space the parser operates within
local root
-- the modules in this parser space
local mod
-- transliteration of Math/math.
local mathTable = {
    'abs', 'acos', 'asin', 'atan', 'atan2', 'ceil', 'cos', 'cosh', 'deg', 'exp',
    'floor', 'fmod', 'frexp', 'huge', 'idexp', 'log', 'log10', 'max', 'min', 'modf',
    'pi', 'pow', 'rad', 'random', 'randomseed', 'sin', 'sinh', 'sqrt', 'tan', 'tanh'
}
-- transliteration of String/string.
local mathTable = {
    'byte', 'char', 'find', 'format', 'gmatch', 'gsub', 'len', 'lower', 'match',
    'rep', 'reverse', 'sub', 'upper'
}

return {
    install = function(self, aroot)
        root = aroot
        mod = aroot.module
    end
}