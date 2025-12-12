return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  enabled = true,
  priority = 1000,
  opts = {
    compile = true,
    undercurl = true,
    functionStyle = { bold = true, italic = true },
    dimInactive = false, -- keep inactive windows bright enough
    theme = "wave",
    background = {
      dark = "wave",
      light = "lotus",
    },
    colors = {
      theme = {
        lotus = {
          ui = {
            bg_gutter = "none",
          },
          syn = {
            keyword = "#c57aff", -- brighter purple for keywords
            identifier = "#e2b714", -- gold tone identifiers
            constant = "#ff9e64", -- orange constants
            number = "#ffa066",
            string = "#a7df78", -- lighter green strings
            func = "#7aa2f7", -- bright blue for functions
            statement = "#11224E", -- punchier red for statements
          },
        },
      },
    },
    overrides = function(colors)
      return {
        Normal = { fg = colors.theme.syn.identifier, bg = "none" },
        NormalNC = { fg = colors.theme.syn.identifier, bg = "none" },
        Comment = { fg = "#7c8696", italic = true }, -- slightly brighter gray comments
        Visual = { bg = "#3b4261" },
      }
    end,
  },
}
