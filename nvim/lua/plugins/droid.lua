return {
  -- Android Tooling Engine
  {
    "rizukirr/droid-nvim",
    ft = { "java", "xml", "groovy" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mason.org/mason.nvim", -- Auto-handles required background LSPs
    },
    opts = {},
    config = function(_, opts)
      require("droid").setup(opts)

      -- Keymaps for rapid terminal deployments
      vim.keymap.set("n", "<leader>ar", ":DroidRun<CR>", { desc = "Build, Install and Launch App" })
      vim.keymap.set("n", "<leader>ab", ":DroidBuild<CR>", { desc = "Compile APK Only" })
      vim.keymap.set("n", "<leader>al", ":DroidLogcat<CR>", { desc = "Open Logcat Terminal Panel" })
    end,
  },

  -- UI Picker integration (Optional, makes device selection clean)
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
