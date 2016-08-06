set ai
set si
set number

set expandtab
set shiftwidth=4
set softtabstop=4

set autoindent

set list
set listchars=trail:·,precedes:<,extends:>,tab:\»\

set laststatus=0
let g:miniBufExplSplitBelow=1

set hlsearch

filetype plugin indent on

colorscheme murphy

if &diff
    colorscheme evening
endif
