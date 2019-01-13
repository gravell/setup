#!/bin/bash

#It assumes that you have git, tmux and vim installed
echo Creating symbolic links...
SCRIPT_FULL_PATH=$(realpath $0)
SCRIPT_DIR_PATH=$(dirname $SCRIPT_FULL_PATH)
ln -s $SCRIPT_DIR_PATH/.vimrc ~/.vimrc
ln -s $SCRIPT_DIR_PATH/.tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR_PATH/.bashrc ~/.bashrc
echo Cloning Vundle...
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo Installing vim plugins...
vim +PluginInstall +qall
echo Setting colour scheme...
echo Done!
