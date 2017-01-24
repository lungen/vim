set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'

" Syntax Checking / Highlightning
Plugin 'scrooloose/syntastic'
" PEP 8
Plugin 'nvie/vim-flake8'

" File Browsing
Plugin 'scrooloose/nerdtree'

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" Super Search
Plugin 'kien/ctrlp.vim'

" GIT - Support
Plugin 'tpope/vim-fugitive'

" Powerline
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Lightline
"Plugin 'itchyny/lightline.vim'

" System Clipboad
set clipboard=unnamed

" YCM
Plugin 'Valloric/YouCompleteMe'

" NERC COMMENTER
" Plugin 'scrooloose/nerdcommenter'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------------------------- OWN SETTINGS -------------------"
" ----------------------------------------- OWN SETTINGS -------------------"
" ----------------------------------------- OWN SETTINGS -------------------"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar/ ff
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=139
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au BufRead,BufNewFile *.c,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h match BadWhitespace /\s\+$/
au         BufNewFile *.c,*.h set fileformat=unix
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=4
au BufRead,BufNewFile *.html set softtabstop=4
au BufRead,BufNewFile *.html set shiftwidth=4
au BufRead,BufNewFile *.html set autoindent
au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!-

" Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 Support
set encoding=utf-8

let python_highlight_all=1
syntax on

set nu
highlight BadWhitespace ctermbg=red guibg=red

" no temp or backup files
set noswapfile
set nobackup
set nowritebackup

map <C-]> :YcmCompleter GoToImprecise<CR>

" nnoremap <silent> <F12> :!clear;python3.5 %<CR>
nnoremap <silent> <F12> :w\|!clear;python3.5 %<CR>
nnoremap <silent> <F11> :w\|!clear;python3.5 -i %<CR>
nnoremap <silent> <F8> :w\|!pudb3 %<CR>

imap jj <Esc>
nmap ff /
cmap ff <Esc>

" remember position when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" colorscheme
"colorscheme jellybeans
colorscheme delek_mine
