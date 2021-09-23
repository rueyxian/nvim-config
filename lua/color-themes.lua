


vim.o.termguicolors = true

-- vim.cmd 'colorscheme nord'
vim.cmd([[
  colorscheme nord
]])

-- vim.g.colorscheme = 'nord'

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






