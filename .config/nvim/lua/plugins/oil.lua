return {
  {
    'stevearc/oil.nvim',
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      watch_for_changes= true,
      view_options = {
        show_hidden = true
      }
    }, 
    keys = {
      { "<C-n>", "<CMD>Oil<CR>" }
    },
    lazy = false,
  },
  {
     opts = {}
  }
		"nvim-tree/nvim-web-devicons",
}
