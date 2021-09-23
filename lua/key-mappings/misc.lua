



------------------------------------------------------------
-- comment
------------------------------------------------------------
-- NERDCommenterToggle, for some reason vim registers <C-/> as <C-_>
-- TODO write it in lua
--https://github.com/neovim/neovim/blob/b535575acdb037c35a9b688bc2d8adc2f3dece8d/src/nvim/keymap.h#L225
-- vim.api.nvim_set_keymap('', '<C-//>', '<plug>NERDCommenterToggle', {noremap = true, silent = true})
vim.cmd('nmap <C-_> <plug>NERDCommenterToggle')
vim.cmd('xmap <C-_> <plug>NERDCommenterTogglegv<Esc>')




------------------------------------------------------------
-- float terminal
------------------------------------------------------------
-- <C-\><C-n> : escape from terminal
vim.api.nvim_set_keymap('n', '<F3>', ":cd %:p:h<CR><cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F3>', "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>", {noremap = true, silent = true})
-- requires lazygit
-- brew install lazygit
vim.api.nvim_set_keymap('n', '<Leader><F3>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>", {noremap = true, silent = true})




------------------------------------------------------------
-- telescope
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', {noremap = true})
