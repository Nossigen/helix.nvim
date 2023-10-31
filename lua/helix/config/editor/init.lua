local EditorLoader = {}

local get_config = function (config_file)
	return require('helix.config.editor.' .. config_file)
end

EditorLoader.load = function ()
	get_config("line_number").load()
	get_config("mouse").load()
	get_config("rulers").load()
	get_config("wrap").load()
	get_config("cursorline").load()
	get_config("cursorcolumn").load()
	get_config("true_color").load()
	get_config("scrolloff").load()
end

return EditorLoader
