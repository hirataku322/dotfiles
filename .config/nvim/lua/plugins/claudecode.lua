local toggle_key = "<C-,>"
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    focus_after_send = true,
    terminal = {
      snacks_win_opts = {
        position = "float",
        width = 0.9,
        height = 0.9,
        wo = {
          winblend = 100,
          winhighlight = "NormalFloat:MyTransparentGroup",
        },
        keys = {
          claude_hide_toggle_key = {
            toggle_key,
            function(self)
              self:hide()
            end,
            mode = "t",
            desc = "Hide",
          },
        },
      },
    },
    diff_opts = {
      keep_terminal_focus = true,
    }
  },
  keys = {
    { "<leader>a",  nil,                              desc = "AI/Claude Code" },
    { toggle_key,   "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude",       mode = { "n", "x" } },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
