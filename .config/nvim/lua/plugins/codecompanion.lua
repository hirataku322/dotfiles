return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      interactions = {
        chat = {
          adapter = {
            name = "opencode",
          },
          opts = {
            completion_provider = "cmp", -- fixed typo
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
          window = {
            layout = "float",
            width = 0.95,
            height = 0.95,
          },
          show_context = false,
        },
      },
      opts = {
        language = "Japanese"
      }
    })

    -- Keymaps for chat toggle and add
    local keymap_opts = { noremap = true, silent = true }
    vim.keymap.set({ "n", "v" }, "<C-,>", "<cmd>CodeCompanionChat Toggle<cr>", keymap_opts)
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", keymap_opts)

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
