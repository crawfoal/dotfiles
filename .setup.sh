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

if ! [ -x "$(command -v ag)" ]; then
  echo "Now installing silver searcher..."
  brew install the_silver_searcher
else
  echo "silver searcher found!"
fi

if ! [ -x "$(command -v asdf)" ]; then
  echo "Now installing asdf..."
  brew install asdf
else
  echo "asdf found!"
fi

if ! asdf plugin list | grep python > /dev/null ; then
  asdf plugin add python

  # install latest python (do this before installing vim w/ brew so that you get
  # vim w/ python3 compatibility)
  system_python = python -V | grep -E -o '[0-9\.]*$'
  latest_python = asdf list all python | grep -E -x '[0-9\.]*' | tail -1
  asdf install python $(latest_python)
  asdf reshim python $(latest_python)
  asdf install python $(system_python)
  asdf reshim python $(system_python)
  asdf global python $(latest_python) $(system_python)
  source .zshrc
else
  echo "python plugin found! (assuming that python >= 3 is also installed)"
fi

if vim --version | grep '\-python3' > /dev/null ; then
  echo "Now installing vim with python3 via brew.."
  # since brew 1.6.0, vim automatically comes with python3 support
  brew install vim
  brew link vim
else
 echo "vim with python3 support found!"
fi

if [ -f ~/.vim/bundle/Vundle.vim ]; then
  echo "Now installing Vundle (for vim)..."
  echo "Warning: It is assumed that your .vimrc already has config for Vundle."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
else
  echo "Vundle (for vim) found!"
fi

# the version of git that you get from homebrew supports more detailed diffs
if find -L /usr -name diff-highlight -type f | grep diff-highlight > /dev/null ; then
  echo "Now installing git with brew..."
  brew install git
  source ~/.zshrc
else
  echo "git from brew found!"
fi

if ! [ -x "$(command -v tmux)" ]; then
  echo "Now installing tmux..."
  brew install tmux
else
  echo "tmux found!"
fi

if ! [ -x "$(command -v tmate)" ]; then
  echo "Now installing tmate..."
  brew install tmate
else
  echo "tmate found!"
fi

if ! [ -x "$(command -v hub)" ]; then
  echo "Now installing hub..."
  brew install hub
else
  echo "hub found!"
fi

if ! [ -d ~/usr/local/Caskroom/alfred ]; then
  echo "Now installing alfred..."
  brew cask install alfred
else
  echo "alfred found!"
fi

# Heroku specific

# I'd prefer to use something like asdf-postgres, but I've had some issues with
# it in the past, and it would also require the rest of my team to use it (at
# least work around having it in the .tool-versions file for each project).
if ! [ -x "$(command -v psql)" ]; then
  echo "Now installing postgresql..."
  brew install postgresql
  brew services start postgresql
else
  echo "postgresql found!"
fi

if ! [ -x "$(command -v heroku)" ]; then
  echo "Now installing heroku cli..."
  brew tap heroku/brew && brew install heroku
  heroku autocomplete --refresh-cache
else
  echo "heroku cli found!"
fi
