require('neo-tree').setup({
  version = '*',
  cmd = 'Neotree',
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  },

})