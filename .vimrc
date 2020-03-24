syntax on
filetype on
filetype indent on
filetype plugin on
set nocompatible

set number

autocmd BufWritePre * :%s/\s\+$//e

set autoindent

" Setup vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

let g:vundle_default_git_proto = 'git'

" Bundles
Plugin 'bling/vim-airline'
Plugin 'SingleCompile'
Plugin 'vim-soy'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'gmarik/vundle'
Plugin 'hlissner/vim-multiedit'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'solarnz/thrift.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

" Code Folding
set foldlevelstart=20
set foldmethod=indent

" Disable gvim toolbars by default
set guioptions-=T
set guioptions-=m>

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Setup pathogen
" execute pathogen#infect()

set guifont=Monaco\ for\ Powerline:h12

" Move lines with ctrl + j/k
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Tagbar
map <F3> :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

" Colors
set  t_Co=256
colorscheme Tomorrow-Night
set cursorline
set colorcolumn=80
set hlsearch

" SimpleCompile
map <F8> :SCCompile<cr>
map <F9> :SCCompileRun<cr>
autocmd Filetype cpp map <buffer> <F8> :SCCompileAF -std=c++11 <CR>
autocmd Filetype cpp map <buffer> <F9> :SCCompileRunAF -std=c++11 <CR>

" YouCompleteMe
let g:ycm_server_python_interpreter = '/Users/nikola/anaconda3/envs/py27/bin/python'
let g:ycm_server_keep_logfiles = 1

" Undo dir
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir

" Indentation
vnoremap > >gv
vnoremap < <gv

" Add cyrillic keymaping
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,
" }}}`

" Add shortcuts for copy and paste from the clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

" Mouse
set mouse=a

" Fix mouse scroll
set mouse=a

" ctrlp
let g:ctrlp_max_files = 0
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Search with Ag
noremap <leader>s :Ag

" bind K to search grep word under the cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

vnoremap K y:Ag "<C-R>""<CR>
vnoremap // y/<C-R>"<CR>

nmap f <Plug>(easymotion-overwin-f2)

" Better scroll
set scrolloff=5

" Tabs
noremap <C-t> :tabnew<CR>

" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

