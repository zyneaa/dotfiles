-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local function create_folder_in_current_dir()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local dir = vim.fn.fnamemodify(buf_path, ":h")
  vim.ui.input({ prompt = "Folder name: " }, function(folder_name)
    if folder_name and #folder_name > 0 then
      local path = dir .. "/" .. folder_name
      vim.fn.mkdir(path, "p")
      print("Created folder: " .. path)
    else
      print("No folder name given.")
    end
  end)
end

local function create_folder_custom_location()
  vim.ui.input({ prompt = "Full folder path: " }, function(path)
    if path and #path > 0 then
      vim.fn.mkdir(path, "p")
      print("Created folder: " .. path)
    else
      print("No path given.")
    end
  end)
end

vim.keymap.set("n", "<leader>ad", create_folder_in_current_dir, { desc = "Make folder in current file dir" })
vim.keymap.set("n", "<leader>af", create_folder_custom_location, { desc = "Make folder in custom location" })

-- This binds the LSP rename function to `<leader>rn`
vim.api.nvim_set_keymap(
  "n",
  "<leader>rn",
  ":lua vim.lsp.buf.rename()<CR>",
  { desc = "Replace every occurrence", noremap = true, silent = true }
)

-- Delete current buffer and its respective file
local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand("%"))
    vim.api.nvim_buf_delete(0, { force = true })
  end
end
vim.keymap.set("n", "<leader>rm", confirm_and_delete_buffer, { desc = "Delete current buffer and file" })

-- Delete current buffer
vim.keymap.set("n", "<leader>rr", function()
  vim.api.nvim_buf_delete(0, { force = true })
end, { desc = "Delete current buffer" })

-- Nuke all the buffers
vim.keymap.set("n", "<leader>ra", function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end
end, { desc = "Rapture All Buffers" })

-- New file and buffer at currently opened buffer's dir
vim.keymap.set("n", "<leader>fa", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local filename = vim.fn.input("Enter filename: ")

  if filename == "" then
    print("Invalid filename or ESC entered")
    return
  end

  local fullpath = current_dir .. "/" .. filename
  if vim.fn.filereadable(fullpath) == 1 then
    print("File already exists: " .. fullpath)
    return
  end

  vim.cmd("edit " .. vim.fn.fnameescape(fullpath))
  print("New file created: " .. fullpath)
end, { desc = "Create new file in current buffer's dir" })

-- New file at given path
vim.keymap.set("n", "<leader>fs", function()
  local filepath = vim.fn.input("Enter full path: ")
  if filepath == "" then
    print("Invalid path or ESC entered")
    return
  end

  local dir = vim.fn.fnamemodify(filepath, ":p:h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p") -- create dirs if missing
  end

  if vim.fn.filereadable(filepath) == 1 then
    print("File already exists: " .. filepath)
    return
  end

  vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  print("New file created: " .. filepath)
end, { desc = "Create new file from path" })

-- Error pop-up
vim.keymap.set("n", "<leader>se", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic (error) in float" })

-- Jump to next error
vim.keymap.set("n", "<Leader>mm", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Jump to next error" })

-- Jump to next warning
vim.keymap.set("n", "<Leader>m", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
end, { desc = "Jump to next warning" })

-- Lua line toggle
vim.keymap.set("n", "<leader>tl", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3 -- show global statusline
  else
    vim.o.laststatus = 0 -- hide it
  end
end, { desc = "Toggle LuaLine" })

vim.keymap.set("n", "<leader>cp", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.cmd("LspStart")
    print("LSP back on deck")
  else
    vim.cmd("LspStop")
    print("LSP is cooked")
  end
end, { desc = "Toggle LSP" })

-- Global tracking variable for the persistent terminal buffer ID
local term_buf_id = nil

-- 1. "Fold" / Toggle Terminal (Keeps output history alive)
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  -- If we are currently inside a terminal buffer, hide it (switch to previous buffer)
  if vim.bo.buftype == "terminal" then
    vim.cmd("wincmd p")
    return
  end

  -- If the terminal buffer exists and is valid, re-open it in a split
  if term_buf_id and vim.api.nvim_buf_is_valid(term_buf_id) then
    vim.cmd("botright split")
    vim.cmd("buffer " .. term_buf_id)
    vim.cmd("resize 15") -- Adjust height to your liking
    vim.cmd("startinsert")
  else
    -- Create a brand new terminal split if none exists
    vim.cmd("botright split")
    vim.cmd("terminal")
    vim.cmd("resize 15")
    term_buf_id = vim.api.nvim_get_current_buf()
    vim.cmd("startinsert")
  end
end, { desc = "Toggle/Fold Terminal (Keep History)" })

-- 2. "Kill" / Flush Terminal (Completely destroys the buffer and process)
vim.keymap.set({ "n", "t" }, "<leader>tk", function()
  -- Find if there's any active terminal buffer running
  local current_buf = vim.api.nvim_get_current_buf()

  if vim.bo[current_buf].buftype == "terminal" then
    -- If inside the terminal, kill it directly
    vim.cmd("bdelete!")
    term_buf_id = nil
    print("Terminal killed.")
  elseif term_buf_id and vim.api.nvim_buf_is_valid(term_buf_id) then
    -- If outside the terminal but it exists, nuke it by ID
    vim.api.nvim_buf_delete(term_buf_id, { force = true })
    term_buf_id = nil
    print("Terminal killed.")
  else
    print("No active terminal to kill.")
  end
end, { desc = "Kill Terminal Process Completely" })

-- 3. Ergonomic Terminal Mode Escape
-- Let's you hit <Esc> to drop into normal mode inside the terminal split
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Escape Terminal Mode" })
