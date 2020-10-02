#! /usr/bin/bash

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -s ~/vimconfig/config.vim ~/.vimrc
ln -s ~/vimconfig/pack ~/.vim/pack
ln -s ~/vimconfig/tmux.conf ~/.tmux.conf
ln -s ~/vimconfig/zshrc ~/.zshrc
