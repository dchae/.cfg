-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- cmd+/ opens terminal in cwd instead of root
map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

-- toggle aerial window, switching focus
map("n", "<leader>a", "<cmd>AerialToggle<CR>")
-- toggle aerial window, keeping focus
map("n", "<leader>A", "<cmd>AerialToggle!<CR>")
-- toggle aerial nav
map("n", "<leader>fa", "<cmd>AerialNavToggle<CR>")

