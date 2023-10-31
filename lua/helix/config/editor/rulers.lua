local notify = require("helix.notify")

local RulersLoader = {}

RulersLoader.load = function ()
	local value = helix.config.editor.rulers
  local rulers = ''

  if type(value) == 'table' then
		for i,ruler in ipairs(value) do
			rulers = rulers .. ruler
			if value[i + 1] ~= nil then
				rulers = rulers .. ','
			end
		end
  else
    rulers = value
  end

  vim.opt.colorcolumn = rulers
end

return RulersLoader
