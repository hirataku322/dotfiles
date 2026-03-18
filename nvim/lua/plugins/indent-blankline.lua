return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup {
      indent = { char = "│" },
      whitespace = {
        highlight = { "Whitespace" }
      },
      scope = {
        enabled = false,
      }
    }
  end,
}
