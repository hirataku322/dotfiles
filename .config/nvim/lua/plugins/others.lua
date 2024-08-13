return {
  -- Basic
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',
  {'akinsho/toggleterm.nvim', versoin = '*', config = true },

  -- Theme
  'sheerun/vim-polyglot', -- old syntax highlighting
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- Status Line
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- LSP
  "williamboman/mason.nvim",
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'simrat39/rust-tools.nvim',

  -- Completion framework
  'hrsh7th/nvim-cmp',

  -- LSP completion source
  'hrsh7th/cmp-nvim-lsp',

  -- Useful completion sources
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',                             
  'hrsh7th/cmp-path',                              
  'hrsh7th/cmp-buffer',                            
  'hrsh7th/vim-vsnip',                             

  -- Others
  'puremourning/vimspector',
  
  -- Oil
  { 
    'stevearc/oil.nvim', 
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {}, 
    config = function()
      require("oil").setup({
          view_options = {
            show_hidden = true
          }
        }
      )
      vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>")
    end
  }
}
