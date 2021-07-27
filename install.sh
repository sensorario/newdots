# NERDTree
rm -rf ~/.vim/pack/vendor/start/nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q


# vim-airline
rm -rf ~/.vim/pack/vendor/start/vim-airline
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/vendor/start/vim-airline
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-airline/doc" -c q



cp vimrc ~/.vimrc
