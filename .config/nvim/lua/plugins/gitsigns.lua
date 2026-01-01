return {
  'lewis6991/gitsigns.nvim',
  opts = {},
  keys = {
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>",      desc = "Git Diff This" },
    { "<leader>gD", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff This vs HEAD" },
    { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>",     desc = "Git Next Hunk" },
    { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>",     desc = "Git Prev Hunk" },
  }
}
