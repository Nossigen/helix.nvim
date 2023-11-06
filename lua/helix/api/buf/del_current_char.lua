-- Behavior
-- 1. We are on a line with content : Remove the caracter under cursor
-- 2. We are on line without content and it's the only line in the buffer : Does nothing
-- 3. We are on a line without content and it's not the only line : Remove the line
return function()
  local content = vim.api.nvim_get_current_line()

  if content == '' then
    local line_number = vim.api.nvim_buf_line_count(0)
    if line_number ~= 1 then
      vim.api.nvim_del_current_line()
    end
    return
  end

  local c = vim.api.nvim_win_get_cursor(0)[2]
  content = string.sub(content, 0, c) .. string.sub(content, c+2, -1)
  vim.api.nvim_set_current_line(content)
end
