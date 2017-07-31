#!/usr/bin/env bash

sudo pacman -S stow --needed

cd ~/dotfiles

stow emacs
stow zsh
stow git
