require("line-number-change-mode").setup({
  mode = {
    i = { -- Insert mode
      bg = "#61afef", -- Blue
      fg = "#1e222a", -- Mantle (background color in OneDark)
      bold = true,
    },
    n = { -- Normal mode
      bg = "#98c379", -- Green
      fg = "#1e222a", -- Mantle
      bold = true,
    },
    R = { -- Replace mode
      bg = "#e06c75", -- Maroon (Red)
      fg = "#1e222a", -- Mantle
      bold = true,
    },
    v = { -- Visual mode
      bg = "#c678dd", -- Mauve (Purple)
      fg = "#1e222a", -- Mantle
      bold = true,
    },
    V = { -- Visual Line mode
      bg = "#c678dd", -- Mauve (Purple)
      fg = "#1e222a", -- Mantle
      bold = true,
    },
    -- Add more modes if needed:
    c = { -- Command mode
      bg = "#e5c07b", -- Yellow
      fg = "#1e222a", -- Mantle
      bold = true,
    },
    t = { -- Terminal mode
      bg = "#56b6c2", -- Cyan
      fg = "#1e222a", -- Mantle
      bold = true,
    },
  },
})
