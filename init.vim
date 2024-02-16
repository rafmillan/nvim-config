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

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off
"

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp", "javascript", "typescript", "lua", "vim", "make" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

require("autoclose").setup()

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_c = {'filename'},
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
EOF

" Enable true colors
"if (has("termguicolors"))
"  set termguicolors
"endif

set background=dark

let g:palenight_termcolors=16
"let g:palenight_terminal_italics=1
colorscheme palenight
syntax on
syntax enable

"let g:material_style = "palenight"
"colorscheme material


set number
set nowrap
set clipboard=unnamedplus
set tabstop=4
set expandtab
set shiftwidth=4
inoremap \\ <esc>
vnoremap \\ <esc>
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal nonumber
autocmd TermEnter * setlocal signcolumn=no
