# NERDTree
rm -rf ~/.vim/pack/vendor/start/nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q


# vim-airline
rm -rf ~/.vim/pack/vendor/start/vim-airline
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/vendor/start/vim-airline
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-airline/doc" -c q


# nerdtree plugin
rm -rf ~/.vim/pack/vendor/start/nerdtree-git-plugin
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/vendor/start/nerdtree-git-plugin
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree-git-plugin/doc" -c q




cat > ~/.vimrc<< EOF

" Tabs and spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" Map the ledaer
let mapleader = "\\\"

" NerdTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

