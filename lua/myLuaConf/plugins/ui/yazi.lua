require("lze").load({
	{
		"yazi.nvim",
		for_cat = "general.extra",
		-- cmd = { "" },
		event = "DeferredUIEnter",
		-- ft = "",
		-- keys = "",
		-- colorscheme = "",
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
