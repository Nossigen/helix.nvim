
return function(to, reset)
  print('--- select')
  local from_row, from_col = unpack(vim.api.nvim_win_get_cursor(0))
  local ns = helix.var.ns.id
  
  if reset == true then
    helix.api.normal_selection.stop()
  else
    local extmarks = vim.api.nvim_buf_get_extmarks(0, ns, 0, -1, {details = true})
    local extmark = extmarks[1] or nil
    print(vim.inspect(extmarks))
    print(vim.inspect(extmark))

    if extmark ~= nil then
      from_row = extmark[2]
      from_col = extmark[3]
      vim.api.nvim_buf_del_extmark(0, ns, extmark[1])
    end
  end

  print("from_row " .. from_row .. " | from_col " .. from_col)
  print("to_row " .. to[1] .. " | to_col " .. to[2])
  vim.api.nvim_buf_set_extmark(0, ns, from_row, from_col, {
    end_row = to[1],
    end_col = to[2],
    hl_group = "IncSearch",
  })
  print('--- endselect')
end