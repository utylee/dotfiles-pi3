set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set term=screen-256color
set backspace=indent,eol,start

" for fzf
set rtp+=~/.fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
"
" fzf 에서 Ag 실행시 옵션과 파일명이 아닌 컨텐츠에서의 검색만을 하도록 하는
" 옵션입니다
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore', {'options': '--delimiter : --nth 4..'}, <bang>0)


" esc 누를시 딜레이를 없애줍니다
" 참고사이트 : https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=10

" 버퍼를 저장하지 않아도 버퍼간 이동을 가능하게끔합니다
set hidden
set tags=tags;/
   

" bashrc 의 alias를 읽기 위한 설정입니다
"let $BASH_ENV = "~/.bashrc"
let $BASH_ENV = "~/.bash_functions"

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

"let g:asyncomplete_smart_completion = 1
"let g:asyncomplete_auto_popup = 1
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"set signcolumn=yes
"let $RUST_BACKTRACE = 1
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_loggingFile =  expand('~/LanguageClient.log')
"let g:LanguageClient_serverStderr = expand('~/LanguageServer.log')



"let g:ale_completion_enabled = 1
"set omnifunc=ale#completon#OmniFunc
"set completeopt=menu,menuone,preview,noselect,noinsert

"let g:completor_python_binary = '/home/pi/.virtualenvs/misc/bin/python'
"let g:completor_racer_binary = '/home/pi/.cargo/bin/racer'
"let g:completor_clang_binary = '/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin/clang'

"let g:completor_filetype_map = {}
"let g:completor_filetype_map.python = {'ft': 'lsp', 'cmd': 'pyls'}


".autocmd User asyncomplete_setup call asyncomplete#register_source(
    "\ asyncomplete#sources#clang#get_source_options())


"ncm2 configs
"autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
"let g:completor_complete_options = 'menuone,noselect,preview'
set nocompatible

"let g:ncm2_pyclang#args_file_path = ['.clang_complete']
"autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
"let g:ncm2_pyclang#library_path = '/usr/lib/llvm-4.0/lib/libclang.so.1'

let g:ncm2_pyclang#library_path = '/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/lib/libclang.so'
let g:ncm2_pyclang#clang_path = '/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin'
"let g:ncm2_pyclang#library_path = '/usr/local/clang_7.0.1/lib/libclang.so.7'
"let g:ncm2_pyclang#library_path = '/usr/local/clang_7.0.1/lib/'
"let g:ncm2_pyclang#clang_path = '/usr/local/clang_7.0.1'
"let g:ncm2_pyclang#args_file_path = ['.clang_complete']
"autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
"let g:clang_library_path='/usr/local/clang_7.0.1/lib/libclang.so.7'

"let g:LanguageClient_serverCommands = {
    "\ 'cpp': ['/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin/clangd'],
    "\ }
    "\ 'cpp': ['clangd'],
    "\ 'cpp': ['/usr/local/clang+llvm-5.0.1-armv7a-linux-gnueabihf/bin/clangd'],
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	"\ 'python': ['~/.pyenv/shims/pyls'],
	"\ 'css': ['css-languageserver', '--stdio'],
" jedi가 있으므로 이건 굳이 하지 않아봅니다
"\ 'python': ['/usr/local/bin/pyls'],
"\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Use deoplete.
let g:deoplete#enable_at_startup = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:python3_host_prog='/home/pi/.pyenv/shims/python3'
""let g:deoplete#enable_at_startup = 0
"nmap <leader>4 :call deoplete#enable() <CR><CR>
""nmap <leader>e :!python3 %<CR>
""autocmd InsertEnter * call deoplete#enable()
"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"if executable('clangd')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'clangd',
        "\ 'cmd': {server_info->['clangd']},
        "\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        "\ })
"endif

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
"endif
"if executable('rls')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'rls',
        "\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        "\ 'whitelist': ['rust'],
        "\ })
"endif
"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
""\ 'cmd': {server_info->['pyls']},

"let g:virtualenv_directory = '/home/utylee/00-Projects/venv-tyTrader'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 0
"let g:airline_section_a = airline#sections#create(['mode', %{airline#extensions#branch#get_head()}''branch'])

function! AirlineWrapper(ext)
	let head = airline#extensions#branch#head()
	return empty(head) ? '' : printf(' %s', airline#extensions#branch#get_head())
endfunction

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = '%t'
" tagbar 업데이트가 너무 느려서 확인해보니 기본 4000이었습니다
set updatetime=1000
au VimEnter * let g:airline_section_x = airline#section#create(['tagbar']) | :AirlineRefresh
"au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh
"let g:airline_section_x = airline#section#create_right(['tagbar']) 
"skip section을 하니 tagbar가 동작을 안했습니다
"let g:airline_skip_empty_sections = 1
"let g:airline_section_y=''
"let g:airline_section_z=''
let g:airline_section_warning=''
let g:airline_section_error=''
let g:airline_section_statistics=''
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ 's'  : 'S',
\ 'S' : 'S-L',
\ }

"let g:airline_section_b = airline#section#create(['%{virtualenv#statusline()}'])
"let g:airline_section_a = airline#section#create(['mode', ' ', '%{airline#extensions#branch#get_head()}'])

