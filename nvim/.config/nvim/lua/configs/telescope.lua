--local builtin = require('telescope.builtin')
local keymap = vim.keymap
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<C-b>', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>l', ":Telescope treesitter<CR>", { silent = true })
--vim.keymap.set('n', '<C-l>', ":Telescope treesitter<CR>", { silent = true })

local telescope = require("telescope")
local actions = require("telescope.actions")
local options = {
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    }
  },
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.9,
      preview_cutoff = 120,
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    vimgrep_arguments = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden'
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { "*.spec", "vendor/cache", "node_modules", ".terraspace_cache" },
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  },
}

telescope.load_extension("fzf")

local merged_config = vim.tbl_deep_extend("force", require "nvchad.configs.telescope", options)

require("telescope").setup(merged_config)
