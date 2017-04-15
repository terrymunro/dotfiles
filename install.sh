#!/bin/bash
DOTFILES=$(pwd)

# Make sure everything is up-to-date
echo "Updating git and submodules..."
git pull && git submodule init && git submodule update

# Remove any current versions to be replaced with dotfiles versions
DIRS=(
  '.vim'
  '.xmonad'
  '.oh-my-zsh'
)
FILES=(
  '.bashrc'
  '.profile'
  '.zprofile'
  '.zshrc'
  '.vimrc'
  '.gitconfig'
  '.tmux.conf'
)

echo "Cleaning existing files..."
for d in ${DIRS[@]}; do
  echo "Removing dir...   $d"
  unlink $HOME/$d
  rm -r $HOME/$d
done

for f in ${FILES[@]}; do
  echo "Removing file...  $f"
  unlink $HOME/$f
  rm $HOME/$f
done

# Link dotfiles versions
echo "Linking dotfile versions..."
mkdir -p $HOME/.config
ln -s $DOTFILES/config/zsh/zshenv       $HOME/.zshenv
ln -s $DOTFILES/config/zsh/zshrc        $HOME/.zshrc
ln -s $DOTFILES/config/nvim/init.vim    $HOME/.vimrc
ln -s $DOTFILES/config/nvim             $HOME/.vim
ln -s $DOTFILES/config/git/gitconfig    $HOME/.gitconfig
ln -s $DOTFILES/config/tmux/tmux.conf   $HOME/.tmux.conf
ln -s $DOTFILES/config/xmonad           $HOME/.xmonad
ln -s $DOTFILES/zsh/oh-my-zsh           $HOME/.oh-my-zsh

ln -s $DOTFILES/config/xmonad           $HOME/.config/xmonad
ln -s $DOTFILES/config/nvim             $HOME/.config/nvim

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
nvim +PlugInstall +qall

# Install powerline - Going to see what life is like without powerline then decide later if I want to add it back
#pip install --user git+git://github.com/powerline/powerline;

echo "Installing powerline fonts"
cd $DOTFILES/fonts/powerline-fonts
/bin/bash install.sh
echo "Installing nerd fonts"
cd $DOTFILES/fonts/nerd-fonts
/bin/bash install.sh

# Done
echo "Install complete."

# Go home
cd $DOTFILES

exit 0
