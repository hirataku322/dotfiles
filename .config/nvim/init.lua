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
set.cursorlin=true

set.list listchars='tab:\▸\-'
set.expandtab=true
set.tabstop=2 
set.shiftwidth=2 

set.ignorecase=true
set.smartcase=true
set.incsearch=true
set.wrapscan=true
set.hlsearch=true

set.clipboard=unnamedplus
-- set.clipboard+=unnamed

set.history=1000

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
nnoremap sd :bd<CR>


nnoremap j gj
nnoremap k gk


inoremap <silent> <C-c> <ESC>
vnoremap <silent> <C-c> <ESC>

nnoremap zz zt
nnoremap zt zz


cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


noremap <leader>f <Plug>(easymotion-bd-w)


map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge


let g:findroot_not_for_subdir = 0
let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
nnoremap <expr> <C-p> ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'
nnoremap <expr> <leader>jg ':Telescope live_grep cwd='.FindRootDirectory().'/<cr>'
nnoremap <leader>jb <cmd>Telescope buffers<cr>
nnoremap <leader>jh <cmd>Telescope help_tags<cr>


nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q!<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-


nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
