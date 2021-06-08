syntax on


let mapleader=" "

set clipboard=unnamedplus
set nohlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set relativenumber
set number
set number relativenumber
set expandtab
set smartindent
set smartcase
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
highlight LineNr ctermfg=grey
"hi Pmenu ctermbg=Brown  ctermfg=LightYellow
set hidden  "hides buffer instead of closing"
set mouse=a
"set autochdir
"set scrolloff=18
"colorscheme gruvbox8_hard
"hi Normal guibg=NONE ctermbg=NONE
">>>>>plug start>>>>>>>> 
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
"directory structure plugin"
Plug 'scrooloose/nerdtree'
"vim fugitive for git logs
Plug 'tpope/vim-fugitive'
"multiple cusrsors like sublime"
Plug 'terryma/vim-multiple-cursors'
"auto completion of pairs"
Plug 'jiangmiao/auto-pairs'
"commentor"
Plug 'scrooloose/nerdcommenter'
"adding icons
Plug 'ryanoasis/vim-devicons'
"fuzzy finedr using fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"grep for vim
Plug 'jremmen/vim-ripgrep'
"startup script for vim
Plug 'mhinz/vim-startify'
"git-gutter
Plug 'airblade/vim-gitgutter'
"intelliscense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"surroundings
Plug 'tpope/vim-surround'
"color-scheme
"Plug 'tpope/vim-vividchalk'
"Plug 'lifepillar/vim-gruvbox8'
"indentation guidelines
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
call plug#end()
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=grey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=7

"colorscheme gruvbox
"hi Normal guibg=NONE ctermbg=NONE
">>>>>>>>>custom key mappings start>>>>>>>>"
nnoremap <f1> :set hls <CR>
nnoremap <f2> :term <CR>
nnoremap <f3> :UndotreeToggle <CR>
nnoremap <f4> :NERDTreeToggle<CR>
nnoremap<C-z> :vertical split<CR>
nnoremap<S-x> :vertical resize +5<CR>
nnoremap<C-x> :vertical resize -5 <CR>
nnoremap<C-t> :Files <CR>
nnoremap <leader>s :Rg 
nnoremap<C-q> :GitGutterToggle<CR>
nnoremap <leader>b :Buffers <CR>
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>
"nnoremap <leader>f2 :set autochdir <CR>
inoremap<C-s> <ESC> :w <CR>

nnoremap<leader>gc :Git commit <CR> 
nnoremap<leader>gd :Git diff<CR> 
nnoremap<leader>gw :Gvdiffsplit<CR> 
nnoremap<leader>gs :G<CR>
nnoremap<leader>gp :Git push<CR>

">>>>>>>>>> mappings end>>>>>>>>>>>>>>>"

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
"find root of the project
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
"map <C-p> :ProjectFiles<CR>
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR><C-W>
"Autocmd for g++
autocmd BufWritePost *11.cpp !g++ % -lGL -lcrypto -lglut -lGLU &&  ./a.out
"autocmd filetype cpp nnoremap <f5> :w <bar> !g++ % -lcrypto -lGL -lglut -lGLU -o %:r && ./%:r <cr> 

source $HOME/.vim/plug-config/coc.vim
