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
