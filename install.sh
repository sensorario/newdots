rm -rf ~/.fzf

# dependencies
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# plugins
folders=(
    "$HOME/.vim/pack/vendor/start/vim-airline"
    "$HOME/.vim/pack/vendor/start/nerdtree"
    "$HOME/.vim/pack/vendor/start/nerdtree-git-plugin"
    "$HOME/.vim/pack/packages/start/fzf"
    "$HOME/.vim/pack/packages/start/fzf.vim"
    "$HOME/.vim/pack/tpope/start/fugitive"
)
urls=(
    "https://github.com/vim-airline/vim-airline.git"
    "https://github.com/preservim/nerdtree.git"
    "https://github.com/Xuyuanp/nerdtree-git-plugin.git"
    "https://github.com/junegunn/fzf.git"
    "https://github.com/junegunn/fzf.vim.git"
    "https://github.com/tpope/vim-fugitive.git/"
)

for i in ${!folders[@]};
do
    folder=${folders[$i]}
    url=${urls[$i]}
     
    if [ ! -d "$folder" ] ; then
        git clone "$url" "$folder"
    else
        git -C $folder pull 
    fi

    vim -u NONE -c "helptags $folder/doc" -c q
done

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


" Other editor stuffs
set t_Co=256
filetype on
set nocompatible
syntax enable
set number
set cursorcolumn
set cursorline
set smartindent

set fillchars=vert:'|'
hi! VertSplit guifg=black guibg=black ctermfg=black ctermbg=black

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

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeShowBookmarks = 1

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
VIMRC
