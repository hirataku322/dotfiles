return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- LSP completion source
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- Snippet engine
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    -- Other sources
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require("cmp")

    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    local source_icons = {
      nvim_lsp = "λ",
      vsnip = "⋗",
      buffer = "Ω",
      path = "🖫",
      nvim_lua = "",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua", keyword_length = 2 },
        { name = "vsnip", keyword_length = 2 },
      }, {
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
      }),

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        format = function(entry, item)
          item.kind = string.format("%s %s", kind_icons[item.kind] or "", item.kind)
          item.menu = source_icons[entry.source.name] or entry.source.name
          return item
        end,
      },
    })
  end,
}