"let g:airline_section_a = airline#section#create(['mode', '%{AirlineWrapper()}'])
"let g:airline_section_b = airline#section#create([g:airline_symbols.branch, ' ', '%{fugitive#head()}', ' ', ' %{virtualenv#statusline()}'])
"let g:airline_section_b = airline#section#create(['%{airline#extensions#branch#get_head()}', ' %{virtualenv#statusline()}'])
"let g:airline_section_b = airline#section#create(['branch'])
"let g:airline_section_b = ['branch']
"let g:virtualenv_stl_format = '[%n]'
"let g:Powerline_symbols = 'fancy'
"파일이름만
"let g:airline_section_c = '%t'
"디렉토리포함
let g:airline_section_c = '%f'
au VimEnter * let g:airline_section_x = airline#section#create(['tagbar']) | :AirlineRefresh

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"function! MyOverride(...)
"	call a:l.add_section('StatusLine', 'all')
"	return l
"endfunction
"call airline#add_statusline_func('MyOverride')

"let g:jedi#auto_initialization = 1 
"let g:jedi#squelch_py_warning = 1


"let g:gutentags_trace = 1

" emmet-vim 을 html과 css에서만 사용하는 설정

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

au BufRead,BufNewFile */etc/nginx/* set ft=nginx

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
set autochdir
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

let g:simple_todo_map_normal_mode_keys = 0
set noshellslash
"map <F5> : !python3 %<CR>
"nmap <leader>e :!python3 %<CR>
"nmap <leader>e :!python3 '%:p'<CR>
"nmap <leader>e :set shellcmdflag=-ic <CR> :!ts python '%'<CR> <CR> :set shellcmdflag=-c<CR>
"nmap <leader>e :!ts python '%:p' 2>/dev/null<CR> <CR>
"nmap <leader>e :!ts rustc '%:p' 2>/dev/null<CR> <CR>
"nmap <leader>w :!ts rustc '%:t' 2>/dev/null<CR> <CR>
nmap <leader>r :Rooter<CR>
let g:rooter_manual_only = 1
nmap <leader>w :!ts cargo build --release <CR> <CR>
"nmap <leader>w :!ts cargo run '%:t' <CR> <CR>
nmap <leader>c :!ts C-c<CR>
nmap <leader>e :!ts python '%:t' 2>/dev/null<CR> <CR>
"현재 행을 실행하는 커맨드인데 공백제거가 안돼 아직 제대로 되지 않습니다
"nmap <leader>w :exec '!ts python -c \"'getline('.')'\"'<CR>
nmap <leader>` :set fullscreen<CR>
nmap <leader>q :bd!<CR>
nmap <leader>Q :cclose<CR>
nmap <leader>c :!ts C-c<CR> <CR>
map <F7> :NERDTreeTabsToggle<CR>
"map <F2> :NERDTreeToggle<CR>
nmap <leader>2 :NERDTreeToggle<CR>
map <F1> :e $MYVIMRC<CR>
nmap <leader>1 :e $MYVIMRC<CR>
nmap <leader>5 :syntax sync fromstart<CR>
nmap <leader>5 :syntax sync fromstart<CR>
map <A-3> :tabnext<CR>
map <A-4> :tabprevious<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
"ex) :ccl<CR>       "Close the search result windows

"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-h> <c-w>h
"map <c-l> <c-w>l
"map <C-T> :tabnew<CR>:wincmd w<CR>

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|avi|mkv|mov|mp4|wma|xlsx|mp3|ini|doc|docx|un|bak)$',
\}

" 현재파일의 디렉토리로 변경 %->  상대경로파일명, :p-> 절대경로파일명, :h->
" 한마디전으로

nmap <leader>z :cd %:p:h<cr> :pwd<cr>



" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
"let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
"nmap <leader>f :CtrlPCurWD<cr>
nmap <leader>v :Marks<cr>
"nmap <leader>a :Ag<cr>
nmap <leader>a :Ag<cr>
nmap <leader>s :Tags<cr>
nmap <leader>d :BTags<cr>
nmap <leader>f :Files<cr>
nmap <leader>g :ProjectFiles<cr>
nmap <silent> <Leader>h :Ag <C-R><C-W><CR>
nmap <leader>x :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>t :History<cr>		
"nmap <leader>m :CtrlPMixed<cr>
"nmap <leader>v :Marks<cr>
"nmap <leader>d :CtrlPBufTagAll<cr>
"nmap <leader>f :Files<cr>
"nmap <leader>a :CtrlPTag<cr>
"nmap <leader>a :Rg<cr>
"nmap <leader>s :Tags<cr>


" Easy bindings for its various modes
nmap <leader>v :CtrlPBuffer<cr>
"nmap <leader>t :CtrlPMRU<cr>
"nmap <leader>m :CtrlPMixed<cr>
"nmap <leader>bs :CtrlPMRU<cr>
let g:ctrlp_match_window = 'max:12'

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

"set air-line theme {dark, molokai, ...}
let g:airline_theme='molokai'
"let g:airline_theme='solarized'
"let g:airline_theme='dark'
"let g:airline_theme='tomorrow'
"let g:airline_theme='jellybeans'


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

