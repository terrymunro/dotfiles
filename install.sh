#!/bin/bash
DOTFILES=$(pwd)

# Make sure everything is up-to-date
git pull && git submodule init && git submodule update

# Remove any current versions to be replaced with dotfiles versions
DIRS=(
  .vim
  .oh-my-zsh
  .xmonad
)
FILES=(
  .zprofile
  .zshrc
  .bashrc
  .vimrc
  .gitconfig
  .tmux.conf
)
for d in "$DIRS"; do
  unlink "$HOME/$d"
  rm -r "$HOME/$d"
done
for f in "$FILES"; do
  unlink "$HOME/$f"
  rm "$HOME/$f"
done

# Link dotfiles versions
ln -s $DOTFILES/config/zsh/zprofile     $HOME/.zprofile
ln -s $DOTFILES/config/zsh/zshrc        $HOME/.zshrc
ln -s $DOTFILES/config/nvim/init.vim    $HOME/.vimrc
ln -s $DOTFILES/config/nvim             $HOME/.vim
ln -s $DOTFILES/config/git/gitconfig    $HOME/.gitconfig
ln -s $DOTFILES/config/tmux/tmux.conf   $HOME/.tmux.conf
ln -s $DOTFILES/config/xmonad           $HOME/.xmonad
ln -s $DOTFILES/config                  $HOME/.config
ln -s $DOTFILES/oh-my-zsh               $HOME/.oh-my-zsh

# Make sure bundles are installed
vim +PlugInstall +qall

# Install powerline - Going to see what life is like without powerline then decide later if I want to add it back
#pip install --user git+git://github.com/powerline/powerline;
/bin/bash $DOTFILES/powerline-fonts/install.sh

# Done
echo "Install complete."

# Go home
cd ~
