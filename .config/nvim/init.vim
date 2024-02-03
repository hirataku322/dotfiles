runtime plug.vim
runtime theme.vim
runtime fern.vim
runtime coc.vim

lua require('Comment').setup()
lua require("toggleterm").setup()
lua require('telescope').load_extension('fzf')

let mapleader = "\<Space>"
syntax enable 

set number
set fenc=utf-8 
set nobackup 
set noswapfile 
set autoread 
set hidden 
set showcmd 
set autochdir

" Visual
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set smartindent 
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 
set wildmode=list:longest "コマンドラインの補完
set cursorline

"Tab系
set list listchars=tab:\▸\- "不可視文字を可視化(タブが「▸-」と表示される)
set expandtab "Tab文字を半角スペースにする
set tabstop=2 "行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=2 "行頭でのTab文字の表示幅

"検索系
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示

"ヤンクをClipBoardに
set clipboard=unnamedplus
set clipboard+=unnamed

set helplang=ja,en
set history=1000

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
nnoremap sd :bd<CR>

"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Control + c でnormalモードに戻る
inoremap <silent> <C-c> <ESC>
vnoremap <silent> <C-c> <ESC>

nnoremap zz zt
nnoremap zt zz

"コマンド履歴をたどる際のフィルタリングを可能にする
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"ハイライトを無効化するた目のショートカット
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"アクティブなファイルが含まれているディレクトリを手早く展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"vim easy-motion 
noremap <leader>f <Plug>(easymotion-bd-w)

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Telecsope
let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
nnoremap <expr> <C-p> ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'
nnoremap <expr> <leader>jg ':Telescope live_grep cwd='.FindRootDirectory().'/<cr>'
nnoremap <leader>jb <cmd>Telescope buffers<cr>
nnoremap <leader>jh <cmd>Telescope help_tags<cr>

" ウィンドウ分割を楽にする設定
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q!<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-

"タブ操作
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)"
nmap ga <Plug>(EasyAlign)

" autocmd
autocmd BufRead, BufNewFile *.hql set filetype=sql

" jsonpath
" Optionally copy path to a named register (* in this case) when calling :JsonPath
let g:jsonpath_register = '*'
au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>

" toggleterm
lua << EOF
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
end, {})

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
      '--glob',  -- this flag allows you to hide exclude these files and folders from your search 👇
      '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock, *.DS_Store}', 
    }
  }
}
EOF
