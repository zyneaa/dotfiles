return {
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    lazy = false, -- Internal filetype lazy-loading is handled by the plugin
    config = function()
      local ht = require("haskell-tools")
      local bufnr = vim.api.nvim_get_current_buf()
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Core Haskell Keymaps
      -- 1. Run code lenses (crucial for type signatures and evaluations)
      vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run, opts)

      -- 2. Evaluate expressions inline inside comments
      vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)

      -- 3. GHCi REPL Management (Spawns a terminal split instantly)
      vim.keymap.set("n", "<leader>rl", ht.repl.toggle, opts) -- Toggle REPL for project
      vim.keymap.set("n", "<leader>rp", function()
        ht.repl.toggle(vim.api.nvim_buf_get_name(0))          -- Toggle REPL for current file
      end, opts)

      vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)   -- Safe quit REPL
      -- Standard LSP fallbacks if you don't have them globally configured
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
  },
}
