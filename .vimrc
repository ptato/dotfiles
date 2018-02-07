set nocompatible
" Colors {{{
syntax enable "Enable syntax highlighting
set t_Co=256 "256 Colors
set background=dark "Force dark theme
colorscheme blackdust "deus,VisualStudioDark
" }}}
" Indentation {{{
set tabstop=4 "How many spaces a tab character occupies visually
set expandtab "Use soft tabs (tab key writes space characters)
set softtabstop=4 "Number of spaces written with a tab
set shiftwidth=4 "A level of indentation is defined as 4 spaces
" }}}
" Misc {{{
set modeline "Enable file modelines
set modelines=1 "Check 1 line

filetype indent on "Load filetype specific indent settings
    " place at ~/.vim/indent/<language>.vim (<language>.vim as in e.g. python.vim)
" }}}
" UI {{{
set title "Show filename in title
set guioptions= "Remove every gui thing on gvim
set guifont=Liberation\ Mono

set laststatus=2 "Always show status line
set showcmd "Show last command on the status line
set ruler "Show line and column number on the status line

set cursorline "Highlights current line
set nonumber "Don't show line numbers on the left
set foldcolumn=0 "0 character gutter

set wildmenu "Visual autocomplete for command menu
set lazyredraw "Don't redraw when it's not necessary
set showmatch "Highlight matching parenthesis and brackets

set wrap
set linebreak "Wrap words rather than characters

set noerrorbells
set visualbell
set t_vb=
set belloff=all
" }}}
" Usability {{{
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start "Sometimes backspace doesn't work without this
set hidden "Allow hidden buffers, lets me swap files without saving
" }}}
" Search {{{
set incsearch "Interactive search
set hlsearch "Highlight matches
nnoremap <leader>h :nohlsearch<CR> 
    "<leader>h removes the highlighting

set ignorecase "Case-insensitive search
set smartcase "Case-insensitive when lower-case, Case-sensitive when upper-case
" }}}
" Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " first level that will be folded when a file is opened
set foldnestmax=10 " maximum of folds nested within each other
set foldmethod=indent " fold based on indent level
" }}}
" Movement {{{
    "Move vertically by visual lines, even when they wrap
nnoremap j gj
nnoremap k gk

    "Move to beginning/end of line
    "TODO: Remap this in visual mode
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

    "Highlights last inserted text
nnoremap gV `[v`]
" }}}
" Shortcuts {{{
    " ñ is :, which is in the same position in the american layout
nnoremap ñ :

    "Ignore Ex mode
nnoremap Q <nop>

" let mapleader=" " " leader is space
map <space> <leader>

    " jk is escape, allowing me to exit insert mode without leaving the home row
inoremap jk <esc>

    " Gundo is a plugin that allows you to traverse vim's undo tree easily
" nnoremap <leader>u :GundoToggle<CR>

    "<leader>fs -> File Save
nnoremap <leader>fs :w<CR>

    " <leader>fed File Edit Dotfile
    " <leader>fsd -> File Source Dotfile
nnoremap <leader>fed :e $MYVIMRC<CR>
nnoremap <leader>fsd :source $MYVIMRC<CR>

    " Saves opened windows, reopen them with vim -S
" nnoremap <leader>s :mksession<CR>

    " Comment a line of code with <leader>cc, uncomment with <leader>cu
    " https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType haskell          let b:comment_leader = '-- '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-B>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

    "CtrlP
nmap <leader>p <C-p>

    "Delete buffer, Next buffer
nmap <leader>bd :bn<CR>:bd#<CR>
nmap <leader>bn :bn<CR>
" }}}
" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb' " Order files top to bottom
let g:ctrlp_switch_buffer = 0 " Open files in new buffer
let g:ctrlp_working_path_mode = 0 " Allow changing path in a session 
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Use 'ag' for searching
" }}}
" Plugins {{{
execute pathogen#infect()
" }}}
" vim:foldmethod=marker:foldlevel=0
