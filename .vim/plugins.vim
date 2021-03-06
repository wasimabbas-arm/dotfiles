if &compatible
  set nocompatible
end

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

" language packs
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings

" Ale
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '⚠️'

" CtrlP
" from https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --color=never

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

" Emmet
" enable all function in all mode
let g:user_emmet_mode = 'a'
let g:user_emmet_leader_key = '<Tab>'
" fix Emmet in JSX
let g:user_emmet_settings = {
\ 'javascript.jsx': {
\   'extends': 'jsx',
\ },
\}

" GitGutter
let g:gitgutter_realtime = 250

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_leadingSpaceEnabled = 1

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" JSON
let g:vim_json_syntax_conceal = 0
