set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
" autocompletion
"Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-sensible'
" file tree
Plugin 'scrooloose/nerdtree'
" file search
Plugin 'kien/ctrlp.vim'
"Plugin 'sjbach/lusty'
" git plugin
Plugin 'tpope/vim-fugitive'
" syntax checking plugin
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
"comment code
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" tag of code
Plugin 'majutsushi/tagbar'
" search file
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

" 文档编辑
" restructtext
"Plugin 'Rykka/riv.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Flowerowl/ici.vim'

" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 配色
Plugin 'altercation/vim-colors-solarized'

" golang
Plugin 'jnwhiteh/vim-golang'
Plugin 'dgryski/vim-godef'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" vim-scripts repos
Plugin 'L9'
" Java Conf
"Plugin 'Vim-JDE'
"Plugin 'JavaBrowser'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'


" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"

"
" 一些基本配置
"
set anti enc=utf-8
set guifont=Source_Code_Pro:h12
autocmd BufWritePost *.py call Flake8()

filetype plugin indent on     " required!
" Set to auto read when a file is changed from the outside
set autoread
let mapleader = ','
let g:mapleader = ','
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set number

set guifont=Courier_New:h16
set guifontwide=STXihei:h16
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=W501,E225'
let syntastic_python_checker_args='--ignore=E501,E225'
" Ignore case when searching
set ignorecase smartcase
" Highlight search results
set hlsearch incsearch
" Use spaces instead of tabs
set expandtab smarttab shiftwidth=4 tabstop=4
"Always show current position
set ruler

let g:pymode_breakpoint_cmd = 'import pdb; pdb.set_trace()  # XXX BREAKPOINT'

"" Height of the command bar
set cmdheight=2
"禁止生成临时文件
set nobackup
set noswapfile

set wrap

" golang
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufferWritePost,FileWritePost *.go execute 'go fmt'
"autocmd BufWritePre *.go '!go fmt'
autocmd FileType go autocmd BufWritePre <buffer> Fmt

vmap <c-c> :w !pbcopy<CR><CR>

" 状态栏配置
set laststatus =2 "always has status line

syntax enable
set background=dark
colorscheme solarized


"
"插件相关配置
"
let g:autopep8_aggressive=2

let g:jedi#force_py_version=3
let g:jedi#smart_auto_mappings = 0
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#completions_enabled = 1

" NERDTree=====
" au VimEnter * NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=24
let NERDTreeIgnore=['\.pyc', '\.swp', '\~']
"switch window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" tagbar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
"let g:tagbar_left=1
noremap <Leader>y :TagbarToggle<CR>       " Display panel with y (or ,y)

" LustyBufferExplorer=====
"nnoremap <leader>lb :LustyBufExplorer<CR>
set hidden

"let g:syntastic_go_checkers=['go', 'govet', 'golint']
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='solarized256_dark'
let g:solarized_termtrans = 1
set t_Co=256                  " 在终端启用256色

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

Plugin 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


    """"""""""""""""""""""
    "Quickly Run
    """"""""""""""""""""""
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python2.7 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"  auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
