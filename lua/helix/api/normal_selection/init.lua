vim.api.nvim_create_autocmd(
  {"BufRead"}, {
    desc = "Create buffer related variables for selection",
    callback = function(args)
      vim.api.nvim_buf_set_var(args.buf, 'select_active', true)
      vim.api.nvim_buf_set_var(args.buf, 'select_active_motion', nil)
    end
  }
)

vim.api.normal_selection = {}
vim.api.normal_selection.select = require('helix.api.normal_selection.select')
vim.api.normal_selection.stop = require('helix.api.normal_selection.stop')
