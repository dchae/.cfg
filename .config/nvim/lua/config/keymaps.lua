-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
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

-- My keymap to execute current script in terminal
local wk = require("which-key")
wk.add({
  { "<leader><cr>", group = "run code/file" },
})
-- original keymap script by u/linkarzu on r/neovim
-- If current file is a script, make it executable, and execute it via Snacks terminal
-- else if current file has a runner, open Snacks terminal and execute it via the runner
-- Had to include quotes around "%" because there are some apple dirs that contain spaces, like iCloud
local runners = { ["js"] = "node", ["rb"] = "ruby", ["py"] = "python" }

local function run_current_file(runImmediately)
  local filepath = vim.fn.expand("%:p:.") -- Get the current filepath, relative to current dir if possible
  filepath = vim.fn.shellescape(filepath) -- Properly escape the file name for shell commands
  local file_extension = vim.fn.expand("%:e") -- Get file extension
  local first_line = vim.fn.getline(1) -- Get the first line of the file

  if string.match(first_line, "^#!/") then -- If first line starts with shebang (e.g. #!/usr/bin/env node)
    vim.cmd("!chmod +x " .. filepath) -- Make the file executable
    -- vim.cmd("vsplit") -- Split the window vertically
    -- vim.cmd("terminal " .. escaped_filepath) -- Open terminal and execute the file
    if not string.match(filepath, "/") then -- if filepath is relative add "./"
      filepath = "./" .. filepath
    end

    if runImmediately then
      Snacks.terminal(filepath, { win = { position = "bottom" }, interactive = false }) -- use Snacks terminal
    else
      Snacks.terminal.open() -- Open terminal
      vim.cmd("startinsert") -- Enter insert mode
      vim.api.nvim_input(filepath) -- Insert runner and filepath
    end
    vim.cmd("startinsert") -- Enter insert mode, recommended by echasnovski on Reddit
  elseif runners[file_extension] then -- if we have a valid runner for the filetype
    local runner = runners[file_extension] -- Get runner
    local cmd = runner .. " " .. filepath -- Runner and filepath (e.g. node script.js)
    if runImmediately then
      Snacks.terminal(cmd, { win = { position = "bottom" }, interactive = false }) -- use Snacks terminal
      vim.cmd("startinsert") -- Enter insert mode
    else
      Snacks.terminal.open() -- Open terminal
      vim.cmd("startinsert") -- Enter insert mode
      vim.api.nvim_input(cmd) -- Insert command
    end
  else
    vim.cmd("echo 'Error: Could not resolve interpreter or find shebang line.'")
  end
end

local function run_current_file_auto()
  run_current_file(true)
end

vim.keymap.set("n", "<leader><cr><cr>", run_current_file_auto, { desc = "Run current file (Auto)" })
vim.keymap.set("n", "<leader><cr>w", run_current_file, { desc = "Run current file (Wait)" })
