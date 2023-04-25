#!/usr/bin/zsh

alias dotfiles="git --git-dir $HOME/.cfg --work-tree=$HOME"
cd $HOME/.cfg

dotfiles config --local status.showUntrackedFiles no
dotfiles checkout

