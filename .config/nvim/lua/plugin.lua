local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypth,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',

  -- Theme
  'folke/tokyonight.nvim',
  'sheerun/vim-polyglot', -- old syntax highlighting
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',

  -- Filer
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- 'lambdalisue/fern.vim',
  -- 'lambdalisue/nerdfont.vim',
  -- 'lambdalisue/fern-renderer-nerdfont.vim',
  -- 'lambdalisue/glyph-palette.vim',

  'github/copilot.vim',
  'stevearc/overseer.nvim',
  'airblade/vim-rooter',
  'mogelbrod/vim-jsonpath',
  'jalvesaq/Nvim-R',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})
