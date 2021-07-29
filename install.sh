rm -rf ~/.fzf
rm -rf ~/.vim/pack

# dependencies
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# plugins
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/vendor/start/vim-airline
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/vendor/start/nerdtree-git-plugin
git clone https://github.com/junegunn/fzf.git ~/.vim/pack/packages/start/fzf
git clone https://github.com/junegunn/fzf.vim.git ~/.vim/pack/packages/start/fzf.vim
git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/start/fugitive

# documentations
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-airline/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree-git-plugin/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/packages/start/fzf/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/packages/start/fzf.vim/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c q

# vimrc file
cat > ~/.vimrc<< EOF
" encoding
set encoding=UTF-8

" Tabs and spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4


" Other terminal stuffs
set t_Co=256
filetype on
set nocompatible
syntax enable
set number
set cursorcolumn
set cursorline

set fillchars=vert:'|'
hi! VertSplit guifg=black guibg=black ctermfg=black ctermbg=black

" Map the ledaer
let mapleader = "\\\"

" NerdTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree

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

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

