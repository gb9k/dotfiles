#!/bin/bash

wget https://bootstrap.pypa.io/get-pip.py
wget https://raw.githubusercontent.com/gb9k/dotfiles/master/.vimrc-simple
mv .vimrc-simple .vimrc
python get-pip.py
pip install flake8
mkdir -p ~/.fonts &&\
git clone https://github.com/powerline/fonts.git ~/.fonts
fc-cache -vf ~/.fonts
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone git://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
cd ~/.vim/bundle && \
git clone https://github.com/mattn/emmet-vim.git
git clone git://github.com/tpope/vim-surround.git
cd ../..
rm get-pip.py
bash -c "$(curl -fsSL https://git.io/vuMdM)"
