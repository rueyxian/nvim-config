

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

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'qpkorr/vim-bufkill'
"Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
" Plug 'turbio/bracey.vim'

Plug 'ekalinin/dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'


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
set smartindent
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


"# auto indent 
autocmd  BufRead,BufWritePre *.sh,*.html,*.gohtml :call AutoIndent() 
function! AutoIndent()
	let save_pos = getpos(".")
	normal gg=G
	call setpos(".", save_pos)
endfunction

" ----------------------------------------}}}


" ================================================================================
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
let g:NERDCompactSexyComs = 1

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
" cd $HOME/go/src
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <Leader><F2> :NERDTree<CR>
cnoreabbrev nt <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'NERDTree' : 'nt')<CR>

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
" ----------------------------------------{{{ Open files in horizontal split
"noremap <silent> <Leader>s :call fzf#run({
"\   'down': '40%',
"\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
"nnoremap <silent> <Leader>v :call fzf#run({
"\   'right': winwidth('.') / 2,
"\   'sink':  'vertical botright split' })<CR>

"# select buffers
" ----------------------------------------{{{
function! s:buflist()
	redir => ls
	silent ls
	redir END
	return split(ls, '\n')
endfunction

function! s:bufopen(e)
	execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m --bind ctrl-k:up,ctrl-j:down',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nnoremap <silent> <Leader>p :call fzf#run({
			\	'source': 'rg --files --column --no-heading --hidden --follow --glob "!.git/*"', 'sink': 'e', 'down': '~30%', 'options': '--bind ctrl-o:up,ctrl-l:down'})<cr>


" ----------------------------------------}}}

"# Open FZF search
nnoremap <C-f> :Files!<CR>
nnoremap <C-f> :Files<CR>
inoremap <C-f> <Esc>:BLines!<CR>
nnoremap <C-p> :Buffers<CR>

cnoreabbrev buf <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Buffers' : 'buf')<CR>
cnoreabbrev fs <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Files' : 'fs')<CR>
cnoreabbrev fshome <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Files ~' : 'fshome')<CR>
cnoreabbrev fsdesk <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Files ~/Desktop' : 'fsdesk')<CR>
cnoreabbrev fsgo <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Files ~/go/src/' : 'fsgo')<CR>

" nnoremap <C-g> <Esc><Esc>:BCommits!<CR> 
"
" inoremap <C-f> <Esc>:BLines!<CR> 
" nnoremap <C-f>  :call fzf#run(fzf#wrap({'dir': '~'}))


" ============================================================
"" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }


" " Enable per-command history.
" " CTRL-N and CTRL-P will be automatically bound to next-history and
" " previous-history instead of down and up. If you don't like the change,
" " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>


" let g:fzf_tags_command = 'ctags -R'
" " Border color
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

" "Get Files
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	\   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
	\ call fzf#vim#grep(
	\   'git grep --line-number '.shellescape(<q-args>), 0,
	\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" ----------------------------------------}}}


"========================
"      fatih/vim-go      
"========================
" ----------------------------------------{{{
"gohtml syntax highlighting
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_updatetime = 250

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

	" :GoSameIdsAutoToggle
	autocmd FileType go cnoreabbrev gohl <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'GoSameIdsAutoToggle' : 'gohl')<CR>
	autocmd FileType go cnoreabbrev gotype <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "GoAutoTypeInfo" : "gotype")<CR>
" cnoreabbrev <silent> filepathfromhome <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call FilePath()" : "filepathfromhome")<CR>
" function! FilePath()	

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



function! s:newHandlerState(statustype) abort
  let l:state = {
        \ 'winid': win_getid(winnr()),
        \ 'statustype': a:statustype,
        \ 'jobdir': getcwd(),
        \ 'handleResult': funcref('s:noop'),
      \ }

  " explicitly bind requestComplete to state so that within it, self will
  " always refer to state. See :help Partial for more information.
  let l:state.requestComplete = funcref('s:requestComplete', [], l:state)

  " explicitly bind start to state so that within it, self will
  " always refer to state. See :help Partial for more information.
  let l:state.start = funcref('s:start', [], l:state)

  return l:state
