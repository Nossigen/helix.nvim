local KeymapLoader = {}

local unload_vim_keymap = function ()
	local unmap = vim.api.nvim_del_keymap

	local mappings = vim.api.nvim_get_keymap('n')

	for _, data in ipairs(mappings) do
		vim.api.nvim_del_keymap('n', data.lhs)
		-- print(vim.inspect(i))
		-- print(vim.inspect(data))
	end
	
	local mappings = vim.api.nvim_buf_get_keymap(0, 'n')

	for _, data in ipairs(mappings) do
		vim.api.nvim_buf_del_keymap(0, 'n', data.lhs)
	end
end
local function load_helix_keymap()
	-- Normal
	local xmap = function (mapping, action)
		vim.keymap.set('v', mapping, action, {noremap=true, silent=true})
	end

	local nmap = function (mapping, action)
		vim.keymap.set('n', mapping, action, {noremap=true, silent=true})
	end

	-- Goto

	nmap('<C-c>', helix.cmd.toggle_comments)
	xmap('<C-c>', helix.cmd.toggle_comments)

	nmap('<leader>fF', helix.cmd.file_picker_in_current_directory)

	nmap('<', 'v<')
	nmap('>', 'v>')

	xmap('<', '<gv')
	xmap('>', '>gv')

	nmap('d', helix.cmd.delete_selection)

	-- nmap('w', helix.cmd.move_next_word_start)
	-- xmap('w', helix.cmd.move_next_word_start)
	-- xmap('w', '<ESC>ve')

	nmap('W', 'vE')
	xmap('W', '<ESC>vE')

	nmap('b', 'vb')
	xmap('b', '<ESC>vb')

	nmap('U', '<C-r>')

	nmap('x', helix.cmd.extend_line_below)
	xmap('x', 'j')

	--nmap('%', 'ggvge')

	-- Goto
	xmap('gl', '$')
	xmap('gh', '0')
	xmap('gs', '^')
	xmap('ge', 'G')

	nmap('gl', '$')
	nmap('gh', '0')
	nmap('gs', '^')
	nmap('ge', 'G')
end

KeymapLoader.load = function ()
	unload_vim_keymap()
	load_helix_keymap()
end

return KeymapLoader
