local opt = vim.opt

opt.number=true
opt.fenc='utf-8' 
opt.backup=false
opt.swapfile=false 
opt.autoread=true 
opt.hidden=true 
opt.showcmd=true 
opt.autochdir=true
opt.history=1000

opt.virtualedit='onemore' 
opt.smartindent=true
opt.showmatch=true
opt.laststatus=2 
opt.wildmode='list:longest'
opt.cursorline=true

opt.list=true
opt.listchars='tab:▸-'
opt.expandtab=true
opt.tabstop=2 
opt.shiftwidth=2 

opt.ignorecase=true
opt.smartcase=true
opt.incsearch=true
opt.wrapscan=true
opt.hlsearch=true

opt.clipboard='unnamed'
opt.clipboard:append{'unnamedplus'}
