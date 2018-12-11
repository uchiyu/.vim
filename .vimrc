"---------------------------------------------------------------------------
" フォント設定:
if has('win32')
  " Windows用
  set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka−等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 注釈:
" 印刷はGUIでなくてもできるのでvimrcで設定したほうが良いかもしれない。この辺
" りはWindowsではかなり曖昧。一般的に印刷には明朝、と言われることがあるらし
" いのでデフォルトフォントは明朝にしておく。ゴシックを使いたい場合はコメント
" アウトしてあるprintfontを参考に。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"   :help printing

" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
  endif
endif

"------------------------------------------------------------

 "filetypeの自動認識をオン(html, pyなど)
filetype on

"------------------------------------------------------------
" Must have options
" 強く推奨するオプション
" バッファを保存しなくても他のバッファを表示できるようにする
set hidden
" コマンドライン補完を便利に
set wildmenu
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

"------------------------------------------------------------
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent
set smartindent

" 現在の行の強調表示
set cursorline

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する(右下の行数とか)
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" "press <Enter> to continue"
" コマンドラインの高さを2行に
set cmdheight=2

" 行番号の表示と相対表示
" 番号＋j(or)kでジャンプ
set number
set relativenumber

" 画面に余裕を持たせてスクロール
set scrolloff=5

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

"------------------------------------------------------------
" インデント関連のオプション
" Indentation settings according to personal preference.

" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
set expandtab

" インデントにハードタブを使う場合の設定。
" タブ文字を2文字分の幅で表示する。
set tabstop=4

"------------------------------------------------------------
" Mappings マッピング
" Useful mappings
" Yの動作をDやCと同じにする
map Y y$

"============================================================
"ユーザー変更部 uchiyu
"============================================================
"-------------------------------------------------------------
" <leader>をspaceに
let mapleader = "\<Space>"

"------------------------------------------------------------
"insertからjjで抜ける
inoremap <silent> jj <ESC>

"ctrl-enter で一行改行を入れてesc
nnoremap <C-j> o<ESC>

"OSのクリップボードを使用
set clipboard=unnamed

"コマンドや検索パターンを100件まで保存
set history=100

"ESCを2回でハイライトを消す
"nmap <silent> <Esc><Esc> :nohlsearch<CR>

"------------------------------------------------------------
" ファイルを開いた時に、以前のカーソル位置を復元する
function! s:RestoreCursorPostion()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup vimrc_restore_cursor_position
  autocmd!
  autocmd BufWinEnter * call s:RestoreCursorPostion()
  autocmd InsertLeave * set nopaste
augroup END

"文字コード---------------------------------------------------
"文字コードの自動認識
"使用文字コードをutf-8に
set encoding=utf-8
"ファイルの読み込みの設定 左から順に試行
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

"改行コードの自動認識
set fileformats=unix,dos,mac

"------------------------------------------------------------
"スワップファイルを作成しない
set noswapfile

"------------------------------------------------------------
"vim 自体の設定で画面分割を右側に出す
set splitright

"------------------------------------------------------------
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"------------------------------------------------------------
"括弧のクォートの自動補完(開き括弧で文字を打つと自動で括弧閉じが入る)
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"------------------------------------------------------------
"閉じ括弧が入力されたら、カーソルを括弧内に
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `' `'<Left>

"------------------------------------------------------------
"minttyの設定
"insert時にカーソルをブロックから変化
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"-------------------------------------------------------------
" 行末の空白文字を可視化
set list
set listchars=eol:$,tab:>-,trail:_,extends:<

" 対応する括弧やフレーズの表示
set showmatch
set matchtime=1

" スクロールが重くなる対策
" スクリプト実行中に画面を描画しない
set lazyredraw
" 高速ターミナル接続
set ttyfast

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のための map も設定しておく
nnoremap gj j
nnoremap gk k

" git grep をcommand lineで実行
command! -nargs=? Grep silent grep! <f-args> | redraw!
cabbrev grep Grep
set grepprg=git\ grep\ -I\ --line-number
augroup QUICKFIX
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

" 言語毎の設定------------------------------------------------
" ファイルタイプを認識して、インデントを変更
" coffee
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" python
au BufRead,BufNewFile,BufReadPre *.python   set filetype=python
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et

" html
au BufRead,BufNewFile,BufReadPre *.html set filetype=html
autocmd FileType html     setlocal sw=4 sts=4 ts=4 et

" sass
au BufRead,BufNewFile *.scss set filetype=sass
autocmd FileType sass     setlocal sw=4 sts=4 ts=4 et

" slim
autocmd BufRead,BufNewFile *.slim setfiletype slim

