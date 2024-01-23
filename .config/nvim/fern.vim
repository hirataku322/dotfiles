let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1 "隠しファイルをデフォルトで表示

nmap <C-n> :Fern . -reveal=% -drawer -toggle<CR>

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