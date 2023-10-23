-- Open NvimTree properly when passed a directory
vim.api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", callback = function(data)
  -- buffer is a directory
  if (data.file == "") then
    data.file = os.getenv("PWD")
  end

  local directory = vim.fn.isdirectory(data.file) == 1

  -- Neovim now starts with a --embed flag
  -- so it is necessary to remove that flag
  -- so we can look for a file or directory
  -- passed to it when it starts up
  local args = {}
  for _, v in pairs(vim.v.argv) do
    if string.sub(v,1,2) ~= "--" then
      table.insert(args,v)
    end
  end

  if not directory then
    if 1 == #args then
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
