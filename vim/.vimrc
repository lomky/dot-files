""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                        WELCOME                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Hello! This is my custom written vimrc, version 3. RubyConf2021 inspired me
  " to do a thourough refresh of my vimrc. Enjoy!

  " High level:
  " Setup:    installs VimPlug and installs the plugins
  " Plugins:  Specifies the Plugins, by type
  " Configs:  Configures vim, by type
  "
  " Types:
  "   - Vim Settings
  "     - General
  "     - Theme
  "     - Search
  "   - Tools
  "     - [Tool]
  "   - Language Specific
  "     - [Language]

  " Comment Verbosity
  " All plugins & settings should have a basic comment stating:
  " - what they do
  " - why they do it (if not straightforward)
  " - their source
  " - any associated plugin (give the full/name)

  " Version History
  " # 3.0
  " Full rewrite
  " Swap Vundle->VimPlug
  " Serious Organizing

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         SETUP                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Make sure our plugin tool is installed & run
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                        PLUGINS                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  call plug#begin()

  "                                                                                                         VIM SETTINGS
    "                                                                                                            GENERAL
      " sensible default configs. Replaces nocompatible
      " https://github.com/tpope/vim-sensible
      Plug 'tpope/vim-sensible'

      " Smartmatch indent style
      " https://github.com/tpope/vim-sleuth
      Plug 'tpope/vim-sleuth'

      " use airline
      " https://github.com/vim-airline/vim-airline
      Plug 'vim-airline/vim-airline'

    "                                                                                                              THEME
      " Color Schemes - https://vimcolorschemes.com/
      " https://github.com/sainnhe/everforest
      Plug 'sainnhe/everforest'

  "                                                                                                                TOOLS
    "                                                                                                             CTRL-P
      " Fuzzy-path finding with Ctrl-P
      " Press <F5> purge cache
      " Press <c-f> and <c-b> to cycle modes.
      " Press <c-d> to switch to filename only search instead of full path.
      " Press <c-r> to switch to regexp mode.
      " Use <c-j>, <c-k> or the arrow keys to navigate the result list.
      " Use <c-t> or <c-v>, <c-x> to open selected in a new tab or in a new split.
      " Use <c-n>, <c-p> to select next/previous string in the prompt's history.
      " Use <c-y> to create a new file and its parent directories.
      " Use <c-z> to mark/unmark multiple files and <c-o> to open them.
      " https://github.com/ctrlpvim/ctrlp.vim
      Plug 'ctrlpvim/ctrlp.vim'

    "                                                                                                       SURROUND.VIM
      " Surround.vim - easily delete, change and add surroundings in pairs.
      " https://github.com/tpope/vim-surround
      " cs'" -> 'foo' becomes "foo"
      " ds'  -> 'foo' becomes foo
      " yss  -> hello world becomes { hello world }
      " ysiw -> hello world becomes { hello } world
      Plug 'tpope/vim-surround'


    "                                                                                                       ZETTLE NOTES
      " vimwiki & vim-zettel to take better notes & manage them
      Plug 'vimwiki/vimwiki'
      Plug 'junegunn/fzf'
      Plug 'junegunn/fzf.vim'
      Plug 'michal-h21/vim-zettel'

    "                                                                                                           NERDTree
      " https://github.com/preservim/nerdtree
      " sidebar file browser
      Plug 'preservim/nerdtree'
  "                                                                                           LANGUAGE-SPECIFIC SETTINGS
    "                                                                                                          BEANCOUNT
      " https://github.com/nathangrigg/vim-beancount
      " Syntax highlighting, AlignCommodity, & ^X^O autocomplete accounts
      Plug 'nathangrigg/vim-beancount'

    "                                                                                                            JS & TS
      " JavaScript support
      " https://github.com/pangloss/vim-javascript
      Plug 'pangloss/vim-javascript'

      " TypeScript syntax
      " https://github.com/leafgarland/typescript-vim
      Plug 'leafgarland/typescript-vim'

      " JS and JSX syntax
      " https://github.com/maxmellon/vim-jsx-pretty
      Plug 'maxmellon/vim-jsx-pretty'

    "                                                                                                       RUBY & RAILS
      " https://github.com/vim-ruby/vim-ruby
      " vim ruby support - make sure we're on the newest!
      Plug 'vim-ruby/vim-ruby'

      " https://github.com/kana/vim-textobj-user
      " https://github.com/nelstrom/vim-textobj-rubyblock
      " ar - select all of a ruby-block
      " ir - select insides of a ruby-block
      Plug 'kana/vim-textobj-user'
      Plug 'nelstrom/vim-textobj-rubyblock'

      " https://github.com/tpope/vim-rails
      " adds rails support to gf
      " syntax highlighting ++
      " task running with :Rails
      Plug 'tpope/vim-rails'

      " RSpec running
      " https://github.com/thoughtbot/vim-rspec
      " RSpec.vim mappings
      " map <Leader>t :call RunCurrentSpecFile()<CR>
      " map <Leader>s :call RunNearestSpec()<CR>
      " map <Leader>l :call RunLastSpec()<CR>
      " map <Leader>a :call RunAllSpecs()<CR>
      Plug 'thoughtbot/vim-rspec'


  " Done listing Plugins - Initialize the plugin system
  call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                        CONFIGS                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "                                                                                                         VIM SETTINGS
    "                                                                                                            GENERAL
      set showcmd               " Show what has been typed in the lower right
      set number relativenumber " use hybrid line numbers
      set ruler                 " use the ruler
      set foldmethod=indent     "fold basedon indentation, by default

      " Low contrast highlight column 120
      if exists('+colorcolumn')
        highlight ColorColumn ctermbg=magenta
        set colorcolumn=80
        set colorcolumn=120
      else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
      endif

      " show me my whitespace
      exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
      set list

      " semicolon is the new colon
      nnoremap ; :

      " configure vim-airline/vim-airline
      " show all the buffers for single tab
      let g:airline#extensions#tabline#enabled = 1

    "                                                                                                             SEARCH
      set incsearch     " highlight as typing
      set ignorecase    " ignore case
      set smartcase     " unless I type uppercase
      set hlsearch      " Highlight all matches
      highlight clear Search
      highlight       Search   ctermfg=White

      " Rewires n and N to update the highlights
      nnoremap <silent> n   n:call HLNext(0.8)<cr>
      nnoremap <silent> N   N:call HLNext(0.8)<cr>

      " blink the match we've just jumped to
      function! HLNext (blinktime)
          highlight HighlightColors ctermfg=black ctermbg=green
          let [bufnum, lnum, col, off] = getpos('.')
          let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
          let target_pat = '\c\%#\%('.@/.'\)'
          let ring = matchadd('HighlightColors', target_pat, 101)
          redraw
          exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
          call matchdelete(ring)
          redraw
      endfunction

    "                                                                                                              THEME
      " Configure sainnhe/everforest

      " Set dark or light mode
      set background=dark
      " Set contrast. Available values: 'hard', 'medium'(default), 'soft'
      let g:everforest_background = 'soft'
      colorscheme everforest

    "                                                                                                           NERDTree
      " Configure preservim/nerdtree
      nnoremap <C-n> :NERDTreeToggle<CR>
  "                                                                                                    LANGUAGE SPECIFIC
    "                                                                                                          BEANCOUNT
      " configure nathangrigg/vim-beancount

      " my beancount decimal goes on columnn 70
      let g:beancount_separator_col=70

    "                                                                                                       RUBY & RAILS
      " Activate better matching, esp ruby do/end
      runtime macros/matchit.vim

      "rspec commands
      :let mapleader = ","
      let g:rspec_command = "!bundle exec rspec {spec}"
      map <Leader>t :call RunCurrentSpecFile()<CR>
      map <Leader>s :call RunNearestSpec()<CR>
      map <Leader>l :call RunLastSpec()<CR>
      map <Leader>a :call RunAllSpecs()<CR>


      let mapleader="\\"
