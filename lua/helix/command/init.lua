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
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row, col - 1})
	end

	helix.cmd.move_char_right = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row, col + 1})
	end

	helix.cmd.move_char_right = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row, col + 1})
	end

	helix.cmd.move_visual_line_down = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row + 1, col})
	end

	helix.cmd.move_visual_line_up = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row - 1, col})
	end

	-- In development
	helix.cmd.move_next_word_start = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		local line_content = vim.api.nvim_buf_get_lines(0, row - 1, row, false)
		line_content = line_content[0] or line_content[1]
		print(line_content)
	end

	helix.cmd.goto_line_start = function ()
		row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, {row, 0})
	end

	-- WARN: Only works in normal mode right now
	helix.cmd.delete_selection = function ()
		local mode = vim.fn.mode()

		if mode == 'n' then
			row, col = unpack(vim.api.nvim_win_get_cursor(0))
			local line_content = vim.api.nvim_buf_get_lines(0, row - 1, row, false)
			line_content = line_content[0] or line_content[1]

			if line_content ~= '' then
				line_content_start = string.sub(line_content, 0, col)
				line_content_end = string.sub(line_content, col + 2, -1)
				line_content = line_content_start .. line_content_end
				vim.api.nvim_buf_set_lines(0, row - 1, row, false, {line_content})
			else
				vim.api.nvim_buf_set_lines(0, row - 1, row, false, {})
			end
		elseif mode == 'v' then
			print('Not working rn')
		end
	end
	
	helix.cmd.toggle_comments = get('code.toggle_comments')
	helix.cmd.file_picker_in_current_directory = get('picker.file_picker_in_current_directory')
end

return Commands
