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


    "                                                                                   ZETTLE NOTES
      " vimwiki & vim-zettel to take better notes & manage them
      Plug 'vimwiki/vimwiki'
      Plug 'junegunn/fzf'
      Plug 'junegunn/fzf.vim'
      Plug 'michal-h21/vim-zettel'

  "                                                                                           LANGUAGE-SPECIFIC SETTINGS
    "                                                                                                          BEANCOUNT
      " https://github.com/nathangrigg/vim-beancount
      " Syntax highlighting, AlignCommodity, & ^X^O autocomplete accounts
      Plug 'nathangrigg/vim-beancount'

    "                                                                                            JS & TS
      " JavaScript support
      " https://github.com/pangloss/vim-javascript
      Plug 'pangloss/vim-javascript'

      " TypeScript syntax
      " https://github.com/leafgarland/typescript-vim
      Plug 'leafgarland/typescript-vim'

      " JS and JSX syntax
      " https://github.com/maxmellon/vim-jsx-pretty
      Plug 'maxmellon/vim-jsx-pretty'

      " Autocompletion
      " https://github.com/neoclide/coc.nvim
      Plug 'neoclide/coc.nvim'

    "                                                                                                       RUBY & RAILS
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
      set showcmd            " Show what has been typed in the lower right
      set number             " use line numbers
      set ruler              " use the ruler
      set foldmethod=indent  "fold basedon indentation, by default

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

  "                                                                                                    LANGUAGE SPECIFIC
    "                                                                                                          BEANCOUNT
      " configure nathangrigg/vim-beancount

      " my beancount decimal goes on columnn 70
      let g:beancount_separator_col=70

    "                                                                                                           JS & TS
      " neoclide/coc.nvim config -
      " NB: remember to cd to the plug coc.nvim dir & yarn install
        " we are using typescript
        let g:coc_global_extensions = [ 'coc-tsserver' ]

        " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
        " unicode characters in the file autoload/float.vim
        set encoding=utf-8

        " TextEdit might fail if hidden is not set.
        set hidden

        " Some servers have issues with backup files, see #649.
        set nobackup
        set nowritebackup

        " Give more space for displaying messages.
        set cmdheight=2

        " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
        " delays and poor user experience.
        set updatetime=300

        " Don't pass messages to |ins-completion-menu|.
        set shortmess+=c

        " Always show the signcolumn, otherwise it would shift the text each time
        " diagnostics appear/become resolved.
        if has("patch-8.1.1564")
          " Recently vim can merge signcolumn and number column into one
          set signcolumn=number
        else
          set signcolumn=yes
        endif

        " Use tab for trigger completion with characters ahead and navigate.
        " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
        " other plugin before putting this into your config.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        if has('nvim')
          inoremap <silent><expr> <c-space> coc#refresh()
        else
          inoremap <silent><expr> <c-@> coc#refresh()
        endif

        " Make <CR> auto-select the first completion item and notify coc.nvim to
        " format on enter, <cr> could be remapped by other vim plugin
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

        " Use `[g` and `]g` to navigate diagnostics
        " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
          else
            execute '!' . &keywordprg . " " . expand('<cword>')
          endif
        endfunction

        " Highlight the symbol and its references when holding the cursor.
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

        " Formatting selected code.
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder.
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Applying codeAction to the selected region.
        " Example: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap keys for applying codeAction to the current buffer.
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Apply AutoFix to problem on the current line.
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Map function and class text objects
        " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
        xmap if <Plug>(coc-funcobj-i)
        omap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap af <Plug>(coc-funcobj-a)
        xmap ic <Plug>(coc-classobj-i)
        omap ic <Plug>(coc-classobj-i)
        xmap ac <Plug>(coc-classobj-a)
        omap ac <Plug>(coc-classobj-a)

        " Remap <C-f> and <C-b> for scroll float windows/popups.
        if has('nvim-0.4.0') || has('patch-8.2.0750')
          nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
          vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        endif

        " Use CTRL-S for selections ranges.
        " Requires 'textDocument/selectionRange' support of language server.
        nmap <silent> <C-s> <Plug>(coc-range-select)
        xmap <silent> <C-s> <Plug>(coc-range-select)

        " Add `:Format` command to format current buffer.
        command! -nargs=0 Format :call CocAction('format')

        " Add `:Fold` command to fold current buffer.
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " Add `:OR` command for organize imports of the current buffer.
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Add (Neo)Vim's native statusline support.
        " NOTE: Please see `:h coc-status` for integrations with external plugins that
        " provide custom statusline: lightline.vim, vim-airline.
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

        " Mappings for CoCList
        " Show all diagnostics.
        nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions.
        nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
        " Show commands.
        nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document.
        nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols.
        nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list.
        nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

        command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


    "                                                                                                       RUBY & RAILS
      " Match ruby do/end
      runtime macros/matchit.vim

      "rspec commands
      :let mapleader = ","
      let g:rspec_command = "!bundle exec rspec {spec}"
      map <Leader>t :call RunCurrentSpecFile()<CR>
      map <Leader>s :call RunNearestSpec()<CR>
      map <Leader>l :call RunLastSpec()<CR>
      map <Leader>a :call RunAllSpecs()<CR>


      let mapleader="\\"
