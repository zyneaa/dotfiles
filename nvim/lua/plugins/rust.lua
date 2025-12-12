return {
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            auto = false,
            only_current_line = false,
            show_parameter_hints = true,
            show_variable_hints = true,
          },
        },
      })
    end,
  },
}
