set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"이게 있으니 :term가 아니고 기본 sh 로 되어 ts.fish이 실행이 안됩니다
"if &shell =~# 'fish$'
	"set shell=sh
"endif
set iskeyword+=-
"
" esc 누를시 딜레이를 없애줍니다
" 참고사이트 : https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=10

" tagbar 업데이트가 너무 느려서 확인해보니 기본 4000이었습니다
set updatetime=1000

" ctrlp가 ag를 사용하게 합니다
"set grepprg=ag\ --nogroup\ --nocolor
set grepprg=rg\ --color=never
"set grepprg=rg\ --vimgrep
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_user_command = 'rg %s --files --color=never --no-ignore'
" " ag is fast enough that CtrlP doesn't need to cache
"let g:ctrlp_use_caching = 0
"if executable('ag')
"endif

let g:simple_todo_map_normal_mode_keys = 0

nnoremap ,c :let @+ = expand("%:p").":".line('.')<cr>

"let g:lsc_server_commands = {'javascript': 'typescript-language-server --stdio'}
let g:lsc_server_commands = {
		\ 'javascript': 'typescript-language-server --stdio'
		\ }
let g:lsc_auto_map = v:true

"let g:lsc_enable_autocomplete  = v:true
"let g:lsc_enable_diagnostics   = v:false
"let g:lsc_reference_highlights = v:false
"let g:lsc_trace_level          = 'off'

set rtp+=~/.fzf
let g:fzf_history_dir = '~/.fzf/fzf-history'
let g:fzf_layout = { 'down': '100%' }
let g:fzf_preview_window = []

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'query':   ['fg', 'Ignore'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Ignore'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:terminal_ansi_colors = [
\ '#073642', '#dc322f', '#859900', '#b58900',
    \ '#268bd2', '#d33682', '#2aa198', '#eee8d5',
    \ '#002b36', '#cb4b16', '#586e75', '#657b83',
    \ '#839496', '#6c71c4', '#93a1a1', '#fdf6e3']

" coc setups  ---------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the \ursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap ,e <Plug>(coc-rename)
nmap ,d <Plug>(coc-codeaction)


"" Ultisnips  ------------------------------------------------------
"
"" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
"" - https://github.com/Valloric/YouCompleteMe
"" - https://github.com/nvim-lua/completion-nvim
""let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
""----------------------------------------------------------------



"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>,
	"\ {'options': ['--layout=reverse', '--info=inline']}, <bang>0)


"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-l', <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-l --path-to-ignore ~/.ignore --nocolor --hidden -g ""', <bang>0)
"command! -bang -nargs=* Rg call fzf#vim#rg(<q-args>, '--files --hidden --follow --no-ignore', <bang>0)

" fzf 에서 Ag 실행시 옵션과 파일명이 아닌 컨텐츠에서의 검색만을 하도록 하는
" 옵션입니다

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore', {'options': '--delimiter : --nth 4..'}, <bang>0)

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

"command! -bang -nargs=* Rg
  "\ call fzf#vim#grep(
  "\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  "\   <bang>0 ? fzf#vim#with_preview('up:60%')
  "\           : fzf#vim#with_preview('right:50%:hidden', '?'),
  "\   <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden --path-to-ignore ~/.ignore', <bang>0)
""let g:fzf_ag_raw =1
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore "*json"', <bang>0)
"command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {}, <bang>0)
"set term=screen-256color
set backspace=indent,eol,start


""기본 자동완성 기능
""http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
""참고
""
"" 이걸 빼고 아래omni complete를 기본 ctrl n 으로 동작하게 바꿔버렸습니다.
"" 첫번째 항목 선택이 이상해서말이죠
""
"set completeopt=longest,menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
""inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
""
"" complete 완성후 :pclose 로 프리뷰윈도우 닫는 명령
"" If you prefer the Omni-Completion tip window to close when a selection is
"" made, these lines close it on movement in insert mode or when leaving
"" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 변경된 버퍼를 저장하지 않고도 버퍼간 이동을 가능하게끔합니다
set hidden
set tags=tags;/

" bashrc 의 alias를 읽기 위한 설정입니다
"let $BASH_ENV = "~/.bashrc"
let $BASH_ENV = "~/.bash_functions"

