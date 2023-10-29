local PluginAdaptaterLoader = {}

PluginAdaptaterLoader.load = function ()
	require('helix.plugin_adaptater.indent-blankline').load()
	require('helix.plugin_adaptater.comment').load()
	require('helix.plugin_adaptater.telescope').load()
end

return PluginAdaptaterLoader
