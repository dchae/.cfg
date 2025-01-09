return {
  {
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
  },

  -- lazy load vscode style snippets to luasnip
  -- {
  --   require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand("../../snippets") } }),
  -- },

  -- force lspconfig to use current directory rubocop gem
  -- src: https://www.reddit.com/r/neovim/comments/18g4ya0/solargraph_rubocop_issues_in_lazyvim/kcz5p7j/
  -- this currently loads lspconfig on every startup, which is why it is disabled.
  -- local lspconfig = require("lspconfig")
  --
  -- {
  --   "neovim/nvim-lspconfig",
  --   ft = "rb",
  --   opts = {
  --     -- Useful for debugging formatter issues
  --     format_notify = true,
  --     inlay_hints = { enabled = false },
  --     servers = {
  --       ruby_lsp = {
  --         cmd = { "bundle", "exec", "ruby-lsp" },
  --         init_options = {
  --           formatter = "auto",
  --         },
  --       },
  --       rubocop = {
  --         -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
  --         cmd = { "bundle", "exec", "rubocop", "--lsp" },
  --         root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
  --       },
  --     },
  --   },
  -- },
}
