vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set
options = {noremap = true}

-- Mappings
map('n', 'k', 'gk', options)
map('n', 'j', 'gj', options)
map({'i', 'v'}, '<C-c>', '<ESC>', options)
map('n', '<C-l>', ':nohlsearch<CR>', options)
map('n', '<C-r>', ':w<CR>:luafile %<CR>:nohlsearch<CR>', options)

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
map('n', '<C-p>', find_files, options)
map('n', '<leader>jg', live_grep, options)
map('n', '<leader>jb', require('telescope.builtin').buffers, options)
map('n', '<leader>jh', require('telescope.builtin').help_tags, options)

-- Other
map("n", "<C-n>", "<CMD>Oil<CR>")
map('n', '<leader>f', '<Plug>(easymotion-bd-w)', options)
map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", options)

-- ToggleTerm
require("toggleterm").setup{}
map("n", "<C-h>", ":ToggleTerm direction=float<CR>", options)
