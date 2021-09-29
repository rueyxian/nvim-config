

-- vim.api.nvim_set_vim.api.nvim_set_keymap({mode}, {vim.api.nvim_set_keymap}, {mapped to}, {options})

-- remap leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- :source
-- vim.api.nvim_set_keymap('n', '<F12>', ':source<CR>', {noremap = true})
-- vim.cmd("nnoremap <expr> <F12> &filetype ==# 'vim' ? ':source %<CR>' : ':edit $MYVIMRC<CR>'")
vim.api.nvim_set_keymap('n', '<F12>', ':edit $MYVIMRC<CR>', {noremap = true})


-- kill buffer
vim.api.nvim_set_keymap('n', '<F9>', ':bd<CR>', {noremap = true, silent = true})

-- quit
vim.api.nvim_set_keymap('n', '<F10>', ':quit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<F10>', '<Esc>:quit<CR>', {noremap = true, silent = true})

-- close quickfix window
vim.api.nvim_set_keymap('n', '<leader>a', ':cclose<CR>', {noremap = true, silent = true})

-- escape to normal mode
-- vim.api.nvim_set_keymap('i', '<C-i>', '<ESC>', {noremap = true})
-- vim.api.nvim_set_keymap('v', '<C-i>', '<ESC>', {noremap = true})
-- vim.api.nvim_set_keymap('t', '<C-i>', '<ESC>', {noremap = true})

-- open line without entering insert mode
vim.api.nvim_set_keymap('n', 'o', 'o<ESC>', {noremap = true})
vim.api.nvim_set_keymap('n', 'O', 'O<ESC>', {noremap = true})

-- delete line except eol character
vim.api.nvim_set_keymap('n', 'dD', '0d$', {noremap = true})

-- navigate to sol & eol
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', 'g_', {noremap = true})
vim.api.nvim_set_keymap('x', 'H', '^', {noremap = true})
vim.api.nvim_set_keymap('x', 'L', 'g_', {noremap = true})


-- paragraph movement
vim.api.nvim_set_keymap('n', 'K', '{', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', '}', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', '{', {noremap = true})
vim.api.nvim_set_keymap('v', 'J', '}', {noremap = true})


-- swap paragraph movement
-- vim.api.nvim_set_keymap('n', '{', '}', {noremap = true})
-- vim.api.nvim_set_keymap('n', '}', '{', {noremap = true})

-- switch buffer
vim.api.nvim_set_keymap('n', '\\', ':bnext<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<S-\\>', ':bprev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-\\>', ':bprev<CR>', {noremap = true, silent = true})


-- split & vsplit
vim.api.nvim_set_keymap('n', '<C-w><C-k>', ':sp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w><C-j>', ':sp<CR><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w><C-h>', ':vsp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w><C-l>', ':vsp<CR><C-w>l', {noremap = true, silent = true})

-- window movement
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})


-- wrap highlighted with text object
vim.api.nvim_set_keymap('v', '<Leader>[', 'di[]<Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>(', 'di()<Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>{', 'di{}<Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader><', 'di<lt>><Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>\'', 'di\'\'<Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>"', 'di""<Esc>hp', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>`', 'di``<Esc>hp', {noremap = true, silent = true})



-- move visual selected line(s)
--[[
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv=gv', {noremap = true, silent = true})
--]]

-- omnicompletion
-- vim.api.nvim_set_keymap('i', '<exp> <C-o>', 'pumvisible() ? "<C-n>" : "<C-o>"', {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<exp> <C-o>', 'pumvisible() ? "<C-e>" : "<C-x><C-o>"', {expr = true, noremap = true, silent = true})



------------------------------------------------------------
-- commands & abbreviation
------------------------------------------------------------
-- remove highlight
vim.cmd[[cnoreabbrev <silent> hlc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "let @/=''" : "hlc")<CR>]]


-- change current working directory
-- vim.cmd[[cnoreabbrev <silent> cwd <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "cd %:p:h\|pwd" : "cwd")<CR>]]
vim.cmd[[cnoreabbrev <silent> cwd <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "cd %:p:h\|echo 'change working directory: '.getcwd()" : "cwd")<CR>]]








-- TODO write it in lua
-- cnoreabbrev rpt <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Rpt' : 'rpt')<CR>
-- command! -nargs=+ Rpt call <SID>Repeat(<f-args>)
--
-- function! s:Repeat(string, count)
--   if a:count =~ '\d'
--   call s:RepeatAtCursor(a:string, a:count)
--   else
--     echom "second argument has to be an integer"
--   endif
-- endfunc
--
--
-- function! s:RepeatAtCursor(character, count)
--   let l:i = 0
--   while i < a:count
--     execute "normal!a".a:character
--     let l:i += 1
--   endwhile
-- endfunction








