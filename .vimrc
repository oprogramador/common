set tabpagemax=20
set background=dark
set mouse=a
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set shiftwidth=2
set softtabstop=2
set ts=4 sw=4 expandtab

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

au BufRead,BufNewFile *.plez set filetype=plezuro
autocmd Filetype plezuro set syntax=plezuro

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.twig,*.php"



let g:ftp_conf = {
\ 'local_base_path' : '/home/pierre/ftp-client/',
\ 'remote_base_path' : '/home/pierre/ftp-server/',
\ 'local_backup_path' : '/home/pierre/pierre_copy/undo/',
\ 'user' : 'pierre',
\ 'pass' : 'password',
\ 'host' : '127.0.0.1',
\ 'silent' : 0
\ }


execute pathogen#infect()
syntax on
filetype plugin indent on

let NERDTreeMapOpenInTab='<F12>'
let g:NERDTreeDirArrows=0

inoremap <F2> <Esc>:w<CR>i
inoremap <F3> <Esc>ui
inoremap <F4> <Esc><C-R>i
inoremap <C-Y> <Esc>Pi
inoremap <C-U> <Esc>pi
inoremap <C-D> <Esc>ddi
inoremap <c-up> <C-o>8i<up><Esc>
inoremap <c-down> <C-o>8i<down><Esc>
inoremap <c-left> <C-o>8i<left><Esc>
inoremap <c-right> <C-o>8i<right><Esc>
inoremap <c-r> <Esc>:call RandChar()<cr>i
                                
map <F2> :w<CR>
map <F3> ui
map <F4> <C-R>i
map <F5> i<End><CR><Esc>
map <F7> gT
map <F8> gt
map <F9> :tabfirst<CR><c-w><left>
map ll "_ddP
map lk "_dP
map de "_dd
map ay :%y+<CR>
map ad :%d+<CR>
map t <CR>:Tab %<CR>
map <c-up> 8<up>
map <c-down> 8<down>
map <c-left> 8<left>
map <c-right> 8<right>
map <c-d> daw

setlocal omnifunc=javacomplete#Complete 

function Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

function RandChar()
    return nr2char(Rand()%256)
endfunction 

command! -nargs=0 RandChar :normal i call Tab('<args>')
