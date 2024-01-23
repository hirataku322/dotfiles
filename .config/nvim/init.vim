runtime plug.vim

lua require('Comment').setup()
lua require("toggleterm").setup()
lua require('telescope').load_extension('fzf')

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" leaderの設定
let mapleader = "\<Space>"

" カラーテーマ
if has('termguicolors')
  set termguicolors
endif

set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_transparent_background=2
" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

"setting
set number
set fenc=utf-8 
set nobackup 
set noswapfile 
set autoread 
set hidden 
set showcmd 

" Visual
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set smartindent 
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 
set wildmode=list:longest "コマンドラインの補完
set cursorline

syntax enable 

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

"Buffer
au BufRead, BufNewFile *.hql set filetype=sql " hqlを .sql ファイルとして扱う

" タブ操作
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprevious<CR>

" 現在のタブを閉じる
nnoremap <leader>q :tabclose<CR>

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

" command + c でコピー
" DはCommand。terminal自体のショートカットキーとしてCommandが割り当てられている事が多く、動作しない可能性があるらしい
" noremap <D-c> y "

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
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>jg <cmd>Telescope live_grep<cr>
nnoremap <leader>jb <cmd>Telescope buffers<cr>
nnoremap <leader>jh <cmd>Telescope help_tags<cr>

 " Fern
nmap <C-n> :Fern . -reveal=% -drawer -toggle<CR>
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1 "隠しファイルをデフォルトで表示

function! s:init_fern() abort
  nmap <buffer> D <Plug>(fern-action-trash=)y<CR>
  nnoremap <buffer><silent> <Plug>(fern-my-enter-project-root) 
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()

" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" Airline SETTINGS
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" ウィンドウ分割を楽にする設定
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

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Highlight extra whitespaces
" https://zenn.dev/kawarimidoll/articles/450a1c7754bde6
" u00A0 ' ' no-break space
" u2000 ' ' en quad
" u2001 ' ' em quad
" u2002 ' ' en space
" u2003 ' ' em space
" u2004 ' ' three-per em space
" u2005 ' ' four-per em space
" u2006 ' ' six-per em space
" u2007 ' ' figure space
" u2008 ' ' punctuation space
" u2009 ' ' thin space
" u200A ' ' hair space
" u200B '​' zero-width space
" u3000 '　' ideographic (zenkaku) space
autocmd VimEnter * ++once
      \ call matchadd('ExtraWhitespace', "[\u00A0\u2000-\u200B\u3000]")
      \ | highlight default ExtraWhitespace ctermbg=darkmagenta guibg=darkmagenta

" 補完用floating windowの透明度を設定
set pumblend=10

" Snippets周りの設定
" Use <C-l> for trigger snippet expand.
vmap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"Diagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

"ノーマルモードで
nmap <silent> <leader><leader> :CocList<cr>
nmap <silent> <leader>h :<C-u>call CocAction('doHover')<cr>
nmap <silent> <leader>df <Plug>(coc-definition)
nmap <silent> <leader>rf <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>mt <Plug>(coc-format)

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
EOF
