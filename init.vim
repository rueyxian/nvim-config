

"===================
"      Plugins      
"===================
" ----------------------------------------{{{
call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-fugitive'
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'qpkorr/vim-bufkill'
"Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'mattn/emmet-vim'


call plug#end()
" ----------------------------------------}}}

"====================
"      Settings      
"====================
" ----------------------------------------{{{
let mapleader = " "
filetype on
filetype plugin on
filetype indent on
set ttyfast
set encoding=utf-8
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
"set expandtab
"set smartindent
set ruler
set number
set relativenumber
set nowrap
set textwidth=0                                "a line will no longer be borken to next line when pasting certain length of line
set formatoptions-=o                            "remove auto comment when open a new line from a commented line in normal mode
set formatoptions-=r                            "remove auto comment when open a new line from a commented line in insert mode
set splitright
set splitbelow
set noswapfile
set nobackup
set fileformats=unix,dos,mac
set hidden                                      "retain buffer when window is closed 
"set undodir=~/.vim/undodir
"set undofile
set incsearch                                   "highlight matches every typing
set hlsearch                                    "highlight found searches
set nocursorcolumn                              "disable verticle cursor highlight
set nocursorline                                "disable horizontal cursor hightlight
set lazyredraw
set noshowcmd
set list
set listchars=space:·,tab:→\ ,eol:↲             "[space: u00B7][tab: u2192][eol: u21b2]
set scrolloff=999
set autowrite
set omnifunc=syntaxcomplete#Complete
" set completeopt=menuone,preview,noinsert,noselect
set completeopt=menuone,preview,noinsert

set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor


if has('nvim')
	"some how does not werk =(
	highlight! TermCursorNC guibg=red guifg=white ctermbg=12 ctermfg=15
endif


" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

"# persist undo/redo tree of buffer after closing
if has('persistent_undo')
	set undofile
	set undodir=~/.vim/undodir
endif

"autocmd BufCreate,BufEnter * lcd %:p:h
"autocmd! 
"autocmd BufEnter * lcd %:p:h

augroup changeDirCurr
	autocmd!
	"auto change directory to current buffer (exclude terminal type)
	autocmd BufCreate,BufEnter * if &buftype !=# 'terminal'| lcd %:p:h  | endif
augroup END	

" ----------------------------------------}}}


"========================
"      Color Scheme      
"========================
" ----------------------------------------{{{
syntax on

" let g:airline_theme='gruvbox'
" let g:gruvbox_termcolors=256
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox	

highlight SignColumn guibg=#272822
let g:rehash256 = 1
let g:molokai_original=1
let g:airline_theme='molokai'
let NERDTreeIgnore = ['_site']
colorscheme molokai
" ----------------------------------------}}}


"==============================
"      ctrlpvim/ctrlp.vim      
"==============================
" ----------------------------------------{{{

"# CtrlPBuf as first mode ----------------------------------------{{{
let g:ctrlp_cmd = 'CtrlPBuffer'
" ----------------------------------------}}}

"# exit CtrlP 
let g:ctrlp_prompt_mappings = { 
	\	'PrtHistory(1)'     : ['<c-s-n>'],
	\	'PrtExit()'         : ['<c-p>', '<esc>'],
	\	}

"# delete buffer in CtrlPBuf Mode ----------------------------------------{{{
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
	" nnoremap <buffer> <silent> <C--> :call <sid>DeleteBuffer(0)<CR>
	nnoremap <buffer> <silent> <C--> :call <sid>DeleteBuffer(1)<CR>
endfunc

func! s:DeleteBuffer(force)
	 let line = getline('.')
	 let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
			 \ : fnamemodify(line[2:], ':p')
	if a:force ==# 0 
		execute "bd" bufid
	else
		 execute "bd!" bufid	
	endif
	 exec "norm \<F5>"
endfunc 
" ----------------------------------------}}}

" ----------------------------------------}}}

"===================================
"      scrooloose/nerdcommeter      
"===================================
" ----------------------------------------{{{
" let g:NERDCreateDefaultMappings = 0