endfunction


" ================================================================================

cnoreabbrev <silent> goiferr <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call GoIfErr()" : "goiferr")<CR>
func! GoIfErr()
	let l:goinfo = go#complete#GetInfo()

	" ==================================================
	let l:varPattern = '[a-zA-Z0-9\*\._\[\]\{\}\ ]\+'
	let l:errPattern = '\([a-zA-Z0-9_]\+ \)\?error'

	let l:varsCommaPattern = '\(\('.l:varPattern.', \)*'.l:varPattern.'\)\?'		

	" ===============
	let l:funcPattern = 'func \(('.l:varPattern.').\)\?[a-zA-Z0-9]\+'
	let l:argsPattern = '('.l:varsCommaPattern.')'

	let l:sretPattern = '\(error\|('.l:errPattern.')\)'
	let l:mretPattern = '(\('.l:varPattern.', \)*'.l:errPattern.'\(, '.l:varsCommaPattern.'\)\?)'

	" ===============
	let l:sglRetPattern = '^'.l:funcPattern.l:argsPattern.' '.l:sretPattern.'$'
	let l:mulRetPattern = '^'.l:funcPattern.l:argsPattern.' '.l:mretPattern.'$'

	" ==================================================
	" check if it's a valid func signature
	if (l:goinfo !~# l:sglRetPattern) && (l:goinfo !~# l:mulRetPattern)
		echom "failed to generate if-error statement"
		return
	endif

	" ==================================================
	" check if it's a method/function with single return (error)
	if l:goinfo =~# l:sglRetPattern 
		execute "normal! ^iif err := \<ESC>g_a; err != nil {\<ESC>"
		execute "normal! opanic(err)\<ESC>"
		execute "normal! o}\<ESC>"	
		return
	endif

	" ==================================================
	" method/function with multiple return
	let l:lpIdxs = s:matches(l:goinfo, '(')
	let l:rpIdxs = s:matches(l:goinfo, ')')
	let l:lpIdx = l:lpIdxs[len(l:lpIdxs) - 1]
	let l:rpIdx = l:rpIdxs[len(l:rpIdxs) - 1]
	let l:retsStr = l:goinfo[lpIdx + 1:rpIdx - 1]

	" ===============
	let l:rettypes = []
	for l:retstr in split(l:retsStr, ",")
		let l:ret = split(l:retstr, " ")
		let l:type = l:ret[len(l:ret) - 1]
		let l:type = substitute(l:type, " ", "","")
		let l:rettypes = add(l:rettypes, l:type)
	endfor

	" ===============
	let l:num = 0
	execute "normal! ^\<ESC>"
	for l:rettype in l:rettypes
		if l:rettype !=# "error"
			execute "normal! iv". l:num. ", \<ESC>l"		
			let l:num += 1	
			continue
		endif
		execute "normal! ierr, \<ESC>l"		
	endfor

	execute "normal! hhs := "		
	execute "normal oiif err != nil {\<ESC>"
	execute "normal! opanic(err)\<ESC>"
	execute "normal! o}\<ESC>"	

endfunction

" ================================================================================

" ----------------------------------------}}}

"===================================
"      pangloss/vim-javascript      
"===================================
" ----------------------------------------{{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" augroup javascript_folding
"     au!
"     au FileType javascript setlocal foldmethod=syntax
" augroup END

" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

" ----------------------------------------}}}


"===========================
"      mattn/emmet-vim      
"===========================
" ----------------------------------------{{{
" let g:user_emmet_leader_key='<C-Y>'
" ----------------------------------------}}}

"=========================
"      elzr/vim-json      
"=========================
" ----------------------------------------{{{
let g:vim_json_syntax_conceal = 0
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
	autocmd FileType json set autoindent
  " autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=2
  " autocmd FileType json set softtabstop=2 tabstop=2
	autocmd FileType json set expandtab
	autocmd FileType json set foldmethod=manual
augroup END
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


"# toggle wrap & linebreak  ----------------------------------------{{{
" command! -nargs=* Wrap :set wrap linebreak
command! -nargs=* Wrap call WrapLinebreak()
cnoreabbrev wrap <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Wrap' : 'wrap')<CR>

func! WrapLinebreak()
	set wrap!
	if &wrap ==# 1
		set linebreak
		echom "set wrap & linebreak"
	else
		set nolinebreak
		echom "set nowrap & nolinebreak"
	endif
endfunc
" ----------------------------------------}}}


"# repeat character  ----------------------------------------{{{
cnoreabbrev rpc <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'RpC' : 'rpc')<CR>
command! -nargs=+ RpC call <SID>RepeatCharacter(<f-args>)

