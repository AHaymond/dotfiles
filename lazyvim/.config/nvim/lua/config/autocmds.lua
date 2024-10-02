-- Define the command for prettifying JSON
vim.cmd([[
  command! -nargs=0 PrettifyJSON :%!jq '.'
]])

-- add key mapping for running the command
vim.cmd([[
  autocmd FileType json nnoremap <buffer> <F5> :PrettifyJSON<CR>
]])
