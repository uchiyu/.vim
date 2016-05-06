"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  set guifont=MS_Mincho:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
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
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

"------------------------------------------------------------
" Features
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

 "filetypeの自動認識をオン(html, pyなど)
filetype on

"------------------------------------------------------------
" Must have options {{{1
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

"------------------------------------------------------------
"自動でコメントアウト挿入をやめる
autocmd FileType * set formatoptions-=ro

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
nmap <silent> <Esc><Esc> :nohlsearch<CR>

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

" coffeeの設定------------------------------------
" coffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"プラグイン---------------------------------------------------
"---------------------------
"start Neobundle Settings.
"---------------------------

"---------------------------
"Nuobundleの設定
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch  'Shougo/neobundle.vim'

"vimproc.vim のインストールとmake
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }

NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'

"---------------------------
" 追加のプラグイン
"---------------------------
" helpの日本語化と遅延ロード
NeoBundle 'vim-jp/vimdoc-ja' , {
      \  'autoload' : { 'commands' : [ 'help' ] },
      \}
" vimdoc-ja 普段はコメントアウト
set helplang=ja,en

" indentLine
NeoBundle  'Yggdroot/indentLine'
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'

" 自動でかっこを閉じる
NeoBundle 'Townk/vim-autoclose'

"コードを実行------------------------------------------------------
"インストール後にmakeが必要
":QuickRun ファイルタイプで実行 開いた実行結果は:onlyで閉じると楽
":QuickRun <= ?で標準入力も可能 空白には対応してない
""NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': 'vertical'}}

"シンタックスチェック syntastic------------------------------------
NeoBundle "scrooloose/syntastic"
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
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"JSのシンタックスファイル
NeoBundle 'mattn/jscomplete-vim'
"coffee-scriptのシンタックスファイル
NeoBundle 'kchmck/vim-coffee-script'
"slimのシンタックスファイル
NeoBundle 'slim-template/vim-slim'

"スニペット snippet------------------------------------------------
"snippetは入力補完 complcacheは入力補完機能の強化 のようなもの
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets'

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

"jsの補完強化
NeoBundle 'marijnh/tern_for_vim'

" Ruby Rails関連----------------------------------------------------
NeoBundle 'supermomonga/neocomplete-rsense.vim'
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

"surround.vim 括弧などの編集---------------------------------------
NeoBundle 'tpope/vim-surround'

"open-browser.vim URLを開いたりググれる----------------------------
NeoBundle 'open-browser.vim'
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"webapi vimからhttpのpostやgetが可能-------------------------------
NeoBundle 'mattn/webapi-vim'

"ノードの整形
NeoBundle 'moll/vim-node'

" ドキュメント参照 shift+kでリファレンス
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動でendなどを閉じる
NeoBundle 'tpope/vim-endwise'

" gfの強化版
NeoBundle 'tpope/vim-rails'
autocmd User Rails AlterCommand r R
autocmd User Rails AlterCommand rc Rcontroller
autocmd User Rails AlterCommand rm Rmodel
autocmd User Rails AlterCommand rv Rview

"emmet.vim htmlやcss記述の効率化-----------------------------------
NeoBundle 'mattn/emmet-vim'
"emmetを日本語設定に
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

"------------------------------------------------------------------
"unite.vim ディレクトリやファイルの作成、バッファの表示など
NeoBundle 'Shougo/unite.vim'

NeoBundle 'basyura/unite-rails'
" 最近使用したファイルの表示
NeoBundle 'Shougo/neomru.vim'
nnoremap <leader>m :<C-u>Unite file_mru<CR>

"-----------------------------------------------------------------
"vimfiler ファイル操作が可能に
NeoBundle 'Shougo/vimfiler'
" セーフティーモードの解除
let g:vimfiler_safe_mode_by_default = 0
"ffでVimfilerでIDE風にファイルを表示
nnoremap ss :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>

"スカウター ":scouter ファイル名 で実行
NeoBundle 'thinca/vim-scouter'

" カラースキーマの設定---------------------------------------------------
NeoBundle 'MaxMellon/molokai'

" yankringの弊害が少ないver
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
" C-p, C-n で貼り付けたテキストの前後の履歴
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" Required
call neobundle#end()

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
" Neobundleのインストールでエラーに
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
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
