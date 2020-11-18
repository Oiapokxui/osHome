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
"! ou reinicie o vim.						!
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

"Os dois comandos abaixo remapeiam o segundo caractere para o primeiro
nnoremap B 0 
nnoremap E $

"Ctrl +  W + (j ou k ou l ou h) trocavam de windows no vim
"Agora os comandos que fazem isso são CTRL + (j ou k ou l ou h)
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <Leader>r <C-W>r
tnoremap <C-N> <C-W>N

"Permite com que a clipboard do SO seja usada para copiar e colar
"Para copiar para ela digite ` "+y `
"Para colar dela digite ` "+p `
set clipboard=unnamedplus

set shiftwidth=4		" always set indent size as 4 whitespaces
set tabstop=4
