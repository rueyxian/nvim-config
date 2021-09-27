


vim.o.termguicolors = true


vim.cmd('colorscheme nord')


------------------------------------------------------------
-- fatih/molokai
------------------------------------------------------------
vim.g["rehash256"] = 1
vim.g["molokai_original"] = 1

------------------------------------------------------------
-- morhetz/gruvbox
------------------------------------------------------------
-- vim.g["gruvbox_termcolors"] = 256
-- vim.g["gruvbox_contrast_dark"] = 'hard'
-- vim.g["gruvbox_invert_selection"] = '0'

vim.g.gruvbox_termcolors = 256
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = false
vim.g.gruvbox_underline = true
vim.g.gruvbox_undercurl = true

vim.g.gruvbox_improved_strings = false
vim.g.gruvbox_improved_warnings = false



------------------------------------------------------------
-- EdenEast/nightfox.nvim
------------------------------------------------------------

local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nordfox", -- nightfox | nordfox | palefox
  styles = {
    -- comments = "italic", -- change style of comments to be italic
    -- keywords = "bold", -- change style of keywords to be bold
    -- functions = "italic,bold" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = true, -- inverse the highlighting of match_parens
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
-- nightfox.load()



------------------------------------------------------------
-- sainnhe/sonokai
------------------------------------------------------------
-- :help sonokai.txt
-- default | atlantis | andromeda | shusia | maia | espresso
vim.g.sonokai_style = 'shusia'
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_transparent_background = 0
vim.g.sonokai_diagnostic_text_highlight = 0
vim.g.sonokai_diagnostic_line_highlight = 1
vim.g.sonokai_diagnostic_virtual_text = 'colored'





------------------------------------------------------------
-- sainnhe/gruvbox-material
------------------------------------------------------------
-- :help gruvbox-material
-- material | mix | original
vim.g.gruvbox_material_palette = 'original' 
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_visual = 'reverse'
vim.g.gruvbox_material_ui_contrast = 'high'

vim.g.gruvbox_material_diagnostic_text_highlight = 0
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
