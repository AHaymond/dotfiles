local my_on_attach = function(bufnr)
  local api = require("nvim-tree.api")
  -- BEGIN_DEFAULT_ON_ATTACH
  local opts = function(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local map = LazyVim.safe_keymap_set

  map("n", "<C-d>", api.tree.change_root_to_node, opts("CD"))
  map("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  map("n", "<CR>", api.node.open.edit, opts("Open"))
  map("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  map("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
  map("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
  map("n", ".", api.node.run.cmd, opts("Run Command"))
  map("n", "<C-u>", api.tree.change_root_to_parent, opts("Up"))
  map("n", "a", api.fs.create, opts("Create"))
  map("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
  map("n", "c", api.fs.copy.node, opts("Copy"))
  map("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
  map("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
  map("n", "]c", api.node.navigate.git.next, opts("Next Git"))
  map("n", "d", api.fs.remove, opts("Delete"))
  --  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  map("n", "E", api.tree.expand_all, opts("Expand All"))
  map("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
  map("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  map("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
  map("n", "F", api.live_filter.clear, opts("Clean Filter"))
  map("n", "f", api.live_filter.start, opts("Filter"))
  map("n", "g?", api.tree.toggle_help, opts("Help"))
  map("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  map("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  map("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  map("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
  map("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
  map("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
  map("n", "o", api.node.open.edit, opts("Open"))
  map("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  map("n", "p", api.fs.paste, opts("Paste"))
  map("n", "P", api.node.navigate.parent, opts("Parent Directory"))
  map("n", "q", api.tree.close, opts("Close"))
  map("n", "r", api.fs.rename_full, opts("Rename"))
  map("n", "R", api.tree.reload, opts("Refresh"))
  map("n", "s", api.node.run.system, opts("Run System"))
  map("n", "S", api.tree.search_node, opts("Search"))
  map("n", "u", api.fs.rename_full, opts("Rename Full Path"))
  map("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
  map("n", "W", api.tree.collapse_all, opts("Collapse"))
  map("n", "X", api.fs.cut, opts("Cut"))
  map("n", "y", api.fs.copy.filename, opts("Copy Name"))
  map("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  map("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  map("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
  -- END_DEFAULT_ON_ATTACH
end

return {
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree", noremap = true },
    },
    init = function()
      local create_autocmd = vim.api.nvim_create_autocmd

      create_autocmd({ "VimEnter" }, {
        pattern = "*",
        callback = function(data)
          -- buffer is a directory
          local directory = vim.fn.isdirectory(data.file) == 1

          local args = {}
          for _, v in pairs(vim.v.argv) do
            if string.sub(v, 1, 2) ~= "--" then
              table.insert(args, v)
            end
          end

          if not directory then
            if 1 == #args then
              vim.cmd("NvimTreeToggle")
            end
            return
          end

          -- create a new, empty buffer
          vim.cmd.enew()

          -- wipe the directory buffer
          vim.cmd.bw(data.buf)

          -- change to the directory
          vim.cmd.cd(data.file)

          vim.cmd("NvimTreeToggle")
        end,
      })
    end,
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 35,
      },
      on_attach = my_on_attach,
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          modified_placement = "before",
          show = {
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            modified = "󰃉",
          },
        },
        group_empty = true,
      },
      modified = {
        enable = true,
        show_on_dirs = false,
      },
      filters = {
        dotfiles = true,
      },
      git = {
        ignore = false,
      },
    },
  },
}
