return {
  "dchae/canter.nvim",
  opts = {
    runners = {
      ["js"] = "node",
      ["ts"] = "bun",
      ["rb"] = "ruby",
      ["py"] = "python",
    },
  },
}

-- local dev build
-- return {
--   "canter.nvim",
--   dir = "/Users/dchae/github-dchae/canter.nvim",
--
--   opts = {
--     runners = {
--       ["js"] = "node",
--       ["ts"] = "bun",
--       ["rb"] = "ruby",
--       ["py"] = "python",
--     },
--
--     terminal = {
--       type = "builtin",
--       -- builtin_opts = {
--       --   position = "vsplit", -- can be "vsplit", "split", or "float"
--       --   escape_keymap = true, -- escape terminal mode with <Esc>
--       -- },
--       -- snacks_opts = {
--       --   win = {
--       --     position = "bottom",
--       --     relative = "editor",
--       --   },
--       --   interactive = false,
--       -- },
--     },
--   },
-- }
