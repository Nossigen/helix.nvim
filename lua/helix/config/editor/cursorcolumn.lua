local notify = require("helix.notify")

local CursorColumnLoader = {}

CursorColumnLoader.load = function ()
	local value = helix.config.editor.cursorcolumn

	if type(value) == "boolean" then
		vim.opt.cursorcolumn = value
	else
		notify.error("Cursorcolumn configuration must be a boolean, configured value : " .. value)
	end
end

return CursorColumnLoader
