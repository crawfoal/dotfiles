#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v brew)" ]; then
  echo "Now installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "brew found!"
fi

if ! [ -d ~/.oh-my-zsh ]; then
  echo "Now installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --noreplace-rc
else
  echo "oh-my-zsh found!"
fi

if ! [ -x "$(command -v asdf)" ]; then
  echo "Now installing asdf..."
  brew install asdf
else
  echo "asdf found!"
fi

# install latest python, set global
# remember to reshim
# may need to source .zshrc again (do it just to be safe)

if vim --version | grep '\-python3' ; then
  echo "Now installing vim with python3 via brew.."
  # since brew 1.6.0, vim automatically comes with python3 support
  brew install vim
  brew link vim
else
 echo "vim with python3 support found!"
fi

if ! [ -f ~/.vim/bundle/Vundle.vim ]; then
  echo "Now installing Vundle (for vim)..."
  echo "Warning: It is assumed that your .vimrc already has config for Vundle."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
else
  echo "Vundle (for vim) found!"
fi

# install tmux

# instal tmate

# install hub
