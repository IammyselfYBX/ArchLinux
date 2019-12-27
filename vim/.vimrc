"---------------------------------------------------------------------------------------------------
syntax on "代码高亮
set wildmenu "保证到窗口有5行距离
set scrolloff=5 
set cursorline "显示一条线
set wrap "文本都在一个窗口显示
set showcmd
set wildmenu 

"---------------------------------------------------------------------------------------------------
"搜索设置
set hlsearch "设置搜索高亮
set ignorecase "忽略搜索大小写
set smartcase "智能搜索 比如YoucompleMe即有大写又有小写
"不想每次打开一个新文档都会显示高亮
exec "nohlsearch"  

"---------------------------------------------------------------------------------------------------
"自定义
map Q :q<CR>
map S :w<CR>
map R :source $MYVIMRC<CR>

"---------------------------------------------------------------------------------------------------
"更改键位
noremap ; :

"---------------------------------------------------------------------------------------------------
"vim识别文件格式
set nocompatible "支持老版本
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on 

"---------------------------------------------------------------------------------------------------
"文件格式
set encoding=utf-8

"---------------------------------------------------------------------------------------------------
"更改缩进
set tabstop=2
set shiftwidth=2
set softtabstop=2

"---------------------------------------------------------------------------------------------------
"缩放代码
set foldmethod=indent 
set foldlevel=99

"区分普通模式与插入模式光标
let &t_SI="\<ESC>]50;CursorShape=1\x7"
let &t_SR="\<ESC>]50;CursorShape=2\x7"
let &t_EI="\<ESC>]50;CursorShape=0\x7"

"---------------------------------------------------------------------------------------------------
"分屏
"右侧分屏光标在右边
map sr :set splitright<CR>:vsplit<CR>
"左侧
map sl :set nosplitright<CR>:vsplit<CR>
"上侧
map su :set nosplitbelow<CR>:split<CR>
"下侧
map sd :set splitbelow<CR>:split<CR>



"光标往右<空格>
map <SPACE>r <C-w>l 
"光标往上
map <SPACE>u <C-w>k 
"光标往左
map <SPACE>l <C-w>h 
"光标往下
map <SPACE>d <C-w>j 

"改变分屏大小<上下左右键>
map <down> :res +5<CR>
map <up> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"左右分屏与上下分屏互换
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

"####################################################################################################
"####################################################################################################
"---------------------------------------------------------------------------------------------------
"PlugInstall
"插件管理
call plug#begin('~/.vim/plugged')
	Plug 'connorholyday/vim-snazzy'
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdtree'
	Plug 'w0rp/ale'
	Plug 'Valloric/YouCompleteMe'
	Plug 'iamcco/mathjax-support-for-mkdp'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

"vim-snazzy配色方案
color snazzy
let g:SnazzyTransparent = 1  "透明背景

"#########################################################################################
"YouCompleMe配置文件
"寻找全局配置文件
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
let g:ycm_key_invoke_completion = '<M-;>'
let g:ycm_use_clangd = 0
let g:ycm_collect_identifiers_from_tag_files = 1
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
"让补全行为与一般的IDE一致
set completeopt=longest,menu
"不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
"每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
"在注释中也可以补全
let g:ycm_complete_in_comments=1
"输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
"错误标识符
let g:ycm_error_symbol='>>'
"警告标识符
let g:ycm_warning_symbol='>*'
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0

"########################################################################
"NERDTree
"help NERDTree 查看更多 
map tt :NERDTree<CR>



"markdowmpreview
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
