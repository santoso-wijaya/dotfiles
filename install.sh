#!/bin/bash

apt-get update -qy && apt-get upgrade -qy
apt-get install -qy --no-install-recommends \
  curl \
  git \
  vim
apt-get clean -qy


git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.adog "log --all --decorate --oneline --graph"
git config --global alias.xl "log --graph --abbrev=commit --decorate --date=relative --all"


# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Fetch and place some plugins for pathogen to consume
pushd ~
git clone --recurse-submodules https://github.com/santoso-wijaya/dotfiles.git
cd dotfiles
find $(pwd -P)/.vim/bundle -maxdepth 1 -type d -execdir \
  ln -s $(pwd -P)/.vim/bundle/{} ${HOME}/.vim/bundle/{} \;
ln -s $(pwd -P)/.vimrc ${HOME}/.vimrc
popd


# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Activate plugins specified in .vimrc
# See: https://github.com/junegunn/vim-plug/issues/675#issuecomment-328157169
vim +'PlugInstall --sync' +qa


echo -e "dotfiles have been set up by:" > ~/dotfiles.txt
echo -e "https://github.com/santoso-wijaya/dotfiles/blob/main/install.sh" >> ~/dotfiles.txt

