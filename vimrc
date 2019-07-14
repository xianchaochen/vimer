  call plug#begin('~/.vim/plugged')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
"Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'    " replace powerline
  Plug 'Raimondi/delimitMate'
  Plug 'mattn/emmet-vim'
  Plug 'arnaud-lb/vim-php-namespace'
  Plug 'tpope/vim-surround'
  Plug 'fholgado/minibufexpl.vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'tpope/vim-repeat'
  Plug 'scrooloose/nerdcommenter'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'kien/ctrlp.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'scrooloose/syntastic'
  Plug 'luochen1990/rainbow'
  Plug 'majutsushi/tagbar'
  Plug 'vim-scripts/grep.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tomasr/molokai'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  call plug#end()

" ****************element************
" 限制只对html,css文件使用的话:
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
" ****************element************

" *********MBF*************************
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplMoreThanOne=0

  map <F5> :MBEbp<CR>
  map <F6> :MBEbn<CR>
" *********MBF***********************

" *********vim-php-namespace************
  function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
  endfunction
  autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
  autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" ********vim-php-namespace*************

" ************syntastic语法检查*******
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol='✗'
  let g:syntastic_auto_jump = 1
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_style_error_symbol = '✗'
  let g:syntastic_style_warning_symbol = '⚠'

  nmap <A-up> :lprev<cr>
  nmap <A-down> :lnext<cr>
  nmap <A-right> :ll<cr>
  " 安装php语法分析器phpcs
" ************syntastic语法检查*******

"" **********auto-pairs自动括号单双引号补全******
  " let g:AutoPairsFlyMode = 0
  " let g:AutoPairsShortcutBackInsert = '<M-b>'
" **********auto-pairs自动括号单双引号补全******

" *********PHP函数提示*******************
" '!'代表重定义一个已经存在的函数
  if !exists('PHPAutoComplete')
    function! PHPAutoComplete()
      set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
      set complete-=k complete+=k
    endfunction
  endif
  au FileType php call PHPAutoComplete()
" *********PHP函数提示******************

" **********trainling-whitespace代码行最后无效的空格标红**
" leader+space去掉末尾空格
  map <leader><space> :FixWhitespace<cr>
" **********trainling-whitespace代码行左后无效的空格标红**


" ***********nerdcommenter注释******
" 注释的时候自动加个空格, 强迫症必配
  let NERDSpaceDelims = 1
" **********nerdcommenter注释************

" ***********ctrlp*****************
" 设置ctrlp的快捷方式 ctrp
" 打开ctrlp搜索
  let g:ctrlp_map = '<leader>ff'
  let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
  map <leader>fp :CtrlPMRU<CR>
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
  let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
      \ }
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_match_window_bottom=1
  let g:ctrlp_max_height=15
  let g:ctrlp_match_window_reversed=0
  let g:ctrlp_mruf_max=500
  let g:ctrlp_follow_symlinks=1
" ***********ctrlp****************

" ***********ultisnips*************
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" ***********ultisnips*************

" ***********rainbow_parentheses************
  let g:rainbow_active = 1
" ***********rainbow_parentheses************

" **********配置NERDTree********************
  map <F2> :NERDTreeToggle<CR>
" 光标回到目录树
  ""修改树的显示图标
  let g:NERDTreeDirArrowExpandable = '+'
  let g:NERDTreeDirArrowCollapsible = '-'
  ""窗口位置
  let g:NERDTreeWinPos='left'
  ""窗口尺寸
  let g:NERDTreeSize=30
  ""窗口是否显示行号
  let g:NERDTreeShowLineNumbers=1
  ""不显示隐藏文件
  let g:NERDTreeHidden=0
  ""打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
  ""当NERDTree为剩下的唯一窗口时自动关闭
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim nerdtree tabs 增强NERDTree
"  let g:nerdtree_tabs_open_on_console_startup=1       "设置打开vim的时候默认打开目录树
" **********配置NERDTree*******************

" *********tagbar****************************
  map <F3> :TagbarToggle<CR>
" F9触发，设置宽度为30
  let g:tagbar_width = 30
  let g:tagbar_ctags_bin = 'ctags'
  let g:tagbar_autofocus = 1
" 关闭排序,即按标签本身在文件中的位置排序
  let g:tagbar_sort = 0
" ********tagbar*****************************

" ***********代码缩进************************
" indentLine 代码缩进线标志线
  let g:indentLine_char = '|'
  let g:indentLine_color_term = 239
" 映射到ctrl+i键
  map <C-i> :IndentLinesToggle<CR>
" ***********代码缩进***********************


" **********快捷键设置************************
" 定义快捷键的前缀,常用的操作映射到 Leader 操作
  let mapleader = ","
" 定义快捷键到行首和行尾
  nmap lh 0
  nmap le $

" 光标 focus 左侧树形目录
  nnoremap ll <c-w>h
" 光标 focus 文件显示窗口
  nnoremap rr <c-w>l

" 使用 ,w 保存文件
  nnoremap <Leader>w :wq<CR>
" 退出不保存
  nnoremap <Leader>q :q!<CR>
" 使用 ,o 创建一个新文件
  nnoremap <Leader>o :CtrlP<CR>

" **********快捷键设置************************

" *********配色方案*************************
" 开启语法高亮
  syntax enable
  syntax on
