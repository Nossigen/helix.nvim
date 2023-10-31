local notify = require("helix.notify")

local LineNumberLoader = {}

LineNumberLoader.load = function ()
	local value = helix.config.editor["line-number"]

	require('gitsigns').setup({})

	vim.opt.number = true

	if value == "relative" then
		vim.opt.relativenumber = true
		vim.opt.numberwidth = 1

		vim.api.nvim_create_autocmd('InsertEnter', {callback = function ()
			vim.opt.relativenumber = false
		end})
		vim.api.nvim_create_autocmd('InsertLeave', {callback = function ()
			vim.opt.relativenumber = true
		end})
	elseif value ~= "absolute" then
		notify.error("Unknow line-number configuration : " .. value)
	end
end

return LineNumberLoader