function! s:RepeatCharacter(string, count)
	if a:count =~ '\d'
	call s:RepeatCharacterAtCursor(a:string, a:count)
	else	
		echom "second argument has to be an integer"
	endif
endfunc
" ----------------------------------------}}}


"# get file path ----------------------------------------{{{
cnoreabbrev <silent> filepathfromhome <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call <SID>FilePath()" : "filepathfromhome")<CR>
function! s:FilePath()	
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
" autocmd FileType go cnoreabbrev <silent> gofilepath <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? "call <SID>GoFilePath()" : "gofilepath")<CR>
" function! s:GoFilePath()	
"   let l:srcPath = $GOPATH . "/src/"
"   if stridx(getcwd(), l:srcPath) ==# 0		"Check if srcPath is the substring of cwd and it's start from index 0
"     let l:gofilepath = getcwd()[strlen(l:srcPath):]
"     echom "clipboard copied: ". l:gofilepath
"     let @+ = 	l:gofilepath
"   else
"     echom "clipboard copy failed"
"   endif
" endfunction
" ----------------------------------------}}}

"# copy last Nth messages to clipboard ----------------------------------------{{{
cnoreabbrev <silent> copymsg <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'CopyMsg' : 'copymsg')<CR>
command! -nargs=+ CopyMsg call <SID>CopyMessages(<f-args>)
function! s:CopyMessages(num)	
	if a:num !~# '^\d\+$'
		echom "argument must be a number"
		return
	endif

	execute "redir @+"	
	execute a:num . "messages"
	execute "redir END"
endfunction
" ----------------------------------------}}}



" ----------------------------------------}}}


"========================
"      Key Mappings      
"========================
" ----------------------------------------{{{
"command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
"autocmd FileType vim nnoremap <buffer> <F11> :source %<CR>


"# linewise motion (if &warp=1) ----------------------------------------{{{
noremap <expr> <Up> &wrap ==# 1 ? "gj" : "j"
noremap <expr> <Down> &wrap ==# 1 ? "gk" : "k"
noremap <expr> j &wrap ==# 1 ? "gj" : "j"
noremap <expr> k &wrap ==# 1 ? "gk" : "k"

nnoremap <silent> 0 :call <SID>NavStartLine('n') <CR>
nnoremap <silent> ^ :call <SID>NavStartLineNonBlank('n') <CR>
nnoremap <silent> $ :call <SID>NavEndLine('n') <CR>
nnoremap <silent> g_ :call <SID>NavEndLineNonBlank('n') <CR>

xnoremap <silent> 0 :call <SID>NavStartLine('x') <CR>
xnoremap <silent> ^ :call <SID>NavStartLineNonBlank('x') <CR>
xnoremap <silent> $ :call <SID>NavEndLine('x') <CR>
xnoremap <silent> g_ :call <SID>NavEndLineNonBlank('x') <CR>
" ----------------------------------------}}}

"# buffers ----------------------------------------{{{

