execute pathogen#infect()

set encoding=UTF-8
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number

let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:webdevicons_conceal_nerdtree_brackets=1
let NERDTreeShowHidden=1

syntax enable
set background=dark
colorscheme gruvbox

set mouse=a
set guifont=FuraCode\ Nerd\ Font:h14
set linespace=6
set updatetime=100

let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:flow#showquickfix=0

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

no <C-J> <C-W><C-J>
no <C-K> <C-W><C-K>
no <C-H> <C-W><C-H>
no <C-L> <C-W><C-L>

set splitbelow
set splitright

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
