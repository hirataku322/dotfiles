return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make' 
  },
  { 
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.g['findroot_not_for_subdir'] = 0
      vim.g['rooter_patterns'] = {'.git', '.svn', 'package.json', '!node_modules'}

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            -- 検索から除外するものを指定
            "^.git/",
            "^.cache/",
            "^Library/",
            "Parallels",
            "^Movies",
            "^Music",
          },
          vimgrep_arguments = {
            -- ripggrepコマンドのオプション
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
          },
        },
        extensions = {
          -- ソート性能を大幅に向上させるfzfを使う
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")

      function get_git_root()
        return string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
      end

      function find_files()
        require('telescope.builtin').find_files({cwd = get_git_root(), hidden=true})
      end

      function live_grep()
        require('telescope.builtin').live_grep({cwd = get_git_root(), hidden=true})
      end
      vim.keymap.set('n', '<C-p>', find_files, options)
      vim.keymap.set('n', '<leader>jg', live_grep, options)
      vim.keymap.set('n', '<leader>jb', require('telescope.builtin').buffers, options)
      vim.keymap.set('n', '<leader>jh', require('telescope.builtin').help_tags, options)
    end
  },
}
