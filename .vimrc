" vim 环境设定
" 设定说明 https://dougblack.io/words/a-good-vimrc.html


" Colors
" colorscheme badwolf " awesome colorscheme
colorscheme jellybeans " awesome colorscheme
"colorscheme stellarized
" 设置透明
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE
syntax enable " enable syntax processing

" -------
"Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
" set softtabstop=4 " number of spaces in tab when editing
" set expandtab       " tabs are spaces

" -------
" UI Config
set number 				" 可以在每一列的最前面显示行号啦！
" set showcmd             " show command in bottom bar 
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" ------
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" ------
" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" ------
" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
" nnoremap gV `[v`]

" ------
" Leader Shortcuts --未完成
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>

" open ag.vim
" nnoremap <leader>a :Ag

" edit vimrc/zshrc and load vimrc bindings
" These are shortcuts to edit and source my vimrc and my zshrc. That's it.
nnoremap <leader>ev :vsp ~/.vimrc<CR>
" nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>


" ------
" Autogroups
augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	" autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
			                \:call <SID>StripTrailingWhitespaces()
	autocmd FileType java setlocal noexpandtab
	autocmd FileType java setlocal list
	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
	autocmd FileType php setlocal expandtab
	autocmd FileType php setlocal list
	autocmd FileType php setlocal listchars=tab:+\ ,eol:-
	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
	autocmd FileType ruby setlocal shiftwidth=2
	autocmd FileType ruby setlocal softtabstop=2
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


" ------
" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" ------
" Custom Functions
" toggle between number and relativenumber
function! ToggleNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
	" save last search & cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

" From Niao ge Linux
set backspace=2 " 可随时用倒退键删除
set autoindent " 自动缩排
set ruler " 可显示最后一列的状态
set showmode " 左下角那一列的状态
syntax on " 进行语法检验，颜色显示。


" Organization
" foldmethod=marker
" foldlevel=0
" set modelines=1

" Chinese test
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


" ------
set nocompatible              " be iMproved, required
filetype off                  " required
"filetype on                   " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Code Completed
" Plugin 'Valloric/YouCompleteMe'

" 文件目录
"Plugin 'scrooloose/nerdtree'

" LaTex
"Plugin 'vim-latex/vim-latex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
"
" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置


