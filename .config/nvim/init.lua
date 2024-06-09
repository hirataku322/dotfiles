require("settings/core")
require("settings/lazy")

local keymap = vim.keymap
local opt = vim.opt

-- Color Scheme
opt.termguicolors=true
vim.g.nightflyTransparent = true
vim.cmd[[colorscheme nightfly]]

keymap.set('n', '<leader>f', '<Plug>(easymotion-bd-w)')

require('bufferline').setup()
require('Comment').setup()
