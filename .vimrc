" This must be first, because it changes other options as a side effect.
set nocompatible " don't behave Vi-compatible


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark               " "dark" or "light", used for highlight colors
set cursorline                    " highlight the screen line of the cursor
set guifont=Source\ Code\ Pro\ 12 " Name(s) of font(s) to be used

"set list                     " show <Tab> and <EOL>
"set listchars=tab:>-,trail:- " characters for displaying in list mode

set number " print the line number in front of each line
set nowrap " long lines don't wrap and continue on the next line
set ruler  " show cursor line and column in the status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on    " syntax highlighting
  set hlsearch " highlight matches with last search pattern
endif

" right margin
highlight ColorColumn guibg=#2d2d2d ctermbg=237
set colorcolumn=81,121 " columns to highlight
highlight Right120 ctermbg=darkred ctermfg=white guibg=#592929
match Right120 /\%121v.\+/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread          " autom. read file when changed outside of Vim
set history=1000      " number of command-lines that are remembered
set foldmethod=indent " folding type


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    " use spaces when <Tab> is inserted
set shiftwidth=2 " number of spaces to use for (auto)indent step
set smarttab     " use 'shiftwidth' when inserting <Tab>
set tabstop=2    " number of spaces that <Tab> in file uses


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogenerated files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup   " don't keep backup file after overwriting a file
set noswapfile " don't use a swapfile for a buffer


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase " ignore case in search patterns
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
endif

" Vim Plug
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" Colors
if $TERM_PROGRAM == 'vscode'
  " Use matching color scheme for VS Code Integrated Terminal
  colorscheme codedark
elseif filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
syntax enable " enable syntax processing

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2  " Always show statusline
set t_Co=256      " Use 256 colours
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode    " Hide default mode text (e.g. -- INSERT -- below statusline)

" Powerline Escape Fix
" https://medium.com/usevim/powerline-escape-fix-e849fd07aad0
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
