return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    signature = { enabled = true },

    completion = {
      list = { selection = "auto_insert" },
    },

    keymap = {
      preset = "super-tab",
      -- preset = "enter",
      --
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
