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
-- basic
------------------------------------------------------------
require('settings')
require('key-mappings')
require('color-themes')


------------------------------------------------------------
-- plugins
------------------------------------------------------------
require('plugins')

require('plugins/toggleterm')

require('plugins/nerdcommenter')

require('plugins/vim-indent-guides')

require('plugins/nvim-tree')

require('plugins/nvim-cmp')
require('plugins/nvim-autopairs')

require('plugins/telescope')


-- TODO get rid of vim-go, use go-pls only
require('plugins/vim-go')

------------------------------
-- lspconfig
------------------------------
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md 
require('plugins/nvim-lspconfig')


-- lua
require('plugins/nvim-lspconfig/lua-language-server')
-- require('plugins/nvim-lspconfig/lua-ls')


-- rust
-- https://github.com/simrat39/rust-tools.nvim
require('plugins/nvim-lspconfig/rust-tools')


-- go
-- require('plugins/nvim-lspconfig/go-pls')



