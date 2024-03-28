" vundle settings
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
"Plugin 'vim-syntastic/syntastic'
Plugin 'prettier/vim-prettier'
Plugin 'google/vim-jsonnet'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'github/copilot.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" vim settings that I like... 

if has("gui_running")
    set lines=145
    set columns=120
endif

" tab stop and expand tab
set ts=4
set et
set softtabstop=4 " delete four spaces!
set shiftwidth=4
set smartindent
set number

set spell spelllang=en_us

colorscheme desert

" Enable the ruler
set ruler

" go one more character at the end of a line
set virtualedit=onemore

" Syntastic Settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_sh_checkers = ['shellcheck']
"
"let g:syntastic_error_symbol = '❌'
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'
"let g:syntastic_style_warning_symbol = '💩'
"
"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

" ale settings
let g:ale_sign_column_always=1

" change mapping of window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Prittier settings
" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" this is not a supported option :(
let g:prettier#config#jsx_single_quote = 'true'

let g:prettier#config#print_width = 100

let g:prettier#config#bracket_spacing = 'true'

"Max out the height of the current split
"ctrl + w _
"
""Max out the width of the current split
"ctrl + w |
"
""Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =
"

" run prettier on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync

set statusline+=col\ %c

" split below the current window instead of above
set splitbelow


" use tabs in Makefiles
autocmd FileType make setlocal noexpandtab

" open terminal in bottom for macvim
if has("gui_macvim") && has("gui_running")
    autocmd StdinReadPre * let s:std_in=1
    " Start NERDTree. If a file is specified, move the cursor to its window.
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


    " Start NERDTree when Vim starts with a directory argument.
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
    autocmd VimEnter * terminal
    autocmd VimEnter * wincmd k
    autocmd VimEnter * 45 wincmd +
endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"" Save session on quitting Vim
"autocmd VimLeave * NERDTreeClose
"autocmd VimLeave * mksession! [filename]
"
"" Restore session on starting Vim
"autocmd VimEnter * NERDTree
"

" Enable gitgutter by default
let g:gitgutter_enabled=1
" Update more frequently to pick up git changes for gitgutter
set updatetime=100

set nofixendofline

packloadall

"" copilot settings
"" enable copilot for yaml files
let g:copilot_filetypes = {  'yaml': v:true }
