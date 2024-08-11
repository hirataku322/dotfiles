vim.g.mapleader = ' '
vim.g.maplocalleader = ','

options = {noremap = true}

-- Mappings
vim.keymap.set('n', 'k', 'gk', options)
vim.keymap.set('n', 'j', 'gj', options)
vim.keymap.set({'i', 'v'}, '<C-c>', '<ESC>', options)
vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>', options)
vim.keymap.set('n', '<C-r>', ':w<CR>:luafile %<CR>:nohlsearch<CR>', options)

-- Window
vim.keymap.set('n', 'ss', ':sp<CR>', options)
vim.keymap.set('n', 'sv', ':vs<CR>', options)
vim.keymap.set('n', 'sq', ':q!<CR>', options)
vim.keymap.set('n', 'sj', '<C-w>j', options)
vim.keymap.set('n', 'sk', '<C-w>k', options)
vim.keymap.set('n', 'sl', '<C-w>l', options)
vim.keymap.set('n', 'sh', '<C-w>h', options)
vim.keymap.set('n', 'sJ', '<C-w>J', options)
vim.keymap.set('n', 'sK', '<C-w>K', options)
vim.keymap.set('n', 'sL', '<C-w>L', options)
vim.keymap.set('n', 'sH', '<C-w>H', options)
vim.keymap.set('n', 's>', '<C-w>>', options)
vim.keymap.set('n', 's<', '<C-w><', options)
vim.keymap.set('n', 's+', '<C-w>+', options)
vim.keymap.set('n', 's-', '<C-w>-', options)

-- Buffer
vim.keymap.set('n', '<C-j>', ':bp<CR>', options)
vim.keymap.set('n', '<C-k>', ':bn<CR>', options)
vim.keymap.set('n', 'sd', ':bp|bd#<CR>', options)

-- Telescope
function get_git_root()
  return string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
end

function find_files()
  require('telescope.builtin').find_files({cwd = get_git_root(), hidden=true})
end

function live_grep()
  require('telescope.builtin').live_grep({cwd = get_git_root(), hidden=true})
end
vim.keymap.set('n', '<C-p>', find_files, options)
vim.keymap.set('n', '<leader>jg', live_grep, options)
vim.keymap.set('n', '<leader>jb', require('telescope.builtin').buffers, options)
vim.keymap.set('n', '<leader>jh', require('telescope.builtin').help_tags, options)

-- Other
vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>")
vim.keymap.set('n', '<leader>f', '<Plug>(easymotion-bd-w)', options)
vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", options)

-- ToggleTerm
require("toggleterm").setup{}
vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=float<CR>", options)
