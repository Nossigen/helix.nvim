local notify = require("helix.notify")

local IdleTiemoutLoader = {}

IdleTiemoutLoader.load = function ()
	local value = helix.config.editor["idle-timeout"]

	if type(value) == "number" then
		vim.opt.timeoutlen = value
	else
		notify.error("Idle-timeout configuration must be a number, configured value : " .. vim.inspect(value))
	end
end

return IdleTiemoutLoader
