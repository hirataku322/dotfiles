call plug#begin('~/.vim/plugged')

" Visual 
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'sainnhe/gruvbox-material' 
Plug 'sheerun/vim-polyglot' "syntax highlight
Plug 'lambdalisue/glyph-palette.vim'

" Status Line
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

" Vim Command
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'ggandor/leap.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-file-browser.nvim' " find_files and grepをするために導入

" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" git
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'airblade/vim-gitgutter'

" Other
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'github/copilot.vim'
Plug 'honza/vim-snippets'
Plug 'stevearc/overseer.nvim'
Plug 'airblade/vim-rooter'
Plug 'mogelbrod/vim-jsonpath'


call plug#end()
