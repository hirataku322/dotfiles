return {
	"akinsho/toggleterm.nvim",
	versoin = "*",
	config = function()
		require("toggleterm").setup()

		-- 同じキーでオンオフを切り替える
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		end
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=float<CR>")

		-- open lazygit in toggreterm
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
		})

		function lazygit_toggle()
			lazygit:toggle()
		end
		vim.keymap.set("n", "<leader>lg", "<cmd>lua lazygit_toggle()<CR>")
	end,
}
