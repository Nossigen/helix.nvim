
-- This function require Comment.nvim
return function ()
	local mode = vim.fn.mode()
	local api = require('Comment.api')

	if mode == 'n' then
		api.toggle.linewise.current()
	elseif mode == 'x' or mode == 'v' then
		local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
		vim.api.nvim_feedkeys(esc, 'nx', false)
		api.toggle.linewise(vim.fn.visualmode())
	end
end
