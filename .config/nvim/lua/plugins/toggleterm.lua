return {
  {
    'akinsho/toggleterm.nvim',
    versoin = '*',
    config = function()
      -- 同じキーでオンオフを切り替える
      require("toggleterm").setup{}
      vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=float<CR>", options)
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      end
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

      -- lazygitをtoggletermで開く
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end
      vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", options)
    end
  }
}
