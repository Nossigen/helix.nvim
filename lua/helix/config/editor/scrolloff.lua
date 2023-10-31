local notify = require("helix.notify")

local ScrollOffLoader = {}

ScrollOffLoader.load = function ()
	local value = helix.config.editor.scrolloff
  vim.opt.scrolloff = value
end

return ScrollOffLoader
