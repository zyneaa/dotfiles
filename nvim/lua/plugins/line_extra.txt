local colors = {
  color_0 = "#A888B5",
  color_1 = "#DD88CF",
  color_2 = "#574964",
  color_3 = "#574964",
  color_4 = "#FAFAFA",
  color_5 = "#A888B5",
  color_6 = "#FAFAFA",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.color_2, bg = colors.color_5 },
    b = { fg = colors.color_3, bg = colors.color_6 },
    c = { fg = colors.color_3 },
  },

  insert = { a = { fg = colors.color_2, bg = colors.color_0 } },
  visual = { a = { fg = colors.color_2, bg = colors.color_1 } },
  replace = { a = { fg = colors.color_2, bg = colors.color_4 } },

  inactive = {
    a = { fg = colors.color_3, bg = colors.color_2 },
    b = { fg = colors.color_3, bg = colors.color_2 },
    c = { fg = colors.color_3 },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
        require("lualine").setup({
          options = {
            theme = bubbles_theme,
            component_separators = "",
            section_separators = { left = "", right = "" },
          },
          sections = {
            lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
            lualine_b = { "filename", "branch" },
            lualine_c = {
              "%=", --[[ add your center compoentnts here in place of this comment ]]
            },
            lualine_x = {},
            lualine_y = { "filetype", "progress" },
            lualine_z = {
              { "location", separator = { right = "" }, left_padding = 2 },
            },
          },
          inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
          },
          tabline = {},
          extensions = {},
        }),
      }
    end,
  },
}
