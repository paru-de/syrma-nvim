local M = {}

--- Load Lua files from Neovim's after/ftplugin directory.
--- @param filetypes string[]|string Filetypes to load Lua files for.
function M.load_ftplugins(filetypes)
  local types = type(filetypes) == "table" and filetypes or { filetypes }
  for _, ft in ipairs(types) do
    local ft_dir = vim.fn.stdpath("config") .. "/after/ftplugin/" .. ft
    if vim.fn.isdirectory(ft_dir) == 1 then
      local files = vim.fn.glob(ft_dir .. "/*.lua", false, true)
      for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
          dofile(file) -- Source the Lua file
        end
      end
    end
  end
end

return M
