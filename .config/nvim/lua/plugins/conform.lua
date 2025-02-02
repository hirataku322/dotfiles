return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local format_on_save_opt = {
			timeout_ms = 500,
			lsp_fallback = true,
			async = false,
		}
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				typescript = { "prettier" },
			},
			format_on_save = format_on_save_opt,
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format(format_on_save_opt)
		end)
	end,
}
