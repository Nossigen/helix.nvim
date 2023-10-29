return {
	load = function ()
		require('telescope').setup({
			defaults = {
				layout_strategy = 'horizontal',
				layout_config = {
					prompt_position = 'top'
				}
			}
		})
	end
}
