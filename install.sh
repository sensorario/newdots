rm -rf ~/.fzf

# dependencies
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# plugins
plugins=(
    "$HOME/.vim/pack/vendor/start/vim-airline"
    "https://github.com/vim-airline/vim-airline.git"
    "$HOME/.vim/pack/vendor/start/nerdtree"
    "https://github.com/preservim/nerdtree.git"
    "$HOME/.vim/pack/vendor/start/nerdtree-git-plugin"
    "https://github.com/Xuyuanp/nerdtree-git-plugin.git"
    "$HOME/.vim/pack/packages/start/fzf"
    "https://github.com/junegunn/fzf.git"
    "$HOME/.vim/pack/packages/start/fzf.vim"
    "https://github.com/junegunn/fzf.vim.git"
    "$HOME/.vim/pack/tpope/start/fugitive"
    "https://github.com/tpope/vim-fugitive.git/"
    "$HOME/.vim/pack/vendor/start/vim-gitgutter"
    "https://github.com/airblade/vim-gitgutter.git/"
)

echo "\n >>> START plugins installation "
for i in ${!plugins[@]};
do
    if (( i % 2 == 0 ))
    then
        # echo $i
        folder="${plugins[$i]}"
        url="${plugins[$i+1]}"
        if [ ! -d "$folder" ] ; then
            git clone "$url" "$folder"
        else
            git -C $folder pull 
        fi
        vim -u NONE -c "helptags $folder/doc" -c q
    fi
done
echo " >>> END plugins installation "

# vimrc file
cat > ~/.vimrc<< VIMRC
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
colorscheme blackdust
set backspace=indent,eol,start
set noswapfile
set ignorecase


set fillchars=vert:\ 
hi! VertSplit guifg=black guibg=black ctermfg=black ctermbg=black

" Map the ledaer
let mapleader = "\\\"

" NerdTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fzf
nnoremap <C-p> :Files<CR>

" Buffers
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

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

cat > ~/.vim/colors/halloween.vim<< HALLOWEEN
" Vim color file - halloween
" Generated by http://bytefluent.com/vivify 2021-09-06
set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "halloween_modified"

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#008700 guibg=#192224 guisp=#192224 gui=NONE ctermfg=28 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --
hi IncSearch guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=235 ctermbg=1 cterm=NONE
hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi SignColumn guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Typedef guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Title guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=bold ctermfg=189 ctermbg=235 cterm=bold
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreCondit guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Include guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Float guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi NonText guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi DiffText guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi ErrorMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Conditional guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi StorageClass guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Todo guifg=#F9F9FF guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=189 ctermbg=1 cterm=NONE
hi Special guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi LineNr guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=bold ctermfg=235 ctermbg=1 cterm=bold
hi Label guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi PMenuSel guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=235 ctermbg=1 cterm=NONE
hi Search guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=235 ctermbg=1 cterm=NONE
hi Delimiter guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Statement guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Comment guifg=#2f6b27 guibg=NONE guisp=NONE gui=italic ctermfg=22 ctermbg=NONE cterm=NONE
hi Character guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=bold ctermfg=235 ctermbg=1 cterm=bold
hi Number guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Operator guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLineFill guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi WarningMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi VisualNOS guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline ctermfg=235 ctermbg=189 cterm=underline
hi DiffDelete guifg=NONE guibg=#192224 guisp=#192224 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi ModeMsg guifg=#F9F9F9 guibg=#192224 guisp=#192224 gui=bold ctermfg=15 ctermbg=235 cterm=bold
hi CursorColumn guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Define guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Function guifg=#3d5f99 guibg=NONE guisp=NONE gui=bold ctermfg=67 ctermbg=NONE cterm=bold
hi FoldColumn guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreProc guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Visual guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=NONE ctermfg=235 ctermbg=189 cterm=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi VertSplit guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi Exception guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi Keyword guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi Type guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi DiffChange guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi Cursor guifg=#192224 guibg=#F9F9F9 guisp=#F9F9F9 gui=NONE ctermfg=235 ctermbg=15 cterm=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Error guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi PMenu guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=NONE ctermfg=235 ctermbg=66 cterm=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi Constant guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi String guifg=#00d75f guibg=NONE guisp=NONE gui=NONE ctermfg=41 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi Repeat guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Structure guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Macro guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
HALLOWEEN

cat > ~/.vim/colors/blackdust.vim<< BLACKDUST
" Vim color file - blackdust
" Generated by http://bytefluent.com/vivify 2021-09-07
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "blackdust"

