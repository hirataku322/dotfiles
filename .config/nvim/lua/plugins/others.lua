return {
  -- Basic
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'numToStr/Comment.nvim',

  -- Theme
  'sheerun/vim-polyglot', -- old syntax highlighting

  -- Status Line
  'nvim-tree/nvim-web-devicons',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- LSP
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
}
