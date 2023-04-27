local opt = vim.opt
opt.hidden = true
opt.number = true
opt.mouse = "a" -- Mouse support for noobs
opt.showmode = true
opt.ttyfast = true
opt.encoding = 'utf-8'
opt.termencoding = 'utf-8'
opt.incsearch = true
opt.hlsearch = true
opt.autoread = true
opt.laststatus = 2
opt.cursorline = true
opt.autoindent = true
opt.backspace = '2'
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = true
opt.foldmethod = 'indent'
opt.foldlevelstart = 9999
--
--
---- Disabling some built in plugins
--local builtins = {
--  "2html_plugin",
--  "getscript",
--  "getscriptPlugin",
--  "gzip",
--  "logipat",
--  "netrw",
--  "netrwPlugin",
--  "netrwSettings",
--  "netrwFileHandlers",
--  "matchit",
--  "matchparen",
--  "tar",
--  "tarPlugin",
--  "rrhelper",
--  "spellfile_plugin",
--  "vimball",
--  "vimballPlugin",
--  "zip",
--  "zipPlugin",
--  "logipat",
--  "matchit",
--  "tutor",
--  "rplugin",
--  "syntax",
--  "synmenu",
--  "optwin",
--  "compiler",
--  "bugreport",
--  "ftplugin",
--  "archlinux",
--  "fzf",
--  "tutor_mode_plugin",
--  "sleuth",
--  "vimgrep"
--}
--
--for _, plugin in ipairs(builtins) do
--  g["loaded_" .. plugin] = 1
--end