"NERDCommenterToggle, for some reason vim registers <C-/> as <C-_>
map <C-_> <plug>NERDCommenterToggle

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lins is commented or not 
let g:NERDToggleCheckAllLines = 1
" ----------------------------------------}}}


"===============================
"      scrooloose/nerdtree      
"===============================
" ----------------------------------------{{{
cd $HOME/go/src
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <C-F2> :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
cnoreabbrev NT <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'NERDTree' : 'NT')<CR>

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


"========================
"      junegunn/fzf      
"========================
" ----------------------------------------{{{
 "Open files in horizontal split
"noremap <silent> <Leader>s :call fzf#run({
"\   'down': '40%',
"\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
"nnoremap <silent> <Leader>v :call fzf#run({
"\   'right': winwidth('.') / 2,
"\   'sink':  'vertical botright split' })<CR>

"# select buffers
" ----------------------------------------{{{
"function! s:buflist()
  "redir => ls
  "silent ls
  "redir END
  "return split(ls, '\n')
"endfunction

"function! s:bufopen(e)
  "execute 'buffer' matchstr(a:e, '^[ 0-9]*')
"endfunction

"nnoremap <silent> <Leader><Enter> :call fzf#run({
"\   'source':  reverse(<sid>buflist()),
"\   'sink':    function('<sid>bufopen'),
"\   'options': '+m --bind ctrl-k:up,ctrl-j:down',
"\   'down':    len(<sid>buflist()) + 2
"\ })<CR>

