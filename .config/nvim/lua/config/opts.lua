-- ファイル設定
vim.opt.fenc = "utf-8"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true

-- 表示設定
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.showmatch = true

-- 編集設定
vim.opt.virtualedit = "onemore"
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- 検索設定
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true

-- その他
vim.opt.wildmode = "list:longest"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.history = 1000
vim.opt.helplang = "ja"

-- 注: autochdir は予期しない動作を引き起こす可能性があるため、
-- プロジェクトルート検出プラグインの使用を検討してください
-- vim.opt.autochdir = true
