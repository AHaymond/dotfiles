local function open_nvim_tree(data)
  if 1 == #vim.v.argv then
    vim.cmd('NvimTreeToggle')
  end
end
vim.api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", callback = open_nvim_tree })

