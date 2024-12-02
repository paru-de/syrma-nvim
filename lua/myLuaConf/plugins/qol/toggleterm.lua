require("toggleterm").setup({})

-- Define keymaps here, ensuring toggleterm is loaded
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	float_opts = {
		border = "single",
		width = 120,
		height = 100,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	direction = "float",
})

function LazyGit_toggle()
	lazygit:toggle()
end

local golangTest = Terminal:new({
	cmd = "go test; read -n 1 -s -r ",
	hidden = true,
	float_opts = {
		border = "single",
		width = 120,
		height = 100,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	direction = "float",
})

function GoTest_toggle()
	golangTest:toggle()
end

local floatingterminal = Terminal:new({
	hidden = true,
	float_opts = {
		border = "single", -- or 'double' or 'shadow' or 'none'
		width = 120,
		height = 50,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	direction = "float",
})

function FloatingTerminal_toggle()
	floatingterminal:toggle()
end
