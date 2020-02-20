"MIT License
"Copyright (c) 2020 phR0ze
"
"Permission is hereby granted, free of charge, to any person obtaining a copy
"of this software and associated documentation files (the 'Software'), to deal
"in the Software without restriction, including without limitation the rights
"to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"copies of the Software, and to permit persons to whom the Software is
"furnished to do so, subject to the following conditions:
"
"The above copyright notice and this permission notice shall be included in all
"copies or substantial portions of the Software.
"
"THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
"SOFTWARE.

augroup GeneralSettings
  autocmd!
  set title                     " Sets the window title to your current buffer name
  set encoding=UTF-8            " Required for vim-devicons to work correctly
  set autochdir                 " Automatically switch working directory to current file
  set backspace=2               " Configure backspace to work as normal same as =indent,eol,start
  set clipboard=unnamedplus     " Set all yanks to be copied to register * as well as register +
  set formatoptions+=tqw        " Text formatting, a=auto formatting for t=text and w=paragraphs
  set nobackup                  " Don't make a backup of a file when overwriting it
  set noerrorbells              " Turn off incessant beeping

  " Search
  set nohlsearch                " Don't highlight matches with last search pattern
  set ignorecase                " Ignore case in search patterns
  set smartcase                 " With ignorecase this searches case sensitive when capital is given

  " Set numbering/status
  set number			              " Shows line numbers
  set ruler 			              " Shows current position (row and column) at the bottom of srceen

  " Set tabbing/indenting
  set tabstop=2		              " How many columns a tab counts for
  set shiftwidth=2	            " Specifies how many columns text is indented with the rindent operations << and >>
  set softtabstop=2             " How many columns a tab counts for, only used when expandtab is not set
  set expandtab		              " Hitting tab in insert mode will produce the appropriate number of spaces
  set cindent                   " Enables automatic C program indenting
  set autoindent                " Enables automatic C program indenting
  set smartindent		            " Indents according to blocks of code, 'nosmartindent'

  set showmatch		              " When typing a closing parenthesis, bracket, or brace, shows match
  set showmode                  " Show if you are in insert/command mode at the bottom of the screen
  set spell spelllang=en_us     " Set spelling options
  set nospell                   " Turn spelling off by default
  set textwidth=100	            " Maximum line length before wrapping; 0 means don't do this
  set wrapmargin=10	            " When width 0, this wraps if within this many spaces from right margin
  set wildmode=longest,list     " Sets tab completion for command line similar to bash
augroup END

" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Interface
Plug 'vim-airline/vim-airline'              " Awesome status bar at bottom with git support
Plug 'vim-airline/vim-airline-themes'       " Vim Airline themes

" ColorSchemes
Plug 'vim-scripts/CycleColor' 			        " Color scheme cycler
Plug 'ajmwagar/vim-deus' 				            " deus
Plug 'YorickPeterse/happy_hacking.vim'      " happy_hacking
Plug 'w0ng/vim-hybrid' 				              " hybrid
Plug 'kristijanhusak/vim-hybrid-material'   " hybrid_material
Plug 'nanotech/jellybeans.vim' 			        " jellybeans
Plug 'dikiaap/minimalist' 				          " minimalist
Plug 'marcopaganini/termschool-vim-theme'   " termschool

" Syntax highlighting
Plug 'stephpy/vim-yaml'                     " yaml
Plug 'kurayama/systemd-vim-syntax'          " systemd

" Word processing
Plug 'junegunn/goyo.vim'                    " Allow for margins in vim, i.e. print layout
 
call plug#end()

" File type settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FiletypeSettings
  autocmd!

  " Override filetype detection
  au BufNewFile,BufRead *.smali set filetype=smali
  au BufNewFile,BufRead *conkyrc set filetype=conkyrc

  " Override file type configs
  au FileType make setl noexpandtab
  au FileType vim setl foldmethod=marker
  au FileType yaml setl ts=2 sw=2 sts=2
augroup END

" Vim-Airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                    " Always include status line at the bottom of the screen
let g:airline_powerline_fonts = 1   " User powerline fonts for icons
let g:airline_theme = 'deus'        " Set the airline theme

" Goyo settings
" Toggle on and off with :Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width = 80               " Set width
let g:goyo_height = 100             " Set height
let g:goyo_linenr = 0               " Disable line numbers

" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" n Normal mode map. Defined using :nmap or nnoremap
" i Insert mode map. Defined using :imap or inoremap
" v Visual and select mode map. Defined using :vmap or vnoremap
" x Visual mode map. Defined using :xmap or xnoremap
" s Select mode map. Defined using :smap or snoremap
" c Command-line mode map. Defined using :cmap or cnoremap
" noremap ignores other mappings - always use this mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ";"

" Edit/source this config file
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR> 

" Toggle Word processor mode
nnoremap <Leader>gy :WP<CR>:Goyo<CR>

" Move up/down by rows rather than by lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" Configure copy/paste and select all
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
nnoremap <C-a> ggVG

" Color settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                                   " Turn on syntax hi-lighting
set t_Co=256                                " Enable 256 colors for terminal mode
set background=dark                         " Set vim color mode (dark or light)
colorscheme deus                            " Set the color scheme

" Word processor mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! WordProcessorMode() 
  setlocal formatoptions=1                  " Don't break lines after one-letter words
  setlocal noexpandtab                      " Keep tabs and don't convert to spaces
  setlocal wrap                             " Wrap text when it reaches the end
  setlocal linebreak                        " Vim will break lines at sensible spaces
  setlocal nolist                           " Disable list setting so that linebreak works
  set complete+=s                           " Search thesaurus for a word to autocomplete

  " Spelling key squences
  " ]s    moves to the next spelling mistake
  " [s    moves to the previous spelling mistake
  " zg    add a word to your dictionary
  " z=    to get vim to suggest spelling fixes, type the number and hit enter
  setlocal spell spelllang=en_us            " Enable Vim's built in spell checking

endfu
com! WP call WordProcessorMode()
