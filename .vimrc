set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on
runtime! macros/matchit.vim

augroup mkd
  au BufRead,BufNewFile *.mkd,*.md,*.markdown setfiletype mkd
  au BufRead,BufNewFile *.md setfiletype mkd
  au BufRead,BufNewFile *.markdown setfiletype mkd
  au BufRead,BufNewFile *.citrus setfiletype citrus
  au BufRead,BufNewFile *.slim setfiletype slim
  au BufRead,BufNewFile *.coffee setfiletype coffee
  au BufRead,BufNewFile *.sls setfiletype yaml
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
  autocmd FileType gitcommit set tw=72 fo=tcroqw
  autocmd FileType coffee setl foldmethod=indent sw=2 et
augroup END

autocmd BufWritePost,FileWritePost * call AutoTag ()
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"colorscheme xoria256
set tags=tags;/
nnoremap <silent> <F8> :TagbarToggle<CR>
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
set relativenumber

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
let g:ctrlp_show_hidden=1

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
"nnoremap <silent> <F5> :Rdebugger %<CR>
nnoremap <leader>re :RdbEval 
nnoremap <leader>sr :%s/
"nnoremap <leader>ff :CommandTFlush<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack! 
nnoremap <leader>vv :Ack! <cword><CR>

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

let g:quickfixsigns_classes=['loc', 'qfl', 'vcsdiff', 'breakpoints']

"Powerline settings
let g:Powerline_symbols = 'unicode'

function! CloseHiddenBuffers()
    " Tableau pour memoriser la visibilite des buffers                                                                                      
    let visible = {}
    " Pour chaque onglet...
    for t in range(1, tabpagenr('$'))
        " Et pour chacune de ses fenetres...
        for b in tabpagebuflist(t)
            " On indique que le buffer est visible.
            let visible[b] = 1
        endfor
    endfor
    " Pour chaque numero de buffer possible...
    for b in range(1, bufnr('$'))
        " Si b est un numero de buffer valide et qu'il n'est pas visible, on le
        " supprime.
        if bufexists(b) && !has_key(visible, b)
            " On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
            " sont pourtant charges en memoire.
            execute 'bwipeout' b
        endif
    endfor
endfun

function! s:ExecuteInShell(command, bang)
	let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

	if (_ != '')
		let s:_ = _
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')
		silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap
		silent! :%d
		let message = 'Execute ' . _ . '...'
		call append(0, message)
		echo message
		silent! 2d | resize 1 | redraw
		silent! execute 'silent! %!'. _
		silent! execute 'resize ' . line('$')
		silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
	endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell
