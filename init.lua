-- Line numbers
vim.opt.number = true
-- Column at 80 chars
vim.opt.colorcolumn = "80"

-- Highlight search results
vim.opt.hlsearch = true

-- Remove swap files and mouse support
vim.opt.swapfile = false
vim.opt.mouse = ""

-- Two space tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd("let g:zig_fmt_autosave = 0");

-- Syntax highlighting
vim.cmd("syntax on")

-- Command to clear the search buffer
vim.api.nvim_create_user_command(
    "ClearSearch",
    function()
      vim.cmd('let @/ = ""')
    end,
    {nargs = 0}
)

-- Set file types
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.fragment", "*.vertex", "*.compute", "*.frag", "*.vert", "*.comp", "*.glsl"},
  command = "set ft=glsl"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.h"},
  command = "set ft=c"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.rs"},
  command = "set colorcolumn=100"
})

-- Lazy.nvim, package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy.nvim
require("lazy").setup("plugins")

-- Terminal mode remaps
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
-- Insert mode remaps
-- Normal mode remaps
-- split screen
vim.keymap.set("n", "<C-n>", "<C-w>w")
vim.keymap.set("n", "<C-h>", "<C-w>>")
vim.keymap.set("n", "<C-l>", "<C-w><")
vim.keymap.set("n", "<C-j>", "<C-w>-")
vim.keymap.set("n", "<C-k>", "<C-w>+")
-- tabs
vim.keymap.set("n", "<C-o>t", "<CMD>tabnew<CR>")
vim.keymap.set("n", "<C-Right>", "<CMD>tabnext<CR>")
vim.keymap.set("n", "<C-Left>", "<CMD>tabprev<CR>")
