vim.diagnostic.config({ virtual_text = false })

require("tiny-inline-diagnostic").setup({
  preset = "powerline",
  hi = {
    mixing_color = "#202020",
  },
})
