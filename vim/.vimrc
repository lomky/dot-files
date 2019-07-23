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

" https://github.com/mhinz/vim-startify
Plugin 'mhinz/vim-startify'

" https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'

" https://github.com/nathangrigg/vim-beancount
Plugin 'nathangrigg/vim-beancount'

" https://github.com/drewtempelmeyer/palenight.vim
Plugin 'drewtempelmeyer/palenight.vim'

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
"set foldmethod=indent

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

" line numbers! Ruler! Column highlight!
set number
set ruler
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" search improvements. 
set incsearch     " highlight as typing
set ignorecase    " ignore case
set smartcase     " unless I type uppercase
set hlsearch      " Highlight all matches
highlight clear Search
highlight       Search   ctermfg=White

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" highlight the match in red
function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction


" show me my whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" semicolon is the new colon
nnoremap ; :

" buffer display zone

" set laststatus=0
" let g:miniBufExplSplitBelow=1

 set laststatus=2
 set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" let g:miniBufExplSplitBelow=1

" md is markdown, for me!
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" my beancount decimal goes on columnn 70
let g:beancount_separator_col=70

"colorscheme murphy

"if &diff
    "colorscheme evening
"endif

set background=dark
colorscheme palenight
"let g:lightline.colorscheme = 'palenight'
let g:palenight_terminal_italics=1

filetype plugin indent on
syntax on
