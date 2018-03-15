" VIMRC settings used by James Smith (james.smith@berkeley.edu)

set encoding=utf-8

" Remove vi backwards compatibility {{{
set nocompatible
" }}}

" I dont like netrw
let loaded_netrwPlugin = 1
let g:cpp_class_scope_highlight = 1

" mapleader {{{
let mapleader = ","
" }}}

" Themeing {{{
set t_Co=256
set background=dark
syntax on
let g:molokai_original = 1
colorscheme molokai
set guifont=Meslo\ LG\ S\ for\ Powerline:h12
" No scroll bar:
set guioptions-=r
" }}}

filetype plugin indent on
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType asm,txt setlocal commentstring=#\ %s
autocmd FileType asm setlocal syntax=mips
set modelines=0

" Misc Editor Settings {{{
set number
set autoindent
set tabstop=4 shiftwidth=4
set smarttab
set nowrap
set wildmode=longest,list,full
set wildmenu
set clipboard=unnamed
set relativenumber
set laststatus=2
" }}}

" Search options {{{
set hlsearch
set incsearch
" Clears search
map <leader><space> :let @/=''<CR>
" }}}

" Nerd Tree hotkey
nmap <leader>m :NERDTreeToggle<CR>

" Show Whitespace {{{
set listchars=tab:▸\ ,eol:¬,nbsp:%
if has("patch710")
	set listchars+=space:⋅
endif
nmap <leader>l :set list!<CR>
" }}}

" Python specitif tab settings... cant get indent files to work
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
" for viplab C++ we use 2 space tabs, expanded. Comment this out when
" working on my own C++
" it would be great to have a list of folders for which to apply this rule
" autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4

" Airline Options {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" }}}

" Buffer settings {{{
set hidden
nmap <C-Tab>   :silent bnext<CR>
nmap <C-S-Tab> :silent bprev<CR>
nmap <leader>] :silent bnext<CR>
nmap <leader>[ :silent bprev<CR>
" }}}

" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

if has("gui_running")
else
	" Mouse support for terminal mode
	set mouse=a
	map <ScrollWheelUp> <C-Y>
	map <S-ScrollWheelUp> <C-U>
	map <ScrollWheelDown> <C-E>
	map <S-ScrollWheelDown> <C-D>
endif

" Prevent MacVim from overwriting our chosen colorscheme
let macvim_skip_colorscheme = 1

if has("gui_macvim")
	let macvim_hig_shift_movement = 1
endif

" Using the vim-sessions plugin {{{
let g:session_directory = $HOME . "/.vim/sessions"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
" }}}

" Buffer management
function! Reopen()
	let i = bufnr('%')
	let buffer_name=@%
	exec "w"
	exec "bd!"
	exec "e " . buffer_name
endfunction

" Sets a directory for swap files to be all in one place
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Disable arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable auto commenting a line after inserting a new line
set formatoptions-=cro
autocmd BufNewFile,BufRead * setlocal fo-=c fo-=r fo-=o

" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif

set shortmess=aT

set ttimeoutlen=100

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" vimtex {{{
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '-r 1'
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
" On Startup
" Plug 'tpope/vim-sensible'
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-fugitive'
Plug 'Harenome/vim-mipssyntax'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'xolox/vim-notes'
Plug 'lervag/vimtex'

" On Demand
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
" }}}

