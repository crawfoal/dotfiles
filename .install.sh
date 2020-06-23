#!/usr/bin/env bash
set -euo pipefail

read -p "Enter dotfiles directory [$(pwd)]: " dotfiles_path
dotfiles_path="${dotfiles_path:-$(pwd)}"

for file in * ; do
  echo "Creating symlink ~/.$file -> $dotfiles_path/$file ..."
  ln -s -i $dotfiles_path/$file ~/.$file || true
  echo "... done"
done

ln -s -i $dotfiles_path/.tat /usr/local/bin/tat || true
