return {
  -- lazy load vscode style snippets to luasnip
  require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand("../../snippets") } }),
}
