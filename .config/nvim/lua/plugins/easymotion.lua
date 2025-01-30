return {
  'easymotion/vim-easymotion',
  -- require(vim-easymotion).setup()は不要
  config = function() 
    vim.keymap.set('n', '<leader>f', '<Plug>(easymotion-overwin-w)')
  end
}
