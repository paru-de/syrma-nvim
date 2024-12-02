-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- See keybinds.lua for system copy/paste
if os.getenv("WAYLAND_DISPLAY") and vim.fn.exepath("wl-copy") ~= "" then
	vim.g.clipboard = {
		name = "wl-clipboard",
		copy = {
			["+"] = "wl-copy",
			["*"] = "wl-copy",
		},
		paste = {
			["+"] = "wl-paste",
			["*"] = "wl-paste",
		},
		cache_enabled = 1,
	}
end

-- Theme
require("onedark").setup({
	style = "darker",
	transparent = true,
	lualine = {
		transparent = true,
	},
})
require("onedark").load()
-- Overriding some backgrounds  TODO: make popups more visible against bg (border possible?)
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202020" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#202020", fg = "#bbc2cf" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#272727", fg = "#bbc2cf" })
-- TODO: define in mini.lua, double check values; this isn't enough and looks off
vim.api.nvim_set_hl(0, "MiniNotifyBorder", { bg = "#202020", fg = "#bbc2cf" })
vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = "#202020", fg = "#bbc2cf" })
vim.opt.termguicolors = true

-- [[ Setting options ]]

-- Enable mouse mode
vim.opt.mouse = "a"

-- Save undo history
vim.opt.undofile = true

-- [[ Editing ]]
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight active line
vim.opt.cursorline = true
vim.cmd.hi("CursorLine guibg=#272727")
vim.cmd.hi("Comment gui=none")

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Modes are already displayed in the status line
vim.opt.showmode = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable line wrapping and set the wrap width to 80 characters
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
if vim.bo.filetype == "python" then
	vim.o.nowrap = true
end
vim.opt.colorcolumn = { 80 } -- xiyaowong/vircolumn.nvim makes it smaller and less fugly

-- stops line wrapping from being confusing
vim.opt.breakindent = true

-- Indent
vim.opt.smarttab = true
vim.opt.cpoptions:append("I")

-- Disable auto comment on enter
vim.api.nvim_create_autocmd("FileType", {
	desc = "remove formatoptions",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- [[ Search ]]

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Misc ]]

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menu,preview,noselect"

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- update title with filepath
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = "nvim | %t"
