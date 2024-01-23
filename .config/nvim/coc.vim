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

