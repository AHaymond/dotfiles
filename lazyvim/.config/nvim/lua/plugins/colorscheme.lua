return {
  {
    "sainnhe/sonokai",
    init = function()
      vim.opt.termguicolors = true
      vim.cmd([[
      if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      ]])
      vim.g.sonokai_style = "espresso"
      vim.cmd([[colorscheme sonokai]])
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
