local editor_loader = require("helix.config.editor")
local default_config = require("helix.config.default_config")

local config = {}

config.parse = function (raw_json_data)
	local configuration = vim.json.decode(raw_json_data)
	
	helix.config = vim.tbl_deep_extend("force", default_config, configuration)
	editor_loader.load()
	-- Add a space after the line
	vim.opt.virtualedit = 'onemore'
end

return config
