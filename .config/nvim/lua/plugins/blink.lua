return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    signature = { enabled = true },

    completion = {
      -- Don't select by default, auto insert on selection
      list = { selection = { preselect = false, auto_insert = true } },
    },

    keymap = {
      preset = "super-tab",
      -- preset = "enter",
      --
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
