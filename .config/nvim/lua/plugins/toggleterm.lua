return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      float_opts = {
        height = function()
          return math.floor(vim.o.lines * 0.89)
        end,
        border = "solid",
      }
    })

    -- 同じキーでオンオフを切り替える
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=float<CR>")

    -- open lazygit in toggreterm
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    local function lazygit_toggle()
      lazygit:toggle()
    end
    vim.keymap.set("n", "<leader>lg", lazygit_toggle)
  end,
}