"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#cccccc guibg=#3f3f3f guisp=#3f3f3f gui=NONE ctermfg=252 ctermbg=237 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi CursorLine -- no settings --
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi CursorColumn -- no settings --
"hi EnumerationName -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi MatchParen -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi Underlined -- no settings --
"hi TabLine -- no settings --
"hi clear -- no settings --
"hi default -- no settings --
hi IncSearch guifg=#000000 guibg=#c15c66 guisp=#c15c66 gui=NONE ctermfg=NONE ctermbg=131 cterm=NONE
hi WildMenu guifg=#000000 guibg=#dca3a3 guisp=#dca3a3 gui=NONE ctermfg=NONE ctermbg=181 cterm=NONE
hi SpecialComment guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Typedef guifg=#ffffff guibg=NONE guisp=NONE gui=bold,underline ctermfg=15 ctermbg=NONE cterm=bold,underline
hi Title guifg=#ffffff guibg=#333333 guisp=#333333 gui=bold ctermfg=15 ctermbg=236 cterm=bold
hi Folded guifg=#dca3a3 guibg=#333333 guisp=#333333 gui=NONE ctermfg=181 ctermbg=236 cterm=NONE
hi PreCondit guifg=#dfaf8f guibg=NONE guisp=NONE gui=bold ctermfg=180 ctermbg=NONE cterm=bold
hi Include guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi StatusLineNC guifg=#333333 guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=236 ctermbg=252 cterm=NONE
hi NonText guifg=#1f1f1f guibg=NONE guisp=NONE gui=NONE ctermfg=234 ctermbg=NONE cterm=NONE
hi DiffText guifg=#ffffff guibg=#1f1f1f guisp=#1f1f1f gui=bold ctermfg=15 ctermbg=234 cterm=bold
hi ErrorMsg guifg=#000000 guibg=#00c0cf guisp=#00c0cf gui=NONE ctermfg=NONE ctermbg=44 cterm=NONE
hi Debug guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi PMenuSbar guifg=NONE guibg=#464646 guisp=#464646 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi Identifier guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Conditional guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi StorageClass guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Todo guifg=#ffffff guibg=#000000 guisp=#000000 gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Special guifg=#7f7f7f guibg=NONE guisp=NONE gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi LineNr guifg=#7f7f7f guibg=#464646 guisp=#464646 gui=NONE ctermfg=8 ctermbg=238 cterm=NONE
hi StatusLine guifg=#333333 guibg=#f18c96 guisp=#f18c96 gui=NONE ctermfg=236 ctermbg=210 cterm=NONE
hi Label guifg=#8fffff guibg=NONE guisp=NONE gui=underline ctermfg=123 ctermbg=NONE cterm=underline
hi PMenuSel guifg=#333333 guibg=#f18c96 guisp=#f18c96 gui=NONE ctermfg=236 ctermbg=210 cterm=NONE
hi Search guifg=#000000 guibg=#c15c66 guisp=#c15c66 gui=NONE ctermfg=NONE ctermbg=131 cterm=NONE
hi Delimiter guifg=#8f8f8f guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Statement guifg=#8fffff guibg=NONE guisp=NONE gui=NONE ctermfg=123 ctermbg=NONE cterm=NONE
hi Comment guifg=#7f7f7f guibg=NONE guisp=NONE gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi Character guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Float guifg=#9c93b3 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Number guifg=#aca0a3 guibg=NONE guisp=NONE gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi Boolean guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Operator guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Question guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi WarningMsg guifg=#ffffff guibg=#333333 guisp=#333333 gui=bold ctermfg=15 ctermbg=236 cterm=bold
hi VisualNOS guifg=#333333 guibg=#f18c96 guisp=#f18c96 gui=bold,underline ctermfg=236 ctermbg=210 cterm=bold,underline
hi DiffDelete guifg=#333333 guibg=#464646 guisp=#464646 gui=NONE ctermfg=236 ctermbg=238 cterm=NONE
hi ModeMsg guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Define guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi Function guifg=#ffff8f guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#dca3a3 guibg=#464646 guisp=#464646 gui=NONE ctermfg=181 ctermbg=238 cterm=NONE
hi PreProc guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi Visual guifg=#333333 guibg=#f18c96 guisp=#f18c96 gui=NONE ctermfg=236 ctermbg=210 cterm=NONE
hi MoreMsg guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi VertSplit guifg=#333333 guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=236 ctermbg=252 cterm=NONE
hi Exception guifg=#8fffff guibg=NONE guisp=NONE gui=underline ctermfg=123 ctermbg=NONE cterm=underline
hi Keyword guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Type guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi DiffChange guifg=NONE guibg=#333333 guisp=#333333 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Cursor guifg=#000000 guibg=#aeaeae guisp=#aeaeae gui=NONE ctermfg=NONE ctermbg=145 cterm=NONE
hi Error guifg=#000000 guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
hi PMenu guifg=#333333 guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=236 ctermbg=252 cterm=NONE
hi SpecialKey guifg=#7e7e7e guibg=NONE guisp=NONE gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi Constant guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Tag guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi String guifg=#cc9393 guibg=NONE guisp=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#7f7f7f guisp=#7f7f7f gui=NONE ctermfg=NONE ctermbg=8 cterm=NONE
hi Repeat guifg=#8fffff guibg=NONE guisp=NONE gui=underline ctermfg=123 ctermbg=NONE cterm=underline
hi Directory guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Structure guifg=#ffffff guibg=NONE guisp=NONE gui=bold,underline ctermfg=15 ctermbg=NONE cterm=bold,underline
hi Macro guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi DiffAdd guifg=NONE guibg=#613c46 guisp=#613c46 gui=NONE ctermfg=NONE ctermbg=95 cterm=NONE
hi cursorim guifg=#1F1F1F guibg=#FFEE68 guisp=#FFEE68 gui=NONE ctermfg=234 ctermbg=227 cterm=NONE
hi htmlitalic guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=italic ctermfg=252 ctermbg=234 cterm=NONE
hi htmlboldunderlineitalic guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=bold,italic,underline ctermfg=252 ctermbg=234 cterm=bold,underline
hi htmlbolditalic guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=bold,italic ctermfg=252 ctermbg=234 cterm=bold
hi htmlunderlineitalic guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=italic,underline ctermfg=252 ctermbg=234 cterm=underline
hi htmlbold guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=bold ctermfg=252 ctermbg=234 cterm=bold
hi htmlboldunderline guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=bold,underline ctermfg=252 ctermbg=234 cterm=bold,underline
hi htmlunderline guifg=#D0D0D0 guibg=#1F1F1F guisp=#1F1F1F gui=underline ctermfg=252 ctermbg=234 cterm=underline
hi condtional guifg=#8fffff guibg=NONE guisp=NONE gui=NONE ctermfg=123 ctermbg=NONE cterm=NONE
BLACKDUST
