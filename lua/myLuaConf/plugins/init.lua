-- Auto Save
require("auto-save").setup({
	opts = {},
})

-- Todo Comments
require("todo-comments").setup({

	opts = { signs = false },
})

-- Automatically insert pairs
require("nvim-autopairs").setup({
	config = function()
		-- If you want to automatically add `(` after selecting a function or method
		local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
		local cmp = require 'cmp'
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,

})

-- Show color codes as colors
require("nvim-highlight-colors").setup({})

-- Smooth scrolling
require("cinnamon").setup({})

-- Jump around quickly
require("leap").setup({})

require("lze").load({
	{ import = "myLuaConf.plugins.core.telescope" },
	{ import = "myLuaConf.plugins.core.treesitter" },
	{ import = "myLuaConf.plugins.core.completion" },
	{
		"lazydev.nvim",
		for_cat = "neonixdev",
		cmd = { "LazyDev" },
		ft = "lua",
		after = function(plugin)
			require("lazydev").setup({
				library = {
					{ words = { "nixCats" }, path = (require("nixCats").nixCatsPath or "") .. "/lua" },
				},
			})
		end,
	},

	{
		"undotree",
		for_cat = "general.extra",
		cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
		before = function(_)
			vim.g.undotree_WindowLayout = 1
			vim.g.undotree_SplitWidth = 40
		end,
	},
	{
		"comment.nvim",
		for_cat = "general.extra",
		event = "DeferredUIEnter",
		after = function(plugin)
			require("Comment").setup()
		end,
	},
	{
		"indent-blankline.nvim",
		for_cat = "general.extra",
		event = "DeferredUIEnter",
		after = function(plugin)
			require("ibl").setup()
		end,
	},

	{
		"vim-startuptime",
		for_cat = "general.extra",
		cmd = { "StartupTime" },
		before = function(_)
			vim.g.startuptime_event_width = 0
			vim.g.startuptime_tries = 10
			vim.g.startuptime_exe_path = require("nixCatsUtils").packageBinPath
		end,
	},
	{
		"fidget.nvim",
		for_cat = "general.extra",
		event = "DeferredUIEnter",
		-- keys = "",
		after = function(plugin)
			require("fidget").setup({})
		end,
	},
})
