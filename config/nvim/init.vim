" vim: set foldmethod=marker foldlevel=0:
" =============================================================================
" Terry's Neovim Configuration
" =============================================================================
" {{{


" }}}
" =============================================================================
" Vim-Plug {{{
" =============================================================================

call plug#begin('~/.vim/plugged')

" Parked untli futher notice
" Browse GitHub events (user dashboard, user/repo activity)
"Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" A git commit browser
"Plug 'junegunn/gv.vim'
"Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-tbone'    " Tmux
"Plug 'tpope/vim-commentary',     { 'on': '<Plug>Commentary' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'rhysd/vim-grammarous'
"Plug 'beloglazov/vim-online-thesaurus'

Plug 'junegunn/vim-emoji'
" Improvements to searching
Plug 'junegunn/vim-slash'
Plug 'junegunn/rainbow_parentheses.vim'
" Defines text objects to target text after the designated characters
Plug 'junegunn/vim-after-object'
" Extends \" and @ in normal mode and <CTRL-R> in insert mode so you can see
" the contents of the registers.
Plug 'junegunn/vim-peekaboo'
" Improves . to work with plugin maps
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',       { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale',                  { 'on' : 'ALEEnable'  }
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree',           { 'on': 'UndotreeToggle' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim',        { 'do': 'make' }
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
Plug 'wesQ3/vim-windowswap'                           " ,ww
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'

" Org-mode
Plug 'jceb/vim-orgmode',          { 'for': 'org' }

" Powerline replacement
Plug 'itchyny/lightline.vim'

" EXPERIMENTAL
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-fnr'

" Colour schemes
Plug 'iCyMind/NeoSolarized'
Plug 'MaxSt/FlatColor'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'AlessandroYorba/Monrovia'
Plug 'joshdick/onedark.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'derekwyatt/vim-scala',      { 'for': 'scala'      }
Plug 'ensime/ensime-vim',         { 'for': 'scala'      }
Plug 'bitc/vim-hdevtools',        { 'for': 'haskell'    }
Plug 'eagletmt/ghcmod-vim',       { 'for': 'haskell'    }
Plug 'eagletmt/neco-ghc',         { 'for': 'haskell'    }
Plug 'idris-hackers/idris-vim',   { 'for': 'idris'      }
Plug 'pangloss/vim-javascript',   { 'for': 'javascript' }
Plug 'mxw/vim-jsx',               { 'for': 'javascript' }
Plug 'flowtype/vim-flow',         { 'for': 'javascript' }
Plug 'groenewege/vim-less',       { 'for': 'less'       }
Plug 'honza/dockerfile.vim',      { 'for': 'dockerfile' }

" Externals
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" }}}
" =============================================================================
" Settings {{{
" =============================================================================

" -----------------------------------------------------------------------------
"  General Config
" -----------------------------------------------------------------------------
set relativenumber                          " Relative line numbers
set number                                  " Line numbers
set backspace=indent,eol,start              " Allow backspace in insert mode
set showmode                                " Show current mode
set visualbell                              " Sounds are annoying
set autoread                                " Reload files changed outside vim
set magic                                   " Use 'magic' patterns (extended
                                            " regex

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
set hidden

" -----------------------------------------------------------------------------
"  Enable VIM crosshair muahahh -> WARNING: Can cause Vim to respond slowly <-
" -----------------------------------------------------------------------------
set cursorline
set cursorcolumn

" -----------------------------------------------------------------------------
"  Colour
" -----------------------------------------------------------------------------
colorscheme onedark

let lightline_theme = 'onedark'

" -----------------------------------------------------------------------------
"  Indentation
" -----------------------------------------------------------------------------
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and spaces visually
set list
"neovim defaults are probs better
"set listchars=tab:\|\ ,trail:·

" -----------------------------------------------------------------------------
"  Folds
" -----------------------------------------------------------------------------
set foldlevel=1
set foldmethod=indent                       " Fold based on indent
set foldnestmax=3                           " Deepest fold is 3 levels
set foldlevelstart=99

