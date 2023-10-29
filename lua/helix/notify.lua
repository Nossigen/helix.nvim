

local Notify = {}

Notify.error = function (message)
	vim.notify(message, vim.logs.levels.ERROR, {
			title = "Helix"
	})
end


return Notify
