" 自己的vimrc
" 安装插件管理器: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


let mapleader=','
set nocompatible              " 去除VI一致性,必须要添加  关闭兼容模式
filetype off                  " 必须要添加
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim可以保存文件修改历史
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

""""""""""""""""""""""""""""设置自己的leader""""""""""""""""""""""""""""""""""""
" 打开文件类型侦测
filetype on
" 根据不同的文件类型加载不同的插件
filetype plugin on
filetype indent on

set number " 打开行号
syntax on " 打开高亮
" colorscheme hybrid " 设置主题
set pastetoggle=<F2> " 按F2 进入粘贴模式
"set cursorline " 显示横线
""set cursorcolumn
set hlsearch " 高亮搜索
set foldmethod=indent " 设置折叠方式
"光标遇到折叠，折叠就打开
set foldopen=all
"  不生成swp文件
set noswapfile
" 开启实时搜索并且对大小写不敏感
set incsearch
set ignorecase
" 设置忽略大小写
set ignorecase
" 开启vim自身命令行模式智能补全
set wildmenu
" 设置颜色配色
" colorscheme one
"set background=dark
"set modifiable
" 自动识别文件格式
set fileformats=unix,dos
set fileformat=unix
" 统一缩紧
set tabstop=4         "设置 tab 的宽度
set softtabstop=4     "设置 删除 tab 的宽度
set shiftwidth=4      "设置 智能缩进的宽度
set expandtab         "设置 将 tab 转换为 4 个空格
%retab!
" 不能自动换行
"set nowrap
" 格式化
set formatoptions=tcrqn " 根据要求格式化
set autoindent     " 继承缩紧
set smartindent    " 为C语言提供自动缩紧
set cindent        " 使用C样式缩紧
set smarttab       " 在行和段开始处使用制表符
" 设置文件编码
set fileencoding=utf-8
" 搜索设置
set showmatch      " 匹配成队符号
set matchtime=5    " 匹配括号高亮的时间
" 行数控制
set scrolloff=20  " 光标始终保持在距离上下顶点20行的位置
" 设置最大行字符数
"set foldlevel=99
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
"set ai "或者 set autoindent vim使用自动对齐，也就是把当前行的对齐格式应用到下一行
set si "或者 set smartindent 依据上面的对齐格式，智能的选择对齐方式
set ci "set cindent 按照 C 语言的语法，自动地调整缩进的长度
"set mouse=a  "鼠标支持

" 键位映射
" 将- 号设置成x  表示按 - 号 删除一个字符
map - x
map <space> viw
map <c-d> dd
" 关闭方向键, 强迫自己用 hjkl vim禁用方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 空格t  加载配置文件
map <leader>t :source $MYVIMRC<CR>

" 定义快捷键到行尾部和首部
nmap H ^
nmap L $
" 快速跳转
nmap J 5j
nmap K 5k
nmap L 5l
nmap H 5h
" 关于保存退出文件相关
"nmap <Leader>w :w<CR>
"nmap <Leader>e :wq<CR>
nmap <Leader>p "+p

inoremap <leader>w <Esc>:wi<cr>   " 保存文件用,w
inoremap <leader>x <Esc>:x<cr>    " 保存文件并退出,x
" jj 进入normal模式
inoremap jj <Esc>
" 尖括号自动补全
inoremap < <><LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>

" 设置上下左右分屏跳转
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 跳转Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resize splits with arrow keys(设置窗口上下左右大小)
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" 消除颜色
noremap <Leader><space> :nohlsearch<CR>

" 解决终端下配色方案异常
let &t_ut=''
" 处理复制粘贴
vnoremap <Leader>y "+y
" 让vim配置保存后立马生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 光标返回上一级
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif""'""")>""'")""'")
" Compile function
noremap r :call CompileRunGcc()<CR>

" ===
" === Install Plugs with Vim-Plug
" ===

call plug#begin('~/.local/share/nvim/site/autoload/')

Plug 'RRethy/vim-illuminate'  " 显示光标下当前单词的其他用法
Plug 'AndrewRadev/splitjoin.vim' " 在单行和多行代码形式之间切换
Plug 'vim-airline/vim-airline'   "状态栏插件
Plug 'vim-airline/vim-airline-themes' "状态栏插件
Plug 'Yggdroot/indentLine' "缩进线
Plug 'preservim/nerdtree'     "文件树
Plug 'connorholyday/vim-snazzy' " 配色方案
Plug 'mhinz/vim-startify'  " 可以显示历史文件
call plug#end()

" ===
" === vim-snazzy
" ===
let g:SnazzyTransparent = 1 " 背景不透明设置
colorscheme snazzy
