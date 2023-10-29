local notify = require("helix.notify")

local MouseLoader = {}

MouseLoader.load = function ()
	local value = helix.config.editor.mouse

	if type(value) == "boolean" then
		if value == true then
			vim.opt.mouse = ""
		else
			vim.opt.mouse = "a"
		end
	else
		notify.error("Mouse configuration must be a boolean, configured value : " .. value)
	end
end

return MouseLoader
