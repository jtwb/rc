
syntax on

" searching
set ignorecase
set smartcase
set hls

" indenting
" I have a love-hate relationship with AI/SI... if only it really chilled out during pastes
filetype indent on
set ai
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" hit f2 to fix autoindent-during-paste
nnoremap <c-p> :set invpaste paste?<CR>
set pastetoggle=<c-p>
set showmode

" Set plugin / syntax required options...
set nocompatible
filetype plugin on

" Set personalized key settings...
let mapleader=","
nnoremap <F3> :let @/ = ""<CR>
set whichwrap+=<,>,h,l,[,]

" Colors
"set background=dark
colorscheme railscasts

if $BIGTERM
    "colorscheme zenburn
    colorscheme wombat256
endif

" #au FileType js so .vim/js.vimrc
" au FileType js set shiftwidth=2
au BufRead,BufNewFile *.js so $HOME/.vim/js.vimrc
au BufRead,BufNewFile *.coffee so $HOME/.vim/coffee.vimrc
au BufRead,BufNewFile *.scss so $HOME/.vim/scss.vimrc
