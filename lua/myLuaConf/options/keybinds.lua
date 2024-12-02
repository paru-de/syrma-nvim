-- [[ General keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Moves Line Down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Moves Line Up' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll Down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll Up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next Search Result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous Search Result' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Exit terminal mode with EscEsc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- System copy/paste without overwriting registers
vim.keymap.set("n", '<leader>ys', '"+y', { noremap = true, silent = true, desc = 'Yank select to clipboard' })
vim.keymap.set({ "v", "x" }, '<leader>ys', '"+y', { noremap = true, silent = true, desc = 'Yank selection to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>yy', '"+yy',
	{ noremap = true, silent = true, desc = 'Yank line to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
vim.keymap.set('i', '<C-p>', '<C-r><C-p>+',
	{ noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' })
vim.keymap.set("x", "<leader>P", '"_dP',
	{ noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })

-- Delete a char back/forwards
vim.api.nvim_set_keymap('i', '<C-b>', '<BS>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Del>', { noremap = true, silent = true })

-- Toggle Quickfix
vim.api.nvim_set_keymap('n', '<leader>Q', ':lua ToggleQuickfix()<CR>',
	{ noremap = true, silent = true, desc = 'Toggle Quickfix' })
function ToggleQuickfix()
	-- Check if any window is a quickfix window
	local quickfix_is_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			quickfix_is_open = true
			break
		end
	end

	-- Toggle quickfix list
	if quickfix_is_open then
		vim.cmd('cclose') -- Close quickfix list if open
	else
		vim.cmd('copen') -- Open quickfix list if closed
	end
end

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ LSP keymaps ]]
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>cf', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix' })

-- [[ Plugin keymaps ]]

-- Neo-Tree
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle filesystem<CR>',
	{ noremap = true, silent = true, desc = 'File [E]xplorer' })
vim.api.nvim_set_keymap('n', '\\', ':Neotree toggle filesystem<CR>',
	{ noremap = true, silent = true, desc = 'File [E]xplorer' })

-- Cheat Sheets
vim.api.nvim_set_keymap('n', '<leader>C', ':CheatSH<CR>',
	{ noremap = true, silent = true, desc = 'Open code [C]heat Sheet' })
vim.api.nvim_set_keymap('n', '<leader>?', ':Cheatsheet<CR>',
	{ noremap = true, silent = true, desc = 'Open vim Cheat Sheet' })

-- Coverage.nvim
vim.api.nvim_set_keymap('n', '<leader>Ts', ':CoverageSummary<CR>',
	{ noremap = true, silent = true, desc = 'Show [S]ummary' })
vim.api.nvim_set_keymap('n', '<leader>Tg',
	':!go test -coverprofile=coverage.out<CR> :CoverageLoad <CR> :CoverageToggle<CR>',
	{ noremap = true, silent = true, desc = '[G]o: Generate & toggle coverage report' }
)
vim.api.nvim_set_keymap('n', '<leader>Tt', ':CoverageToggle<CR>',
	{ noremap = true, silent = true, desc = '[T]oggle coverage' }
)

-- ToggleTerm
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm<CR>',
	{ noremap = true, silent = true, desc = 'Toggle [T]erminal' })
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua FloatingTerminal_toggle()<CR>',
	{ noremap = true, silent = true, desc = 'Toggle [F]loating Terminal' })
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>lua LazyGit_toggle()<CR>',
	{ noremap = true, silent = true, desc = 'Toggle [G]it (LazyGit)' })
vim.api.nvim_set_keymap('n', '<leader>Tr', '<cmd>lua GoTest_toggle()<CR>',
	{ noremap = true, silent = true, desc = 'Go: [R]un tests' })

-- Yazi
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Yazi<CR>',
	{ noremap = true, silent = true, desc = 'Open yazi at the current file' })

vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>Yazi cwd<CR>',
	{ noremap = true, silent = true, desc = "Open the file manager in nvim's working directory" })

vim.api.nvim_set_keymap('n', '<C-Up>', '<cmd>Yazi toggle<CR>',
	{ noremap = true, silent = true, desc = 'Resume the last yazi session' })
