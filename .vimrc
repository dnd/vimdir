set nocompatible

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
runtime! macros/matchit.vim

augroup mkd
  au BufRead,BufNewFile *.mkd,*.md,*.markdown setfiletype mkd
  au BufRead,BufNewFile *.md setfiletype mkd
  au BufRead,BufNewFile *.markdown setfiletype mkd
  au BufRead,BufNewFile *.citrus setfiletype citrus
  au BufRead,BufNewFile *.slim setfiletype slim
augroup END

augroup myfiletypes
  autocmd!
  autocmd FileType haml,sql,slim set ai sw=2 sts=2 et foldmethod=indent
  autocmd FileType html,javascript set ai sw=2 sts=2 et 
  autocmd FileType citrus,cucumber,ruby,eruby,yaml,vim set ai sw=2 sts=2 et foldmethod=syntax
  autocmd FileType vim set foldmethod=indent
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

autocmd BufWritePost,FileWritePost * call AutoTag ()
set tags=tags;/
nnoremap <silent> <F8> :TlistToggle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set updatetime=1000

set statusline=%F%m%r%h%w\ [%{&fenc}][%{&ff}][%Y]\ #%{winnr()}%=[\%03.3b,\%02.2B][%l/%L,%v][%p%%]
set laststatus=2
set backupdir=/tmp
set directory=/tmp

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

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
set fo=croqw
set switchbuf=usetab

"Map autocompletion to ctrl+space
inoremap <Nul> <C-x><C-o>
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"Make backspace work like other editors
set backspace=indent,eol,start

nmap <silent> <leader><space> :nohlsearch<CR>
inoremap jj <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
"nnoremap : ;

let g:fuzzy_matching_limit=50

" camelcasemotion plugin mappings
no W w
no B b
no E e
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
"sunmap e 

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
"map <leader>t :FufFile<CR>
"map <leader>o :FufBuffer<CR>

nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :Rdebugger %<CR>
nnoremap <leader>re :RdbEval 
nnoremap <leader>sr :%s/
"nnoremap <leader>ff :CommandTFlush<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack 

let xml_use_xhtml = 1
" prevent supertab from hijacking endwise
let g:SuperTabCrMapping = 0

map <silent> <m-1> :tabn 1<CR>
map <silent> <m-2> :tabn 2<CR>
map <silent> <m-3> :tabn 3<CR>
map <silent> <m-4> :tabn 4<CR>
map <silent> <m-5> :tabn 5<CR>
map <silent> <m-6> :tabn 6<CR>
map <silent> <m-7> :tabn 7<CR>
map <silent> <m-8> :tabn 8<CR>
map <silent> <m-9> :tabn 9<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
