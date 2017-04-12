"
" Terry's VIMRC
"
set nocompatible  " be iMproved, required
filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'					" Let Vundle manage Vundle

Plugin 'tpope/vim-sensible'         " Sensible defaults for vim
Plugin 'tpope/vim-unimpaired'       " Navigation shortcuts [x and ]x for moving back and forth for X
Plugin 'tpope/vim-surround'         " Surround text with a pair of anything (s in normal)
Plugin 'jiangmiao/auto-pairs'       " Insert/Delete brackets in pairs
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'         " Fast file opening
Plugin 'danro/rename.vim'
Plugin 'Shougo/neocomplete'         " Autocomplete
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'mpickering/hlint-refactor-vim'
Plugin 'ensime/ensime-vim'
Plugin 'KabbAmine/zeavim.vim'

" Syntax definitions
Plugin 'pangloss/vim-javascript'
Plugin 'hdima/python-syntax'
Plugin 'derekwyatt/vim-scala'

"""""" vim-scripts repos
Plugin 'vim-scripts/editorconfig-vim'  " Helps developers define and maintain consistent coding styles between different editors and IDEs
Plugin 'vim-scripts/BufOnly.vim'

" Required plugins available after
call vundle#end()

if has("autocmd")     " Enable file type detection
  filetype on
  filetype plugin indent on " required!
endif

syntax on             " Enables syntax highlighting
colorscheme mustang   " Current colour scheme
set expandtab
set shell=zsh
set encoding=utf-8
set autoindent
set smarttab
set smartindent
set showmode
set tw=80
set smartcase
set shiftround
set history=1000
set ff=unix
set hidden
set nowrap
set showmatch
set copyindent
set tabstop=2
set shiftwidth=2
set mouse=a
set number
set foldmethod=manual
set hlsearch
set incsearch
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set modeline
set textwidth=0
set wrapmargin=0
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set t_Co=256
set cmdheight=1

" I want new splits to appear to the right and to the bottom of the current
set splitbelow
set splitright

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let NERDTreeIgnore = ['\~$', '\.pyc$']
let NERDTreeMinimalUI = 1
let mapleader = ","
let g:mapleader = ","
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:ctrlp_custom_ignore = '\v[\/]dist$|node_modules\|DS_Store\|git\|*.pyc'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_length = 3
let g:UltiSnipsExpandTrigger="<S-TAB>"
let g:UltiSnipsJumpForardTrigger="<C-B>"
let g:UltiSnipsJumpBackwardTrigger="<C-Z>"
let g:UltiSnipEditSplit="vertical"
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:haskell_tabular = 1

" Custom Mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>
map <Leader>s :SyntasticToggleMode<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
nnoremap <F1> <Esc>

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>et g:haskellmode_completion_ghc = 1

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" Recommended key-mappings
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
nnoremap <localleader>t :EnTypeCheck<CR>

" Auto commands and omni completes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.scala silent :EnTypeCheck

if executable('python')   " Powerline stuffs
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup

  if has('unix')
    if (system('uname -s') =~ "linux")
      source ~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
    elseif (system('uname -s') =~ "darwin")
      source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
    endif
  endif
  set laststatus=2
  set noshowmode
endif

if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

  if has('unix')
    if (system('uname -s') =~ "darwin")
      let g:vimshell_editor_command = 'mvim'
    endif
  endif
else " no gui
  if has('unix')
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

if has('persistent_undo')
  " create the directory if it doesn't exist
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile              " Save undo's after file closes
  set undodir=~/.vim/undo/  " where to save undo histories
  set undolevels=100        " how many undos
  set undoreload=3000       " number of lines to save for undo
endif

if executable('/bin/zsh')
  set shell=/bin/zsh
endif
