#!/bin/bash

apt-get update -q && apt-get upgrade
apt-get install -qy --no-install-recommends \
  build-essential \
  curl \
  wget \
  git \
  vim \
  ca-certificates \
  gnupg2 \
apt-get clean


mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


pushd ~
git clone --recurse-submodules https://github.com/santoso-wijaya/dotfiles.git
find $(pwd -P)/.vim/bundle -type d -depth 1  -execdir \
  ln -s $(pwd -P)/.vim/bundle/{} ${HOME}/.vim/bundle/{} \;

echo -e "dotfiles have been set up by:\n" > ~/dotfiles.txt
echo -e "https://github.com/santoso-wijaya/dotfiles/blob/main/install.sh" >> ~/dotfiles.txt

