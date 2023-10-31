local notify = require("helix.notify")

local CursorLineLoader = {}

CursorLineLoader.load = function ()
	local value = helix.config.editor.cursorline

	if type(value) == "boolean" then
		vim.opt.cursorline = value
	else
		notify.error("Cursorline configuration must be a boolean, configured value : " .. value)
	end
end

return CursorLineLoader
