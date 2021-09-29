
local lualine = require 'lualine'

-- Color table for highlights
local colors = {
    bg = '#222730',
    fg = '#bbc2cf',
    fg2 = '#8190b3',
    white = '#aaaaaa',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "║",
    -- theme = 'auto',
    theme = 'nord',
    -- theme = 'gruvbox',
    -- theme = {
    --   -- We are going to use lualine_c an lualine_x as left and
    --   -- right section. Both are highlighted by c theme .  So we
    --   -- are just setting default looks o statusline
    --   normal = {c = {fg = colors.fg, bg = colors.bg}},
    --   inactive = {c = {fg = colors.fg, bg = colors.bg}}
    -- }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end



----------------------------------------------------------
-- mode color
----------------------------------------------------------
local mode_color = {
    n = '#aaaaaa',
    i = colors.yellow,
    v = colors.green,
    [''] = colors.green,
    V = colors.green,
    c = colors.blue,
    no = '#000000',
    s = '#000000',
    S = '#000000',
    [''] = '#000000',
    ic = '#000000',
    R = colors.red,
    Rv = colors.red,
    cv = '#000000',
    ce = '#000000',
    r = '#000000',
    rm = '#000000',
    ['r?'] = '#000000',
    ['!'] = '#000000',
    t = colors.violet,
}

-- local mode_icon = {
--     n = '○',
--     i = '◌',
--     v = '⦿',
--     [''] = '●',
--     V = '●',
--     c = '◐',
--     no = 'no',
--     s = 's',
--     S = 'S',
--     [''] = '^S',
--     ic = 'ic',
--     R = 'R',
--     Rv = 'Rv',
--     cv = 'cv',
--     ce = 'ce',
--     r = 'r',
--     rm = 'rm',
--     ['r?'] = 'r?',
--     ['!'] = '!',
--     t = '✤'
-- }


----------------------------------------------------------
-- left padding
----------------------------------------------------------
-- ins_left {
--     function()
--         vim.api.nvim_command('highlight! LualineMode guifg=' ..  "#000000"  .. " guibg=" .. mode_color[vim.fn.mode()])
--         return '   '
--     end,
--     color = 'LualineMode',
--     padding = 1,
-- }



----------------------------------------------------------
-- filetype component
----------------------------------------------------------
ins_left {
    'filetype',
    condition = conditions.buffer_not_empty,
    upper = true,
    color = {fg = colors.fg},
    padding_left = 0,
    padding_right = 1,
}



----------------------------------------------------------
-- directory
----------------------------------------------------------
ins_left {
    function()
    local max = 50
    local dir = vim.fn.expand('%:p:h') .. '/'

    local len = string.len(dir)
    if len > max then
        dir = dir:sub(len - max + 1, len)

        local pos = 1
        while dir:sub(pos,pos) ~= '/'
        do pos = pos + 1 end

        if pos > 1 then
            len = string.len(dir)
            dir = dir:sub(pos, len)
        end

        return '...' .. dir
    end

        return dir
    end,
    condition = conditions.buffer_not_empty,
    color = {fg = colors.fg2},
    -- padding_right = 0,
    padding = 0,
}


----------------------------------------------------------
-- filename
----------------------------------------------------------
ins_left {
    function()
        return vim.fn.expand('%:t')
    end,
    condition = conditions.buffer_not_empty,
    color = {fg = colors.fg},
    -- padding_right = 0,
    padding = 0,
}

----------------------------------------------------------
-- mid section
----------------------------------------------------------
-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}


----------------------------------------------------------
-- lsp
----------------------------------------------------------
ins_left {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '',
  color = {fg = colors.fg2},
  right_padding = 0, 
}


----------------------------------------------------------
-- diagnostic component
----------------------------------------------------------
ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},

  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.green,
  color_hint = colors.blue

}


----------------------------------------------------------
-- git branch
----------------------------------------------------------
ins_right {
    'branch',
    icon = '',
    condition = conditions.check_git_workspace,
    color = {fg = colors.fg},
    right_padding = 0,
}


----------------------------------------------------------
-- git diff
----------------------------------------------------------
ins_right {
    'diff',
    -- symbols = {added = '落', modified = 'ﱤ ', removed = 'x '},
    color_added = colors.green,
    color_modified = colors.orange,
    color_removed = colors.red,
    condition = conditions.hide_in_width,
    right_padding = 1,
}


----------------------------------------------------------
-- encoding component
----------------------------------------------------------
ins_right {
    'o:encoding', 
    upper = true, 
    condition = conditions.hide_in_width,
    color = {fg = colors.fg2},
    right_padding = 0,
}


----------------------------------------------------------
-- file format component
----------------------------------------------------------
ins_right {
      'fileformat',
      upper = true,
      icons_enabled = false,
      color = {fg = colors.fg2},
    right_padding = 0,
}


----------------------------------------------------------
-- filesize component
----------------------------------------------------------
ins_right {
    function()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then return '' end
                local sufixes = {'B', 'KB', 'MB', 'GB'}
                local i = 1
                while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format('%.1f%s', size, sufixes[i])
        end
        local file = vim.fn.expand('%:p')
        if string.len(file) == 0 then return '' end
        return format_file_size(file)
    end,
    condition = conditions.buffer_not_empty,
    color = {fg = colors.fg2},
    right_padding = 1,
}


----------------------------------------------------------
-- location component
----------------------------------------------------------
ins_right {
    'location', 
    color = {fg = colors.fg},
    right_padding = 0,
}

----------------------------------------------------------
-- location component
----------------------------------------------------------
ins_right {
    'progress', 
    color = {fg = colors.fg},
    right_padding = 1,
}


----------------------------------------------------------
-- right padding
----------------------------------------------------------
-- ins_right {
--     function()
--         vim.api.nvim_command('highlight! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" .. mode_color[vim.fn.mode()])
--         return '    '
--     end,
--     color = 'LualineMode',
--     padding = 0,
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
