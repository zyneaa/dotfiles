-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust", "c", "cpp", "js", "ts", "java" },
  callback = function()
    vim.opt.foldmarker = "{,}"
    vim.opt_local.foldmethod = "marker"
  end,
})

vim.filetype.add({
  extension = {
    reix = "ts",
    wiggle = "markdown",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end,
})
