call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'drewtempelmeyer/palenight.vim'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'm4xshen/autoclose.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'dgox16/oldworld.nvim'
Plug 'mellow-theme/mellow.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'", { 'tag': '0.1.8' }
Plug 'projekt0n/github-nvim-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'preservim/nerdcommenter'
Plug 'f-person/git-blame.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'romgrk/barbar.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'mhinz/vim-startify'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off
"

lua << EOF
-- STARTIFY
vim.g.startify_custom_header = {
  "                                             __                                                     ",
  "                                          ,o88888                                                   ",
  "                                       ,o8888888'                                                   ",
  "                  ,:o:o:oooo.        ,8O88Pd8888\"                                                   ",
  "               ,.::.::o:ooooOoOoO. ,oO8O8Pd888'\"                                                    ",
  "            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O\"                                                       ",
  "           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8\"                                                         ",
  "           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8\"    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   ",
  "          , ..:.::o:ooOoOO8O888O8O,COCOO\"      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ",
  "         , . ..:.::o:ooOoOOOO8OOOOCOCO\"        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   ",
  "          . ..:.::o:ooOoOoOO8O8OCCCC\"o         ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   ",
  "             . ..:.::o:ooooOoCoCCC\"o:o         ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   ",
  "             . ..:.::o:o:,cooooCo\"oo:o:        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
  "          `   . . ..:.:cocoooo\"'o:o:::'                                                             ",
  "          .`   . ..::ccccoc\"'o:o:o:::'         ░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓   Welcome!   ░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓   ",
  "         :.:.    ,c:cccc\"':.:.:.:.:.'                                                               ", 
  "       ..:.:'`::::c:''..:.:.:.:.:.'                                                                 ",
  "     ...:.'.:.::::'    . . . . .'                                                                   ",
  "    .. . ....:.\"' `   .  . . ''                                                                     ",
  "  . . . ....\"'                                                                                      ",
  "  .. . .\"'                                                                                          ",
  " .                                                                                                  ",
  "",
}
vim.g.NERDTreeHijackNetrw = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 1
vim.g.startify_files_number = 10
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 0  -- Don't change to VCS root
vim.g.startify_enable_special = 0      -- Disable special buffers in session
vim.g.startify_session_persistence = 0 -- Don't auto-save sessions
vim.g.startify_session_autoload = 0
vim.g.startify_disable_at_vimenter = 0
vim.g.startify_lists = {
  { type = 'dir', header = { 'MRU ' .. vim.fn.getcwd() } }
}
vim.g.startify_custom_indices = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}

-- BARBAR
vim.g.barbar_auto_setup = false
require('barbar').setup({
  animation = false,
  auto_hide = false,
  clickable = true,
  exclude_ft = {'startify'}, -- Exclude startify from barbar
  exclude_name = {'[No Name]'}, -- Exclude unnamed buffers
  focus_on_close = 'previous',
  hide = {extensions = false, inactive = false},
  highlight_alternate = false,
  highlight_inactive_file_icons = false,
  highlight_visible = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      custom_colors = false,
      enabled = true,
    },
    -- separator = {left = '▎', right = ''}
    separator = {left = '|', right = '|'},
    separator_at_end = false,
    modified = {button = '●'},
    pinned = {button = '*', filename = true},
    preset = 'default',
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {buffer_index = true},
    visible = {modified = {buffer_number = false}},
  },
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  minimum_length = 5,
  semantic_letters = true,
  sidebar_filetypes = {
    NvimTree = true,
    undotree = {text = 'undotree'},
  },
  sort = {
    ignore_case = false,
  },
})
vim.keymap.set('n', '<A-c>', function()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  local visible_buffers = {}
  
  for _, buf in ipairs(buffers) do
    if buf.listed == 1 and buf.name ~= '' then
      table.insert(visible_buffers, buf)
    end
  end
  
  if #visible_buffers <= 1 then
    -- If this is the last buffer, quit Neovim
    vim.cmd('quit')
  else
    -- Otherwise, close the buffer normally
    vim.cmd('BufferClose!')
  end
end, { noremap = true, silent = true })

-- INDENT LINE
require("ibl").setup {
    indent = {
        char = "╎"
    },
    exclude = {
      filetypes = {
          "startify",
          "help",
          "terminal",
          "dashboard",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "mason",
          "",
      },
      buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
      },
    },
}

