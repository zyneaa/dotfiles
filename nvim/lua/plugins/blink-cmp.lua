return {
  "saghen/blink.cmp",
  enabled = true,
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    keymap = {
      preset = "default",
      ["<S-Enter>"] = { "accept", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      autocomplete = true, -- still show suggestions
      select_first = false, -- don't auto-select
      ghost_text = {
        enabled = false,
      },
    },
  },
  opts_extend = { "sources.default" },
}
