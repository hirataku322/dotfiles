local lsp_servers = {
  "pyright",
  "lua_ls",
  "jsonls",
  "yamlls",
  "ts_ls",
  "vue_ls",
}

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = lsp_servers,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local server_configs = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        ts_ls = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath('data') ..
                    "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
        },
      }

      for _, server in ipairs(lsp_servers) do
        vim.lsp.config[server] = server_configs[server] or {}
      end

      vim.lsp.enable(lsp_servers)

      local keymaps = {
        -- 情報表示
        { "n", "K",  vim.lsp.buf.hover },
        { "n", "ge", vim.diagnostic.open_float },
        -- ナビゲーション
        { "n", "gd", vim.lsp.buf.definition },
        { "n", "gD", vim.lsp.buf.declaration },
        { "n", "gi", vim.lsp.buf.implementation },
        { "n", "gt", vim.lsp.buf.type_definition },
        { "n", "gr", vim.lsp.buf.references },
        { "n", "g]", vim.diagnostic.goto_next },
        { "n", "g[", vim.diagnostic.goto_prev },
        -- コード操作
        { "n", "gn", vim.lsp.buf.rename },
        { "n", "ga", vim.lsp.buf.code_action },
      }

      for _, keymap in ipairs(keymaps) do
        vim.keymap.set(keymap[1], keymap[2], keymap[3])
      end
    end,
  },
}
