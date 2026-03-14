return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "franco-ruggeri/codecompanion-spinner.nvim",
  },
  config = function()
    require("codecompanion").setup({
      interactions = {
        chat = {
          adapter = {
            name = "opencode",
          },
          opts = {
            completion_provider = "cmp",
          },
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
            },
            close = {
              modes = { n = "<C-c>", i = "<C-a>" },
            },
          },
        },
      },
      display = {
        chat = {
          show_context = false,
        },
      },
      opts = {
        language = "Japanese",
      },
      extensions = {
        spinner = {}
      }
    })

    -- Keymaps for chat toggle and add
    local keymap_opts = { noremap = true, silent = true }
    vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionChat Toggle<cr>", keymap_opts)
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", keymap_opts)

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
