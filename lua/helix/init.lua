local Plugin = {}

local default_setup = {
	config = {
		enabled = true,
		file = "~/.config/helix/config.toml"
	},
	keymap = {
		enabled = true,
	},
	plugin = {
		telescope = true,
		indent_blankline = true,
		comment = true
	}
}
local load_config = function()
	if helix.setup.config.enabled then
		-- TODO Test for dasel presence
		local raw_json_data = ""

		vim.fn.jobstart(
			'dasel -f ' .. helix.setup.config.file .. ' -w json',
			{
					on_stdout = function (_, data, _)
						for i, data_line in ipairs(data) do
							if data_line ~= nil and data_line ~= '' then
								raw_json_data = raw_json_data .. data_line
							end
						end
					end,
					on_exit = function(_, _, _)
						require("helix.config").parse(raw_json_data)
					end
			}
		)
	end
end


Plugin.setup = function (setup)
	require('helix.api')
	helix.setup = vim.tbl_deep_extend("force", default_setup, setup)
	
	helix.var = {}
	helix.var.ns = {}
	helix.var.ns.id = vim.api.nvim_create_namespace("helix")
	helix.var.ns.highlight = {}
	helix.var.ns.highlight.select = "NormalSelection"

	vim.api.nvim_set_hl(helix.var.ns.id, helix.var.ns.highlight.select, {fg="#181825", bg="#7ec9d8"})

	require('helix-cmd').load()
	load_config()
	require("helix.plugin_adaptater").load()
	-- require("helix.command").load()

	if helix.setup.keymap.enabled == true then
		require("helix.keymap").load()
	end
end

return Plugin

