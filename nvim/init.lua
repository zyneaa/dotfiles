-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("kanagawa").setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = { bold = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false, -- let your medieval parchment show
  dimInactive = false,
  terminalColors = true,
  theme = "lotus",
  background = {
    dark = "lotus",
    light = "lotus",
  },
  colors = {
    theme = {
      lotus = {
        ui = {
          bg = "none",
          bg_gutter = "none",
          fg = "#393E46",
        },
        syn = {
          comment = "#343131",
          variable = "#9A3F3F",
          constant = "#432323",
          identifier = "#1B3C53",
          statement = "#3A0519",
          preproc = "#c0844a",
          special = "#bca672",
          string = "#021526",
          number = "#000B58",
          keyword = "#b57444",
          func = "#d6c48e",
        },
      },
    },
  },
  overrides = function(colors)
    return {
      Normal = { fg = "#222831", bg = "none" },
      Visual = { bg = "#3e382c" },
    }
  end,
})
vim.cmd.colorscheme("catppuccin")
