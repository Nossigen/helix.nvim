local notify = require("helix.notify")

local WrapLoader = {}

WrapLoader.load = function ()
	local value = helix.config.editor['soft-wrap'].enable

	if type(value) == 'boolean' then
		vim.opt.wrap = value
	else
		notify.error("Invalid configuration for soft-wrap: " .. vim.inspect(value))
  end
end

return WrapLoader
