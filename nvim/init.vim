set rnu
set nu
colorscheme industry
filetype plugin on
filetype plugin indent on


call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', {'for': 'python' }
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive' "Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion' "Goto word
Plug 'yuttie/comfortable-motion.vim' "Scrolling
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'frazrepo/vim-rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mhinz/vim-startify'

Plug 'jpalardy/vim-slime', { 'for': 'python' } 
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

Plug 'jalvesaq/zotcite'


call plug#end()

"""Settings"""
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint', 'pylint_flask']
call neomake#configure#automake('nrwi', 500)

hi HighlightedyankRegion cterm=reverse gui=reverse
"Trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nmap <buffer> <F9> <Esc>:w<CR>:!clear;python %<CR>


"IndentLine 
let g:indentLine_char = '▏' 
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1 

"Emmet for html
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:airline_theme='fruit_punch'
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text'
set laststatus=2
"vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

map <F2> :NERDTreeToggle<cr>
map <C-z> :tabn<cr>

"Ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(dmg|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'a'

let g:smoothie_enabled = 1

"Buffergator
let g:buffergator_viewport_split_policy = 'R'

"Slime config
let g:slime_target = 'tmux'
let g:slime_python_ipython = 1

let g:slime_python_ipython = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"Ipython
"_start
map <F3> :SlimeSend1 ipython --matplotlib <CR>
map <F5> :IPythonCellExecuteCellJump <CR>
"_run script
nnoremap <Leader>cell :IPythonCellRun<CR>
"_run script w/ timing
nnoremap <Leader>cellt :IPythonCellRunTime<CR>
"_execute the current cell
nnoremap <Leader>C :IPythonCellExecuteCell<CR>
"_execute the current cell and jump to the next cell
"_clear Ipython screen
nnoremap <Leader>clear :IPythonCellClear<CR>
"_restart ipython
nnoremap <Leader>restart :IPythonCellRestart<CR>
"_run all cells 
nnoremap <Leader>rall :IPython
"_cell navigation
nnoremap <Leader>' :IPythonCellPrevCell<CR>
nnoremap <Leader>/ :IPythonCellNextCell<CR>
"_close plots
nnoremap <Leader>x :IPythonCellClose<CR>