"プラグイン---------------------------------------------------
"---------------------------
"start vim-plug.
"---------------------------

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

"-------------------------
" Start Plug Settings.
"-------------------------

" Required:
call plug#begin('~/.vim/plugged')

"---------------------------
" 追加のプラグイン
"---------------------------
" helpの日本語化と遅延ロード
Plug 'vim-jp/vimdoc-ja' , {
      \  'autoload' : { 'commands' : [ 'help' ] },
      \}
" vimdoc-ja 普段はコメントアウト
set helplang=ja,en

" indentLine
Plug  'Yggdroot/indentLine'
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'

" 自動でかっこを閉じる
Plug 'Townk/vim-autoclose'

"コードを実行------------------------------------------------------
"インストール後にmakeが必要
":QuickRun ファイルタイプで実行 開いた実行結果は:onlyで閉じると楽
":QuickRun <= ?で標準入力も可能 空白には対応してない
""NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': 'vertical'}}

"シンタックスチェック syntastic------------------------------------
Plug 'vim-syntastic/syntastic'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0

" rubocopを使用
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"htmlのシンタックスファイル
Plug 'hail2u/vim-css3-syntax'
"Plug 'taichouchou2/html5.vim'
"JSのシンタックスファイル
Plug 'mattn/jscomplete-vim'
"coffee-scriptのシンタックスファイル
Plug 'kchmck/vim-coffee-script'
"es6のシンタックスファイル
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty'
"jsxのシンタックス
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

"jsの補完強化
Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }

"JSONのシンタックス
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" GOのサポート
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" optional
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
"slimのシンタックスファイル
Plug 'slim-template/vim-slim'
"スニペット snippet------------------------------------------------
"snippetは入力補完 complcacheは入力補完機能の強化 のようなもの
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 自分用 snippet ファイルの場所
let g:neosnippet#snippets_directory = '~/.vim/snippets/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"surround.vim 括弧などの編集---------------------------------------
Plug 'tpope/vim-surround'

"open-browser.vim URLを開いたりググれる----------------------------
Plug 'tyru/open-browser.vim'
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"webapi vimからhttpのpostやgetが可能-------------------------------
Plug 'mattn/webapi-vim'

"ノードの整形
Plug 'moll/vim-node'

" ドキュメント参照 shift+kでリファレンス
Plug 'thinca/vim-ref'
Plug 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
Plug 'szw/vim-tags'

" 自動でendなどを閉じる
Plug 'tpope/vim-endwise'

"emmet.vim htmlやcss記述の効率化-----------------------------------
Plug 'mattn/emmet-vim'
"emmetを日本語設定に
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

"------------------------------------------------------------------
"unite.vim ディレクトリやファイルの作成、バッファの表示など
Plug 'Shougo/unite.vim'

Plug 'basyura/unite-rails'
" 最近使用したファイルの表示
Plug 'Shougo/neomru.vim'
nnoremap <leader>m :<C-u>Unite file_mru<CR>

"-----------------------------------------------------------------
"vimfiler ファイル操作が可能に
Plug 'Shougo/vimfiler'
" セーフティーモードの解除
let g:vimfiler_safe_mode_by_default = 0
"ffでVimfilerでIDE風にファイルを表示
nnoremap ss :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>

"スカウター ":scouter ファイル名 で実行
Plug 'thinca/vim-scouter'

" カラースキーマの設定---------------------------------------------------
Plug 'MaxMellon/molokai'

" yankringの弊害が少ないver
Plug 'LeafCage/yankround.vim'
Plug 'kien/ctrlp.vim'
"ctrlpをc-fで起動する
" ctrl + j k で検索結果を移動
let g:ctrlp_map = '<C-f>'
" C-p, C-n で貼り付けたテキストの前後の履歴
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" コマンドラインの拡張
Plug 'itchyny/lightline.vim'
" コマンドラインにbranchを表示
Plug 'tpope/vim-fugitive'

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ }
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
set noshowmode

" 検索結果の順番を表示
Plug 'osyo-manga/vim-anzu'
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" ESC×2で検索のハイライトを消す. 最後にCRで改行
nmap <silent> <Esc><Esc> <Plug>(anzu-clear-search-status) :nohlsearch<CR>

set statusline=%{anzu#search_status()}

Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Initialize plugin system
call plug#end()

"-------------------------
" End Plug Settings.
"-------------------------

"Neobundleを呼び出すとsyntax offになるのでsyntax onは最後に
syntax on
"indentの設定 Clojure
filetype plugin indent on
filetype indent on

"色の設定(syntax onのあとに) molokai
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

"------------------------------------------------------------
"自動でコメントアウト挿入をやめる
autocmd FileType * set formatoptions-=ro

