-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g

g.PreserveNoEOL = 1
g.expand_region_use_select_mode = 0

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.signcolumn = "yes:2"
opt.wildignore = ".svn,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif"
opt.mmp = 5000
