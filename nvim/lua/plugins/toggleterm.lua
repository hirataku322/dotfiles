return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-h>",     desc = "Toggle terminal" },
    { "<leader>l", desc = "Toggle lazygit" },
    { "<C-,>",     desc = "Toggle claude" },
  },
  config = function()
    require("toggleterm").setup({
      float_opts = {
        height = function()
          return math.floor(vim.o.lines * 0.89)
        end,
        border = "rounded",
      },
    })

    -- ターミナルモードでのキーマップ設定
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0, desc = "Move to left window" })
        vim.keymap.set("t", "<C-,>", [[<Cmd>wincmd h<CR>]], { buffer = 0, desc = "Move to left window" })
      end,
    })

    -- フローティングターミナルのトグル（現在のファイルのディレクトリで開く）
    vim.keymap.set("n", "<C-h>", function()
      local dir = vim.fn.fnameescape(vim.fn.expand("%:p:h"))
      vim.cmd("ToggleTerm direction=float dir=" .. dir)
    end, { desc = "Toggle terminal" })

    -- lazygit in toggleterm
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    vim.keymap.set("n", "<leader>l", function()
      lazygit:toggle()
    end, { desc = "Toggle lazygit" })

    -- AIエージェントCLIをホスト名で切り替え(個人Macはclaude、それ以外はopencode)
    local personal_hostnames = {
      "yamakawatakutos-MacBook-Air.local",
      "yamakawatakutos-MacBook-Air",
    }
    local hostname = vim.fn.hostname()
    local is_personal = vim.tbl_contains(personal_hostnames, hostname)
    local agent_cmd = is_personal and "claude" or "opencode"

    local agent = Terminal:new({
      cmd = agent_cmd,
      direction = "float",
      hidden = true,
    })

    vim.keymap.set("n", "<C-,>", function()
      agent:toggle()
    end, { desc = "Toggle " .. agent_cmd })
  end,
}
