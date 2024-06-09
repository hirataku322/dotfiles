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
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Telescope
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Other
  'mogelbrod/vim-jsonpath',
  'jalvesaq/Nvim-R',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },
}
