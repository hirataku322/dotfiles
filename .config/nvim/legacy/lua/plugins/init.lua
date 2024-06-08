local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypth,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- Basic
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',
  'github/copilot.vim',

  -- Theme
  'folke/tokyonight.nvim',
  'sheerun/vim-polyglot', -- old syntax highlighting
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- Status Line
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- Filer
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Other
  'stevearc/overseer.nvim',
  'mogelbrod/vim-jsonpath',
  'jalvesaq/Nvim-R',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --     event = "VeryLazy",
  --     config = function()
  --       require("chatgpt").setup()
  --     end,
  --     dependencies = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "folke/trouble.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
})
