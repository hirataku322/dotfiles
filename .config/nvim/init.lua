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
map('n', '<C-c>', '<ESC>', options)
map('v', '<C-c>', '<ESC>', options)
map('n', '<C-l>', ':nohlsearch<CR><C-l>', options)

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

map('n', '<C-j>', ':bprev<CR>', options)
map('n', '<C-k>', ':bnext<CR>', options)
map('n', 'sd', ':bd<CR>', options)

map('n', '<leader>f', '<Plug>(easymotion-bd-w)', options)

map('n', '<C-p>', ':Telescope find_files cwd=".FindRootDirectory()."<CR>', options)
map('n', '<leader>jg', ':Telescope live_grep cwd=".FindRootDirectory()."<CR>', options)
map('n', '<leader>jb', ':Telescope buffers<CR>', options)
map('n', '<leader>jh', ':Telescope help_tags<CR>', options)

map("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Nvim-R
vim.g['R_vsplit'] = 1
vim.g['R_assign'] = 0
vim.g['R_nvimpager'] = 'horizontal'
vim.g['R_objbr_place'] = 'console,right'
vim.g['R_objbr_opendf'] = 0
vim.g['R_app'] = 'radian'
vim.g['R_cmd'] = 'R'
vim.g['R_hl_term'] = 0
vim.g['R_bracketed_paste'] = 1

-- Color Scheme
set.termguicolors=true
vim.g.nightflyTransparent = true
vim.cmd[[colorscheme nightfly]]

-- Comment
require('Comment').setup()

-- Telecsope
vim.g['findroot_not_for_subdir'] = 0
vim.g['rooter_patterns'] = {'.git', '.svn', 'package.json', '!node_modules'}

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob',
      '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock, .DS_Store}'
    }
  },
}

-- Toggleterm
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Nvim-web-Devicon
require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 color_icons = true;
 default = true;
 strict = true;
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}

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
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  }
}

-- Oil
require("oil").setup()
