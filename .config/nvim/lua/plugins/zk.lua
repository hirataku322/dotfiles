return {
  "zk-org/zk-nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })

    local zk = require("zk")

    -- 新規ノート作成
    vim.keymap.set("n", "<leader>zn", function()
      local title = vim.fn.input("Title: ")
      if title ~= "" then
        zk.new({ title = title })
      end
    end, { desc = "zk: new note" })

    -- ノート検索
    vim.keymap.set("n", "<leader>zf", function()
      zk.edit({ sort = { "modified" } }, { title = "Notes" })
    end, { desc = "zk: find notes" })

    -- キーワード検索（本文をlive_grepで検索）
    vim.keymap.set("n", "<leader>zg", function()
      local notebook_path = vim.env.ZK_NOTEBOOK_DIR
      require("telescope.builtin").live_grep({ cwd = notebook_path })
    end, { desc = "zk: grep notes" })
  end,
}
