
-- setup must be called before loading
--vim.cmd([[
--if exists('+termguicolors')
--  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--  set termguicolors
--endif
--]])
vim.g.sonokai_style = 'espresso'
--vim.g.sonokai_better_performance = 1
--vim.g.sonokai_enable_italic = 1
vim.cmd("colorscheme sonokai")
