return {
  "nvim-telescope/telescope.nvim",
  tag = "*",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-frecency.nvim' },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        frecency = {
          show_scores = false,
          show_unindexed = true,
          ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
        },
      },
    }

    require("telescope").load_extension("frecency")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", function() builtin.find_files({ hidden = true }) end)
    vim.keymap.set("n", "<leader>jg", builtin.live_grep)
    vim.keymap.set("n", "<leader>jh", builtin.help_tags)
    vim.keymap.set("n", "<leader>jf", "<Cmd>Telescope frecency<CR>")
  end
}
