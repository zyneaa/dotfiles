return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load()
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = true,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      integrations = {
        telescope = { enabled = true, style = "nvchad" },
        dropbar = { enabled = true, color_mode = true },
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { fg = colors.mauve, bg = "none" },
          LspInfoBorder = { fg = colors.mauve, bg = "none" },
        }
      end,
    },
  },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      extra_groups = {
        "AvanteBackground",
        "AvanteInput",
        "AvanteSplit",
        "NormalFloat",
        "FloatBorder",
      },
    },
  },
}
