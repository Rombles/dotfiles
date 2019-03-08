set nocompatible
filetype plugin on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'kien/ctrlp.vim'
Plugin 'python-mode/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'derekwyatt/vim-scala'

call vundle#end()

let mapleader = ","
let g:mapleader = ","

" defaults:
"  textwidth (tw)  80
"  smartcase (scs)
set tw=120
set ignorecase
set smartcase
set hlsearch
set number

" Statusline
set laststatus=2

set ts=2
set sw=2
set sts=4
set et
set expandtab

" Relative line numbers
set relativenumber

" clear search
nnoremap <silent> <CR> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"
" enable FileType plugin
filetype plugin indent on

" function to expand tabs and delete trailing white space without losing
" cursor position
function! FixUnwantedWhitespace()
    let l = line(".")
    let c = col(".")
    retab
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" automatically fix white space on buffer save for specified file types
"au FileType c,cpp,python,java,ruby au BufWritePre <buffer> call FixUnwantedWhitespace()
au BufWritePre <buffer> call FixUnwantedWhitespace()

" set my color scheme
set term=screen-256color
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" a couple useful function key settings
nmap <F2> :set ignorecase! ignorecase?<CR>
nmap <F3> :set smartcase! smartcase?<CR>
nmap <F4> :set hlsearch! hlsearch?<CR>

 " Map tab to be a actual tab if the cursor is at the beginning of a word, other
 " wise triggers completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|htmlcov/|\.(o|swp|pyc|egg)$'

let g:ctrlp_use_caching = 0
if executable('ag')
set grepprg=ag\ --nogroup\ --nocolor

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
\ }
endif

" Pymode Rope Settings
let g:pymode_rope = 0

" Open/Close NERDTree
map <leader>f <Esc>:NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'build$[[dir]]', 'dist$[[dir]]', '__pycache__$[[dir]]']

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

map <leader>a <Esc>:PymodeLint<cr>
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_ignore="W403,W0232,E1101,E402"


" vim-airline settings
" when only one tab is open, show all of the open buffers
let g:airline#extensions#tabline#enabled = 1
" user powerline patched fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'murmur'
" dict of configurably unicode symbols. mmmmmmmmmm
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#branch#displayed_head_limit = 12
