let g:username = "westar"
let g:usermail = "me@wes.cloud"

syntax on

" setup invisible character highlighting
" toggable by CTRL+h
map <C-h> :set list!<CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" Show line numbers and set them DarkGray
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show lightline and disable default mode show
set noshowmode
set laststatus=2

set colorcolumn=80

" Set tab to be 4 spots wide
set tabstop=4

" Defensive defaults for tabs
set softtabstop=0 noexpandtab
set shiftwidth=4

filetype off

" Plugin install
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

" Map enter to insert+cr
map <Enter> i<CR>

" Focus NERDTree when Ctrl+Tab is pressed
map <C-n> :NERDTreeFocus<CR>

" Open NERDTree when no arguments are supplied
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if only window is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ignore node_modules in NERDTree
let NERDTreeIgnore=['node_modules[[dir]]']


