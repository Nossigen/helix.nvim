local notify = require("helix.notify")

local TrueColorLoader = {}

TrueColorLoader.load = function ()
	local value = helix.config.editor["true-color"]

	if type(value) == "boolean" then
    vim.opt.termguicolors = value
	else
		notify.error("Unknow true-color configuration : " .. vim.inspect(value))
	end
end

return TrueColorLoader
