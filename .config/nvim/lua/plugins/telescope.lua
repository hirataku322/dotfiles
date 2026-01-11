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
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob", "!.git/*"
        },
        file_ignore_patterns = { "node_modules", ".git/" },
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
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
    vim.keymap.set("n", "<C-p>", function() builtin.find_files({ hidden = true }) end, { desc = "Find files" })
    vim.keymap.set("n", "<leader>jg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>jh", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>jb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>jr", builtin.resume, { desc = "Resume last search" })
    vim.keymap.set("n", "<leader>jd", builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>js", builtin.git_status, { desc = "Git status" })
    vim.keymap.set("n", "<leader>jf", function()
      require("telescope").extensions.frecency.frecency({
        path_display = { "tail" }
      })
    end, { desc = "Frecency files" })
  end
}
