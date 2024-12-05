require("lze").load({
  {
    "which-key.nvim",
    for_cat = "general.extra",
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      require("which-key").setup({
        preset = "helix",
        icons = {
          mappings = false,
        },
        -- Document existing key chains
        spec = {
          { "<leader>b", group = "De[b]ug" },
          {
            "<leader>c",
            group = "[C]ode",
            mode = { "n", "x" },
          },
          { "<leader>d", group = "[D]ocument" },
          {
            "<leader>h",
            group = "Git [H]unk",
            mode = { "n", "v" },
          },
          { "<leader>r", group = "[R]ename" },
          { "<leader>s", group = "[S]earch" },
          { "<leader>t", group = "[T]oggle" },
          { "<leader>tm", group = "[M]arkdown" },
          { "<leader>T", group = "[T]ests" },
          { "<leader>w", group = "[W]orkspace" },
          {
            "<leader>y",
            group = "[Y]ank (System)",
            mode = { "n", "v" },
          },
        },
      })
    end,
  },
})
