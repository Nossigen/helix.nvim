-- TODO : Not finished
-- WARN : Not working

---Shortcut for `nvim_replace_termcodes`.
---@param keys string
---@return string
local function termcodes(keys)
	return vim.api.nvim_replace_termcodes(keys, true, true, true) --[[@as string]]
end

---Returns if two key sequence are equal or not.
---@param a string
---@param b string
---@return boolean
local function keymap_equals(a, b)
	return termcodes(a) == termcodes(b)
end

local function get_map(mode, lhs)
	for _, map in ipairs(vim.api.nvim_buf_get_keymap(0, mode)) do
		if keymap_equals(map.lhs, lhs) then
			return {
				lhs = map.lhs,
				rhs = map.rhs or "",
				expr = map.expr == 1,
				callback = map.callback,
				noremap = map.noremap == 1,
				script = map.script == 1,
				silent = map.silent == 1,
				nowait = map.nowait == 1,
				buffer = true,
			}
		end
	end

	for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
		if keymap_equals(map.lhs, lhs) then
			return {
				lhs = map.lhs,
				rhs = map.rhs or "",
				expr = map.expr == 1,
				callback = map.callback,
				noremap = map.noremap == 1,
				script = map.script == 1,
				silent = map.silent == 1,
				nowait = map.nowait == 1,
				buffer = false,
			}
		end
	end

	return {
		lhs = lhs,
		rhs = lhs,
		expr = false,
		callback = nil,
		noremap = true,
		script = false,
		silent = true,
		nowait = false,
		buffer = false,
	}
end

return function (mode, input)
  local user_keymap = get_map(mode, input)
end