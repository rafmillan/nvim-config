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

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off
"

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp", "javascript", "typescript", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

require("autoclose").setup()
EOF

" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif



syntax enable
set background=dark

"colorscheme palenight
"let g:palenight_terminal_italics=1

let g:material_style = "palenight"
colorscheme material




set number
set nowrap
set clipboard=unnamedplus
set tabstop=4
set expandtab
set shiftwidth=4

