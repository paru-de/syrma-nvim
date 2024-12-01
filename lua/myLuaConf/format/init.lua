require('lze').load {
  {
    "conform.nvim",
    for_cat = 'format',
    cmd = { "ConformInfo" },
    event = "BufWritePre",
    -- ft = "",
    -- keys = {
    --   { "<leader>FF", desc = "[F]ormat [F]ile" },
    -- },
    -- colorscheme = "",
    after = function(plugin)
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          -- NOTE: download some formatters in lspsAndRuntimeDeps
          -- and configure them here
          lua = { "stylua" },
          go = { "gofumpt", "gofmt", "golint" },
          -- templ = { "templ" },
          -- Conform will run multiple formatters sequentially
          -- python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          -- javascript = { { "prettierd", "prettier" } },
        },
        notify_on_error = false,
        format_on_save = function(bufnr)
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = 'never'
          else
            lsp_format_opt = 'fallback'
          end
          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        end,
      })

      -- vim.keymap.set({ "n", "v" }, "<leader>FF", function()
      --   conform.format({
      --     lsp_fallback = true,
      --     async = false,
      --     timeout_ms = 1000,
      --   })
      -- end, { desc = "[F]ormat [F]ile" })
    end,
  },
}
