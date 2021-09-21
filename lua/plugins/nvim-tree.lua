--[[
local g = vim.g

-- Plugin: nvim-tree
--- https://github.com/kyazdani42/nvim-tree.lua
g.nvim_tree_width = 40
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "‣ "
}

--]]

-- Keybindings are defined in `keymapping.lua`
--- See: `help NvimTree`
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings



---[[


vim.g.nvim_tree_side = 'left'                                -- left by default
vim.g.nvim_tree_width = 40                                    -- 30 by default, can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
vim.g.nvim_tree_gitignore = 1                                 -- 0 by default
vim.g.nvim_tree_auto_open = 1                                 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1                                -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }  -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1                              -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1                                    -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_follow_update_path = 1                        -- 0 by default, will update the path of the current dir if the file is not inside the tree. Default is 0
vim.g.nvim_tree_indent_markers = 1                            -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 1                             -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1                                    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1                    -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~'                   -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1                                  -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_auto_resize = 0                               -- 1 by default, will resize the tree to its saved width when opening a file
vim.g.nvim_tree_disable_netrw = 0                             -- 1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0                              -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1                              -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1                               --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 1                           -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_window_picker = 1                     -- 0 by default, will disable the window picker.
vim.g.nvim_tree_hijack_cursor = 0                             -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.g.nvim_tree_icon_padding = ' '                            -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = ' >> '                        --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_update_cwd = 1                                -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
vim.g.nvim_tree_respect_buf_cwd = 1                           -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_refresh_wait = 500                            -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.



---[[
vim.g.nvim_tree_window_picker_exclude = {
  {
    {'filetype', {'notify', 'packer', 'qf'}}
  },
  {
    {'buftype', {'terminal'}}
  },
}
-- ]]

--[[
vim.g.nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
-- ]]

--  Dictionary of buffer option names mapped to a list of option values that
--  indicates to the window picker that the buffer's window should not be
--  selectable.
-- vim.g.nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } --  List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_special_files = { {'README.md', 1}, {'Makefile', 1}, {'MAKEFILE', 1} } --  List of filenames that gets highlighted with NvimTreeSpecialFile


--[[
vim.g.nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
-- ]]


-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

--  default will show icon by default if no icon is provided
--  default shows no icon by default

vim.g.nvim_tree_icons = {
  {'default', ''},
  {'symlink', ''},
  {
    'git', {
      {'unstaged', '✗'},
      {'staged', '✓'},
    },
  },
  {
    'folder', {
      {'arrow_open', '?'},
      {'arrow_closed', '?'},
      {'default', '?'},
      {'open', '?'},
      {'empty', '?'},
      {'empty_open', '?'},
      {'symlink', '?'},
      {'symlink_open', '?'},
    },
  },

  {'default', ""},
  {'symlink', ""},
  {
    'git', {
      {'unstaged', "✗"},
      {'staged', "✓"},
      {'unmerged', ""},
      {'renamed', "➜"},
      {'untracked', "★"},
      {'deleted', ""},
      {'ignored', "◌"},
    },
  },
  {
    'folder', {
      {'arrow_open', ""},
      {'arrow_closed', ""},
      {'default', ""},
      {'open', ""},
      {'empty', ""},
      {'empty_open', ""},
      {'symlink', ""},
      {'symlink_open', ""},
    },
  },
  {
    'lsp', {
      {'hint', ""},
      {'info', ""},
      {'warning', ""},
      {'error', ""},
    },
  }, 
}

--[[
vim.g.nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

-- ]]

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>
--  NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them



--  a list of groups can be found at `:help nvim_tree_highlight`
vim.cmd("highlight NvimTreeFolderIcon guibg=blue")

--]]
