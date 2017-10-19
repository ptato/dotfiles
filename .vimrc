" Colors {{{
colorscheme deus
syntax enable " enable syntax highlighting
set background=dark
" }}}
" Indentation {{{
set tabstop=4 " how many spaces a tab character occupies visually
" set softtabstop=4 " number of spaces written with a tab
set noexpandtab " set expandtab " use soft tabs (tab inserts spaces)
set shiftwidth=4 " indentation is defined as 4 spaces
" }}}
" Miscellaneous {{{
set modeline
set modelines=1
filetype indent on " load filetype specific indent settings
    " place at ~/.vim/indent/<language>.vim (<language>.vim as in e.g. python.vim)
"}}}
" UI {{{
set showcmd " show last command in bottom bar
set cursorline " highlights current line
" set number " show line numbers on the left
set wildmenu " visual autocomplete for command menu
set lazyredraw " don't redraw when it's not necessary
set showmatch " highlight matching parenthesis and brackets
set guioptions= " remove gui
set guifont=Liberation\ Mono " set gui font
" }}}
" Search {{{
set incsearch " search as characters are written
set hlsearch " highlight matches
nnoremap <leader>h :nohlsearch<CR> 
    " <leader>h removes the highlighting
" }}}
" Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " first level that will be folded when a file is opened
set foldnestmax=10 " maximum of folds nested within each other
set foldmethod=indent " fold based on indent level
" }}}
" Movement {{{
nnoremap j gj
nnoremap k gk
    " move vertically by visual lines, even when they wrap
nnoremap B ^
nnoremap E $
    " move to beginning/end of line
nnoremap $ <nop>
nnoremap ^ <nop>
    " $ and ^ don't do anything
nnoremap gV `[v`]
    " highlights last inserted text
" }}}
" Shortcuts {{{
nnoremap ñ :
    " ñ is :
" let mapleader=" " " leader is space
map <space> <leader>
inoremap jk <esc>
    " jk is escape
" nnoremap <leader>u :GundoToggle<CR>
    " Gundo is a plugin that allows you to traverse vim's undo tree easily
    " get it if you feel adventurous
nnoremap <leader>fs :w<CR>
    "<leader>fs -> File Save
nnoremap <leader>fed :e $MYVIMRC<CR>
    " <leader>fed File Edit Dotfile
nnoremap <leader>feb :e ~/.bashrc<CR>
    " <leader>feb -> File Edit Bash
nnoremap <leader>fsd :source $MYVIMRC<CR>
    " <leader>fsd -> File Source Dotfile
" nnoremap <leader>s :mksession<CR>
    " Saves opened windows, reopen them with vim -S
" }}}
" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb' " Order files top to bottom
let g:ctrlp_switch_buffer = 0 " Open files in new buffer
let g:ctrlp_working_path_mode = 0 " Allow changing path in a session 
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Use 'ag' for searching
nnoremap <leader>ff :CtrlP<CR>
    " <leader>ff is Find File
" }}}
" Plugins {{{
execute pathogen#infect()
" }}}


" vim:foldmethod=marker:foldlevel=0
