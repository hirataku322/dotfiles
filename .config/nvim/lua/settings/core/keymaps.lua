vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local keymap = vim.keymap

-- normal mode
keymap.set('n', 'k', 'gk')
keymap.set('n', 'j', 'gj')
keymap.set('n', '<C-l>', ':nohlsearch<CR>')
keymap.set('n', '<C-r>', ':w<CR>:luafile %<CR>:nohlsearch<CR>')
keymap.set('n', 'ss', ':sp<CR>')
keymap.set('n', 'sv', ':vs<CR>')
keymap.set('n', 'sq', ':q!<CR>')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sl', '<C-w>l')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sJ', '<C-w>J')
keymap.set('n', 'sK', '<C-w>K')
keymap.set('n', 'sL', '<C-w>L')
keymap.set('n', 'sH', '<C-w>H')
keymap.set('n', 's>', '<C-w>>')
keymap.set('n', 's<', '<C-w><')
keymap.set('n', 's+', '<C-w>+')
keymap.set('n', 's-', '<C-w>-')
keymap.set('n', '<C-j>', ':bp<CR>')
keymap.set('n', '<C-k>', ':bn<CR>')
keymap.set('n', 'sd', ':bp|bd#<CR>')

-- insert mode
keymap.set('i', '<C-c>', '<ESC>')

-- visual mode
keymap.set('v', '<C-c>', '<ESC>')
