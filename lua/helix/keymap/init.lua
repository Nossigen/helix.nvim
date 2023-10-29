local KeymapLoader = {}

KeymapLoader.load = function ()
	xmap = function (mapping, action)
		vim.keymap.set('v', mapping, action, {noremap=true, silent=true})
	end

	nmap = function (mapping, action)
		vim.keymap.set('n', mapping, action, {noremap=true, silent=true})
	end

	nmap('<C-c>', function()
		helix.cmd.toggle_comments()
	end)
	xmap('<C-c>', function()
		helix.cmd.toggle_comments()
	end)

	nmap('<leader>fF', function ()
		helix.cmd.file_picker_in_current_directory()
	end)

	-- Normal
	nmap('<', 'v<')
	nmap('>', 'v>')

	xmap('<', '<gv')
	xmap('>', '>gv')

	nmap('d', 'dl')
	xmap('d', 'd')

	nmap('w', 've')
	xmap('w', '<ESC>ve')

	nmap('W', 'vE')
	xmap('W', '<ESC>vE')

	nmap('b', 'vb')
	xmap('b', '<ESC>vb')

	nmap('U', '<C-r>')

	nmap('x', '$V')
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

return KeymapLoader
