return {
  {
    'akinsho/toggleterm.nvim',
    versoin = '*',
    config = function()
      require("toggleterm").setup{}
      vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=float<CR>", options)
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      end
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
}
