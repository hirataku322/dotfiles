return {
  {
    'easymotion/vim-easymotion',
    config = function() 
      vim.keymap.set('n', '<leader>f', '<Plug>(easymotion-bd-w)', options)
    end
  }
}
