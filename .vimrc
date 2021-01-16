" ========================================================================
" 快捷键映射配置
" ========================================================================
"let mapleader = ","
"let g:mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :wq<CR>

set nocompatible    " 关闭兼容模式

"autocmd BufWritePost $MYVIMRC source $MYVIMRC

set timeout timeoutlen=3000 ttimeoutlen=100

" ========================================================================
" 显示配置
" ========================================================================
set number	" 显示行号，缩写su
set ruler	" 用于显示当前光标所在的位置的行号和列号(逗号分割)。在最右端显示文本在文件红的相对位置
set relativenumber	" 显示从当前行数的前后行数
set cursorline	" 高亮显示当前行，缩写cuc
set wrap	" 自动换行
set showcmd	" 显示指令，屏幕最后一行显示(部分)命令
set showmode	" 在插入、替换和可视模式，最后一行提供消息
set wildmenu	" 命令补全

" ========================================================================
" 查找配置
" ========================================================================
set hlsearch	" 高亮显示搜索
set incsearch	" 动态高亮搜索
set ignorecase  " 不区分大小写搜索
set smartcase	" 智能大小写搜索，输入大写就会判定当前搜索区分大小写

" ========================================================================
" 缩进配置
" ========================================================================
set expandtab	" 插入模式下tab都是空格。不使用制表符
set tabstop=4   " 设定tab长度为4个空格
set shiftwidth=4	" 普通模式下的<< >>进行缩进的列数为4个空格
set autoindent	" 继承前一行的缩进方式，适用于多行注释

" ========================================================================
" 语法配置
" ========================================================================
syntax enable	" 语法高亮
syntax on		" 语法高亮

" ========================================================================
" 编码设置
" ========================================================================
set enc=utf-8   " 编码设置，vim内部使用的字符编码，用于缓存的文本、寄存器、Vim 脚本文件
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936 " 编码设置，字符编码的列表，检测文件编码时的备选字符编码列表
set termencoding=utf-8	" 用于输出到终端时采用的编码类型
"开启鼠标，那干嘛还用vim。。。
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

" ========================================================================
" 文件类型设置
" ========================================================================
filetype on  " 检测文件类型

" ========================================================================
" 插件开始的位置
" ========================================================================
call plug#begin('~/.vim/plugged')

" 可以快速对齐的插件，支持的分隔符: <Space> = : . | & # ,
Plug 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plug 'preservim/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
" go get -u github.com/jstemmer/gotags
Plug 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 有道词典在线翻译
Plug 'ianva/vim-youdao-translater'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'


" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 可以在 vim 中使用 tab 补全
"Plug 'vim-scripts/SuperTab'

"" 可以在 vim 中自动完成
""Plug 'Shougo/neocomplete.vim'


" 配色方案
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme github 
Plug 'acarapetis/vim-colors-github'
" colorscheme one 
Plug 'rakr/vim-one'

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

"" 插件结束的位置，插件全部放在此行上面
call plug#end()

" ========================================================================
" vim-easy-align 插件
" ========================================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ========================================================================
" NERDTree 插件
" ========================================================================
" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" git文件标注修改
let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ========================================================================
" tagbar 插件
" ========================================================================
nmap <F9> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" ========================================================================
" vim-go 插件
" ========================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

"" 直接通过 go run 执行当前文件
autocmd FileType go nmap <leader>r :GoRun %<CR>



" ========================================================================
" youcompleteme 插件
" ========================================================================
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ========================================================================
" markdown配置
" ========================================================================
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd


