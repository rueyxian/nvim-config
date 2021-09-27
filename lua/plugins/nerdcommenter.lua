



vim.g.NERDCreateDefaultMappings = 0


-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = 'left'

-- Set a language to use its alternate delimiters by default
-- vim.g.NERDAltDelims_java = 1

-- Add your own custom formats or override the defaults
-- let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
-- vim.g.NERDCustomDelimiters = {'c', {{'left', '/**'}, {'right', '*/'}}}

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lins is commented or not
vim.g.NERDToggleCheckAllLines = 1



------------------------------------------------------------
-- key mapping
------------------------------------------------------------
-- NERDCommenterToggle, for some reason vim registers <C-/> as <C-_>
-- TODO write it in lua
--https://github.com/neovim/neovim/blob/b535575acdb037c35a9b688bc2d8adc2f3dece8d/src/nvim/keymap.h#L225
-- vim.api.nvim_set_keymap('', '<C-//>', '<plug>NERDCommenterToggle', {noremap = true, silent = true})
vim.cmd('nmap <C-_> <plug>NERDCommenterToggle')
vim.cmd('xmap <C-_> <plug>NERDCommenterToggle')
