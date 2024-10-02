-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","

local opt = vim.opt
opt.hidden = true
opt.number = true
opt.mouse = "a" -- Mouse support for noobs
opt.showmode = true
opt.ttyfast = true
opt.encoding = "utf-8"
--opt.termencoding = 'utf-8'
opt.incsearch = true
opt.hlsearch = true
opt.autoread = true
opt.laststatus = 2
opt.cursorline = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.backspace = "2"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = true
opt.foldmethod = "indent"
opt.foldlevelstart = 9999
opt.relativenumber = false
