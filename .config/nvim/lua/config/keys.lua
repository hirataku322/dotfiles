vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.omni_sql_no_default_maps = 1

vim.keymap.set("n", "k", "gk", { desc = "表示行単位で上に移動" })
vim.keymap.set("n", "j", "gj", { desc = "表示行単位で下に移動" })
vim.keymap.set({ "i", "v" }, "<C-c>", "<ESC>", { desc = "ノーマルモードに移行" })
vim.keymap.set("n", "<C-l>", ":nohlsearch<CR>", { desc = "検索ハイライトを消去" })

vim.keymap.set("n", "ss", ":sp<CR>", { desc = "水平分割" })
vim.keymap.set("n", "sv", ":vs<CR>", { desc = "垂直分割" })
vim.keymap.set("n", "sq", ":q!<CR>", { desc = "強制終了" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "下のウィンドウに移動" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "上のウィンドウに移動" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "右のウィンドウに移動" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "左のウィンドウに移動" })
vim.keymap.set("n", "s>", "<C-w>>", { desc = "ウィンドウ幅を広げる" })
vim.keymap.set("n", "s<", "<C-w><", { desc = "ウィンドウ幅を狭める" })
vim.keymap.set("n", "s+", "<C-w>+", { desc = "ウィンドウ高を高くする" })
vim.keymap.set("n", "s-", "<C-w>-", { desc = "ウィンドウ高を低くする" })

vim.keymap.set("n", "sd", ":bp|bd#<CR>", { desc = "現在のバッファを削除" })
