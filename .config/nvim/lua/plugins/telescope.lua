return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.5,
            width = 0.9,
            height = 0.9,
          },
        },
        file_ignore_patterns = {
          "^.git/",
          "^.DS_Store",
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
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      local function get_git_root()
        local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
        if vim.v.shell_error ~= 0 then
          return vim.fn.getcwd()
        end
        return string.gsub(git_root, "\n", "")
      end

      local function find_files()
        builtin.find_files({ cwd = get_git_root(), hidden = true })
      end

      local function live_grep()
        builtin.live_grep({ cwd = get_git_root(), hidden = true })
      end

      vim.keymap.set("n", "<C-p>", find_files)
      vim.keymap.set("n", "<leader>jg", live_grep)
      vim.keymap.set("n", "<leader>jb", builtin.buffers)
      vim.keymap.set("n", "<leader>jh", builtin.help_tags)
    end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
}
