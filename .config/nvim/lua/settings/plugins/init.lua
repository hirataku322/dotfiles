return {
  -- Basic
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',
  'github/copilot.vim',

  -- Theme
  'folke/tokyonight.nvim',
  'sheerun/vim-polyglot', -- old syntax highlighting
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- Status Line
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Other
  'stevearc/overseer.nvim',
  'mogelbrod/vim-jsonpath',
  'jalvesaq/Nvim-R',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

  -- OIl
  {
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
}
