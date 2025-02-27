return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "typescript", "tsx", "javascript", "html", "lua", "rust", "toml" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		ident = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	},
	build = ":TSUpdate",
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
