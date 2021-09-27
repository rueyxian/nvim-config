

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd 'packadd packer.nvim'
end



return require('packer').startup(function(use)
      -- Packer can manage itself
      use {'wbthomason/packer.nvim', opt = true}


      ------------------------------
      -- color theme
      ------------------------------
      use 'fatih/molokai'
      use 'morhetz/gruvbox'
      use 'arcticicestudio/nord-vim'
      use 'sainnhe/sonokai'
      use 'sainnhe/gruvbox-material'
      use 'sainnhe/everforest'
      use 'sainnhe/edge'
      use 'EdenEast/nightfox.nvim'



      ------------------------------
      --  statusline
      ------------------------------
    use 'hoob3rt/lualine.nvim' 


      ------------------------------
      --  terminal
      ------------------------------
      use "akinsho/toggleterm.nvim"

      ------------------------------
      -- indentation guide
      ------------------------------
      use 'nathanaelkane/vim-indent-guides'

      ------------------------------
      -- comment
      ------------------------------
      use 'scrooloose/nerdcommenter'

      ------------------------------
      -- file explorer
      ------------------------------
      use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
      }



      ------------------------------
      -- vim-go (yawn~)
      ------------------------------
      -- use 'fatih/vim-go'


      ------------------------------
      -- lsp
      ------------------------------
      use 'glepnir/lspsaga.nvim'

      use 'neovim/nvim-lspconfig'


      use 'simrat39/rust-tools.nvim'
      -- use 'kabouzeid/nvim-lspinstall'


      ------------------------------
      -- auto completion
      ------------------------------
      use 'hrsh7th/nvim-cmp'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-buffer'

      use 'hrsh7th/cmp-vsnip'
      use 'hrsh7th/cmp-path'
      use 'windwp/nvim-autopairs'

      use 'L3MON4D3/LuaSnip'



      ------------------------------
      -- telescope & fzf
      ------------------------------
      use 'nvim-telescope/telescope.nvim'
      use 'nvim-lua/popup.nvim'
      use 'nvim-lua/plenary.nvim'


end)



