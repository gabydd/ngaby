local opt = vim.opt
local g = vim.g

opt.number = true
opt.ruler = false
opt.signcolumn = "yes"
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.ignorecase = true
opt.smartindent = true
opt.smartcase = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
-- opt.cmdheight = 0
opt.completeopt = { "menu", "menuone", "noselect" }
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 500
opt.fillchars = { eob= " " }
g.mapleader = " "
g.maplocalleader = " "
local ok, _ = pcall(vim.cmd, "colorscheme nord")
if not ok then
	vim.cmd[[colorscheme default]]
end
