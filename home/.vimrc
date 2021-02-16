"vimrc

" general settings
colors garbage-oracle
set t_Co=256
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
syntax on
set showmode
set showcmd
set cursorline
set showmatch

" status line
" to get a list of available colours run
" :so $VIMRUNTIME/syntax/hitest.vim
set laststatus=2
set statusline=				"Left side
set statusline+=%#Search#		"colour
set statusline+=\ %y			"filetype
set statusline+=\ %r			"readonly flag
set statusline+=%#StatusLine#		"colour
set statusline+=\ %F			"full path to file
set statusline+=%=			"Right side
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} "utf-8
set statusline+=\ [%{&fileformat}\]	"[unix]
set statusline+=\ %#Search#     	"colour
set statusline+=\ %l/%L			"line numbers
set statusline+=\ [%c]			"column number
