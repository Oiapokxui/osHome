" Maintainer:	Enrique Emanuel <enrique.emanuel@usp.br>
" Last change:	16 ABRIL 2020
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" 
"
"!!!!!!!!!!!!!!!!!!!!!!!!!!!!ATENÇÃO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"!								!
"! Sempre que salvar este arquivo, digite: ' :source ~/.vimrc ' !
"! ou ' :source $MYVIMRC ' ou reinicie o vim.					!
"!								!
"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"
"
"
" " When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set number "Permite exibir os numeros das linhas

set foldmethod=indent "Permite omitir partes do texto com base na indentacao
set foldlevelstart=1 "Abre, por padrão, 1 níveis de dobras

syntax on "Ativa o highlight de sintaxes
colorscheme gruvbox "Atual tema de cor: Gruvbox
set background=dark "Versao dark do tema

" Tecla leader agora é: ,
let mapleader=','
"Os dois comandos abaixo remapeiam o segundo caractere para o primeiro
nnoremap B 0 
nnoremap E $

"Ctrl +  W + (j ou k ou l ou h) trocavam de windows no vim
"Agora os comandos que fazem isso são CTRL + (j ou k ou l ou h)
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
"Troca o buffer atual e próximo de lugar
nnoremap <Leader>r <C-W>x
tnoremap <C-N> <C-W>N
" Search for word under cursor but not moving cursor 
nmap <silent> <space> *N
nmap s <space>cgn
"Permite com que a clipboard do SO seja usada para copiar e colar
"Para copiar para ela digite ` "+y `
"Para colar dela digite ` "+p `
set clipboard=unnamedplus

set shiftwidth=4		" always set indent size as 4 whitespaces
set tabstop=4
 
" No undo .un~ files
set noundofile
 
" -------------------AIRLINE-----------------------------
"   
" Set the airline theme
let g:airline_theme='wombat'
"
" -------------------NERDTree-----------------------------
"
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif
"  
" -------------------Coc-nvim-----------------------------
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" go to previous buffer, deleting actual buffer  
nmap <silent> gb :bp\|bd #<CR>
" go to previous (ultimo) buffer
nmap <silent> gu :bp<CR>
" go to next (prox) buffer
nmap <silent> gp :bn<CR>
" switch between header and source files
" (WILL OVERRIDE VIM'S SELECT MODE)
nmap <silent> gh :CocCommand clangd.switchSourceHeader<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" -------------------Coc-highlights-----------------------------
"
" Enable highlighting on cursor hold;
autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------------Tabularize-----------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
