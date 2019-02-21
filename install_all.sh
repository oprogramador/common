#!/bin/bash
set -e
cd `dirname $0`

toInstallFirst=(
  vim
  vim-gtk
  wine-stable
  git
  curl
  fish
)

toInstallNext=(
  audacity
  blender
  camorama
  cheese
  chromium-browser
  docker
  docker.io
  firefox
  flashplugin-installer
  g++
  gparted
  mongodb-clients
  mysql-client
  mysql-server
  #skype
  texlive-full
  traceroute
  #unetbootin
  virtualbox
  virtualbox-dkms
  xdotool
)

#sudo add-apt-repository multiverse
sudo apt-get update
for package in "${toInstallFirst[@]}"
do
  sudo apt-get install -y $package
done

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim || echo 'pathogen already installed'
git clone https://github.com/oprogramador/vim-ftp.git ~/.vim/bundle/vim-ftp || echo 'vim-ftp already installed'
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree || echo 'nerdtree already installed'
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter || echo 'nerdcommenter already installed'

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1 || echo 'git prompt already installed'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash | echo 'nvm already installed'

sudo cp cut256 /usr/bin
sudo cp spico /usr/bin
sudo cp spi.sh /usr/bin
sudo cp dir_backup.sh /usr/bin
cp .vimrc ~
cat .bashrc >> ~/.bashrc

for package in "${toInstallNext[@]}"
do
  sudo apt-get install -y $package
done
