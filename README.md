# dotfiles

## Vim

### Pre-requisites

1  Set up [vim-plug](https://github.com/junegunn/vim-plug), a plugin manager.

   ```sh
   $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

### `.vimrc` file

Included in this repo. Copy as `${HOME}/.vimrc` dotfile.

### Install plugin bundles

The vim plugins that I use are included as git submodules.

They are cloned in this git repo under [`.vim/bundle/`](.vim/bundle) directory.
Copy the contents therein into the current workspace's `${HOME}/.vim/bundle/`
directory.

```sh
$ mkdir -p ${HOME}/.vim/bundle && \
    cp -R .vim/bundle/* ${HOME}/.vim/bundle/
```

### Clone and link

Alternatively, simply clone this repo and its submodules, and then make
softlinks to `.vimrc` and the plugin directories under `.vim/bundle/`.

```sh
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
      curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
$ git clone --recurse-submodules https://github.com/santoso-wijaya/dotfiles.git
$ cd dotfiles
$ ln -s .vimrc ${HOME}/.vimrc
$ find $(pwd -P)/.vim/bundle -maxdepth 1 -type d -execdir \
      ln -s $(pwd -P)/.vim/bundle/{} ${HOME}/.vim/bundle/{} \;
```

### Install additional plugins

I'm also using [vim-plug](https://github.com/junegunn/vim-plug) as a plugin
manager. To install all the `Plug ...` plugins specified in the vimrc file from
the command line, execute:

```sh
vim +'PlugInstall --sync' +qa
```

For NeoVim:

```sh
nvim --headless +PlugInstall +qa && \
nvim +UpdateRemotePlugins +qa
```

## Use in Codespaces / GitHub devcontainer

Since this `dotfiles` repo contains an installation script `install.sh`, the
dotfiles contained here will not be automatically copied over to a GitHub
codespace or devcontainer.

Instead, after `postCreateCommand`, the `install.sh` script will be executed
automatically. I've structured it so that it will clone the dotfiles here and
make the appropriate symlinks.