"if exists('$TMUX')
  "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"osx 터미널 상에서의 인서트모드 커서를 변경합니다.
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"osx + tmux 상에서의 인서트모드 커서를 변경합니다.
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


""""""""""""""""""
" 일반 ubuntu - linux 상에서의 커서설정
"

"에디트(이동)모드커서
let &t_EI .= "\<Esc>[1 q"
"수정(인서트)모드커서
let &t_SI .= "\<Esc>[5 q"

" solid block
" let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  "	4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"

"set guicolors  "vim 8.0에서 true color 적용문법 번경
set termguicolors
" backround column erase 문제 수정 문법
set t_ut=

"set t_Co=256
"set t_Co=16
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0


"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

"set runtimepath=~/.vim
"==================================================================
"set nocompatible
"filetype off
"set rtp+=~/vimfiles/bundle/vundle
"call vundle#rc('~/vimfiles/bundle')
"Plugin 'gmarik/vundle'
""Plugin 'The-NERD-tree'
"Plugin 'jistr/vim-nerdtree-tabs' "닫을때tree도같이닫아줌
"
"Plugin 'AutoComplPop' "단어자동완성
""Plugin 'SuperTab'
"Plugin 'SuperTab-continued.'
"Plugin 'a.vim' "헤더-소스 전환
"Plugin 'bufexplorer.zip' "파일의 History
""Plugin 'qtpy.vim'
"Plugin 'flazz/vim-colorschemes'
""Plugin 'Python-mode-klen'
""Plugin 'cqml.vim'
""Plugin 'number-marks'
""Plugin 'qt2vimsyntax'
"filetype plugin indent on
"syntax on
"
""autocmd VimEnter * if &filetype !=# 'gitcommit'| NERDTree | wincmd p | endif 
""autocmd BufEnter * if &filetype !=# 'gitcommit'| NERDTree | wincmd p | endif
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"
"autocmd VimEnter * wincmd w
"
"let g:NERDTreeWinPos = "right"
"let g:NERDTreeWinSize = 36
"let g:nerdtree_tabs_open_on_gui_startup=1

"==================================================================

execute pathogen#infect()

filetype plugin indent on
syntax on
"let g:completor_racer_binary = '/home/pi/.cargo/bin/racer'
"let g:completor_clang_binary = '/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin/clang'

"let g:completor_complete_options = 'menuone,noselect'
 


"for ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
set nocompatible
"let g:ncm2_pyclang#library_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
"let g:ncm2_pyclang#library_path = '/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/lib/libclang.so'
"let g:ncm2_pyclang#library_path = '/usr/local/clang_7.0.1/lib/libclang.so.7'
"let g:ncm2_pyclang#library_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
"autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>


"python에서 $2 $1 이런게 나와서 일단 아래 vim lsp를 사용하기로 변경
"let g:LanguageClient_serverCommands = {
	"\ 'cpp': ['clangd'],
    "\ }

	"\ 'python': ['~/.pyenv/shims/pyls'],
	"\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	"\ 'css': ['css-languageserver', '--stdio'],
" ternjs 를 사용하므로 제거
"\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"\ 'javascript': ['javascript-typescript-stdio'],

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"let g:asyncomplete_smart_completion = 1
"let g:asyncomplete_auto_popup = 1
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"
"imap <c-space> <Plug>(asyncomplete_force_refresh)
"set completeopt+=preview
"autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " pip install python-language-server
"au User lsp_setup call lsp#register_server({
	"\ 'name': 'css-lc',
	"\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
	"\ 'whitelist': ['css'],
	"\ })
"if executable('pyls')
	"" pip install python-language-server
	"au User lsp_setup call lsp#register_server({
		"\ 'name': 'pyls',
		"\ 'cmd': {server_info->['pyls']},
		"\ 'whitelist': ['python'],
		"\ })
	"autocmd FileType py setlocal omnifunc=lsp#complete
"endif
"if executable('rls')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'rls',
        "\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        "\ 'whitelist': ['rust'],
        "\ })
