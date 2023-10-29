local Commands = {}

Commands.load = function ()
	local get = function(command)
		return require('helix.command.' .. command)
	end

	-- Allows reload with load command
	if helix.cmd == nil then
		helix.cmd = {}
	end

	helix.cmd.move_char_left = function ()
		vim.cmd(":normal h")
	end

	helix.cmd.toggle_comments = get('code.toggle_comments')
	helix.cmd.file_picker_in_current_directory = get('picker.file_picker_in_current_directory')
end

return Commands