" -----------------------------------------------------------------------------
"  Completion
" -----------------------------------------------------------------------------
set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*~                 " Ignore when tab completing
set wildignore+=target/*
set wildignore+=node_modules/*

" -----------------------------------------------------------------------------
"  Scrolling
" -----------------------------------------------------------------------------
set scrolloff=8                             " Start scrolling when we're 8
set sidescrolloff=15
set sidescroll=1

" -----------------------------------------------------------------------------
"  Search
" -----------------------------------------------------------------------------
set ignorecase
set smartcase

" -----------------------------------------------------------------------------
"  Custom Settings
" -----------------------------------------------------------------------------
set lazyredraw
set laststatus=2
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set encoding=utf-8
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set clipboard=unnamed
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

silent! set cryptmethod=blowfish2

" Keep the cursor on the same column
set nostartofline

" ctags
set tags=./tags;/

" set complete=.,w,b,u,t
set complete-=i

" -----------------------------------------------------------------------------
" Plugin Settings
" -----------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:ensime_server_v2 = 1

let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
"let g:fzf_layout = { 'window': 'enew' }

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
let NERDTreeShowHidden=1

" ----------------------------------------------------------------------------
" Syntactic
" ----------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----------------------------------------------------------------------------
" w0rp/ale
" ----------------------------------------------------------------------------
let g:ale_linters = {
      \  'haskell': ['stack-ghc', 'hlint', 'hdevtools'],
      \  'scala': ['scalac']
      \}
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" ----------------------------------------------------------------------------
" Other
" ----------------------------------------------------------------------------

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

" }}}
" =============================================================================
" Mappings {{{
" =============================================================================

let mapleader       = ','
let maplocalleader  = ','
imap jj <Esc>

" ALE
nnoremap <Leader>l :ALEEnable<CR>

" Tags
nmap <F8> :TagbarToggle<CR>
nnoremap <C-]> g<C-]>
nnoremap g[ :pop<CR>

" Jump list (to newer position)
nnoremap <C-p> <C-i>

" <C-n> | NERD Tree
nnoremap <C-n>     :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFocus<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>ja
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Navigating to other windows easier
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Make Y behave like other capitals
nnoremap Y y$

" ----------------------------------------------------------------------------
" Terminal
" ----------------------------------------------------------------------------
" Navigating to other windows easier terminal edition
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" Exiting insert mode easier in terminal
tnoremap <ESC> <C-\><C-n>
" ?
tnoremap <A-a> <ESC>a
tnoremap <A-b> <ESC>b
tnoremap <A-f> <ESC>f

" ----------------------------------------------------------------------------
" Ensime
" ----------------------------------------------------------------------------
au FileType scala nnoremap <LocalLeader>t  :EnTypeCheck<CR>
au FileType scala nnoremap <LocalLeader>df :EnDeclaration<CR>
au FileType scala nnoremap <LocalLeader>ds :EnDeclarationSplit<CR>

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" ----------------------------------------------------------------------------
" Haskell
" ----------------------------------------------------------------------------
au FileType haskell nnoremap <buffer> <Leader>tw    :GhcModTypeInsert<CR>
au FileType haskell nnoremap <buffer> <Leader>ts    :GhcModSplitFunCase<CR>
au FileType haskell nnoremap <buffer> <Leader>tq    :GhcModType<CR>
au FileType haskell nnoremap <buffer> <Leader>te    :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <F1>          :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
nmap <Leader>ff :w! stack runhaskell %<CR>

" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
au FileType markdown nnoremap <buffer> <Leader>1 m`yypVr=``
au FileType markdown nnoremap <buffer> <Leader>2 m`yypVr-``
au FileType markdown nnoremap <buffer> <Leader>3 m`^i### <ESC>``4l
au FileType markdown nnoremap <buffer> <Leader>4 m`^i#### <ESC>``5l
au FileType markdown nnoremap <buffer> <Leader>5 m`^i##### <ESc>``6l

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <Leader>c :cclose<Bar>lclose<CR>

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
"nmap <Leader>g :Gstatus<CR>gg<C-n>
"nmap <Leader>d :Gdiff<CR>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab {{{
" ----------------------------------------------------------------------------
function! s:can_complete(func, prefix)
  if empty(a:func)
    return 0
  endif
  let start = call(a:func, [1, ''])
  if start < 0
    return 0
  endif

  let oline  = getline('.')
  let line   = oline[0:start-1] . oline[col('.')-1:]

  let opos   = getpos('.')
  let pos    = copy(opos)
  let pos[2] = start + 1

  call setline('.', line)
  call setpos('.', pos)
  let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
  call setline('.', oline)
  call setpos('.', opos)

  return !empty(type(result) == type([]) ? result : result.words)
endfunction

function! s:feedkeys(k)
  call feedkeys(a:k, 'n')
  return ''
endfunction

function! s:super_duper_tab(pumvisible, next)
  let [k, o] = a:next ? ["\<c-n>", "\<tab>"] : ["\<c-p>", "\<s-tab>"]
  if a:pumvisible
    return s:feedkeys(k)
  endif

  let line = getline('.')
  let col = col('.') - 2
  if line[col] !~ '\k\|[/~.]'
    return s:feedkeys(o)
  endif

  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if prefix =~ '^[~/.]'
    return s:feedkeys("\<c-x>\<c-f>")
  endif
  if s:can_complete(&omnifunc, prefix)
    return s:feedkeys("\<c-x>\<c-o>")
  endif
  if s:can_complete(&completefunc, prefix)
    return s:feedkeys("\<c-x>\<c-u>")
  endif
  return s:feedkeys(k)
endfunction

if has_key(g:plugs, 'ultisnips')
  " UltiSnips will be loaded only when tab is first pressed in insert mode
  if !exists(':UltiSnipsEdit')
    inoremap <silent> <Plug>(tab) <C-r>=plug#load('ultisnips')?UltiSnips#ExpandSnippet():''<CR>
    imap <Tab> <Plug>(tab)
  endif

  let g:SuperTabMappingForward  = "<tab>"
  let g:SuperTabMappingBackward = "<s-tab>"
  function! SuperTab(m)
    return s:super_duper_tab(a:m == 'n' ? "\<c-n>" : "\<c-p>",
                           \ a:m == 'n' ? "\<tab>" : "\<s-tab>")
  endfunction
else
  inoremap <silent> <Tab>   <C-r>=<SID>super_duper_tab(pumvisible(), 1)<CR>
  inoremap <silent> <S-Tab> <C-r>=<SID>super_duper_tab(pumvisible(), 0)<CR>
endif
" }}}
" ----------------------------------------------------------------------------

" }}}
" =============================================================================
" Plugin Specific Stuff {{{
" =============================================================================

" ----------------------------------------------------------------------------
" lightline | Status Bar
" ----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': lightline_theme,
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ],
      \   ],
      \   'right': [
      \     [ 'syntastic', 'ale', 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ],
      \ },
      \ 'component_function': {
      \   'modified'    : 'LightlineModified',
      \   'readonly'    : 'LightlineReadonly',
      \   'fugitive'    : 'LightlineFugitive',
      \   'filename'    : 'LightlineFilename',
      \   'fileformat'  : 'LightlineFileformat',
      \   'filetype'    : 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode'        : 'LightlineMode',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'ale'      : 'ALEGetStatusLine',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'ale'      : 'error',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let mark = '⭠ '  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" ----------------------------------------------------------------------------
" vim-after-object
" ----------------------------------------------------------------------------
silent! if has_key(g:plugs, 'vim-after-object')
  autocmd VimEnter * silent! call after_object#enable('=', ':', '#', ' ', '|')
endif

" ----------------------------------------------------------------------------
" vim-emoji :dog: :cat: :rabbit:!
" ----------------------------------------------------------------------------
function! s:replace_emojis() range
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let subs = substitute(line,
          \ ':\([^:]\+\):', '\=emoji#for(submatch(1), submatch(0))', 'g')
    if line != subs
      call setline(lnum, subs)
    endif
  endfor
endfunction
command! -range EmojiReplace <line1>,<line2>call s:replace_emojis()

" }}}
" ============================================================================
" AUTOCMD {{{
" ============================================================================

" Ensime stuff
autocmd BufWritePost *.scala silent :EnTypeCheck

augroup FiletypeGroup
  autocmd!

  au BufNewFile,BufRead               *.hs          set filetype=haskell
  au BufNewFile,BufRead               Dockerfile*   set filetype=dockerfile
augroup END

augroup vimrc
  " Fugitive
  au FileType gitcommit setlocal completefunc=emoji#complete
  au FileType gitcommit nnoremap <buffer> <silent> cd :<C-U>Gcommit --amend --date="$(date)"<CR>

  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

  " Unset paste on InsertLeave
  au InsertLeave * silent! set nopaste

  " Close preview window
  if exists('##CompleteDone')
    au CompleteDone * pclose
  else
    au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
  endif

  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END

" ----------------------------------------------------------------------------
" Help in new tabs
" ----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" }}}
" ============================================================================
" TEXT OBJECTS {{{
" ============================================================================
" ----------------------------------------------------------------------------
" Common
" ----------------------------------------------------------------------------
function! s:textobj_cancel()
  if v:operator == 'c'
    augroup textobj_undo_empty_change
      autocmd InsertLeave <buffer> execute 'normal! u'
            \| execute 'autocmd! textobj_undo_empty_change'
            \| execute 'augroup! textobj_undo_empty_change'
    augroup END
  endif
endfunction

noremap         <Plug>(TOC) <nop>
inoremap <expr> <Plug>(TOC) exists('#textobj_undo_empty_change')?"\<esc>":''

" ----------------------------------------------------------------------------
" ?ii / ?ai | indent-object
" ?io       | strictly-indent-object
" ----------------------------------------------------------------------------
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
  let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
  let x = line('$')
  let d = [a:b, a:e]

  if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
    let [b, e] = [a:b, a:e]
    while b > 0 && e <= line('$')
      let b -= 1
      let e += 1
      let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
      if i > 0
        break
      endif
    endwhile
  endif

  for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
    let [o, ev, df] = triple

    while eval(ev)
      let line = getline(d[o] + df)
      let idt = s:indent_len(line)

      if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
        let d[o] += df
      else | break | end
    endwhile
  endfor
  execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>

" ----------------------------------------------------------------------------
" <Leader>I/A | Prepend/Append to all adjacent lines with same indentation
" ----------------------------------------------------------------------------
nmap <silent> <leader>I ^vio<C-V>I
nmap <silent> <leader>A ^vio<C-V>$A

" ----------------------------------------------------------------------------
" ?i_ ?a_ ?i. ?a. ?i, ?a, ?i/
" ----------------------------------------------------------------------------
function! s:between_the_chars(incll, inclr, char, vis)
  let cursor = col('.')
  let line   = getline('.')
  let before = line[0 : cursor - 1]
  let after  = line[cursor : -1]
  let [b, e] = [cursor, cursor]

  try
    let i = stridx(join(reverse(split(before, '\zs')), ''), a:char)
    if i < 0 | throw 'exit' | end
    let b = len(before) - i + (a:incll ? 0 : 1)

    let i = stridx(after, a:char)
    if i < 0 | throw 'exit' | end
    let e = cursor + i + 1 - (a:inclr ? 0 : 1)

    execute printf("normal! 0%dlhv0%dlh", b, e)
  catch 'exit'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
  finally
    " Cleanup command history
    if histget(':', -1) =~ '<SNR>[0-9_]*between_the_chars('
      call histdel(':', -1)
    endif
    echo
  endtry
endfunction

for [s:c, s:l] in items({'_': 0, '.': 0, ',': 0, '/': 1, '-': 0})
  execute printf("xmap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 1)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("omap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 0)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("xmap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 1)<CR><Plug>(TOC)", s:c, s:l, s:c)
  execute printf("omap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 0)<CR><Plug>(TOC)", s:c, s:l, s:c)
endfor

" ----------------------------------------------------------------------------
" ?ie | entire object
" ----------------------------------------------------------------------------
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" ----------------------------------------------------------------------------
" ?il | inner line
" ----------------------------------------------------------------------------
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

" ----------------------------------------------------------------------------
" ?i# | inner comment
" ----------------------------------------------------------------------------
function! s:inner_comment(vis)
  if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
    return
  endif

  let origin = line('.')
  let lines = []
  for dir in [-1, 1]
    let line = origin
    let line += dir
    while line >= 1 && line <= line('$')
      execute 'normal!' line.'G^'
      if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
        break
      endif
      let line += dir
    endwhile
    let line -= dir
    call add(lines, line)
  endfor

  execute 'normal!' lines[0].'GV'.lines[1].'G'
endfunction
xmap <silent> i# :<C-U>call <SID>inner_comment(1)<CR><Plug>(TOC)
omap <silent> i# :<C-U>call <SID>inner_comment(0)<CR><Plug>(TOC)

" ----------------------------------------------------------------------------
" ?ic / ?iC | Blockwise column object
" ----------------------------------------------------------------------------
function! s:inner_blockwise_column(vmode, cmd)
  if a:vmode == "\<C-V>"
    let [pvb, pve] = [getpos("'<"), getpos("'>")]
    normal! `z
  endif

  execute "normal! \<C-V>".a:cmd."o\<C-C>"
  let [line, col] = [line('.'), col('.')]
  let [cb, ce]    = [col("'<"), col("'>")]
  let [mn, mx]    = [line, line]

  for dir in [1, -1]
    let l = line + dir
    while line('.') > 1 && line('.') < line('$')
      execute "normal! ".l."G".col."|"
      execute "normal! v".a:cmd."\<C-C>"
      if cb != col("'<") || ce != col("'>")
        break
      endif
      let [mn, mx] = [min([line('.'), mn]), max([line('.'), mx])]
      let l += dir
    endwhile
  endfor

  execute printf("normal! %dG%d|\<C-V>%s%dG", mn, col, a:cmd, mx)

  if a:vmode == "\<C-V>"
    normal! o
    if pvb[1] < line('.') | execute "normal! ".pvb[1]."G" | endif
    if pvb[2] < col('.')  | execute "normal! ".pvb[2]."|" | endif
    normal! o
    if pve[1] > line('.') | execute "normal! ".pve[1]."G" | endif
    if pve[2] > col('.')  | execute "normal! ".pve[2]."|" | endif
  endif
endfunction

xnoremap <silent> ic mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iw')<CR>
xnoremap <silent> iC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iW')<CR>
xnoremap <silent> ac mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aw')<CR>
xnoremap <silent> aC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aW')<CR>
onoremap <silent> ic :<C-U>call   <SID>inner_blockwise_column('',           'iw')<CR>
onoremap <silent> iC :<C-U>call   <SID>inner_blockwise_column('',           'iW')<CR>
onoremap <silent> ac :<C-U>call   <SID>inner_blockwise_column('',           'aw')<CR>
onoremap <silent> aC :<C-U>call   <SID>inner_blockwise_column('',           'aW')<CR>

" ----------------------------------------------------------------------------
" ?i<shift>-` | Inside ``` block
" ----------------------------------------------------------------------------
xnoremap <silent> i~ g_?^```<cr>jo/^```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a~ g_?^```<cr>o/^```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i~ :<C-U>execute "normal vi`"<cr>
onoremap <silent> a~ :<C-U>execute "normal va`"<cr>

" }}}
" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <Leader><Leader> :Files<CR>
"nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plugs_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source':  sort(keys(g:plugs)),
  \ 'sink':    function('s:plugs_sink')}))

" }}}
" ============================================================================
