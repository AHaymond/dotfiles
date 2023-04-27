-- Open NvimTree properly when passed a directory
vim.api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", callback = function(data)
  -- buffer is a directory
  if (data.file == "") then
    data.file = os.getenv("PWD")
  end

  local directory = vim.fn.isdirectory(data.file) == 1

  print(os.getenv("PWD"))

  if not directory then
    if 1 == #vim.v.argv then
      vim.cmd('NvimTreeToggle')
    end
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- Open NivmTree
  vim.cmd('NvimTreeToggle')

end})
