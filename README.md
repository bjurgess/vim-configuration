VIM CONFIGURATION

This is my configuration file for vim. This has only been tested on Ubuntu.

Install Commands:
    cd ~
    
    mkdir .vim
    
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    cp .vimconfig/vimrc ~/.vimrc
    
    vim +PluginInstall +qall
