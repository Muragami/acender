-- acender init.lua, just return the module here, functionality in other files
local acender =
{
    _NAME         = "acender",
	_VERSION      = "0.1.0",
	_DESCRIPTION  = 'A Wren-like to Luajit parser/transpiler',
	_URL          = 'http://github.com/Muragami/acender',
	_COPYRIGHT    = 'Copyright (c) 2026 muragami',
	_LICENSE_TYPE = 'MIT',
	_LICENSE      = [[
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]
}

-- the parser itself
acender.parser = require('acender/parser.lua')
-- link into the parser itself
acender.parser:install(acender)
-- install core module classes
acender.module = {
    Class = require('acender/_class.lua'),
    Fiber = require('acender/_fiber.lua'),
    Fn = require('acender/_fn.lua'),
    List = require('acender/_list.lua'),
    Map = require('acender/_map.lua'),
    Object = require('acender/_object.lua'),
    Range = require('acender/_range.lua'),
    Sequence = require('acender/_sequence.lua'),
}
-- install needed library routines
acender.lib = {
    string = require('acender/lib_string.lua'),
    number = require('acender/lib_number.lua'),
}

if love then
-- if we are in love2d, bind the always enabled modules
acender.module.Data = love.data
acender.module.FileSystem = love.filesystem
-- add a function to bind love2d modules
acender.loveBind = function(self, name)
    local sname = string.lower(name)
    if love[sname] then
        self.module[name] = love[sname]
    else
        error("love does not contain module: " .. (name or 'nil'))
    end
end
end

return acender