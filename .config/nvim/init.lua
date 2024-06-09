require("settings/core")
require("settings/lazy")

local keymap = vim.keymap
local opt = vim.opt

-- Color Scheme
opt.termguicolors=true
vim.g.nightflyTransparent = true
vim.cmd[[colorscheme nightfly]]

keymap.set('n', '<leader>f', '<Plug>(easymotion-bd-w)')
keymap.set("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>")


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

keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>")

require('bufferline').setup()
require('Comment').setup()
