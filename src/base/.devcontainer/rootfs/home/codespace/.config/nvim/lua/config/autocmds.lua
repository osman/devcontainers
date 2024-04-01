-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_user_" .. name, { clear = true })
end

local function filetype_settings(name, pattern, tabstop, shiftwidth, softtabstop, expandtab, cindent)
  return vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("filetype_" .. name),
    pattern = pattern,
    callback = function()
      vim.opt_local.tabstop = tabstop
      vim.opt_local.shiftwidth = shiftwidth
      vim.opt_local.softtabstop = softtabstop
      vim.opt_local.expandtab = expandtab
      vim.opt_local.cindent = cindent
      vim.cmd([[retab]])
    end,
  })
end

vim.cmd([[
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929

  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END

  autocmd BufRead,BufNewFile *.md             set filetype=markdown
  autocmd BufRead,BufNewFile *.rb             set filetype=ruby
  autocmd BufRead,BufNewFile *.mongo          set filetype=javascript
  autocmd BufRead,BufNewFile Vagrantfile      set filetype=ruby
  autocmd BufRead,BufNewFile Dockerfile.tmpl  set filetype=dockerfile
  autocmd BufRead,BufNewFile Dockerfile       set filetype=dockerfile
  autocmd BufRead,BufNewFile *.keymap         set filetype=devicetree
]])

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("anyfile"),
  pattern = { "*" },
  callback = function()
    vim.opt_local.expandtab = true
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("gitcommit"),
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.textwidth = 72
  end,
})
filetype_settings("makefile", { "make" }, 4, 4, 4, false, true)
filetype_settings("ruby", { "ruby" }, 2, 2, 2, true, false)
filetype_settings("python", { "python" }, 4, 4, 4, true, true)
filetype_settings("java", { "java" }, 2, 2, 2, false, true)
filetype_settings("make", { "make" }, 4, 4, 4, false, true)
filetype_settings("ruby", { "ruby" }, 2, 2, 2, true, true)
filetype_settings("python", { "python" }, 4, 4, 4, true, true)
filetype_settings("java", { "java" }, 2, 2, 2, false, true)
filetype_settings("c", { "c", "cpp" }, 2, 2, 2, true, true)
filetype_settings("html", { "html" }, 2, 2, 2, false, true)
filetype_settings("xml", { "xml" }, 2, 2, 2, true, true)
filetype_settings("md", { "md" }, 2, 2, 2, false, true)
filetype_settings("js", { "javascript" }, 4, 4, 4, true, true)
filetype_settings("dt", { "devicetree" }, 2, 2, 2, true, true)
