require("settings/core")
require("settings/lazy")

local keymap = vim.keymap
local opt = vim.opt

keymap.set('n', '<leader>f', '<Plug>(easymotion-bd-w)')

require('bufferline').setup()
require('Comment').setup()
