set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

"ファイラー
Bundle 'Shougo/unite.vim'
"補完系
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
"別プロセスのyank
Bundle 'vim-scripts/yanktmp.vim'
"ruby
Bundle 'vim-ruby/vim-ruby'
"rails
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'

filetype plugin indent on

"------ necomplcache ---------------

"起動時に有効
let g:neocomplcache_enable_at_startup = 1
"AutoComplPopの無効.
let g:acp_enableAtStartup = 0
"大文字小文字の区別
let g:NeoComplCache_SmartCase = 1
"キャメルケース補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
"TABで選択
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-k> にマッピング
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"------ unite ----------------------

"入力モードで開始する
let g:unite_enable_start_insert=1
"バッファ一覧
noremap <C-P> :Unite buffer<CR>
"ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
"最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"------ vim ------------------------
" <C-n>でのシンタックスチェック
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>

set expandtab
set tabstop<
set softtabstop=2
set shiftwidth=2
set backspace=2

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
