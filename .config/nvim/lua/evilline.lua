local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
-- Dracula
local colors = {
    bg = '#282A36',
    fg = '#F8F8F2',
    yellow = '#F1FA8C',
    cyan = '#8BE9Fd',
    darkblue = '#6272A4',
    green = '#50FA7B',
    orange = '#FFB86C',
    violet = '#BD93F9',
    magenta = '#FF79C6',
    blue = '#8BE9FD',
    red = '#FF5555'
}
-- -- Gruvbox
-- local colors = {
--     bg = '#1D2021',
--     fg = '#EBDBB2',
--     yellow = '#FABD2F',
--     cyan = '#83A598',
--     darkblue = '#458588',
--     green = '#B8BB26',
--     orange = '#FE8019',
--     violet = '#D3869B',
--     magenta = '#B16286',
--     blue = '#83A598',
--     red = '#FB4934'
-- }

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue,colors.bg}
    },
}
gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL LINE', [''] = 'VISUAL BLOCK'}
            local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                [''] = colors.blue,V=colors.blue,
                c = colors.magenta,no = colors.red,s = colors.orange,
                S=colors.orange,[''] = colors.orange,
                ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                cv = colors.red,ce=colors.red, r = colors.cyan,
                rm = colors.cyan, ['r?'] = colors.cyan,
                ['!']  = colors.red,t = colors.red}
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.red,colors.bg,'bold'},
        separator=" ",
        separator_highlight = {colors.fg,colors.bg,'bold'}
    },
}
-- gls.left[2] = {
--     ViMode = {
--         provider = function()
--             -- auto change color according the vim mode
--             local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
--                 [''] = colors.blue,V=colors.blue,
--                 c = colors.magenta,no = colors.red,s = colors.orange,
--                 S=colors.orange,[''] = colors.orange,
--                 ic = colors.yellow,R = colors.violet,Rv = colors.violet,
--                 cv = colors.red,ce=colors.red, r = colors.cyan,
--                 rm = colors.cyan, ['r?'] = colors.cyan,
--                 ['!']  = colors.red,t = colors.red}
--             vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
--             return '  '
--         end,
--         highlight = {colors.red,colors.bg,'bold'},
--     },
-- }

-- gls.left[3] = {
--     FileSize = {
--         provider = 'FileSize',
--         condition = condition.buffer_not_empty,
--         highlight = {colors.fg,colors.bg}
--     }
-- }

gls.left[4] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
}

gls.left[5] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.magenta,colors.bg,'bold'}
    }
}

gls.left[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
    },
}

gls.left[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg,'bold'},
    }
}

gls.left[8] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
    }
}
gls.left[9] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
    }
}

gls.left[10] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
    }
}

gls.left[11] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
    }
}

gls.mid[1] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
            local tbl = {['dashboard'] = true,['']=true}
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = ' LSP:',
        highlight = {colors.fg,colors.bg,'bold'}
    }
}

-- gls.right[1] = {
--   FileEncode = {
--     provider = 'FileEncode',
--     condition = condition.hide_in_width,
--     separator = '|',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }
--
-- gls.right[2] = {
--   FileFormat = {
--     provider = 'FileFormat',
--     condition = condition.hide_in_width,
--     separator = '|',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }

gls.right[1] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.violet,colors.bg,'bold'},
    }
}

gls.right[2] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.violet,colors.bg,'bold'},
    }
}

gls.right[3] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green,colors.bg},
    }
}
gls.right[4] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.orange,colors.bg},
    }
}
gls.right[5] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red,colors.bg},
    }
}

gls.right[6] = {
    RainbowBlue = {
        provider = function() return '  ▊' end,
        highlight = {colors.blue,colors.bg}
    },
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg,'bold'}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider =  'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg,'bold'}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider= 'BufferIcon',
        highlight = {colors.fg,colors.bg}
    }
}
