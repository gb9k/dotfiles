execute pathogen#infect()
syntax on
filetype plugin indent on
" autocmd VimEnter * nested :TagbarOpen

set mouse=a            		"mouse can enable visual mode
set number             		"show linenumber
set ruler                       "show the cursor position all the time
set showcmd                     "display incomplete commands
set incsearch                   "do incremental searching
set nu                          "show line numbers
set hlsearch                    "highlight search terms
set ic                          "ignore Case during searches
set foldmethod=indent           "allows codefolding by indent
set colorcolumn=80              "column length dipstick
set noswapfile                  "no more pesky swap files
set laststatus=2                "always show statusline
set go+=a              		"visual selection automatically copied to the clipboard
set pastetoggle=<F2>	    	"better copy&paste
set clipboard=unnamed  		"before pasting, press F2
set encoding=utf-8
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

nnoremap <F5> :GundoToggle<CR>
nmap <F8> :TagbarToggle<CR>

" ===========================================================
" VIM airline settings
" ===========================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#enabled = 0
let g:tagbar_width = 28
let g:airline_theme = 'base16'
let g:YUNOcommit_after = 10

" ===========================================================
" Emmet Settings
" ===========================================================
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ===========================================================
" Solarized Colorscheme Config
" ===========================================================
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" ============================================================
" FileType specific changes
" ============================================================

" Python
" au BufRead *.py compiler nose
set softtabstop=4
set shiftround
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\%l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldlevel=99
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'

" Kivy
au BufRead,BufNewFile *.kv set filetype=kivy
au! Syntax kivy source $HOME/.vim/syntax/kivy.vim
" ============================================================

" This fixes the exit from insert mode delay. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
set timeout     		" Do time out on mappings and others
set timeoutlen=2000		" Wait {num} ms before timing out a mapping
if !has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif
