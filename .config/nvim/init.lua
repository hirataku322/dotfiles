require('plugins')

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set
local set = vim.opt

options = {noremap = true}

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

-- BufferLine
map('n', 'gb', '<CMD>BufferLinePick<CR>')
map('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
map('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
map('n', ']b', '<CMD>BufferLineMoveNext<CR>')
map('n', '[b', '<CMD>BufferLineMovePrev<CR>')
map('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')

-- Other
map("n", "<C-n>", "<CMD>Oil<CR>")
map('n', '<leader>f', '<Plug>(easymotion-bd-w)', options)
map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", options)

-- ToggleTerm
require("toggleterm").setup{}
map("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>", options)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Color Scheme
set.termguicolors=true
vim.g.nightflyTransparent = true
vim.cmd[[colorscheme nightfly]]

-- Telecsope
vim.g['findroot_not_for_subdir'] = 0
vim.g['rooter_patterns'] = {'.git', '.svn', 'package.json', '!node_modules'}

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      -- 検索から除外するものを指定
      "^.git/",
      "^.cache/",
      "^Library/",
      "Parallels",
      "^Movies",
      "^Music",
    },
    vimgrep_arguments = {
      -- ripggrepコマンドのオプション
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-uu",
    },
  },
  extensions = {
    -- ソート性能を大幅に向上させるfzfを使う
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
require("telescope").load_extension("fzf")

-- LazyGit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

-- Overseer
require('overseer').setup({
  templates = {"builtin", "user.run_script" },
})

vim.api.nvim_create_user_command("WatchRun", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "run script" }, function(task)
    if task then
      task:add_component({ "restart_on_save", paths = {vim.fn.expand("%:p")} })
      local main_win = vim.api.nvim_get_current_win()
      overseer.run_action(task, "open vsplit")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {}
)

-- Lualine
require('lualine').setup {
  options = {
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

require("oil").setup({
    view_options = {
      show_hidden = true
    }
  }
)
require'nvim-web-devicons'.setup {}
require('bufferline').setup()
require('Comment').setup()
