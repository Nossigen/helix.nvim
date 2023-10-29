local notify = require("helix.notify")

local LineNumberLoader = {}

LineNumberLoader.load = function ()
	local value = helix.config.editor["line-number"]

	require('gitsigns').setup({
	})
	--vim.opt.statuscolumn="%r"
	if value == "absolute" then
		vim.opt.number = true
	elseif value == "relative" then
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.numberwidth = 1
	else
		notify.error("Unknow line-number configuration : " .. value)
	end
end

return LineNumberLoader
