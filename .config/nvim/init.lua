vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set
local set = vim.opt

options = {noremap = true}

-- lazy.nvim options
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

set.rtp:prepend(lazypath)
require("lazy").setup({
  'tpope/vim-surround',
  'numToStr/Comment.nvim',
  'easymotion/vim-easymotion',

  'sainnhe/gruvbox-material' ,
  'sheerun/vim-polyglot', -- old syntax highlighting

  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',

  'lambdalisue/fern.vim',
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

-- Basic Options
set.number=true
set.fenc='utf-8' 
set.backup=false
set.swapfile=false 
set.autoread=true 
set.hidden=true 
set.showcmd=true 
set.autochdir=true

set.virtualedit='onemore' 
set.smartindent=true
set.showmatch=true
set.laststatus=2 
set.wildmode='list:longest'
set.cursorline=true

set.list=true
set.listchars='tab:▸-'
set.expandtab=true
set.tabstop=2 
set.shiftwidth=2 

set.ignorecase=true
set.smartcase=true
set.incsearch=true
set.wrapscan=true
set.hlsearch=true

set.clipboard='unnamed'
set.clipboard:append{'unnamedplus'}

set.history=1000
