VIM CONFIGURATION

This is my configuration file for vim. This has only been tested on Ubuntu.

Install Commands (assumes you are linux system):
    cd ~

    git clone https://github.com/bjurgess1/vim-configuration.git
    
    ln -s ~/vim-configuration/vim ~/.vim

    ln -s ~/vim-configuration/vimrc ~/.vimrc
    
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    vim +PluginInstall +qall


This assumes you cloned the repository to vim-configuration within your
home directory.
