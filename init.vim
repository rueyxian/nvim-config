

" Plugins ----------------------------------------{{{

call plug#begin('~/.vim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf'
"Plug 'valloric/youcompleteme'
"Plug 'mbbill/undotree'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimproc.vim'
Plug 'fatih/vim-go'

call plug#end()

" ----------------------------------------}}}


let mapleader = " "


" Color Scheme ----------------------------------------{{{

colorscheme molokai
normal! :AirlineTheme molokai

"colorscheme gruvbox	
"normal! :AirlineTheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"
"let g:airline_powerline_fonts = 1
"let g:airline_left_sep= '▶'
"let g:airline_right_sep= '◀'
"

" ----------------------------------------}}}

"ctrlpvim/ctrlp.vim ----------------------------------------{{{
let g:ctrlp_cmd = 'CtrlPBuffer'
" ----------------------------------------}}}

" scrooloose/nerdtree ----------------------------------------{{{
cd e:/dev
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"nnoremap <silent> <leader><leader>t :NERDTreeFind<cr>
"nnoremap <silent> <leader>t :NERDTreeToggle<CR>

nnoremap <leader><leader>f :NERDTreeFind<cr>
nnoremap <leader>f :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = 'ᐳ'
let g:NERDTreeDirArrowCollapsible = 'ᐯ'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:TList_WinWidth = 40
" ----------------------------------------}}}
"



" Initialize Options ----------------------------------------{{{

syntax on

set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
"set smartindent
set number
set relativenumber
set nowrap
set textwidth=0
set splitright
"set smartcase 
"set noswapfile
"set nobackup
"set undodir=~/.vim/undodir
"set undofile
set incsearch
set hlsearch

set list
"space:  u00B7
"tab:    u2192
"eol:    u21b2
set listchars=space:·,tab:→\ ,eol:↲

"set splitright
set scrolloff=999
"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey
if has('nvim')
	highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

set hidden

"autocmd BufCreate,BufEnter * lcd %:p:h
"
" ----------------------------------------}}}


" Fold Marker ----------------------------------------{{{

autocmd FileType vim setlocal foldmethod=marker 
autocmd FileType vim setlocal foldmarker={{{,}}}

autocmd FileType vim nnoremap <buffer> <leader>fm{ :call AddFoldMarkerOpen()<cr>
autocmd FileType vim nnoremap <buffer> <leader>fm} :call AddFoldMarkerClose()<cr>

function! AddFoldMarkerOpen()
	call RemoveTrailingWhiteSpace()
	execute "normal! a "
	call RepeatCharacterAtCursor('-',40)
	call RepeatCharacterAtCursor('{',3)
	call CommentOutIfNot()
endfunction

function! AddFoldMarkerClose()
	call RemoveTrailingWhiteSpace()
	execute "normal! a "
	call RepeatCharacterAtCursor('-',40)
	call RepeatCharacterAtCursor('}',3)
	call CommentOutIfNot()
endfunction

" ----------------------------------------}}}

" command ----------------------------------------{{{

"cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"# change to directory of current file ----------------------------------------{{{
command! Cdc cd %:p:h
" ----------------------------------------}}}

"# remove search highlight ----------------------------------------{{{
command! Hlc let @/=""
" ----------------------------------------}}}

"# clear messages ----------------------------------------{{{
command! Msg :messages
command! Msgc :messages clear
" ----------------------------------------}}}

"# toggle number and relative number ----------------------------------------{{{
command! Nu :set nu!<CR>
command! Rnu :set rnu!<CR>
" ----------------------------------------}}}

"# toggle list ----------------------------------------{{{
command! List :set list!<CR>
" ----------------------------------------}}}

" ----------------------------------------}}}


" key mapping ----------------------------------------{{{

"command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
"autocmd FileType vim nnoremap <buffer> <F11> :source %<cr>

"# kill buffer ----------------------------------------{{{
nnoremap <F10> :bd <CR>
nnoremap <C-F10> :bd! <CR>
" ----------------------------------------}}}
"
"# edit vimrc or resource vimrc ----------------------------------------{{{
nnoremap <expr> <F12> &filetype ==# 'vim' ? ":source %<CR>" : ":edit $MYVIMRC<CR>"
" ----------------------------------------}}}

"# terminal emulator ----------------------------------------{{{

tnoremap <C-j> <C-\><C-n>

"nnoremap <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

nnoremap <expr> <F2> expand('%:t')==#'cmd.exe' ? ":bd!<CR>" : ":cd %:p:h<CR>:terminal<CR>"
nnoremap <C-F2> :terminal<CR>
" ----------------------------------------}}}

"# remap jkhl motion ----------------------------------------{{{
"nnoremap - u
"nnoremap u i
"nnoremap o a
"
"nnoremap i k
"nnoremap k j
"nnoremap j h
"nnoremap l l
"
"vnoremap i k
"vnoremap k j
"vnoremap j h
"vnoremap l l
" ----------------------------------------}}}

