return {
  {
    'simrat39/rust-tools.nvim',
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })

      -- LSP Diagnostics Options Setup 
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({name = 'DiagnosticSignError', text = ''})
      sign({name = 'DiagnosticSignWarn', text = ''})
      sign({name = 'DiagnosticSignHint', text = ''})
      sign({name = 'DiagnosticSignInfo', text = ''})

      vim.diagnostic.config({
          virtual_text = false,
          signs = true,
          update_in_insert = true,
          underline = true,
          severity_sort = false,
          float = {
              border = 'rounded',
              source = 'always',
              header = '',
              prefix = '',
          },
      })

      vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])

      --Set completeopt to have a better completion experience
      --
      -- menuone: popup even when there's only one match
      -- noinsert: Do not insert text until a selection is made
      -- noselect: Do not select, force to select one from the menu
      -- shortness: avoid showing extra messages when using completion
      -- updatetime: set updatetime for CursorHold
      vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
      vim.opt.shortmess = vim.opt.shortmess + { c = true}
      vim.api.nvim_set_option('updatetime', 300) 

      -- Fixed column for diagnostics to appear
      -- Show autodiagnostic popup on cursor hover_range
      -- Goto previous / next diagnostic warning / error 
      -- Show inlay_hints more frequently 
      vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])
    end
  }
}
