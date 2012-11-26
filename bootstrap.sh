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

# Install oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# Install development stuff (Python).
sudo aptitude -y install python-dev python-pip build-essential
sudo pip install -U virtualenvwrapper
sudo pip install git+git://github.com/kevinw/pyflakes.git
sudo pip install -U pip

# Generate an SSH key.
ssh-keygen -t rsa

# Install the Heroku toolbelt.
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install heroku-accounts.
heroku plugins:install git://github.com/ddollar/heroku-accounts.git

# Install RVM (so I can use gems).
curl -L https://get.rvm.io | bash -s stable --ruby

# Install my dotfiles.
git clone git@github.com:rdegges/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git submodule init
cd ~/.dotfiles && git submodule update
rm -f ~/.gitconfig
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
rm -rf ~/.pip
ln -s ~/.dotfiles/pip ~/.pip
rm -f ~/.tmux.conf
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.vim
ln -s ~/.dotfiles/vim ~/.vim
rm -f ~/.vimrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
rm -f ~/.vim.scripts
ln -s ~/.dotfiles/vim.scripts ~/.vim.scripts
rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# Install all Vim modules.
vim +BundleInstall +qall
