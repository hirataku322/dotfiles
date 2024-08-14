vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set
options = {noremap = true}

-- Mappings
map('n', 'k', 'gk', options)
map('n', 'j', 'gj', options)
map({'i', 'v'}, '<C-c>', '<ESC>', options)
map('n', '<C-l>', ':nohlsearch<CR>', options)

-- Window
map('n', 'ss', ':sp<CR>', options)
map('n', 'sv', ':vs<CR>', options)
map('n', 'sq', ':q!<CR>', options)
map('n', 'sj', '<C-w>j', options)
map('n', 'sk', '<C-w>k', options)
map('n', 'sl', '<C-w>l', options)
map('n', 'sh', '<C-w>h', options)
map('n', 'sJ', '<C-w>J', options)
map('n', 'sK', '<C-w>K', options)
map('n', 'sL', '<C-w>L', options)
map('n', 'sH', '<C-w>H', options)
map('n', 's>', '<C-w>>', options)
map('n', 's<', '<C-w><', options)
map('n', 's+', '<C-w>+', options)
map('n', 's-', '<C-w>-', options)

-- Buffer
map('n', '<C-j>', ':bp<CR>', options)
map('n', '<C-k>', ':bn<CR>', options)
map('n', 'sd', ':bp|bd#<CR>', options)
