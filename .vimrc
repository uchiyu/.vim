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
"
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
"
" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

 "------------------------------------------------------------
 " Features {{{1
 " Vi互換モードをオフ（Vimの拡張機能を有効）
 set nocompatible

  "filetypeの自動認識をオン(html, pyなど)
 filetype on

 "------------------------------------------------------------
 " Must have options {{{1
 "
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

 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline

 " 画面最下行にルーラーを表示する
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

" 行番号を表示
set number

 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=200

 " Use <F11> to toggle between 'paste' and 'nopaste'
 " <F11>キーで'paste'と'nopaste'を切り替える
 set pastetoggle=<F11>

 "------------------------------------------------------------
 " インデント関連のオプション {{{1
 " Indentation settings according to personal preference.

 " タブ文字の代わりにスペース2個を使う場合の設定。
 " この場合、'tabstop'はデフォルトの8から変えない。
 set shiftwidth=4
 set softtabstop=4
 set expandtab

 " インデントにハードタブを使う場合の設定。
 " タブ文字を2文字分の幅で表示する。
 set tabstop=4

 "------------------------------------------------------------
 " Mappings {{{1
 " マッピング
 " Useful mappings
 " Yの動作をDやCと同じにする
 map Y y$

 " Map <C-L> (redraw screen) to also turn off search highlighting until the
 " next search
 " <C-L>で検索などの強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
"自動でコメントアウト挿入をやめる
autocmd FileType * set formatoptions-=ro

"日本語入力でノーマルモードに戻った際英数に戻る
"<C-^>でIM制御が行える場合の設定
"let IM_CtrlMode = 4
"ctrl+jで日本語入力固定モードをOnOff
"inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

"============================================================
"ユーザー変更部 uchiyu
"============================================================
"-------------------------------------------------------------
"windowsのctrl+αの操作の追加
":source $VIMRUNTIME/mswin.vim

"------------------------------------------------------------
"insertからjjで抜ける
inoremap <silent> jj <ESC>

"OSのクリップボードを使用
set clipboard=unnamed

"コマンドや検索パターンを10000件まで保存
set history=10000

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

"-------------------------------------------------------------
"autocomplpop.vim 予測変換の常時表示
"snippetに同様の設定があり、競合するのでコメントアウト
"set completeopt=menuone
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
"endfor

"文字コード---------------------------------------------------
"文字コードの自動認識
"使用文字コードをutf-8に
:set encoding=utf-8
"ファイルの読み込みの設定 左から順に試行
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"改行コードの自動認識
"":set fileformats=unix,dos,mac

"------------------------------------------------------------
"スワップファイルを作成しない
set noswapfile

"------------------------------------------------------------
" サーバーでエラー
" XML、HTMLの閉じタグを挿入(C+_で実行) インストールしてmacrosに置く必要あり
":let g:closetag_html_style=1
"source $VIMRUNTIME/macros/closetag.vim

"------------------------------------------------------------
"vim 事態の設定で画面分割を右側に出す
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
" 挿入モードでのカーソル移動
" (LinuxだとBackspaceの機能を消してしまうかも?)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"inoremap <C-h> <Left> backspaceが効かなくなるので×
inoremap <C-l> <Right>

"------------------------------------------------------------
" カーソルキーをブロック（ノーマルモード）とライン（挿入モード）に
" mintty上でのみ動作するのでcygwinやmingwなど意外では無効かも？
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"-----------------------------------------------------------
" 行末の空白文字を可視化
set list
set listchars=eol:$,tab:>-,trail:_,extends:<

display=laststatus

"set showmatch
"set matchtime=1

"プラグイン---------------------------------------------------
"Nuobundleの設定
"---------------------------
"start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

""Nuobundleのプラグイン
"---------------------------
"start Neobundle Settings.
"---------------------------
" 追加のプラグイン
"
" neobundle自体をneobundleで管理
NeoBundleFetch  'Shougo/neobundle.vim'
"自動でかっこを閉じる
NeoBundle 'Townk/vim-autoclose'

