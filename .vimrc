" TODO:
" - Auto preview on quickfix window
" - Auto close quickfix window on entering record
" - cleanup
" - NerdCommenter fixing
" - Adjusting of quickr preview

"Set - as default leader
let mapleader="-"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" list of plugins
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'erig0/cscope_dynamic'
Plugin 'brookhong/cscope.vim'
" Plugin 'vim-scripts/AutoTag'
" Plugin 'ervandew/supertab'
Plugin 'drn/zoomwin-vim'
" Plugin 'ronakg/quickr-cscope.vim'
Plugin 'ronakg/quickr-preview.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rcabralc/monokai-airline.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " required
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
" Put your non-Plugin stuff after this line

" New panes:
set splitright
set splitbelow

" Terminal 256 colors
set t_Co=256

" Remove search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Reload .vimrc
nnoremap <leader>so :so $MYVIMRC<CR>

" * and # highlights but doesn't jump to next by default
" nnoremap * :keepjumps normal *``<CR>
" nnoremap # :keepjumps normal #``<CR>

" Current line highlighting and line numbering
set number
set relativenumber
set cursorline

" Disable swap files
set noswapfile

" When next buffer is openedthe currently modified one goes into background
set hidden

" Enable mouse
"set mouse=a

" Enable exit/write confirmation
set confirm

" Search tag file in current directory and up and up until it finds it
set tags=./tags;/

" Syntax highlight
syntax on
colorscheme monokai

" Default indentation settings
set autoindent
set cindent
set tabstop=4 shiftwidth=4 expandtab

" Set past mode switch to F10
set pastetoggle=<F10>
set showmode

" Enter paste mode before pasting text
" inoremap <silent> <S-Insert> <F2><S-Insert><F2>

" Always show status bar
set laststatus=2

" Line should not be wider than 80 characters
" set colorcolumn=81
" let &colorcolumn=join(range(81,999),",")

" Search options
set hlsearch
set incsearch

" Allow backspace to remove newline and indentation in insert mode
set backspace=indent,eol,start

" Status line options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"Faster and smoother movement
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Airline options
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='monokai'

" Ctrlp options
let g:ctrlp_map='<c-p>'
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_working_path_mode='a'
let g:ctrlp_custom_ignore={
    \'dir': '\v[\/]\.(git|hg|svn)$',
    \'file': '\v\.(o|disasm|hex|readelf|ioc|bin|exe|sc|dll)$'
    \}

" Nerdcommenter options
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWitespace=1
nmap <c-c> <plug>NERDCommenterToggle

" Autoformat options
let g:foratdef_my_custom_c = '"astyle -A7 --mode=c -pcHs".&shiftwidth'
let g:formatters_c = ['my_custom_c']
nmap <leader>af :Autoformat<CR>

" Lazy typos correction
command!-bang Q q<bang>
command! Wa wa
command! WA wa
command! W w

" NerdTree options
nnoremap <silent> <leader>ne :NERDTreeToggle<CR>

" Tagbar options
nnoremap <silent> <leader>t :TagbarToggle<CR>

" Vimgrep options
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>N :cp<CR>

" SuperTab / autocomplete options
let g:SuperTabDefaultCompletionType="context"
set completeopt=longest,menuone
set completeopt-=preview

" Zoomwin options
nnoremap <silent> <c-w>w :ZoomWin<CR>

function! RefreshCscopeDatabase()
    :silent exec"!(cscope -R -b && mv cscope.out ~/cscope.out)"
    :exec ":redraw!"
    :cs reset
endfunction
" Manually reload cscope database
nnoremap <silent> <leader>fr :call RefreshCscopeDatabase()<CR>
" Load cscope database on vim start
autocmd VimEnter * cs add ~/cscope.out
" Update cscope database on file save
" autocmd BufWritePost *.[ch] silent! exec RefreshCscopeDatabase()
" autocmd BufWritePost *.[ch] silent! (!~/build_cscope_db.sh)

" A (alternate) options
" source ~/a.vim

" Cscove options
let g:cscope_silent=1

" nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
