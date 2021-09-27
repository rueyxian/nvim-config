

local opts = {
-- add your config value here
-- default value
    -- use_saga_diagnostic_sign = true,

    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',

    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
        quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
        quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
-- "single" "double" "round" "plus"
    border_style = "single",
    rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
    server_filetype_map = {}
}

require('lspsaga').init_lsp_saga(opts)




------------------------------------------------------------------------------------------
-- key mapping
------------------------------------------------------------------------------------------


------------------------------------------------------------
-- smart scroll
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-n>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})


------------------------------------------------------------
-- documentation
------------------------------------------------------------
-- signature
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})

-- declaration
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})

-- definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
-- TODO: lspsaga code doesn't werk
-- vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>" , {noremap = true, silent = true})


------------------------------------------------------------
-- reference & implementation
------------------------------------------------------------
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})


------------------------------------------------------------
-- hover
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>k', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {noremap = true, silent = true})



------------------------------------------------------------
-- workspace
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {noremap = true, silent = true})

-- TODO: do we need this?
-- vim.api.nvim_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})


------------------------------------------------------------
-- code edit
------------------------------------------------------------
-- code action
vim.api.nvim_set_keymap('n', '<Leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", {noremap = true, silent = true})

-- rename
vim.api.nvim_set_keymap('n', '<Leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})

-- formatting
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})


------------------------------------------------------------
-- lsp finder
------------------------------------------------------------
-- TODO: what the hell is it for?
vim.api.nvim_set_keymap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})


------------------------------------------------------------
-- diagnostic
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>e', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>e', "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true, silent = true})

-- TODO: seems useless
-- vim.api.nvim_set_keymap('n', '<Leader>cc', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>" {noremap = true, silent = true})

-- goto prev & next
vim.api.nvim_set_keymap('n', '[e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '[e', "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', ']e', "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})

-- TODO: seems also useless
-- vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true, silent = true})




------------------------------------------------------------
-- float terminal
------------------------------------------------------------
-- <C-\><C-n> : escape from terminal
vim.api.nvim_set_keymap('n', '<F3>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader><F3>', ":cd %:p:h<CR><cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F3>', "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>", {noremap = true, silent = true})
-- requires lazygit
-- brew install lazygit
vim.api.nvim_set_keymap('n', '<F4>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>", {noremap = true, silent = true})





