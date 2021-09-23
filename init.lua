--[[
███╗   ██╗██╗   ██╗██╗███╗   ███╗             ██╗     ██╗   ██╗ █████╗               ███╗  ███╗ 
████╗  ██║██║   ██║██║████╗ ████║     ██╗     ██║     ██║   ██║██╔══██╗  ████████╗  █████╗█████╗
██╔██╗ ██║██║   ██║██║██╔████╔██║  ████████╗  ██║     ██║   ██║███████║  ╚═══════╝  ╚█████████╔╝
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ╚══██╔══╝  ██║     ██║   ██║██╔══██║  ████████╗   ╚═█████╔═╝ 
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║     ╚═╝     ███████╗╚██████╔╝██║  ██║  ╚═══════╝     ╚═█╔═╝   
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝             ╚══════╝ ╚═════╝ ╚═╝  ╚═╝                  ╚╝     
--]]


-- TODO learn Lua
-- https://github.com/nanotee/nvim-lua-guide
-- https://learnxinyminutes.com/docs/lua/
-- https://www.lua.org/pil/contents.html
-- https://ebens.me/post/lua-for-programmers-part-1/

------------------------------------------------------------
-- settings
------------------------------------------------------------
require('settings')
require('color-themes')


------------------------------------------------------------
-- key mappings
------------------------------------------------------------
require('key-mappings')


------------------------------------------------------------
-- plugins
------------------------------------------------------------
require('plugins')


require('plugins/nerdcommenter')

require('plugins/vim-indent-guides')

require('plugins/nvim-tree')

require('plugins/nvim-cmp')
require('plugins/nvim-autopairs')

require('plugins/telescope')


-- TODO get rid of vim-go, use go-pls only
require('plugins/vim-go')

------------------------------
-- lsp configuration
------------------------------
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
require('plugins/nvim-lspconfig')

require('plugins/lspsaga')



------------------------------
-- language servers
------------------------------
-- lua
require('plugins/nvim-lspconfig/lua-language-server')
-- require('plugins/nvim-lspconfig/lua-ls')


-- rust
-- https://github.com/simrat39/rust-tools.nvim
require('plugins/nvim-lspconfig/rust-tools')


-- go
-- require('plugins/nvim-lspconfig/go-pls')



