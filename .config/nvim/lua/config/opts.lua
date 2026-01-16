-- ファイル設定
vim.opt.fenc = "utf-8"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true

-- 表示設定
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.laststatus = 0
vim.opt.signcolumn = "yes"

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

-- UI改善
vim.opt.termguicolors = true -- 24bitカラーサポート
vim.opt.splitright = true -- 垂直分割を右に開く
vim.opt.splitbelow = true -- 水平分割を下に開く
vim.opt.scrolloff = 8 -- カーソル上下に常に8行表示
vim.opt.sidescrolloff = 8 -- カーソル左右に常に8列表示

-- パフォーマンス
vim.opt.updatetime = 250 -- CursorHoldの反応速度改善（GitSignsなど）
vim.opt.timeoutlen = 300 -- キーマップのタイムアウト短縮

-- Undo永続化
vim.opt.undofile = true -- undoファイルを保存

-- 置換プレビュー
vim.opt.inccommand = "split" -- 置換時にリアルタイムプレビュー表示

-- その他
vim.opt.wildmode = "list:longest"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.history = 1000
vim.opt.helplang = "ja"
