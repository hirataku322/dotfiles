vim.opt.fenc='utf-8' 
vim.opt.backup=false
vim.opt.swapfile=false 
vim.opt.autoread=true 
vim.opt.hidden=true 
vim.opt.showcmd=true 
vim.opt.autochdir=true

vim.opt.virtualedit='onemore' 
vim.opt.smartindent=true
vim.opt.showmatch=true
vim.opt.laststatus=2 
vim.opt.wildmode='list:longest'
vim.opt.cursorline=true

vim.opt.list=true
vim.opt.listchars='tab:▸-'
vim.opt.expandtab=true
vim.opt.tabstop=2 
vim.opt.shiftwidth=2 

vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.incsearch=true
vim.opt.wrapscan=true
vim.opt.hlsearch=true

vim.opt.clipboard='unnamed'
vim.opt.clipboard:append{'unnamedplus'}

vim.opt.history=1000

-- Color Scheme
vim.opt.termguicolors=true
vim.g.nightflyTransparent = true
vim.cmd[[colorscheme nightfly]]