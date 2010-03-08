set nocompatible
syntax on
filetype plugin indent on
runtime! macros/matchit.vim

augroup myfiletypes
  autocmd!
  autocmd FileType haml,sql set ai sw=2 sts=2 et foldmethod=indent
  autocmd FileType javascript set ai sw=2 sts=2 et 
  autocmd FileType cucumber,ruby,eruby,yaml,vim set ai sw=2 sts=2 et foldmethod=syntax
  autocmd FileType vim set foldmethod=indent
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
augroup END

autocmd BufWritePost,FileWritePost * call AutoTag ()
set tags=tags;/
nnoremap <silent> <F8> :TlistToggle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set updatetime=1000

set statusline=%F%m%r%h%w\ [%{&fenc}][%{&ff}][%Y]\ #%{winnr()}%=[\%03.3b,\%02.2B][%l/%L,%v][%p%%]
set laststatus=2

"split window below, and split to the right
set sb
set spr

set cf
set clipboard+=unnamed
set history=256
set autowrite
set ruler
set nu
set nowrap
set timeoutlen=1000

set incsearch
set hlsearch

set cindent
set autoindent
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case,elsif

set showmatch
set mat=5
set vb t_vb=''
set laststatus=2

set ignorecase
set smartcase

set scrolloff=3

let mapleader=","

set textwidth=80
set fo=croqwa

"Map autocompletion to ctrl+space
inoremap <Nul> <C-x><C-o>
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"Make backspace work like other editors
set backspace=indent,eol,start

let g:fuzzy_matching_limit=50

" camelcasemotion plugin mappings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e 

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
map <leader>t :FufFile<CR>
map <leader>f :FufBuffer<CR>

nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :Rdebugger %<CR>
nnoremap <leader>re :RdbEval 

let xml_use_xhtml = 1
