execute pathogen#infect()

syntax enable
filetype plugin indent on

set encoding=UTF-8
set termguicolors
set t_Co=256
set cursorline
set nocompatible
set tabstop=2
set shiftwidth=2
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
set clipboard=unnamed
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups//
set relativenumber
set number
set endofline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" THEME.
colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:WebDevIconsNerdTreeAfterGlyphPadding='  '
let g:webdevicons_conceal_nerdtree_brackets=1
let NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:flow#showquickfix=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|vendor'
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier_eslint'],
\   'php': ['php_cs_fixer'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😨'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:javascript_plugin_flow = 1
let g:ctrlp_show_hidden = 1
let g:vim_markdown_folding_disabled = 1

no <C-J> <C-W><C-J>
no <C-K> <C-W><C-K>
no <C-H> <C-W><C-H>
no <C-L> <C-W><C-L>
no <M-j> 5j
no <M-k> 5k
no <M-d> ddp
no <M-u> ddkP
no <M-f> >gv
no <M-b> <gv
no <C-t> <ESC>:CtrlPBuffer<CR>
no <C-k> :redraw!<CR>
no <Space> <C-d>

imap <leader>w <ESC>ciw
imap <leader>' <ESC>ci'
imap <leader>" <ESC>ci"
imap <leader>( <ESC>ci(
imap <leader>[ <ESC>ci[
imap <leader>{ <ESC>ci{
imap <leader>< <ESC>ci<
imap <leader>t <ESC>cit
imap <leader>u <ESC>u
imap <C-s> <ESC>:w<CR>li
imap <C-q> <ESC>:wqa<CR>
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

nmap <leader>v :e<space>~/.vimrc<CR>
nmap <C-s> :w<CR>
nmap <C-q> :wqa<CR>
nmap <leader>w ciw
nmap <leader>' ci'
nmap <leader>" ci"
nmap <leader>( ci(
nmap <leader>[ ci[
nmap <leader>{ ci{
nmap <leader>< ci<
nmap <leader>t cit
nmap <leader>h :nohl<CR>
nmap <leader>i :set list!<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

