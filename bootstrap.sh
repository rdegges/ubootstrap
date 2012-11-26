#!/bin/bash
#
# ubootstrap - A simple Ubuntu desktop bootstrap script.
#
# Installs all my preferred base packages so I don't need to do this manually
# each time I format my boxes.


# Update system packages with apt-get.
sudo apt-get -y update
sudo apt-get -y safe-upgrade

# Install aptitude (a better package manager), and force updates once more.
sudo apt-get -y install aptitude
sudo aptitude -y update
sudo aptitude -y safe-upgrade

# Install Vim.
sudo aptitude -y install vim

# Install cURL.
sudo aptitude -y intall curl

# Install tmux.
sudo aptitude -y install tmux

# Install zsh.
sudo aptitude -y install zsh

# Install development stuff (Python).
sudo aptitude -y install python-dev python-pip build-essential
sudo pip install -U virtualenvwrapper
sudo pip install git+git://github.com/kevinw/pyflakes.git
sudo pip install -U pip

# Install RVM (so I can use gems).
curl -L https://get.rvm.io | bash -s stable --ruby

# Install my dotfiles.
git clone git@github.com:rdegges/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git submodule init
cd ~/.dotfiles && git submodule update
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/pip ~/.pip
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim.scripts ~/.vim.scripts
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# Install all Vim modules.
vim +BundleInstall +qall
