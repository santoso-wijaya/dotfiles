# dotfiles

## Vim

### Pre-requisites

1.  Set up [Pathogen](https://github.com/tpope/vim-pathogen) for easier
    management of Vim plugins:

    ```sh
    $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
          curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    ```

### `.vimrc` file

Included in this repo. Copy as `${HOME}/.vimrc` dotfile.

### Install plugin bundles

The vim plugins that I use are included as git submodules here:
*   [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
*   [vim-css-color](https://github.com/ap/vim-css-color)
*   [vim-sensible](https://github.com/tpope/vim-sensible)

They are cloned in this git repo under `./.vim/bundle/` directory. Copy the
contents therein into the current workspace's `${HOME}/.vim/bundle/` directory.

```sh
$ mkdir -p ${HOME}/.vim/bundle && \
    cp -R .vim/bundle/* ${HOME}/.vim/bundle/
```