"nnoremap <silent> <Leader>p :call fzf#run({
			"\	'source': 'rg --files --column --no-heading --hidden --follow --glob "!.git/*"', 'sink': 'e', 'down': '~30%', 'options': '--bind ctrl-o:up,ctrl-l:down'})<cr>


" ----------------------------------------}}}

"# Open FZF search
"nnoremap <C-f> :Files!<CR>
"nnoremap <C-f> :Files<CR>
"inoremap <C-f> <Esc>:BLines!<CR>
inoremap <C-f> <Esc>:BLines!<CR> 
nnoremap <C-f>  :call fzf#run(fzf#wrap({'dir': '~'}))

" ----------------------------------------}}}


"========================
"      fatih/vim-go      
"========================
" ----------------------------------------{{{
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

  " :GoBuild and :GoTestCompile
  "autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
	
  " :GoTest
  "autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  "autocmd FileType go nmap <leader>r <Plug>(go-run)

  " :GoDoc
  "autocmd FileType go nmap <Leader>d <Plug>(go-doc)
	autocmd FileType go cnoreabbrev godoc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoDoc' : 'godoc')<CR>

  " :GoCoverageToggle
  "autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  "autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go cnoreabbrev goinfo <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoInfo' : 'goinfo')<CR>

  " :GoMetaLinter
  "autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

	" :GoImplements
	autocmd FileType go cnoreabbrev goimpl <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoImplements' : 'goimpl')<CR>

	" :GoRename
	autocmd FileType go cnoreabbrev gorename <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoRename' : 'gorename')<CR>

	" :GoDef
	autocmd FileType go cnoreabbrev godef <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoDef' : 'godef')<CR>

  " :GoDef but opens in a vertical split
	" autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
	autocmd FileType go nmap <buffer> <Leader>gv <Plug>(go-def-vertical)

  " :GoDef but opens in a horizontal split
  "autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
	autocmd FileType go nmap <buffer> <Leader>gh <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction 
" ----------------------------------------}}}


"=============================
"      neoclide/coc.nvim      
"=============================
" ----------------------------------------{{{
"
" ----------------------------------------}}}




"====================
"      Commands      
"====================
" ----------------------------------------{{{

"# change directory to current buffer(not using, because autocmd do the work) ----------------------------------------{{{
"command! Cdc  lcd %:p:h
" ----------------------------------------}}}

"# remove search highlight ----------------------------------------{{{
cnoreabbrev hlc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "let @/=''" : "hlc")<CR>
" ----------------------------------------}}}

"# clear messages ----------------------------------------{{{
cnoreabbrev msg <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "messages" : "msg")<CR>
cnoreabbrev msgc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "messages clear" : "msgc")<CR>
" ----------------------------------------}}}

"# help close ----------------------------------------{{{
cnoreabbrev hc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "helpc" : "hc")<CR>
" ----------------------------------------}}}

"# toggle number and relative number ----------------------------------------{{{
command! Nu :set nu!<CR>
command! Rnu :set rnu!<CR>
" ----------------------------------------}}}

"# toggle list ----------------------------------------{{{
command! List :set list!<CR>
" ----------------------------------------}}}


"# repeat character  ----------------------------------------{{{
cnoreabbrev rpchar <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'RpChar' : 'rpchar')<CR>
command! -nargs=+ RpChar call RepeatCharacter(<f-args>)

function! RepeatCharacter(string, count)
	if a:count =~ '\d'
	call RepeatCharacterAtCursor(a:string, a:count)
	else	
		echom "second argument has to be an integer"
	endif
endfunc
" ----------------------------------------}}}


"# get file path ----------------------------------------{{{
cnoreabbrev <silent> filepathfromhome <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call FilePath()" : "filepathfromhome")<CR>
function! FilePath()	
	if stridx(getcwd(), $HOME) ==# 0
		let l:filepath = "~".getcwd()[strlen($HOME):]
		echom "clipboard copied: ".l:filepath
		let @+ = l:filepath
	else
		echom "clipboard copy failed"
	endif
endfunction
" ----------------------------------------}}}


"# get go file path ----------------------------------------{{{
autocmd FileType go cnoreabbrev <silent> gofilepath <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call GoFilePath()" : "gofilepath")<CR>
function! GoFilePath()	
	let l:srcPath = $GOPATH . "/src/"
	if stridx(getcwd(), l:srcPath) ==# 0		"Check if srcPath is the substring of cwd and it's start from index 0
		let l:gofilepath = getcwd()[strlen(l:srcPath):]
		echom "clipboard copied: ". l:gofilepath
		let @+ = 	l:gofilepath
	else
		echom "clipboard copy failed"
	endif
endfunction
" ----------------------------------------}}}


" ----------------------------------------}}}


"========================
"      Key Mappings      
"========================
" ----------------------------------------{{{
"command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
"autocmd FileType vim nnoremap <buffer> <F11> :source %<CR>


"# linewise vertical motion (if &warp=1) ----------------------------------------{{{
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
" ----------------------------------------}}}

"# buffers ----------------------------------------{{{
"delete buffer without closing window (using ctrlpvim/ctrlp.vim plugin) 
" nnoremap <F10> :BD<CR>
nnoremap <F10> :BD!<CR>

"delete buffer
" nnoremap <Leader><F10> :bd<CR>
nnoremap <Leader><F10> :bd!<CR>

"next/prev buffer
nnoremap \ :bn<CR>
nnoremap <C-\> :bp<CR>
" ----------------------------------------}}}
"
"# edit vimrc or resource vimrc ----------------------------------------{{{
nnoremap <expr> <F12> &filetype ==# 'vim' ? ":source %<CR>" : ":edit $MYVIMRC<CR>"
" ----------------------------------------}}}

"# create/delete terminal emulator buffer ----------------------------------------{{{
"create terminal buffer and cd to current directory
"delete terminal buffer by using qpkorr/vim-bufkill plugin to retain the window
nnoremap <expr> <F3> &buftype ==# 'terminal' ? ":BD!<CR>" : ":cd %:p:h<CR>:terminal<CR>i"
nnoremap <expr> <Leader><F3> &buftype ==# 'terminal' ? ":bd!<CR>" : ":cd %:p:h<CR>:vsp<CR>:terminal<CR>i"
nnoremap <C-F3> :terminal<CR>

tnoremap <F3> <C-\><C-n>:BD!<CR>
tnoremap <Leader><F3> <C-\><C-n>:bd!<CR>
" ----------------------------------------}}}

"# navigate errors & close quickfix window ----------------------------------------{{{
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" ----------------------------------------}}}

"# escape to normal mode ----------------------------------------{{{
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
tnoremap <C-l> <C-\><C-n>
" ----------------------------------------}}}

"# omni completion ----------------------------------------{{{
"auto close preview window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

"toggle omni completion
inoremap <expr> <C-Space> pumvisible() ? "<C-e>" : "<C-x><C-o>"

" open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"navigation
inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"
inoremap <expr> <C-d> pumvisible() ? "<C-n><C-n><C-n><C-n><C-n>" : "<C-d>"
inoremap <expr> <C-u> pumvisible() ? "<C-p><C-p><C-p><C-p><C-p>" : "<C-u>"

"accept completion
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
" ----------------------------------------}}}

"# move next 'eow' and previous 'bow' ----------------------------------------{{{
" nnoremap <C-h> b
" nnoremap <C-l> e
" "nnoremap <C-S-h> B
" "nnoremap <C-S-l> E
" nnoremap <S-h> B
" nnoremap <S-l> E
" ----------------------------------------}}}
"
"# extends 'j' and 'k's motion ----------------------------------------{{{
nnoremap <C-j> 7j
nnoremap <C-k> 7k
" ----------------------------------------}}}
"
"# move to 'bol' and 'eol' ----------------------------------------{{{
nnoremap <silent> <C-l> :call NavigateEOL() <CR>
nnoremap <silent> <C-h> :call NavigateBOL() <CR>

function! NavigateEOL()	
	let l:col1 = virtcol('.')
	execute "normal! g_"
	let l:col2 	= virtcol('.') 
	if l:col1 ==# l:col2 
		execute "normal! $"
	endif
endfunction

function! NavigateBOL()	
	let l:col1 = virtcol('.')
	execute "normal! ^"
	let l:col2 	= virtcol('.') 
	if l:col1 ==# l:col2 
		execute "normal! 0"
	endif
endfunction

" nnoremap <Leader>h ^
" nnoremap <Leader>l g_
" nnoremap <Leader><S-h> 0
" nnoremap <Leader><S-l> $
" ----------------------------------------}}}

"# character deletion in insert mode ----------------------------------------{{{
"delete word after cursor (simlar to <C-w>, delete word before cursor>
inoremap <C-e> <C-o>de

"reverse backspace
inoremap <C-BS> <C-o>x

"remark: <C-o> escapes to do one normal-mode command, and then return to the insert mode
" ----------------------------------------}}}

"# delete line without deleting 'eol' ----------------------------------------{{{
nnoremap dD 0d$
" ----------------------------------------}}}

"# yank until the end of the line ----------------------------------------{{{
nnoremap Y y$
" ----------------------------------------}}}

"# yank current line to next/previous line ----------------------------------------{{{
"nnoremap <C-y> ddp
"nnoremap <C-S-Y> ddkP
"nnoremap <C-S-y> ddkP
"nnoremap <C-\> ddp 
"nnoremap <C-S-\> ddkP 
" ----------------------------------------}}}

"# create space without leaving normal mode ----------------------------------------{{{
nnoremap <C-Space> a<Space><Esc>
" ----------------------------------------}}}

"# open line ----------------------------------------{{{
nnoremap o o<Esc>
nnoremap <S-o> O<Esc>
"verbose nnoremap <C-o> o
"verbose nnoremap <C-S-o> O
" ----------------------------------------}}}

"# wrap word with text object ----------------------------------------{{{
nnoremap <Leader>[ viw<Esc>a]<Esc>bi[<Esc>E
nnoremap <Leader>( viw<Esc>a)<Esc>bi(<Esc>E
nnoremap <Leader>{ viw<Esc>a}<Esc>bi{<Esc>E
nnoremap <Leader>< viw<Esc>a><Esc>bi<<Esc>E
nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>E
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>E
nnoremap <Leader>` viw<Esc>a`<Esc>bi`<Esc>E

nnoremap <Leader><Leader>[ viW<Esc>a]<Esc>Bi[<Esc>E
nnoremap <Leader><Leader>( viW<Esc>a)<Esc>Bi(<Esc>E
nnoremap <Leader><Leader>{ viW<Esc>a}<Esc>Bi{<Esc>E
nnoremap <Leader><Leader>< viW<Esc>a><Esc>Bi<<Esc>E
nnoremap <Leader><Leader>' viW<Esc>a'<Esc>Bi'<Esc>E
nnoremap <Leader><Leader>" viW<Esc>a"<Esc>Bi"<Esc>E
nnoremap <Leader><Leader>` viW<Esc>a`<Esc>Bi`<Esc>E
" ----------------------------------------}}}
"
"# wrap highlighted with text object ----------------------------------------{{{
vnoremap <Leader>[ di[]<Esc>hp
vnoremap <Leader>( di()<Esc>hp
vnoremap <Leader>{ di{}<Esc>hp
vnoremap <Leader>< di<lt>><Esc>hp
vnoremap <Leader>' di''<Esc>hp
vnoremap <Leader>" di""<Esc>hp
vnoremap <Leader>` di``<Esc>hp
" ----------------------------------------}}}
"
"# enable text-object selection without postion cursor inside text-object ----------------------------------------{{{
onoremap i[ :<C-u>normal! f]vi[<CR>
onoremap i( :<C-u>normal! f)vi(<CR>
onoremap i{ :<C-u>normal! f}vi{<CR>
onoremap i< :<C-u>normal! f>vi<<CR>
onoremap i' :<C-u>normal! f'vi'<CR>
onoremap i" :<C-u>normal! f"vi"<CR>
onoremap i` :<C-u>normal! f`vi`<CR>

onoremap I[ :<C-u>normal! F]vi[<CR>
onoremap I( :<C-u>normal! F)vi(<CR>
onoremap I{ :<C-u>normal! F}vi{<CR>
onoremap I< :<C-u>normal! F>vi<<CR>
onoremap I' :<C-u>normal! F'vi'<CR>
onoremap I" :<C-u>normal! F"vi"<CR>
onoremap I` :<C-u>normal! F`vi`<CR>
" ----------------------------------------}}}

" ----------------------------------------}}}


"=======================
"      Fold Marker      
"=======================
" ----------------------------------------{{{
augroup foldMarker
	autocmd!

	autocmd FileType vim setlocal foldmethod=marker 
	autocmd FileType vim setlocal foldmarker={{{,}}}

	autocmd FileType vim nnoremap <buffer> <Leader>fm{ :call AddFoldMarkerOpen()<CR>
	autocmd FileType vim nnoremap <buffer> <Leader>fm} :call AddFoldMarkerClose()<CR>
augroup END

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


"=========================
"      BoxifyComment      
"=========================
" ----------------------------------------{{{
nnoremap <leader>box :call BoxifyComment()<CR>
function! BoxifyComment()
	call UncommentIfNot()
	call RemoveLeadingWhiteSpace()
	call RemoveTrailingWhiteSpace()
	normal! v0d
	let l:len = strlen(@")
	let l:autoComment = stridx(&formatoptions, 'o') 
	normal! i"
	call RepeatCharacterAtCursor(' ',6) 
	normal! p
	call RepeatCharacterAtCursor(' ',6) 
	normal! O

	if l:autoComment == -1 
		normal! i"
	endif

	call RepeatCharacterAtCursor('=', l:len+12)
	normal! jo

	if l:autoComment == -1 
		normal! i"
	endif

	call RepeatCharacterAtCursor('=', l:len+12)
endfunction
" ----------------------------------------}}}


"============================
"      Helper Functions      
"============================
" ----------------------------------------{{{
function! CursorCharacter()	
	return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction

function! CommentOutIfNot()	
	normal! ^
	if CursorCharacter() !=# "\""
		normal! 0i"
	endif
endfunction

function! UncommentIfNot()
	normal! ^
	while CursorCharacter() ==# "\""
		normal! x
	endwhile
endfunction

function! RepeatCharacterAtCursor(character, count)
	let l:i = 0
	while i < a:count
		execute "normal!a".a:character
		let l:i += 1
	endwhile
endfunction

function! RemoveLeadingWhiteSpace()
	normal! 0
	while CursorCharacter() ==# " " || CursorCharacter() ==# "	"
		normal! x
	endwhile
endfunction

function! RemoveTrailingWhiteSpace()
	normal! $
	while CursorCharacter() ==# " " || CursorCharacter() ==# "	"
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


