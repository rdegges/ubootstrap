#!/bin/bash
#
# ubootstrap - A simple Ubuntu desktop bootstrap script.
#
# Installs all my preferred base packages so I don't need to do this manually
# each time I format my boxes.


# Update system packages with apt-get.
sudo apt-get -y update
sudo apt-get -y safe-upgrade

# Install aptitude (a better package manager).
sudo apt-get -y install aptitude

# Force updates once more.
sudo aptitude -y update
sudo aptitude -y safe-upgrade

# Install Vim.
sudo aptitude -y install vim

# Install VLC.
sudo aptitude -y install vlc

# Install pwgen.
sudo aptitude -y install pwgen

# Install cURL.
sudo aptitude -y install curl

# Install tmux.
sudo aptitude -y install tmux

# Install zsh.
sudo aptitude -y install zsh

# Install oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# Install development stuff (Python).
sudo aptitude -y install python-dev python-pip build-essential python-gpgme

# Install libraries for PostgreSQL (for ORM usage).
sudo aptitude -y install libpq-dev

# Install libraries for asynchronous IO.
sudo aptitude -y install libevent-dev

# Install virtualenvwrapper to make using virtualenv easier.
sudo pip install -U virtualenvwrapper

# Install autoenv to make handling local .env files easier.
sudo pip install -U autoenv

# Update pip.
sudo pip install -U pip

# Install the Heroku toolbelt.
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install heroku-accounts.
heroku plugins:install git://github.com/ddollar/heroku-accounts.git

# Install RVM (so I can use gems).
curl -L https://get.rvm.io | bash -s stable --ruby

## Install my dotfiles.
#git clone git@github.com:rdegges/dotfiles.git ~/.dotfiles
#cd ~/.dotfiles && git submodule init
#cd ~/.dotfiles && git submodule update
#rm -f ~/.gitconfig
#ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
#rm -rf ~/.pip
#ln -s ~/.dotfiles/pip ~/.pip
#rm -f ~/.tmux.conf
#ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
#rm -rf ~/.vim
#ln -s ~/.dotfiles/vim ~/.vim
#rm -f ~/.vimrc
#ln -s ~/.dotfiles/vimrc ~/.vimrc
#rm -f ~/.vim.scripts
#ln -s ~/.dotfiles/vim.scripts ~/.vim.scripts
#rm -f ~/.zshrc
#ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
#rm -f ~/.dircolors
#ln -s ~/.dotfiles/dircolors ~/.dircolors
#
## Install all Vim modules.
#vim +BundleInstall +qall

# Install VirtualBox.
wget http://download.virtualbox.org/virtualbox/4.2.16/virtualbox-4.2_4.2.16-86992~Ubuntu~raring_amd64.deb
sudo dpkg -i virtualbox-4.2_4.2.16-86992~Ubuntu~raring_amd64.deb
rm virtualbox-4.2_4.2.16-86992~Ubuntu~raring_amd64.deb

# Install Dropbox.
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb
sudo dpkg -i dropbox_1.6.0_amd64.deb
rm dropbox_1.6.0_amd64.deb

# Install Chrome.
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Generate an SSH key.
ssh-keygen -t rsa

# User notes.
echo "Now you'll want to install your dotfiles!"
echo "Oh. And don't forget to reboot before you do anything else so ZSH works."
