execute pathogen#infect()

syntax enable
filetype plugin indent on

set encoding=UTF-8
set termguicolors
set t_Co=256
set cursorline
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set number
set path+=**
set background=dark
set mouse=a
set guifont=FuraCode\ Nerd\ Font:h14
set linespace=6
set updatetime=100
set splitbelow
set splitright

" THEME.
colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:webdevicons_conceal_nerdtree_brackets=1
let NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:flow#showquickfix=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|vendor'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😨'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
no <C-J> <C-W><C-J>
no <C-K> <C-W><C-K>
no <C-H> <C-W><C-H>
no <C-L> <C-W><C-L>

map <leader>v :e<space>~/.vimrc<CR>
map <leader>; <ESC>A;<ESC>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>= <ESC>A
imap <leader>; <ESC>A;<ESC>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
