return {
  'akinsho/toggleterm.nvim', 
  versoin = '*', 
  config = function()
    vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>")

    -- lazygit
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>")
  end
}
