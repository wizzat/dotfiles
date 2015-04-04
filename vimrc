" Setting up Vundle - the vim plugin bundler.  Auto installs itself!
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Add your bundles here

Bundle 'bufexplorer.zip'
Bundle 'Align'
Bundle 'Solarized'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/VisIncr'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'solarnz/thrift.vim'

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

" pep8 hates me and the Align/Tabular plugin
let g:syntastic_python_checkers=[]

colorscheme elflord       " Personal preference
syntax on                 " Syntax highlight support
com! E edit               " Typo support
com! W write              " Typo support
filetype plugin indent on " use filetype specific support

set nocompatible        " No, don't use vi mode
set number              " Line numbers on the screen
set backspace=2         " (bs) allow backspacing over everything in insert mode
set hidden              " Bufexlorer stops whining about the current file being unsaved
set history=50          " (hi) keep 50 lines of command line history
set hlsearch            " Highlight my current search term
set incsearch           " Start searching while I type
set mouse=a             " Use the mouse on the terminal
set pastetoggle=<F12>   " Toggle !paste with a key press - mostly so that autoindent doesn't interfere
set ruler               " (ru) show the cursor position all the time
set showcmd             " 
set showmatch           " Do paren matching as I move over them
set laststatus=2        " I always want a status line
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P
set textwidth=0         " Don't word wrap automatically
set wrap                " But do continue long lines on the next line
set vb t_vb=            " No bells
set viminfo='20,\"50,%  " (vi) read/write a .viminfo file, don't store more than 50 lines of registers
set autoindent          " Indent is for the win
set ts=8                " Tabs and I don't get along, so make them obviously huge
set softtabstop=4       " use soft tabs are 4 spaces
set shiftwidth=4        " use soft tabs are 4 spaces
set expandtab           " use soft tabs are 4 spaces
set scrolloff=5         " Syntax highlighting reset
set autoread            " Reload files that have changed

autocmd BufEnter,BufRead,BufNewFile *       lcd %:p:h                                " Always chdir to the current directory with a file.  Helps with relative paths
autocmd BufEnter,BufRead,BufNewFile *       syntax sync fromstart                    " Syntax highlight from the beginning of a file (helps with long string blocks)
autocmd BufEnter,BufRead,BufNewFile *       set softtabstop=4 shiftwidth=4 expandtab " Setup 4 space soft tabs no matter what
autocmd BufEnter,BufRead,BufNewFile *.scala set filetype=scala                       " Set filetype scala for all scala files
autocmd BufEnter,BufRead,BufNewFile *.thrift set filetype=thrift                     " Set filetype thrift for all thrift files

" Auto complete
if has("autocmd") && exists("+omnifunc")            
autocmd Filetype *
\   if &omnifunc == "" |
\     setlocal omnifunc=syntaxcomplete#Complete |
\   endif
endif

" Auto complete
set complete=.,w,b,u,k

" Kills wailing tritespace
map ,wt :perldo s/\s+$//g<CR>:perldo s/\t/    /g<CR>

" Formats a SQL block and capitalizes certain things
map ,fs :!~/work/shell/format_sql_block.pl<CR>
map ,as :Align! =W \<AS\><CR>
map ,q :!~/work/shell/quote.pl<CR>

" Executs github.com/wizzat/shell/tableize.pl to format tables of data
map ,a  :!~/work/shell/tableize.pl<CR>,wt<CR>

" Aligns on equal signs (useful for making pep8 mad at you)
map ,a= :Align! =W =\+<CR>
"map ,a=f :Align! =W [><=~+-]\+<CR>

"Aligns on colons (useful for dictionaries)
map ,a: :Align! =W [:]\+<CR>

" Surrounds the current block with a...
vnoremap ,( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ," <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ,' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ,{ <ESC>`>a}<ESC>`<i{<ESC>
vnoremap ,[ <ESC>`>a]<ESC>`<i[<ESC>

" Modify python filetype autoindent to be less annoying.
let g:pyindent_open_paren        = '&sw'
let g:pyindent_nested_paren      = '&sw'
let g:pyindent_continue          = '&sw'
let python_space_error_highlight = 1

" Make Eclim and YouCompleteMe play nice
let g:EclimCompletionMethod = 'omnifunc'

" Find and display overly long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%181v.\+/
