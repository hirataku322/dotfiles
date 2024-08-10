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
  -- Basic
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },

  -- Theme
  'sheerun/vim-polyglot', -- old syntax highlighting
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- Status Line
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Filer
  { 'stevearc/oil.nvim', opts = {}, dependencies = "nvim-tree/nvim-web-devicons"},

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- LSP
  "williamboman/mason.nvim",
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'simrat39/rust-tools.nvim',
})
