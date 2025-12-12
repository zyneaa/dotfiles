-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Disable autoformatting globally
vim.g.autoformat = false

vim.g.db_ui_execute_on_save = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.g.autoformat = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.g.autoformat = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Disable autoformat after leaving Lua buffer
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.lua",
  callback = function()
    vim.g.autoformat = false
  end,
})
