#!/bin/bash

echo Starting script...
SCRIPT_FULL_PATH=$(realpath $0)
SCRIPT_DIR_PATH=$(dirname $SCRIPT_FULL_PATH)
echo $SCRIPT_FULL_PATH
echo $SCRIPT_DIR_PATH
ln -s $SCRIPT_DIR_PATH/.vimrc ~/.vimrc
ln -s $SCRIPT_DIR_PATH/.tmux.conf ~/.tmux.conf
echo Script finished!
