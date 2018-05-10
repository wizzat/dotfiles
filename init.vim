"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif
"}}}

call plug#begin('~/.config/nvim/plugged')

Plug 'bufexplorer.zip'                                        " Make \be open a list of buffers
Plug 'Align'                                                  " Annoy PEP8 zealots
Plug 'vim-scripts/VisIncr'                                    " ^v<motion>II to increment columns of numbers
Plug 'nathanaelkane/vim-indent-guides'                        " Changes background colors for indent levels. Useful in Python
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " Autocomplete and syntax checking

call plug#end()

com! E edit               " Typo support
com! W write              " Typo support

" Behavior
set number              " Line numbers on the screen
set hidden              " Bufexlorer stops whining about the current file being unsaved
set pastetoggle=<F12>   " Toggle !paste with a key press - mostly so that autoindent doesn't interfere
set ruler               " (ru) show the cursor position all the time
set showcmd             " Show the last command run in the ruler
set showmatch           " Do paren matching as I move over them
set vb t_vb=            " No bells
" Make the status line collapse on the left
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P

" Formatting
set ts=8                " Tabs and I don't get along, so make them obviously huge
set softtabstop=4       " use soft tabs are 4 spaces
set shiftwidth=4        " use soft tabs are 4 spaces
set expandtab           " use soft tabs are 4 spaces
set textwidth=0         " Don't word wrap automatically
set wrap                " But do continue long lines on the next line

autocmd BufEnter,BufRead,BufNewFile *       lcd %:p:h                                " Always chdir to the current directory with a file.  Helps with relative paths

" Kills wailing tritespace
map ,wt :perldo s/\s+$//g<CR>:perldo s/\t/    /g<CR>

" Formats a SQL block and capitalizes certain things
map ,fs :!~/work/shell/format_sql_block.pl<CR>
map ,as :Align! =W \<AS\><CR>
map ,q :!~/work/shell/quote.pl<CR>

" Executs github.com/wizzat/shell/tableize.pl to format tables of data
map ,a  :!~/work/shell/tableize.pl<CR>,wt<CR>

" Aligns on equal signs (useful for making pep8 hate you too)
map ,a= :Align! =W =\+<CR>

" Surrounds the current block with a...
vnoremap ,( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ," <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ,' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ,{ <ESC>`>a}<ESC>`<i{<ESC>
vnoremap ,[ <ESC>`>a]<ESC>`<i[<ESC>
