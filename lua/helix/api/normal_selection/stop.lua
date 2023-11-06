return function()
  vim.api.nvim_buf_clear_namespace(0, helix.var.ns.id, 0, -1)
end