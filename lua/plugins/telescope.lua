



-- https://github.com/nvim-telescope/telescope.nvim




local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}




------------------------------------------------------------
-- key mapping
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', {noremap = true})