"delete buffer
nnoremap <F10> :BD!<CR>
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
inoremap <C-Space> <Esc>
vnoremap <C-Space> <Esc>
tnoremap <C-Space> <C-\><C-n>
" ----------------------------------------}}}

"# omni completion ----------------------------------------{{{
"auto close preview window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

"toggle omni completion
inoremap <expr> <C-o> pumvisible() ? "<C-e>" : "<C-x><C-o>"

" open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-o> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"navigation
inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"
inoremap <expr> <C-d> pumvisible() ? "<C-n><C-n><C-n><C-n><C-n>" : "<C-d>"
inoremap <expr> <C-u> pumvisible() ? "<C-p><C-p><C-p><C-p><C-p>" : "<C-u>"

"accept completion
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
" ----------------------------------------}}}

"# extends 'j' and 'k's motion ----------------------------------------{{{
nnoremap <C-j> 7j
nnoremap <C-k> 7k
" ----------------------------------------}}}
"
"# navigate cursor to 'sol' and 'eol' ----------------------------------------{{{
nnoremap <silent> <C-h> :call <SID>NavStartLineToggle('n') <CR>
nnoremap <silent> <C-l> :call <SID>NavEndLineToggle('n') <CR>

xnoremap <silent> <C-h> :call <SID>NavStartLineToggle('x') <CR>
xnoremap <silent> <C-l> :call <SID>NavEndLineToggle('x') <CR>

