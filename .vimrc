""" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'msanders/snipmate.vim'

" Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-rails'
" Plugin 'fatih/vim-go'

" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/a.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/Emmet.vim'

" Beautify
" Plugin 'tomasr/molokai'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'bling/vim-airline'

" Writing
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



""" Basic
syntax on
colorscheme desert
filetype indent on

" let g:solarized_termcolors=256
" set background=light
" colorscheme solarized

set number
set nocompatible
set backspace=indent,eol,start
set colorcolumn=100
set foldmethod=marker

" Not scroll to the top or bottom
set scrolloff=3

""" Search
set hlsearch
set incsearch
" set ignorecase

""" Indent and tab
set autoindent
set shiftwidth=4
set cindent
set cinoptions=:0,g0,t0,(0,Ws,m1
" setl cinoptions=h4,l1,g0,t0,i4,+4,(0,w1,W4

set expandtab
set tabstop=4
set softtabstop=4

""" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5

""" Auto save
" autocmd BufLeave,FocusLost * bufdo! call WriteFile()
" function WriteFile()
   " if (&buftype=="") && (expand("%:r") > "") && (&readonly==0)
      " write
   " endif
" endfunction

""" Leader key
let mapleader=','
let g:C_MapLeader=','

""" Move around quickly
" Jump between multi-windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Move cursor in 'insert mode' (needn't esc insert mode)
imap h <left>
imap j <down>
imap k <up>
imap l <right>
imap <c-b> <left>
imap <c-f> <right>

""" Ctags and cscope
" Generate tags file
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" Cscope setting
"auto load cscope.out when open file
if has("cscope")
    set nocscopeverbose
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set cscopeverbose
endif

" Mapping key of cscope
nmap <leader>ss :cs find s <c-r>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <c-r>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <c-r>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <c-r>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <c-r>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <c-r>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <c-r>=expand("%:t")<cr><cr>
nmap <leader>si :cs find i <c-r>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <c-r>=expand("<cword>")<cr><cr>

""" Quickfix
nmap <F11> :cw<cr>
nmap <F9> :cp<cr>
nmap <F10> :cn<cr>

" Quickfix in blade
set makeprg=blade
nmap <leader>bb :w<cr>:make build<cr>
nmap <leader>bt :w<cr>:make test<cr>

" Quickfix in comake2
nmap <leader>mk :w<cr>:make<cr>
nmap <leader>cm2 :w<cr>:!comake2<cr>
nmap <leader>cUB :w<cr>:!comake2 -UB -j8<cr>

""" Vim plugins
" Plugin: tagbar.vim
nnoremap <leader>f      :TagbarToggle<cr>
inoremap <leader>f      <c-o>:TagbarToggle <cr>
let g:tagbar_width = 40

" Plugin: project.vim (not use now)
"nmap <F11>      :Project<cr>
"imap <F11>      <esc>:Project<cr>

" Plugin: a.vim
nnoremap <leader>a :A<cr>
inoremap <leader>a <esc>:A<cr>

" Plugin: minibufexpl.vim
nmap <leader>, :bn<cr>
nmap <leader>. :bp<cr>

" Plugin: code_complete.vim
" (See in '~/.vim/plugin/my_snippets.vim')

" Plugin: NERD_tree.vim
nnoremap <leader>t :NERDTreeToggle<cr>
inoremap <leader>t <c-o>:NERDTreeToggle<cr>
let g:NERDTreeIgnore = ['tags', '\.swp$', '\.o', '\.log', '\~$']


" Plugin: NERD_commenter.vim
let g:NERDSpaceDelims = 1
" Comment code block
nmap <leader>cf viw$%,c<space><cr><c-o>

" Plugin: lookupfile.vim
let g:LookupFile_TagExpr = './tags'
nmap <silent> <leader>lt :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

" Plugin: omnicppcomplete
set completeopt=menu

" Plugin: vcscommand.vim
nmap <leader>df :VCSVimDiff<cr>

" Generate file header of various filetypes {{{
let g:license_tag="Baidu Inc."
let g:author_name="Zhong Yi <zhongyi01@baidu.com>"

function! <SID>GenCppFileHeader()
	let l:year = strftime("%Y")
	exec "normal O" . "// Copyright ".l:year.", ".g:license_tag
	exec "normal o" . "Author: ".g:author_name
endfunction

function! <SID>GenPythonFileHeader()
	let l:year = strftime("%Y")
	exec "normal O" . "#!/bin/env python"
    exec "normal o" . "# -*- coding: utf-8 -*-"
    exec "normal o" . "# Copyright ".l:year.", ".g:license_tag
	exec "normal o" . "# Author: ".g:author_name
endfunction
" }}}

" Set tags file (copy from qianqiong's .vimrc) {{{
function! GetUpPath(dir)
    let pos=len(a:dir)-1
    while pos>0
        if (a:dir[pos]=="/" )
            return  strpart(a:dir,0,pos)
        endif
        let pos=pos-1
    endwhile
    return  ""
endfunction

"set related tags
function! s:SetTags()
    let dir = expand("%:p:h") "get source path
    "find tags file up on path recursively
    while dir!=""
        if findfile("tags",dir ) !=""
            "load the tags if found
            exec "set tags+=" . dir . "/tags"
        endif
        "get parent path
        let dir=GetUpPath(dir)
    endwhile
endfunction
" }}}

if has("autocmd")
    autocmd FileType c setfiletype cpp
    autocmd FileType cxx setfiletype cpp
    autocmd FileType hpp setfiletype cpp

    autocmd BufNewFile * if (&filetype=='cpp')
                \| call <SID>GenCppFileHeader() | endif
    autocmd BufNewFile * if (&filetype=='python')
                \| call <SID>GenPythonFileHeader() | endif

    autocmd FileType python setlocal shiftwidth=2 | setlocal softtabstop=2 | setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2 | setlocal softtabstop=2 | setlocal tabstop=2

    autocmd FileType cpp setlocal path+=/usr/include/c++/3.4.5,$HOME/git/baidu
    " autocmd FileType cpp set tags+=$HOME/.vim/tags/stl_tag,
    autocmd BufEnter * call s:SetTags()

    " Remove trailing spaces for C/C++ and Vim file
    autocmd BufWritePre * call RemoveTrailingSpace()

    " Remember cursor postion when exit vim
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

augroup filetype
    autocmd! BufRead,BufNewFile .bladerc BUILD BLADE_ROOT blade.conf setfiletype blade
augroup end
augroup filetype
    autocmd! BufRead,BufNewFile *.proto setfiletype proto
augroup end
augroup filetype
    autocmd! BufRead,BufNewFile Rules setfiletype ruby
augroup end

" Remove extra spaces (Copy from qianqiong's .vimrc) {{{
function! RemoveTrailingSpace()
    if $VIM_HATE_SPACE_ERRORS != '0' &&
                \(&filetype == 'cpp' || &filetype == 'vim' || &filetype == 'blade')
        normal m`
        silent! :%s/\s\+$//e
        normal ``
    endif
endfunction
" }}}

""" Unclassed
" DO NOT use <esc>!
inoremap kj <esc>
" vnoremap kj <esc>

" Press <space> to select current word
map <space> viw

" Delete line in insert mode
imap <c-d> <esc>ddi

" Uppercase in insert mode (couldn't use inoremap)
imap <c-u> <esc>viwUe
nmap U viwUe

" More convenient to edit my .vimrc
nnoremap <leader>ev :vs ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Abbr my signature
:iabbrev ssig -- <cr>Zhong Yi<cr>zhongyi01@baidu.com

" Wrap current word with ""
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" I don't want to use <F9> as ':A'
nnoremap <leader>eb     :e BUILD<cr>
nnoremap <leader>ww      :w<cr>
inoremap <leader>ww      <esc>:w<cr>

" Status Lines
" set statusline=%f\ -\ %4l/%L\ \ \ %y

" :help xxx
nmap <leader>he :help <c-r>=expand("<cword>")<cr><cr>
nmap <leader>qq :q!<cr>

" '%s/xxx/yyy/g' more quickly
nmap <leader>rp :%s/

nmap <leader>si :call SortIncludeStatements()<cr>
" Sort '#include' statements {{{
function! SortIncludeStatements()
    " Move cursor to first line
    normal gg
    while 1
        " Search the begin of '#include' statement block
        if search('\(^\s*\_.\)\@<=#include.*', 'We') == 0
            break
        endif
        let sort_begin = line('.')
        " Search the end of '#include' statement block
        if search('^#include.*\_.\(^\s*$\)\@=', 'We') == 0
            break
        endif
        let sort_end = line('.')
        if sort_begin == sort_end
            continue
        endif
        " Sort, then move cursor to right place
        execute sort_begin . ',' . sort_end . 'sort'
        execute "normal! " . sort_end . "gg"
    endwhile
endfunction
" }}}

nmap <leader>re :call RemoveExtraSpacesAndEmptyLines()<cr>
" Remove extra spaces and extra empty lines {{{
function! RemoveExtraSpacesAndEmptyLines()
    " Remove extra spaces in the end of a line
    silent! :%s/\s\+$//e
    " Remove extra empty lines
    silent! :%s/\n\{3,\}/\r\r/e
    " Move to the last line and try to remove empty line two times
    normal G
    silent! :.g/^$/d
    silent! :.g/^$/d
endfunction
" }}}

" Plugin: clang_complete.vim
let g:clang_complete_copen=0
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'

" Plugin: riv.vim
let g:riv_fold_auto_update = 0
let g:riv_fold_level = 0
imap <leader>rt <c-o>:RivTableCreat<cr>
nmap <leader>rh <c-o>:RivHelpSection<cr>
nmap <leader>rf <c-o>:RivHelpFile<cr>

imap <leader>h1 <c-o>:RivTitle1<cr>
imap <leader>h2 <c-o>:RivTitle2<cr>
imap <leader>h3 <c-o>:RivTitle3<cr>


augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

" Plugin: YCM
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" Plugin: vim-go
au FileType go noremap <Leader>s :update<CR>:GoErrCheck<CR>
"au FileType go nmap <F5> :buffers<CR>:buffer<Space>
au FileType go nmap <F5> :GoInfo<CR>
au FileType go nmap <F6> :GoDef<CR>
au FileType go nmap <F7> :GoErrCheck<CR>
au FileType go nnoremap <F8> :GoFmt<CR>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader><s-d> <Plug>(go-doc)

