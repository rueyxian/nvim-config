

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
Plug 'fatih/vim-go'

call plug#end()

" ----------------------------------------}}}


" Color Scheme ----------------------------------------{{{

"colorscheme molokai
"normal! :AirlineTheme molokai

colorscheme gruvbox	
normal! :AirlineTheme gruvbox

"let g:gruvbox_contrast_dark='hard'
"let g:airline_powerline_fonts = 1
"let g:airline_left_sep= '▶'
"let g:airline_right_sep= '◀'
"

" ----------------------------------------}}}

"ctrlpvim/ctrlp.vim ----------------------------------------{{{

" ----------------------------------------}}}


" scrooloose/nerdtree ----------------------------------------{{{

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <silent> <leader>tf :NERDTreeFind<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = 'ᐳ'
let g:NERDTreeDirArrowCollapsible = 'ᐯ'
"nnoremap <c-j> :NERDTree-j
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:TList_WinWidth = 40
" ----------------------------------------}}}



"================================================================================
" rip grep plugin
"================================================================================
"if executable('rg')
"  let g:rg_derive_root='true'
"endif


" kien/ctrlp plugini
"================================================================================
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_use_caching = 0


"================================================================================
" netrw
"================================================================================
"let g:netrw_browse_split = 2
"let g:netrw_banner = 0
"let g:netrw_winsize = 25




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

set hidden

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



" key mapping ----------------------------------------{{{

"command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd FileType vim nnoremap <buffer> <F11> :source %<cr>

let mapleader = " "

"# options shortcut ----------------------------------------{{{
nnoremap <F3> :set nu! <CR>
nnoremap <leader><F3> :set rnu! <CR>
nnoremap <F2> :set list! <CR>
nnoremap <F4> :set hlsearch! <CR>
" ----------------------------------------}}}
"
"# edit vimrc ----------------------------------------{{{
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <F12> :edit $MYVIMRC<cr>
" ----------------------------------------}}}

"# remove highlight ----------------------------------------{{{
nnoremap <leader>rmh :call RemoveHighlight() <cr>

function! RemoveHighlight()
	let @/ = "" 		
endfunction
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
nnoremap <cr> o<esc>
nnoremap <s-cr> O<esc>
nnoremap <c-cr> o
nnoremap <c-s-cr> O

"nnoremap o o<esc>
"nnoremap <s-o> O<esc>
"nnoremap <c-o> o
"nnoremap <c-s-o> O

inoremap <c-cr> <esc>o
inoremap <c-s-cr> <esc>O
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

" ----------------------------------------}}}