"endif
"if executable('clangd')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'clangd',
		"\ 'cmd': {server_info->['clangd']},
        "\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        "\ })
	"autocmd FileType c setlocal omnifunc=lsp#complete
    "autocmd FileType cpp setlocal omnifunc=lsp#complete
"endif
"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" Use deoplete.
"let g:python3_host_prog='/home/odroid/.pyenv/shims/python3'

"let g:deoplete#enable_at_startup = 0

""let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_at_startup = 0
"autocmd InsertEnter * call deoplete#enable()
"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"let g:virtualenv_directory = '/home/utylee/00-Projects/venv-tyTrader'


function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  if a:current
    let l:s .= ' %{tagbar#currenttag(" %s\ ","")}'
    "let l:s .= crystalline#right_sep('', 'Fill') . ' %{tagbar#currenttag(" %s\ ","")}'
"set statusline+=%{tagbar#currenttag('[%s]\ ','')}
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction


let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
"let g:crystalline_theme = 'default'
"let g:crystalline_theme = 'molokai'
let g:crystalline_theme = 'onedark'

set showtabline=2
set guioptions-=e
set laststatus=2

"set laststatus=2
"
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#virtualenv#enabled = 0
""let g:airline#extensions#tagbar#flags = 'f'
""let g:airline#extensions#hunks#enabled = 0
""let g:airline#extensions#whitespace#enabled = 0
""let g:airline_section_warning=''
""let g:airline_section_error=''
""let g:airline_section_statistics=''
""let g:airline_mode_map = {
""  \ '__' : '-',
""  \ 'n'  : 'N',
""  \ 'i'  : 'I',
"  \ 'R'  : 'R',
"  \ 'v'  : 'V',
"  \ 'V'  : 'V-L',
"  \ 'c'  : 'C',
"  \ 's'  : 'S',
"\ 'S' : 'S-L',
"\ }
"au VimEnter * let g:airline_section_x = airline#section#create(['tagbar']) | :AirlineRefresh
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"set air-line theme {dark, molokai, ...}
"let g:airline_theme='molokai'
""let g:airline_theme='solarized'
""let g:airline_theme='dark'
""let g:airline_theme='tomorrow'
""let g:airline_theme='jellybeans'

"let g:airline_section_a = airline#sections#create(['mode', %{airline#extensions#branch#get_head()}''branch'])

"function! AirlineWrapper(ext)
	"let head = airline#extensions#branch#head()
	"return empty(head) ? '' : printf(' %s', airline#extensions#branch#get_head())
"endfunction

"let g:airline_section_c = airline#section#create(['%f'])

"이 두개가 실제로 사용되고 있었습니다. 일단 제거
"let g:airline_section_a = airline#section#create(['mode', ' ', '%{airline#extensions#branch#get_head()}'])
"let g:airline_section_b = airline#section#create(['%{virtualenv#statusline()}'])
"let g:airline_section_b = airline#section#create(['%f'])
"let g:airline_section_b = ''
"디렉토리 없이 파일명만 표시하게 합니다
"let g:airline_section_c = '%t'

"au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh
"let g:airline_section_x = airline#section#create_right(['tagbar']) 
"skip section을 하니 tagbar가 동작을 안했습니다
"let g:airline_skip_empty_sections = 1
"let g:airline_section_y=''
"let g:airline_section_z=''

"let g:airline_section_a = airline#section#create(['mode', '%{AirlineWrapper()}'])
"let g:airline_section_b = airline#section#create([g:airline_symbols.branch, ' ', '%{fugitive#head()}', ' ', ' %{virtualenv#statusline()}'])
"let g:airline_section_b = airline#section#create(['%{airline#extensions#branch#get_head()}', ' %{virtualenv#statusline()}'])
"let g:airline_section_b = airline#section#create(['branch'])
"let g:airline_section_b = ['branch']
"let g:virtualenv_stl_format = '[%n]'
"let g:Powerline_symbols = 'fancy'


"function! MyOverride(...)
"	call a:l.add_section('StatusLine', 'all')
"	return l
"endfunction
"call airline#add_statusline_func('MyOverride')

"let g:jedi#auto_initialization = 1 
"let g:jedi#squelch_py_warning = 1


" emmet-vim 을 html과 css에서만 사용하는 설정

"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */nginx/* set ft=nginx

set noundofile
set number
set cul
set ignorecase
set shiftwidth=4
set softtabstop=4
set nobackup
set noswapfile
"no equalalways or equalalways --> split 화면에서 사이즈 유즈 관련 세팅
set noea 

" 현재 파일의 디렉토리로 이동
"set autochdir
" 한번 뺴보겠습니다

" 만약 플러긴에서 문제가 생긴다면 아래대안을 사용할 것
"nnoremap ,cd :cd %:p:h<CR> 

if has("gui_running")
	"set lines=55
"	set columns=120
"	au GUIEnter * winpos 300 0
"
	"set guioptions -=T
	"set guioptions -=m
	set fullscreen
endif

set noshellslash
"map <F5> : !python3 %<CR>
"nmap <leader>e :!python3 %<CR>
"nmap <leader>e :!python3 '%:p'<CR>
"nmap <leader>e :set shellcmdflag=-ic <CR> :!ts python '%'<CR> <CR> :set shellcmdflag=-c<CR>
nmap <leader>ee :!ts python '%:p' 2>/dev/null<CR> <CR>
nmap <leader>er :!ts cargo run -j6<CR> <CR>
nmap <leader>ew :!ts tsc '%:p' 2>/dev/null<CR> <CR>
"nmap <leader>w :!ts cargo build --release<CR> <CR>
nmap <leader>w :!ts cargo run -j6<CR> <CR>
"nmap <leader>w :!ts rustc '%:t' 2>/dev/null<CR> <CR>
"nmap <leader>e :!ts python '%' 2>/dev/null<CR> <CR>
"현재 행을 실행하는 커맨드인데 공백제거가 안돼 아직 제대로 되지 않습니다
nmap <leader>r :Rooter<CR>
let g:rooter_manual_only = 1
"nmap <leader>w :exec '!ts python -c \"'getline('.')'\"'<CR>
nmap <leader>` :set fullscreen<CR>

"nmap <leader>qq :bd!<CR>
"nmap <leader>qa :%bd!<CR>
"nmap <leader>qc :cclose<CR>
nmap <leader>q :bd!<CR>
nmap ,q :%bd!<CR>
nmap ,c :cclose<CR>
nmap ,r :syntax sync fromstart<CR>
" ;의 반대방향 역할을 하는 ,키를 더블클릭으로 사용하기 위함입니다
nnoremap ,, ,			

nmap <leader>c :!ts C-c<CR> <CR>
"map <F7> :NERDTreeTabsToggle<CR>
"map <F2> :NERDTreeToggle<CR>
"nmap <leader>2 :NERDTreeToggle<CR>
nmap <leader>1 :e $MYVIMRC<CR>
"nmap <leader>3 :GitGutterToggle<CR>
nmap <leader>5 :syntax sync fromstart<CR>
map <A-3> :tabnext<CR>
map <A-4> :tabprevious<CR>
"map <F3> :cn<CR>
"map <F4> :cp<CR>
"ex) :ccl<CR>       "Close the search result windows

"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-h> <c-w>h
"map <c-l> <c-w>l
"map <C-T> :tabnew<CR>:wincmd w<CR>

"let g:ctrlp_buftag_types = {
"\ 'css' : '--css-types=vcitm',
"\ }

" Setup some default ignores
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|avi|mkv|mov|mp4|wma|xlsx|mp3|ini|doc|docx|un|bak)$',
"\}

" 현재파일의 디렉토리로 변경 %->  상대경로파일명, :p-> 절대경로파일명, :h->
" 한마디전으로

nmap <leader>z :cd %:p:h<cr> :pwd<cr>
nmap <leader>Z :ProsessionDelete<cr>

" Use a leader instead of the actual named binding
"nmap <leader>v :Marks<cr>
nmap <leader>a :Rg<cr>
nmap <leader>s :Tags<cr>
nmap <leader>d :BTags<cr>
nmap <leader>k :BLines<cr>
nmap <leader>l :Lines<cr>
"nmap <leader>d :Tags<cr>
"nmap <leader>g :ProjectFiles<cr>

command! Dirs call fzf#run(fzf#wrap({'source': 'fd --type d --hidden --color=always', 'sink': 'edit'}))
nmap <leader>fa :Files<cr>
nmap <leader>ff :Dirs<cr>
nmap <silent> <leader>ud :BTags <C-R><C-W><CR>
nmap <silent> <Leader>us :Tags <C-R><C-W><CR>
nmap <silent> <Leader>ua :Rg <C-R><C-W><CR>
nmap <silent> <Leader>ul :Lines <C-R><C-W><CR>
nmap <silent> <Leader>uk :BLines <C-R><C-W><CR>

"command history
nmap <C-s>s :History:<cr>
"search histrory
nmap <C-s>f :History/<cr>
"search snippet
nmap <C-s>n :Snippets<cr>

" for vim-fugitive
nmap <leader>gd :Gdiffsplit<cr>
nmap <leader>gv :Gvdiffsplit<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gr :Gread<cr>
"from fzf
nmap <leader>gc :BCommits<cr>	
nmap <leader>gx :Commits<cr>	

"nmap <silent> <Leader>g :BTags <C-R><C-W><CR>
"nmap <silent> <Leader>h :Tags <C-R><C-W><CR>
"nmap <silent> <Leader>j :Rg <C-R><C-W><CR>
"nmap <silent> <Leader>; :Lines <C-R><C-W><CR>
"
nmap <leader>x :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>t :History<cr>		
"nmap <leader>m :CtrlPMixed<cr>
"nmap <leader>d :CtrlPBufTagAll<cr>
"nmap <leader>a :CtrlPTag<cr>
"nmap <leader>v :CtrlPBuffer<cr>
"nmap <leader>t :CtrlPMRU<cr>

" Easy bindings for its various modes
"파일열기를 fzf를 사용해서 이것도 맞춰줘야합니다
"nmap <leader>bs :CtrlPMRU<cr>
"let g:ctrlp_match_window = 'max:12'
"let g:ctrlp_extensions = ['tag']

" Split size change
nmap <leader>- :resize -5<cr>
nmap <leader>= :resize +5<cr>

"d로 삭제시에 레지스터로 복사되는 것을 금지합니다
"noremap d "_d
"noremap dd "_dd
"noremap p "0p

"colorscheme molokai "oreilly jellybeans sweyla1 
"colorscheme oreilly "oreilly jellybeans sweyla1 
"colorscheme monokai "oreilly jellybeans sweyla1 
"set background=dark
"colorscheme solarized 
colorscheme solarized_sd_utylee

"let python_no_builtin_highlight = 1  
"let g:molokai_original = 1



"let g:jedi#completions_command = "<C-N>"


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

"autocmd BufNewFile,BufRead *.qml so c:\vim\vim74\ftplugin\qml.vim
autocmd BufNewFile,BufRead *.qml setf qml 


set langmenu=utf8
"lang mes en_US 
"set langmenu=en_US.UTF-8
set tabstop=4
"cd c:\_GoogleDrive\__시스템트레이딩\
set encoding=utf8
"set fileencodings=utf-8,cp949
set fileencodings=utf-8,cp949
"set langmenu=cp949
"set guifont=나눔고딕코딩:h12:cHANGEUL
"set guifontwide=나눔고딕코딩:h12:cHANGEUL
"set guifont=Lucida\ Console:h11:cDEFAULT
"set guifont=Consolas:h10.15:cDEFAULT
"set guifont=Consolas:h10.2:cANSI
"set guifont=Ubuntu\ Mono\ for\ Powerline:h15:cANSI
"set guifont=Ubuntu\ Mono:h15:cANSI
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18.3
"set guifontwide=NanumGothicCoding:h23
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
"set font=Ubuntu\ Mono\ derivative\ Powerline:h19
set guifontwide=NanumGothicCoding:h24
"set guifontwide=NanumGothicCoding:h15:cDEFAULT
"set guifontwide=Ubuntu:h15:cDEFAULT

"cd c:\_GoogleDrive\
"cd c:\Users\utylee\00-projects
"cd c:\Users\seoru\00-projects\00-python
"
"
"html tag % movement enable
"runtime macros/matchit.vim
