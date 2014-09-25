filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

"вечная отмена изменений
set undofile
set dir=~/.vim/swap/
set backupdir=~/.vim/backup/


"interface
set number
set ruler
set title
set showmatch
"set visualbell
set background=dark
set autoread
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set statusline=%<%f%h%m%r%=%{fugitive#statusline()}\ format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

"search
set smartcase
set hls

"middle mouse insert
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set foldenable
set foldmethod=manual
map <F9>  <esc>:call SWITCHFOLD()<cr>
function SWITCHFOLD()
    if &foldmethod=="marker"
        set foldmethod=syntax
        echo &foldmethod 
        return
    endif
    if &foldmethod=="syntax"
        set foldmethod=indent
        echo &foldmethod 
        return
    endif
    if &foldmethod=="indent"
        set foldmethod=manual
        echo &foldmethod 
        return
    endif
    if &foldmethod=="manual"
        set foldmethod=marker
        echo &foldmethod 
        return
    endif
endfunction

set pastetoggle=<F10>

"сдвиг блока на несколько табов
vnoremap <<gv vnoremap="">>gv

"tab autocomplete
function InsertTabWrapper()
	let col=col('.')-1
	if !col||getline('.')[col - 1]!~'\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>

" set complete=""
"	set complete+=
"	set complete+=b
"	set complete+=t
	"less support
"au BufNewFile,BufRead *.less set filetype=css	
au BufNewFile,BufRead *.roo set filetype=less	
"au BufNewFile,BufRead *.bemhtml set filetype=javascript	
" nerdTree
map <F2>  <esc>:NERDTreeToggle<cr>

"Encodings
set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf8
"set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

"fugitive
map <F3> <Esc>:Gstatus<CR>
imap <F3> <Esc>:Gstatus<CR>
map <F4> <Esc>:Git commit -a -m 
imap <F5> <Esc>:SyntasticCheck <CR>i
map  <F5> <Esc>:SyntasticCheck <CR>
imap <F6> <Esc>:Gdiff <CR>i
map <F6> <Esc>:Gdiff <CR>
"tabs
imap <F7> <Esc>:tabnew <CR>:NERDTree<cr>
map <F7> <Esc>:tabnew <CR>:NERDTree<CR>
imap <F8> <Esc>:tabc <CR>i
map <F8> <Esc>:tabc <CR>

"saving
map <C-S> <Esc>:w<CR>
imap <C-S> <Esc>:w<CR>i

"colors
colorscheme slate
