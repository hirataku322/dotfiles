return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = 'nightfly',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        {
          'filename',
          path = 4,
        }
      },
      lualine_x = {'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    }
  }
}
