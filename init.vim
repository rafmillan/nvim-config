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

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off
"

lua << EOF
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
-- Setup nvim-scrollbar
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
    enabled = false,
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
    lualine_c = {'filename', 'tabs'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
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
            map('i', '<CR>', require('telescope.actions').select_tab)
            map('n', '<CR>', require('telescope.actions').select_tab)
            return true
            end,
        },
        oldfiles = {
            attach_mappings = function(_, map)
            map('i', '<CR>', require('telescope.actions').select_tab)
            map('n', '<CR>', require('telescope.actions').select_tab)
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
"" colorscheme github_dark_colorblind 

" KEY MAPPING
let mapleader = " "
inoremap <C-`> <esc>
vnoremap <C-`> <esc>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>
nnoremap <leader>h <cmd>Telescope command_history<cr>
nnoremap <leader>o <cmd>Telescope oldfiles<cr>
nnoremap n :execute 'normal! ' . v:count1 . 'n'<CR>:lua require('hlslens').start()<CR>
nnoremap N :execute 'normal! ' . v:count1 . 'N'<CR>:lua require('hlslens').start()<CR>
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


" OTHER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:gitblame_enabled = 1
let g:gitblame_message_template = '  <sha> • <author> • <date> • <summary>'
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
