-- Options
require("myLuaConf.options.nvim")
require("myLuaConf.options.keybinds") -- Register the extra lze handlers
require("lze").register_handlers(require("lze.x"))
require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

-- [[ Enable plugins ]]

-- Small plugins
require("myLuaConf.plugins")

-- Core Plugins
require("myLuaConf.plugins.core.lsp")
require("myLuaConf.plugins.core.format")
require("myLuaConf.plugins.core.completion")
require("myLuaConf.plugins.core.treesitter")
require("myLuaConf.plugins.core.telescope")
if nixCats("debug") then
	require("myLuaConf.plugins.core.debug")
end
if nixCats("lint") then
	require("myLuaConf.plugins.core.lint")
end

-- UI Plugins
require("myLuaConf.plugins.ui.lnchangemode") -- show editor mode on active line number
require("myLuaConf.plugins.ui.neo-tree")

-- Help
require("myLuaConf.plugins.help.chsh")
require("myLuaConf.plugins.help.chsh-vim")

-- Tests
require("myLuaConf.plugins.tests.coverage")

-- QoL
require("myLuaConf.plugins.qol.toggleterm")
