
local lualine = require 'lualine'

-- color table for highlights
local colors = {
    nord_night_1 = '#2E3440',
    nord_night_2 = '#3B4252',
    nord_night_3 = '#434C5E',
    nord_night_4 = '#4C566A',
    nord_snow_1 = '#D8DEE9',
    nord_snow_2 = '#E5E9F0',
    nord_snow_3 = '#ECEFF4',
    nord_frost_1 = '#8FBCBB',
    nord_frost_2 = '#88C0D0',
    nord_frost_3 = '#81A1C1',
    nord_frost_4 = '#5E81AC',
    nord_aurora_1 = '#BF616A',
    nord_aurora_2 = '#D08770',
    nord_aurora_3 = '#EBCB8B',
    nord_aurora_4 = '#A3BE8C',
    nord_aurora_5 = '#B48EAD',

   nord_brightness_1 = '#4e586d',
   nord_brightness_2 = '#505b70',
   nord_brightness_3 = '#525d73',
   nord_brightness_4 = '#556076',
   nord_brightness_5 = '#576279',
   nord_brightness_6 = '#59647c',
   nord_brightness_7 = '#5b677f',
   nord_brightness_8 = '#5d6982',
   nord_brightness_9 = '#5f6c85',
   nord_brightness_10 = '#616e88',
   nord_brightness_11 = '#63718b',
   nord_brightness_12 = '#66738e',
   nord_brightness_13 = '#687591',
   nord_brightness_14 = '#6a7894',
   nord_brightness_15 = '#6d7a96',
   nord_brightness_16 = '#6f7d98',
   nord_brightness_17 = '#72809a',
   nord_brightness_18 = '#75829c',
   nord_brightness_19 = '#78859e',
   nord_brightness_20 = '#7b88a1',
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
    -- theme = 'nord',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.nord_snow_1, bg = colors.nord_night_2}},
      inactive = {c = {fg = colors.nord_snow_1, bg = colors.nord_night_1}}
    }
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
-- encoding component
----------------------------------------------------------
ins_left {
    'o:encoding',
    upper = true,
    condition = conditions.hide_in_width,
    -- color = {fg = colors.nord_frost_4},
    color = {fg = colors.nord_brightness_20},
    left_padding = 0,
    right_padding = 0,
}


----------------------------------------------------------
-- file format component
----------------------------------------------------------
ins_left {
    'fileformat',
    upper = true,
    icons_enabled = false,
    -- color = {fg = colors.nord_frost_4},
    color = {fg = colors.nord_brightness_20},
    right_padding = 0,
}

----------------------------------------------------------
-- filesize component
----------------------------------------------------------
ins_left {
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
    -- color = {fg = colors.nord_frost_4},
    color = {fg = colors.nord_brightness_20},
    right_padding = 1,
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
    -- color = {fg = colors.nord_brightness_15},
    color = {fg = colors.nord_brightness_10},
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
    color = {fg = colors.nord_aurora_2},
    -- padding_right = 0,
    padding = 0,
}


----------------------------------------------------------
-- git branch
----------------------------------------------------------
ins_left {
    'branch',
    icon = '',
    condition = conditions.check_git_workspace,
    color = {fg = colors.nord_brightness_10},
    right_padding = 0,
}


----------------------------------------------------------
-- git diff
----------------------------------------------------------
ins_left {
    'diff',
    -- symbols = {added = ' ', modified = ' ', removed = ' '},
    color_added = colors.nord_aurora_4,
    color_modified = colors.nord_aurora_3,
    color_removed = colors.nord_aurora_1,
    condition = conditions.hide_in_width,
    right_padding = 1,
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
  color = {fg = colors.nord_brightness_10},
  right_padding = 0,
}


----------------------------------------------------------
-- diagnostic component
----------------------------------------------------------
ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
  color_error = colors.nord_aurora_1,
  color_warn = colors.nord_aurora_3,
  color_info = colors.nord_aurora_4,
  color_hint = colors.nord_frost_4,

}


----------------------------------------------------------
-- filetype component
----------------------------------------------------------
ins_right {
    function ()
        return vim.bo.filetype
    end,
    condition = conditions.buffer_not_empty,
    upper = true,
    color = {fg = colors.nord_aurora_5},
    -- color = {fg = colors.nord_frost_3},
    padding_left = 0,
    padding_right = 0,
}

----------------------------------------------------------
-- location component
----------------------------------------------------------
ins_right {
    'location',
    color = {fg = colors.nord_brightness_10},
    left_padding = 0,
    right_padding = 1,
}

----------------------------------------------------------
-- location component
----------------------------------------------------------
ins_right {
    'progress',
    color = {fg = colors.nord_brightness_20},
    left_padding = 0,
    right_padding = 0,
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
