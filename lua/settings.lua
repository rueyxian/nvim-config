
vim.g.mapleader = " "

-- include '-' as keyword, e.g. the word 'hello-world' treated as a word
vim.opt.iskeyword:append('-')


vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 999
vim.o.wrap = false

vim.o.splitright = true
vim.o.splitbelow = true




-- show list characters
vim.o.list = false
vim.opt.listchars = { space = '·', tab = '→ ', eol = '↲'}
vim.cmd([[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
]])










------------------------------------------------------------
-- remove auto comment when open a new line from a commented line
------------------------------------------------------------
-- vim.opt.formatoptions:remove('c')
-- vim.opt.formatoptions:remove('o')
-- vim.opt.formatoptions:remove('r')
-- TODO how to do it in lua?
 vim.cmd([[autocmd BufNewFile,BufRead * setlocal formatoptions-=cro]])



------------------------------------------------------------
-- remove whitespace on save
------------------------------------------------------------
-- cmd[[au BufWritePre * :%s/\s\+$//e]]


------------------------------------------------------------
-- auto completion
------------------------------------------------------------
vim.o.completeopt = 'menuone,preview,noinsert,noselect'
-- vim.o.completeopt = 'menuone,preview,noselect'
vim.g.completetion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- vim.g.completetion_matching_strategy_list = {'substring', 'fuzzy'}
-- vim.g.completetion_matching_strategy_list = {'fuzzy'}

------------------------------------------------------------
-- enable to copy to clipboard for operations like yank, delete, change and put
------------------------------------------------------------
-- http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if vim.fn.has('unnamedplus') == 1 then
  vim.opt_global.clipboard:prepend('unnamed')
  vim.opt_global.clipboard:prepend('unnamedplus')
end




