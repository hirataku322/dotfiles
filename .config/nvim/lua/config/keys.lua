vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set({'i', 'v'}, '<C-c>', '<ESC>')
vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>')

vim.keymap.set('n', 'ss', ':sp<CR>')
vim.keymap.set('n', 'sv', ':vs<CR>')
vim.keymap.set('n', 'sq', ':q!<CR>')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 's>', '<C-w>>')
vim.keymap.set('n', 's<', '<C-w><')
vim.keymap.set('n', 's+', '<C-w>+')
vim.keymap.set('n', 's-', '<C-w>-')

vim.keymap.set('n', '<C-j>', ':bp<CR>')
vim.keymap.set('n', '<C-k>', ':bn<CR>')
vim.keymap.set('n', 'sd', ':bp|bd#<CR>')

vim.keymap.set('n', 'gd', '<Plug>(lsp-definition)')
vim.keymap.set('n', 'gs', '<Plug>(lsp-document-symbol-search)')
vim.keymap.set('n', 'gS', '<Plug>(lsp-workspace-symbol-search)')
vim.keymap.set('n', 'gr', '<Plug>(lsp-references)')
vim.keymap.set('n', 'gi', '<Plug>(lsp-implementation)')
vim.keymap.set('n', 'gt', '<Plug>(lsp-type-definition)')
vim.keymap.set('n', 'gn', '<Plug>(lsp-rename)')
vim.keymap.set('n', '[g', '<Plug>(lsp-previous-diagnostic)')
vim.keymap.set('n', ']g', '<Plug>(lsp-next-diagnostic)')
vim.keymap.set('n', 'K',  '<Plug>(lsp-hover)')
