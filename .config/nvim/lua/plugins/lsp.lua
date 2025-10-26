return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"ts_ls",
				"jdtls",
				"lua_ls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- setup using vim.lsp.config (Neovim 0.11+)
			vim.lsp.config.pyright = {}
			vim.lsp.config.ts_ls = {}
			vim.lsp.config.jdtls = {}
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}
			vim.lsp.config.vimls = {}

			-- Enable LSP servers
			vim.lsp.enable({ 'pyright', 'ts_ls', 'jdtls', 'lua_ls', 'vimls' })

			-- Keymaps
			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
			vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
			vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
			vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
			vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

			-- Handlers
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
		end,
	},
}