-- GITHUB THEMES
require('github-theme').setup()

-- TREESITTER
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp", "javascript", "typescript", "lua", "vim", "make" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

-- SCROLLBAR
require("scrollbar").setup({
  show = true,
  set_highlights = true,
  handle = {
    text = " ",
    color = "#57575f",
    cterm = nil,
    highlight = "CursorColumn",
    hide_if_all_visible = true,
  },
  marks = {
    Search = {
      text = { "-", "=" },
      priority = 1,
      color = "#e6b99d",
      cterm = nil,
      highlight = "Search",
    },
  },
  handlers = {
    search = true,  -- Requires hlslens
  },
})

-- SEARCH
require("hlslens").setup({
  build_position_cb = function(plist, _, _, _)
    require("scrollbar.handlers.search").handler.show(plist.start_pos)
  end,
})
local kopts = {noremap = true, silent = true}

-- GIT BLAME
require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = true,
    message_template = '<sha> • <author> • <date> • <summary>'

} 

-- LUALINE
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {''},
    lualine_x = {'progress'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- TELESCOPE
require('telescope').setup{
    defaults = {
        border = true,
        layout_strategy = 'vertical',
        layout_config = {
        -- Remove the layout_strategy from here
            vertical = { 
                width = 0.9,
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom"
            }
        },
        mappings = {
            -- Keybinding to close any Telescope Window
            i = {
                ["qq"] = require('telescope.actions').close,
                ["<M-a>"] = require('telescope.actions').results_scrolling_left,
                ["<M-d>"] = require('telescope.actions').results_scrolling_right,
            },
            n = { ["tt"] = require('telescope.actions').close },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            attach_mappings = function(_, map)
            return true
            end,
        },
        oldfiles = {
            attach_mappings = function(_, map)
            return true
            end,
        },
    },
}

EOF

"" COLOR SCHEME
syntax on
set cursorline
colorscheme mellow

" KEY MAPPING
let mapleader = " "
inoremap <C-`> <esc>
vnoremap <C-`> <esc>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>
nnoremap <leader>h <cmd>Telescope command_history<cr>
nnoremap <leader>o <cmd>Telescope oldfiles<cr>
nnoremap n :execute 'normal! ' . v:count1 . 'nzz'<CR>:lua require('hlslens').start()<CR>
nnoremap N :execute 'normal! ' . v:count1 . 'Nzz'<CR>:lua require('hlslens').start()<CR>
nnoremap * *:lua require('hlslens').start()<CR>
nnoremap # #:lua require('hlslens').start()<CR>
nnoremap g* g*:lua require('hlslens').start()<CR>
nnoremap g# g#:lua require('hlslens').start()<CR>
nnoremap <Leader>l :nohlsearch<CR>

" Set Telescope border highlight colors for dark backgrounds
highlight TelescopeBorder guifg=#ECAAD6 guibg=NONE
highlight TelescopePromptBorder guifg=#ECAAD6  guibg=NONE
highlight TelescopeResultsBorder guifg=#ECAAD6 guibg=NONE
highlight TelescopePreviewBorder guifg=#ECAAD6 guibg=NONE

" Set Telescope result header highlight colors for dark backgrounds
highlight TelescopeResultsTitle guifg=#ffffff guibg=NONE
highlight TelescopePreviewTitle guifg=#ffffff guibg=NONE
highlight TelescopePromptTitle guifg=#ffffff guibg=NONE

" Tab Options
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Close buffer
" nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>
" Magic buffer-picking mode
nnoremap <silent>    <A-p>    <Cmd>BufferPick<CR>
nnoremap <silent>    <A-s-p>  <Cmd>BufferPickDelete<CR>
" Pin/unpin buffer
nnoremap <silent>    <C-p> <Cmd>BufferPin<CR>
" Goto pinned/unpinned buffer
nnoremap <silent>    <C-s-p> <Cmd>BufferGotoPinned 0<CR>

" OTHER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
set number
set mousescroll=hor:0
set autoread
set nowrap
set cmdheight=0
set clipboard=unnamedplus
set tabstop=4
set expandtab
set shiftwidth=4
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal nonumber
autocmd TermEnter * setlocal signcolumn=no
