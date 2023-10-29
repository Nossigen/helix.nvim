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

Plugin.setup = function (setup)
	helix.setup = vim.tbl_deep_extend("force", default_setup, setup)

	load_config()

	require("helix.plugin_adaptater").load()
	require("helix.command").load()

	if helix.setup.keymap.enabled == true then
		require("helix.keymap").load()
	end
end

function load_config()
	if helix.setup.config.enabled then
		-- TODO Test for dasel presence
		local raw_json_data = ""

		vim.fn.jobstart(
			'dasel -f ' .. helix.setup.config.file .. ' -w json',
			{
					on_stdout = function (jobid, data, event)
						for i, data in ipairs(data) do
							if data ~= nil and data ~= '' then
								raw_json_data = raw_json_data .. data
							end
						end
					end,
					on_exit = function(jobid, return_value, event)
						require("helix.config").parse(raw_json_data)
					end
			}
		)
	end
end

return Plugin

