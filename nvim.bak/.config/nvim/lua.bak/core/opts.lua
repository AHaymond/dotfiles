--local cmd = vim.cmd
local opt = vim.opt
--local diagnostic = vim.diagnostic
local g = vim.g
--
opt.hidden = true
--opt.ch = 0
--opt.pumheight = 2
--opt.fileencoding = 'utf-8'
--opt.splitbelow = true
--opt.list = true
--opt.splitright = true
--opt.termguicolors = true
--opt.conceallevel = 0
--opt.showtabline = 3
--opt.tabline = ' '
--opt.showmode = false
--opt.backup = false
opt.number = true
--opt.numberwidth = 3
--opt.ruler = false
--opt.writebackup = false
--opt.updatetime = 300
--opt.timeoutlen = 100
--opt.clipboard = "unnamedplus"
--opt.hlsearch = true
--opt.ignorecase = true
--opt.scrolloff = 0
--opt.sidescrolloff = 5
--opt.foldenable = false
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
--opt.fillchars:append('eob: ')
--opt.listchars:append "space: "
--cmd('set lazyredraw')
--opt.laststatus = 0 -- Global Status
--diagnostic.config { signs = false } -- Removing diagnostic column
--opt.updatetime = 250
--opt.shadafile = "NONE"
--opt.shadafile = ""
--opt.swapfile = false
--opt.shortmess:append "sI"
--
--vim.cmd.colorscheme('onedark')
---- Formatting Code on Save
--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--  callback = function()
--    for _, client in ipairs(vim.lsp.get_active_clients()) do
--      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
--        vim.lsp.buf.format()
--        return
--      else
--        return
--      end
--    end
--  end
--})
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

--vim.api.nvim_exec([[
--set history=1000  "store a ton of history
--set nobackup      " enable backups
--set nowritebackup
--set noswapfile    " It's 2012, Vim.
--
--if exists("+undofile")
--  " This is only present in 7.3+
--  if isdirectory($HOME . '/.local/share/nvim/undo') == 0
--    :silent !mkdir -p ~/.local/share/nvim/undo > /dev/null 2>&1
--  endif
--  set undodir=~/.local/share/nvim/undo " undo files
--  set undofile
--  set undolevels=1000   " maximum number of changes that can be undone
--  set undoreload=10000  " maximum number of lines to save for undo on a buffer reload
--endif
--]], false)
