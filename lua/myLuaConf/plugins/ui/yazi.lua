require("lze").load({
	{
		"yazi.nvim",
		for_cat = "general.extra",
		event = "DeferredUIEnter",
		after = function(plugin)
			require("yazi").setup({

				open_for_directories = true,
				keymaps = {
					show_help = "<f1>",
				},
			})
		end,
	},
})
