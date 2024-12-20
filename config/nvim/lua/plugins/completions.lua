return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = 'v0.*',

  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

 },
  opts_extend = { "sources.default" }
}
