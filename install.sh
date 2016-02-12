# vim setting
cd ~/
ln -s -f ~/.vim/.vimrc ~/

dir=~/.vim

if [ -e $dir ]; then
  git pull origin master
else
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
# :NeobundleInstall
