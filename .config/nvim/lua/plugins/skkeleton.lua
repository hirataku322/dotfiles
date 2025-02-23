return {
	{
		"vim-skk/skkeleton",
		-- 依存関係を明示的に指定しなければならない
		-- skkeletonはvimscriptで実装されておりluaのrequireを使っていないため
		dependencies = { "vim-denops/denops.vim" },
		config = function()
			vim.cmd([[
        call skkeleton#config({
          \ 'globalDictionaries': ['~/.skk/SKK-JISYO.L'],
          \ 'completionRankFile': '~/.skk/rank.json',
          \ 'eggLikeNewline': v:true,
          \ })
      ]])
			vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-toggle)")
		end,
	},
	{
		"willelz/skk-tutorial.vim",
	},
}
