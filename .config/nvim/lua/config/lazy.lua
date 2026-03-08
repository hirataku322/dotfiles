local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})

-- plugins/ ホットリロード（全reload。ファイル名からプラグイン名を解決できないため）
-- パフォーマンスよりも安定性を優先する
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.stdpath("config") .. "/lua/plugins/*.lua",
  callback = function(event)
    for _, plugin in pairs(require("lazy").plugins()) do
      require("lazy").reload(plugin)
    end
    vim.notify(
      "Reloaded all plugins (" .. vim.fn.fnamemodify(event.file, ":t") .. ")",
      vim.log.levels.INFO
    )
  end,
})
