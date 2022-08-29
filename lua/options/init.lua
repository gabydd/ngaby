local ok, _ = pcall(vim.cmd, "colorscheme nord")
if not ok then
	vim.cmd[[colorscheme default]]
end
local opt = vim.opt
local g = vim.g

opt.number = true
opt.termguicolors = true
g.mapleader = true
