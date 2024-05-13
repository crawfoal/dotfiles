"===============================================================================
"                              Amanda's vimrc
"===============================================================================
"
" Author:       Amanda Dolan
" Source:       https://github.com/crawfoal/dotfiles
" Forked from:  auto-generated vimrc (I think?)
"               Bram Moolenaar <Bram@vim.org>
"               last revision 2017 Sep 20
"
"-------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = "\<Space>"
set pyxversion=3
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elixir-editors/vim-elixir'
Plugin 'powerline/powerline-fonts'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
" Deoplete needs the two packages that follow, as well as pynvim, which can be
" installed with pip3 install pynvim. Alternatively install vim8 with python
" 3 support via `brew install vim --with-python3`.
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"let g:deoplete#enable_at_startup = 1
let g:airline_theme='papercolor'
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='light'
let g:airline_section_b = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ }
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Hook vim-test into Vim Test Runner (VTR)
let test#strategy = "vtr"

" Specify test runners
let test#python#runner = 'nose2'
let test#python#nose2#file_pattern = 'test_*'
let test#python#nose2#executable = 'pipenv run nose2'

" Add shortcuts for vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Add shortcuts for Vim Tmux Runner (VTR)
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>dr :VtrDetachRunner<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>fc :VtrFlushCommand<cr>
nnoremap <leader>sf :VtrSendFile<cr>

" VTR settings for Python
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

" Put your non-Plugin stuff after this line

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END
endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set number             " display line numbers beside buffer
set numberwidth=5      " char width of the line number column
set autoindent
set nobackup
set writebackup
set noswapfile
set autowrite
set textwidth=80
set colorcolumn=+1
set background=dark
syntax enable
"Light Color Scheme
"colorscheme tango-morning
"Dark Color Scheme
colorscheme PaperColor

" allow pane navigation without prefix
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <C-W>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <C-W>= :wincmd =<cr>

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" auto delete trailing whitespace on buffer write
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nmap 0 ^
nmap j gj
nmap k gk
command! Q q " quit when I accidentally type :Q instead of :q
command! Qall qall
command! QA qall
nmap <D-s> :w<cr>
imap <D-s> <esc>:w<cr>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" shortcut to format json
command! FormatJSON %!python -m json.tool