"カラースキーマの設定
" NeoBundle 'altercation/vim-colors-solarized'
" set background=light    "または light
NeoBundle 'MaxMellon/molokai'

"コードを実行------------------------------------------------------
"インストール後にmakeが必要
":QuickRun ファイルタイプで実行 開いた実行結果は:onlyで閉じると楽
":QuickRun <= ?で標準入力も可能 空白には対応してない
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': 'vertical'}}

"シンタックスチェック----------------------------------------------
"execute pathogen#infect()
NeoBundle "scrooloose/syntastic"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"snippetは入力補完 complcacheは入力補完機能の強化 のようなもの
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets'

"surround.vim タグなどの編集
NeoBundle 'taichouchou2/surround.vim'

"open-browser.vim URLを開いたりググれる----------------------------
NeoBundle 'open-browser.vim'
" カーソル下のURLをブラウザで開く (Leaderはバックスラッシュ)
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"webapi vimからhttpのpostやgetが可能-------------------------------
NeoBundle 'mattn/webapi-vim'

"htmlのシンタックスファイル----------------------------------------
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
" HTML 5 tags
syntax keyword htmlTagName contained article aside audio bb canvas command
syntax keyword htmlTagName contained datalist details dialog embed figure
syntax keyword htmlTagName contained header hgroup keygen mark meter nav output
syntax keyword htmlTagName contained progress time ruby rt rp section time
syntax keyword htmlTagName contained source figcaption
syntax keyword htmlArg contained autofocus autocomplete placeholder min max
syntax keyword htmlArg contained contenteditable contextmenu draggable hidden
syntax keyword htmlArg contained itemprop list sandbox subject spellcheck
syntax keyword htmlArg contained novalidate seamless pattern formtarget
syntax keyword htmlArg contained formaction formenctype formmethod
syntax keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syntax keyword htmlArg contained hi"den role
syntax match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syntax match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

"JSのシンタックスファイル
NeoBundle 'pangloss/vim-avascript'
NeoBundle 'mattn/jscomplete-vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"

"jsの補完強化
NeoBundle 'marijnh/tern_for_vim'

"ノードの整形
NeoBundle 'moll/vim-node'

"coffee-scriptのシンタックスファイル
NeoBundle 'kchmck/vim-coffee-script'

"emmet.vim htmlやcss記述の効率化-----------------------------------
NeoBundle 'mattn/emmet-vim'
"emmetを日本語設定に
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

"vimproc.vim 非同期処理の実現
NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak' } }
"unite.vim ディレクトリやファイルの作成、バッファの表示など
NeoBundle 'Shougo/unite.vim'
"vimfiler ファイル操作が可能に
NeoBundle 'Shougo/vimfiler'
"スカウター ":scouter ファイル名 で実行
NeoBundle 'thinca/vim-scouter'

call neobundle#end()
" Requireid:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
" Neobundleのインストールでエラーに
"NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"----------------------------------------------------------
"---------------------------
" プラグインの設定
"---------------------------
"---------------------------------
"シンタックスチェック

if ! empty(neobundle#get("syntastic"))
  " Disable automatic check at file open/close
  let g:syntastic_check_on_open=0
  let g:syntastic_check_on_wq=0
  let g:syntastic_c_check_header = 1
  " C++
  let g:syntastic_cpp_check_header = 1
  " Java
  let g:syntastic_java_javac_config_file_enabled = 1
  let g:syntastic_java_javac_config_file = "$HOME/.syntastic_javac_config"
endif

"---------------------------------------------------------
"スニペット-----------------------------------------------
" 自分用 snippet ファイルの場所
let g:neosnippet#snippets_directory = '~/.vim/snippets/'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

"各言語ごとの設定の追加---------------------------------
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" neosnippet-------------------------------------------
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

"------------------------------------------------------
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

"Neobundleを呼び出すとsyntax offになるのでsyntax onは最後に
syntax on

