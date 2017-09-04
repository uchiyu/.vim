#Vim

cloneをneobundleとvimproc
vimprocはmakeの設定を.vimrcに書いてあるのでそのままでOK

```sh
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
```
vim plugを使っているのでインストール

```sh
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
vim上で `:PlugInstall` 
