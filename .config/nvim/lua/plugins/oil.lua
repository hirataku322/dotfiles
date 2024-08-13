return { 
  {
    'stevearc/oil.nvim', 
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {}, 
    config = function()
      require("oil").setup({
          view_options = {
            show_hidden = true
          }
        }
      )
      vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>")
    end
  }
}
