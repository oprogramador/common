#!/bin/bash
set -e
cd `dirname $0`

toInstallFirst=(
  vim
  vim-gtk
  #wine-stable
  git
  curl
  fish
)

toInstallNext=(
  audacity
  blender
  #camorama
  cheese
  chromium-browser
  docker
  docker.io
  firefox
  flashplugin-installer
  g++
  golang
  gparted
  htop
  mongodb-clients
  mysql-client
  mongodb-server-core
  mysql-server
  redis
  #skype
  texlive-full
  traceroute
  #unetbootin
  #virtualbox
  #virtualbox-dkms
  #xdotool
)

#sudo add-apt-repository multiverse
#sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
for package in "${toInstallFirst[@]}"
do
  printf "\n\n\n\n$package to be installed\n"
  sudo apt-get install -y $package
done

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim || echo 'pathogen already installed'
git clone https://github.com/oprogramador/vim-ftp.git ~/.vim/bundle/vim-ftp || echo 'vim-ftp already installed'
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree || echo 'nerdtree already installed'
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter || echo 'nerdcommenter already installed'
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter || echo 'vim-gitgutter already installed'

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1 || echo 'git prompt already installed'

#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash | echo 'nvm already installed'
#nvm i 16
#npm i -g yarn

cp _gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global credential.helper 'cache --timeout=57600'
sudo cp cut256 /usr/bin
sudo cp spico /usr/bin
sudo cp spi.sh /usr/bin
sudo cp dir_backup.sh /usr/bin
cat copy_backup.sh | sed "s/__ZIP_E_BACKUP_PASS__/$ZIP_E_BACKUP_PASS/g" > copy_backup_with_pass
sudo cp copy_backup_with_pass /usr/bin/copy_backup.sh
rm copy_backup_with_pass
cp .vimrc ~
cat .bashrc >> ~/.bashrc
git clone https://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt || echo 'git-aware-prompt already installed'
rm -rf ~/.config/fish
cp -r fish ~/.config/fish

sudo mkdir -p /data/db

for package in "${toInstallNext[@]}"
do
  printf "\n\n\n\n$package to be installed\n"
  sudo apt-get install -y $package
done