"# escape insert mode ----------------------------------------{{{
inoremap <c-j> <esc>
" ----------------------------------------}}}
"
"# move next 'eow' and previous 'bow' ----------------------------------------{{{
"nnoremap H <nop>
"nnoremap L <nop>
nnoremap <c-h> b
nnoremap <c-l> e
"nnoremap <c-s-h> B
"nnoremap <c-s-l> E
nnoremap <s-h> B
nnoremap <s-l> E
" ----------------------------------------}}}
"
"# extends 'j' and 'k's motion ----------------------------------------{{{
nnoremap <c-j> 7j
nnoremap <c-k> 7k
" ----------------------------------------}}}
"
"# move to 'bol' and 'eol' ----------------------------------------{{{
nnoremap <leader>h ^
nnoremap <leader>l g_
nnoremap <leader><s-h> 0
nnoremap <leader><s-l> $
" ----------------------------------------}}}
"
"# reverse delete character ----------------------------------------{{{
inoremap <c-bs> <right><bs>
" ----------------------------------------}}}
"
"delete line ----------------------------------------{{{
nnoremap dD 0d$
" ----------------------------------------}}}
"
"# yank current line to next/previous line ----------------------------------------{{{
"nnoremap <c-y> ddp
"nnoremap <c-s-y> ddkP
nnoremap <c-\> ddp 
nnoremap <c-s-\> ddkP 
" ----------------------------------------}}}
"
"# carriage return ----------------------------------------{{{
nnoremap \ <cr>
" ----------------------------------------}}}
"
"# open line ----------------------------------------{{{
"nnoremap <cr> o<esc>
"nnoremap <s-cr> O<esc>
"nnoremap <c-cr> o
"nnoremap <c-s-cr> O

nnoremap o o<esc>
nnoremap <s-o> O<esc>
nnoremap <c-o> o
nnoremap <c-s-o> O
" ----------------------------------------}}}

"# wrap word with text object ----------------------------------------{{{
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>E
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>E
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>E
nnoremap <leader>< viw<esc>a><esc>bi<<esc>E
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>E
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>E
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>E

nnoremap <leader><leader>[ viW<esc>a]<esc>Bi[<esc>E
nnoremap <leader><leader>( viW<esc>a)<esc>Bi(<esc>E
nnoremap <leader><leader>{ viW<esc>a}<esc>Bi{<esc>E
nnoremap <leader><leader>< viW<esc>a><esc>Bi<<esc>E
nnoremap <leader><leader>' viW<esc>a'<esc>Bi'<esc>E
nnoremap <leader><leader>" viW<esc>a"<esc>Bi"<esc>E
nnoremap <leader><leader>` viW<esc>a`<esc>Bi`<esc>E
" ----------------------------------------}}}
"
"# wrap highlighted with text object ----------------------------------------{{{
vnoremap <leader>[ di[]<esc>hp
vnoremap <leader>( di()<esc>hp
vnoremap <leader>{ di{}<esc>hp
vnoremap <leader>< di<lt>><esc>hp
"vnoremap <leader>< di<<esc>i><esc>
vnoremap <leader>' di''<esc>hp
vnoremap <leader>" di""<esc>hp
vnoremap <leader>` di``<esc>hp
" ----------------------------------------}}}
"
"# enable text-object selection without postion cursor inside text-object ----------------------------------------{{{
onoremap i[ :<c-u>normal! f[vi[<cr>
onoremap i{ :<c-u>normal! f{vi{<cr>
onoremap i< :<c-u>normal! f<vi<<cr>
onoremap i' :<c-u>normal! f'vi'<cr>
onoremap i" :<c-u>normal! f"vi"<cr>
onoremap i` :<c-u>normal! f`vi`<cr>

onoremap I[ :<c-u>normal! F[vi[<cr>
onoremap I( :<c-u>normal! F(vi(<cr>
onoremap I{ :<c-u>normal! F{vi{<cr>
onoremap I< :<c-u>normal! F<vi<<cr>
onoremap I' :<c-u>normal! F'vi'<cr>
onoremap I" :<c-u>normal! F"vi"<cr>
onoremap I` :<c-u>normal! F`vi`<cr>

" ----------------------------------------}}}

" ----------------------------------------}}}



" Helper Functions ----------------------------------------{{{
"
function! CursorCharacter()	
	return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction

function! CommentOutIfNot()	
	normal! ^
	let l:cursor = CursorCharacter()
	if l:cursor !=# "\""
		normal! 0i"
	endif
endfunction

function! RepeatCharacterAtCursor(character, count)
	let l:i = 0
	while i < a:count
		execute "normal!a".a:character
		let l:i += 1
	endwhile
endfunction

function! RemoveTrailingWhiteSpace()
	normal! $
	while CursorCharacter() ==# " "
		normal! x
	endwhile
endfunction

function! StringReplaceCharacter(str, char, replace)
	let l:ret = ''	
	for c in split(a:str, '\zs')	
		if c ==# a:char
			let l:ret .=  a:replace	
		else
			let l:ret .= c
		endif
	endfor
	return l:ret
endfunction

" ----------------------------------------}}}