" 根据是运行gvim 还是 在终端运行vim来判断使用哪个配色方案
  if has("gui_macvim") || has("gui_running")
      " 修改字体和大小
      set gfn=Monaco:h10
      " 取消默认的快捷键
      " let macvim_skip_cmd_opt_movement = 1
      " let macvim_hig_shift_movement = 1
      " 设置背景透明度
      " set transparency=10
      colorscheme molokai     " 设置颜色方案, 配置方案的文件在.vim/colors中
      set linespace=3         " 行间距
      set columns=180         " 初始窗口的宽度
      set lines=35            " 初始窗口的高度
      au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorline   " 高亮当前行
      au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorcolumn " 高亮当前列
  else
      colorscheme molokai
      set t_Co=256              " 让终端支持256色，否则很多配色不会正常显示，molokai就是其中之一
      set linespace=3
      set columns=180
      set lines=45
      " 终端时的背景颜色
      hi Pmenu ctermbg=black
      " 当在终端使用时，弹出提示框内的文本的高亮的颜色
      hi PmenuSel ctermfg=0 ctermbg=lightblue
  endif
" *********配色方案************************

" *********窗口设置************************
" 使用GUI界面时的设置(全是代码,不应该有工具条、菜单、滚动条浪费空间)
  if has("gui_running")
	  set guioptions+=c        " 使用字符提示框
	  set guioptions-=m        " 隐藏菜单栏
	  set guioptions-=T        " 隐藏工具栏
	  set guioptions-=L        " 隐藏左侧滚动条
	  set guioptions-=r        " 隐藏右侧滚动条
	  set guioptions-=b        " 隐藏底部滚动条
	  set showtabline=0       " 隐藏Tab栏
	  set cursorline           " 突出显示当前行
  endif
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
  fun! ToggleFullscreen()
	  call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
  endf
" 全屏开/关快捷键
  map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
  autocmd VimEnter * call ToggleFullscreen()
" *********窗口设置***********************

" *********状态栏美化********************
" 设置状态栏主题风格
"  let g:Powerline_colorscheme='solarized256'
" 总是显示状态栏
  set laststatus=2
" *********状态栏美化********************

" **********Basic Setup***********************
" 被分割窗口之间显示空白
  set fillchars=vert:/
  set fillchars=stl:/
  set fillchars=
" 浅色显示当前行
  autocmd InsertLeave * se nocul
" 用浅色高亮当前行
  autocmd InsertEnter * se cul
" 设置字体和大小
" set guifont=Monaco:h14
  set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 显示光标当前位置
  set ruler
" 在状态栏显示目前所执行的指令，未完成的指令片段亦会显示出来
  set showcmd
" 命令行显示vim当前模式
  set showmode
" 使用vim的键盘模式
  set nocompatible
" 开启行号显示
  set number
" Dont line wrap mid-word
  set lbr
" 设置Tab长度为4空格
  set tabstop=4
" 设置自动缩进长度为4空格
  set shiftwidth=4
  set softtabstop=4
" 继承前一行的缩进方式，适用于多行注释
  set autoindent
" 设置命令行记录条数默认500
  set history=1000
" 启动时隐去援助提示
  set shortmess=atI
" 高亮显示当前行/列
  set cursorline
  set cursorcolumn
" 高亮显示搜索结果
  set hlsearch
" 禁止折行
  set nowrap
" 增强模式中的命令行自动完成操作
  set wildmenu
" 与windows共享剪贴板
  set clipboard+=unnamed
" 长行显示自动折行
  set wrap
" 自动识别缩进
  set smartindent
" 用空格代替制表符
  set expandtab
" 在行和段开始处使用制表符
  set smarttab
" 在搜索的时候忽略大小写
  set ignorecase
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
  set incsearch
" 不需要备份
  set nobackup
  set noswapfile
" 设置编码支持中文不乱码
  set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
  set termencoding=utf-8
  set encoding=utf-8
" 允许用退格键删除字符
  set backspace=indent,eol,start
" ******************* 规范代码中缩进********
" 随 vim 自启动
  let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
  let g:indent_guides_start_level=2
" 色块宽度
  let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
  nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" *******************规范代码中的缩进******
" 基于缩进或语法进行代码折叠
  set foldenable                      " 允许自动折叠
  set foldmethod=marker               " 设置折叠的函数为marker， markervi自带
  set foldcolumn=0                    " 设置折叠的宽度, 就是折叠之后到底显示几行
  setlocal foldlevel=10               " 折叠层级, 最多最外层这贴包含多少个折叠
" 启动 vim 时关闭折叠代码
  set nofoldenable
" za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
" 不发出错误声音
  set noerrorbells
" 当文件内容被其他文件修改时自动加载
  set autoread
" 设置中文帮助
  set helplang=cn
" 当光标到达行尾或者行首时，继续移动转至下一行或者上一行, win有用
  set whichwrap+=<,>,h,l
" 用于目录插件NERD_tree上，打开目录忽略这些文件
  set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a
" 当文件太长时，打开不会显示@@符号的字样
  set dy=lastline
  set confirm                         " 在处理未保护或只读文件的时候，弹出确认
  set pumheight=30                    " 智能提示框层的高度
  set magic                           " 选择括号自动匹对闭合的括号
  " set cmdheight=2                   " 命令行（在状态行下）的高度，默认为1，这里是2
" 开启文件类型侦测
  filetype on
" 根据侦测到的不同类型加载对应的插件
" filetype Plug on
  set undodir=~/tmp/                  " 撤销缓存目录
  set undofile                        " 撤销文件, 当关闭文件之后，重新打开还可以无限撤销到最原始的文件
" 禁止光标闪烁
  set gcr=a:block-blinkon0
" 禁止显示滚动条
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
" 禁止显示菜单和工具条
  set guioptions-=m
  set guioptions-=T
" 保存 .vimrc 时自动重启加载它
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置重新载入.vimrc快捷键
  map <silent> <leader>ss :source ~/.vimrc<cr>
" 设置快速编辑.vimrc快捷键
  map <silent> <leader>ee :e ~/.vimrc<cr>
