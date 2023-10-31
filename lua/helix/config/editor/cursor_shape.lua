local notify = require("helix.notify")

local CursorShapeLoader = {}

CursorShapeLoader.load = function ()
	local value_normal = helix.config.editor['cursor-shape'].normal
	local value_insert = helix.config.editor['cursor-shape'].insert
	local value_select = helix.config.editor['cursor-shape'].select
  local cursor_shape = ''

  local translate_cursor_shape = function (shape)
    if shape == 'block' then
      return shape
    else if shape == 'bar' then
      return 'ver{100}'
    else if shape == 'underline' then
      return 'hor{100}'
    else
      return 'error'
    end
  end

  value_normal = translate_cursor_shape(value_normal)
  value_insert = translate_cursor_shape(value_insert)
  value_select = translate_cursor_shape(value_select)
  
  vim.opt.guicursor="c:block,n-sm:" .. value_normal .. ",v:" .. value_select .. ",i-ci-ve:" .. value_insert
end

return CursorShapeLoader
