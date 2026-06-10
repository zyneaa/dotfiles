return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      section_separators = { left = "▓▒░", right = "░▒▓" },
    },
    sections = {
      lualine_b = {
        "branch",
      },
      lualine_x = {},
      lualine_y = {},
    },
  },
}
