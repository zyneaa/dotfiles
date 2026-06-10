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
          -- Core Layout Transparency
          AvanteBackground = { bg = "none", ctermbg = "none" },
          AvanteInput = { bg = "none", ctermbg = "none" },
          NormalFloat = { bg = "none", ctermbg = "none" },
          FloatBorder = { bg = "none", fg = colors.surface1 },
          WinSeparator = { bg = "none", fg = colors.surface0 },
          AvanteSplit = { bg = "none", fg = colors.surface0 },

          -- Muted hints
          AvantePopupHint = { bg = "none", fg = colors.overlay0 },
          AvanteInlineHint = { bg = "none", fg = colors.surface2 },

          -- 1. Main Title Capsule (The "Avante" box)
          AvanteTitle = { bg = colors.surface1, fg = colors.text, bold = true },
          -- Force the title corner symbols to match the exact same surface1 grey color
          AvanteReversedTitle = { fg = colors.surface1, bg = "none" },

          -- 2. Subtitle Capsules (The "Selected Code" / "Selected files" box)
          AvanteSubtitle = { bg = colors.surface0, fg = colors.subtext1, bold = false },
          -- Force the subtitle corner symbols to match the exact same surface0 grey color
          AvanteReversedSubtitle = { fg = colors.surface0, bg = "none" },

          -- 3. Third Title Capsules (The Input Box Header / generating prompts)
          AvanteThirdTitle = { bg = colors.surface0, fg = colors.subtext0 },
          -- Force the third title corner symbols to match the exact same surface0 grey color
          AvanteReversedThirdTitle = { fg = colors.surface0, bg = "none" },
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
