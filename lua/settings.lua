
vim.g.mapleader = " "

-- include '-' as keyword, e.g. the word 'hello-world' treated as a word
vim.opt.iskeyword:append('-')


vim.o.encoding = "UTF-8"

-- vim.g.netrw_banner = 0
-- vim.g.loaded_netrw = 0

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 2

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 999
vim.o.wrap = false

vim.o.splitright = true
vim.o.splitbelow = true


------------------------------------------------------------
-- performance
------------------------------------------------------------
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.synmaxcol = 1000
vim.opt.lazyredraw = true


------------------------------------------------------------
-- show list characters
------------------------------------------------------------
vim.o.list = false
vim.opt.listchars = { space = '·', tab = '→ ', eol = '↲'}


------------------------------------------------------------
-- remove auto comment when open a new line from a commented line
------------------------------------------------------------
-- vim.opt.formatoptions:remove('c')
-- vim.opt.formatoptions:remove('o')
-- vim.opt.formatoptions:remove('r')
-- TODO how to do it in lua?
 vim.cmd([[autocmd BufNewFile,BufEnter * setlocal formatoptions-=cro]])


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




