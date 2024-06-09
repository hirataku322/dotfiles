return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 
    "nvim-tree/nvim-web-devicons" 
  },
  config = function()
    vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>")
  end
}
