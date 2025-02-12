vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.omni_sql_no_default_maps = 1

vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")
vim.keymap.set({ "i", "v" }, "<C-c>", "<ESC>")
vim.keymap.set("n", "<C-l>", ":nohlsearch<CR>")

vim.keymap.set("n", "ss", ":sp<CR>")
vim.keymap.set("n", "sv", ":vs<CR>")
vim.keymap.set("n", "sq", ":q!<CR>")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "s>", "<C-w>>")
vim.keymap.set("n", "s<", "<C-w><")
vim.keymap.set("n", "s+", "<C-w>+")
vim.keymap.set("n", "s-", "<C-w>-")

vim.keymap.set("n", "<C-j>", ":bp<CR>")
vim.keymap.set("n", "<C-k>", ":bn<CR>")
vim.keymap.set("n", "sd", ":bp|bd#<CR>")
