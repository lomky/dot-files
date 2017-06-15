" Welcome to the world of tomorrow!
set nocompatible

" Vundle stuff START
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/bling/vim-bufferline
Plugin 'bling/vim-bufferline'

" The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  "Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
" Vundle stuff END

" This shows what you are typing as a comman.
set showcmd

"fold based on indentation, by default
set foldmethod=indent

syntax enable

set autoindent

" set up default tab-as-spaces to 2
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
  set spl=en spell
  set nospell
endif

" line numbers!
set number
set ruler

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" search as we type & highlight
set incsearch
set hlsearch

" show me my whitespace
set list
set listchars=trail:·,precedes:<,extends:>,tab:\»\

" set laststatus=0
" let g:miniBufExplSplitBelow=1

 set laststatus=2
 set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" let g:miniBufExplSplitBelow=1

" md is markdown, for me!
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

colorscheme murphy

if &diff
    colorscheme evening
endif

filetype plugin indent on
syntax on
