set tabpagemax=20
set background=dark
set mouse=a
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set expandtab
set shiftwidth=4
set softtabstop=4

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.twig"

execute pathogen#infect()
syntax on
filetype plugin indent on

let NERDTreeMapOpenInTab='<F12>'

:inoremap <F2> <Esc>:w<CR>i
:inoremap <F3> <Esc>ui
:inoremap <F4> <Esc><C-R>i
:inoremap <C-U> <Esc>Pi
:inoremap <C-O> <Esc>pi
:inoremap <C-D> <Esc>ddi
":inoremap ( ()<Esc>i
":inoremap [ []<Esc>i
":inoremap {<CR> {<Esc>:call Curly()<CR>i
:inoremap <c-up> 8<up>
:inoremap <c-down> 8<down>
:inoremap <c-left> 8<left>
:inoremap <c-right> 8<right>

:map <F2> :w<CR>
:map <F3> ui
:map <F4> <C-R>i
:map <F5> i<End><CR><Esc>
:map <F7> gT
:map <F8> gt
:map ll "_ddP
:map lk "_dP
:map de "_dd
:map ay :%y+<CR>
:map ad :%d+<CR>
:map t <CR>:Tab %<CR>
:map <c-up> 8<up>
:map <c-down> 8<down>
:map <c-left> 8<left>
:map <c-right> 8<right>

:setlocal omnifunc=javacomplete#Complete 

:function Curly()
:	let line = getline('.')
:	let tabsnr = 0
:	let i = 0
:	while i<len(line)
:		if line[i] != '\t'
:			break
:		endif
:		let tabsnr += 1
:		let i += 1
:	endwhile
:	exec 'put="ewgewgewgewgewgewgewgew"'
:	exec 'put="' . repeat('\t', tabsnr+1) . '"'
:	exec 'put="' . repeat('\t', tabsnr) . '}"'
:endfunction


:function Tab(name)
:	echo system('spi.sh ' . a:name)
:	exec "tabedit " . a:name
:endfunction

command! -nargs=1 -complete=file Tab call Tab('<args>')

:function CloseAll()
:	redir => message
:  	silent execute "tabs"
:  	redir END
:	let messages = split(message,'\n')
:	for i in messages
:		if i !~ '^Tab'
:			echo system('spi.sh ' . i[4:])
:		endif
:	endfor
:	exec "qa"
:endfunction

command! -nargs=0 CloseAll call CloseAll()

:function Close()
:	redir => message
:  	silent execute "echo @%"
:  	redir END
:	echo system('spi.sh ' . message[1:])
:	exec "q"
:endfunction

command! -nargs=0 Close call Close()