function! s:NavStartLine(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		if &wrap ==# 1
				execute "normal! g0"
		else
				execute "normal! 0"
		endif
	endif
endfunc

function! s:NavStartLineNonBlank(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		if &wrap ==# 1
				execute "normal! g^"
		else
				execute "normal! ^"
		endif
	endif
endfunc

function! s:NavEndLine(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		if &wrap ==# 1
			execute "normal! g$"
		else
			execute "normal! $"
		endif
	endif
endfunc

function! s:NavEndLineNonBlank(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		if &wrap ==# 1
			"simple gg_ command won't work"
			execute "normal! g$"
			if s:CursorCharacter() =~ "\\s"
				execute "normal! ge"
			endif
		else
			execute "normal! g_"
		endif
	endif
endfunc

function! s:NavStartLineToggle(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		let l:col1 = virtcol('.')
			call s:NavStartLineNonBlank(a:mode)	
		let l:col2 	= virtcol('.') 
		if l:col1 ==# l:col2 
			call s:NavStartLine(a:mode)	
		endif
	endif
endfunc

function! s:NavEndLineToggle(mode)
	if a:mode == 'n' || a:mode == 'x'
		if a:mode == 'x'
			execute "normal! gv"
		endif
		let l:col1 = virtcol('.')
			call s:NavEndLineNonBlank(a:mode)
		let l:col2 	= virtcol('.') 
		if l:col1 ==# l:col2 
			call s:NavEndLine(a:mode)
		endif
	endif
endfunc
" ----------------------------------------}}}


"# delete line without deleting 'eol' ----------------------------------------{{{
nnoremap dD 0d$
" ----------------------------------------}}}

"# open line ----------------------------------------{{{
nnoremap o o<Esc>
nnoremap <S-o> O<Esc>
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


" ================================================================================
"=======================
"      Fold Marker      
"=======================
" ----------------------------------------{{{
augroup foldMarker
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker 
	autocmd FileType vim setlocal foldmarker={{{,}}}

	" autocmd FileType vim command! FoldOpen call <SID>AddFoldMarkerOpen()<CR>
	" cnoreabbrev foldopen <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'FoldOpen' : 'foldopen')<CR>

	" autocmd FileType vim command! FoldClose call <SID>AddFoldMarkerClose()<CR>
	" cnoreabbrev foldclose <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'FoldClose' : 'foldclose')<CR>
augroup END

" function! s:AddFoldMarkerOpen()
"   call <SID>RemoveTrailingWhiteSpace()
"   execute "normal! a "
"   call <SID>RepeatCharacterAtCursor('-',40)
"   call <SID>RepeatCharacterAtCursor('{',3)
"   call <SID>CommentOutIfNot()
" endfunction

" function! s:AddFoldMarkerClose()
"   call <SID>RemoveTrailingWhiteSpace()
"   execute "normal! a "
"   call <SID>RepeatCharacterAtCursor('-',40)
"   call <SID>RepeatCharacterAtCursor('}',3)
"   call <SID>CommentOutIfNot()
" endfunction
" ----------------------------------------}}}

"=========================
"      BoxifyComment      
"=========================
" ----------------------------------------{{{

" command! Boxify call <SID>BoxifyComment()<CR>
" cnoreabbrev boxify <C-r>=(getcmdtype()==#':' && getcmdpos()==#1 ? 'Boxify' : 'boxify')<CR>
" " nnoremap <leader>box :call BoxifyComment()<CR>
" function! s:BoxifyComment()
"   call <SID>UncommentIfNot()
"   call <SID>RemoveLeadingWhiteSpace()
"   call <SID>RemoveTrailingWhiteSpace()
"   normal! v0d
"   let l:len = strlen(@")
"   let l:autoComment = stridx(&formatoptions, 'o') 
"   normal! i"
"   call <SID>RepeatCharacterAtCursor(' ',6) 
"   normal! p
"   call <SID>RepeatCharacterAtCursor(' ',6) 
"   normal! O

"   if l:autoComment == -1 
"     normal! i"
"   endif

"   call <SID>RepeatCharacterAtCursor('=', l:len+12)
"   normal! jo

"   if l:autoComment == -1 
"     normal! i"
"   endif

"   call <SID>RepeatCharacterAtCursor('=', l:len+12)
" endfunction
" ----------------------------------------}}}


" ============================
"      Helper Functions      
"============================
" ----------------------------------------{{{
function! s:CursorCharacter()	
	return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction

function! s:RepeatCharacterAtCursor(character, count)
	let l:i = 0
	while i < a:count
		execute "normal!a".a:character
		let l:i += 1
	endwhile
endfunction

func! s:CountSubString(str, substr)
	let l:count = 0
	let l:str = a:str
	while 1
		let l:idx = match(l:str, a:substr)
		if l:idx ==# -1
			break
		endif
		let l:str = substitute(l:str, a:substr, "", "") 
		let l:count += 1	
	endwhile
	return l:count
endfunction

function! s:matches(str, substr) 
	let l:str = a:str
	let l:substrlen = strlen(a:substr)
	let l:offset = 0
	let l:idxs = []
	while 1
		let l:idx = match(l:str, a:substr)	
		if l:idx ==# -1
			break
		endif
		let l:idx += l:offset	
		let l:idxs = add(l:idxs, l:idx)
		let l:str = substitute(l:str, a:substr, "", "")
		let l:offset += l:substrlen
	endwhile
	return l:idxs
endfunction



" function! s:CommentOutIfNot()	
"   normal! ^
"   if CursorCharacter() !=# "\"
"     normal! 0i"
"   endif
" endfunction

" function! s:UncommentIfNot()
"   normal! ^
"   while CursorCharacter() ==# "\"
"     normal! x
"   endwhile
" endfunction


" function! s:RemoveLeadingWhiteSpace()
"   normal! 0
"   while CursorCharacter() ==# " " || CursorCharacter() ==# "	"
"     normal! x
"   endwhile
" endfunction

" function! s:RemoveTrailingWhiteSpace()
"   normal! $
"   while CursorCharacter() ==# " " || <CursorCharacter() ==# "	"
"     normal! x
"   endwhile
" endfunction

" function! s:StringReplaceCharacter(str, char, replace)
"   let l:ret = ''	
"   for c in split(a:str, '\zs')	
"     if c ==# a:char
"       let l:ret .=  a:replace	
"     else
"       let l:ret .= c
"     endif
"   endfor
"   return l:ret
" endfunction

" ----------------------------------------}}}


