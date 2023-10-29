local LineNumberLoader = require("helix.config.editor.line_number")
local MouseLoader = require("helix.config.editor.mouse")

local EditorLoader = {}

EditorLoader.load = function ()
	MouseLoader.load()
	LineNumberLoader.load()
end

return EditorLoader
