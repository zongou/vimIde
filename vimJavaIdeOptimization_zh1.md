[这是我的vimrc配置](https://github.com/zongou/vimJavaIDE/blob/master/.vimrc)  
### 更改悬浮窗的颜色
    "===============================
    " 悬浮窗
    :hi Pmenu ctermfg=16 ctermbg=252 cterm=NONE guifg=#697383 guibg=#d3d1cc gui=NONE
    " 悬浮窗选择状态
    :hi PmenuSel ctermfg=16 ctermbg=45 cterm=bold guifg=#555f6f guibg=#bdbbb6 gui=bold
    " 悬浮窗滚动条全区
    :hi PmenuSbar ctermbg=188 cterm=NONE guibg=#dfddd7 gui=NONE
    " 滚动条拖动条
    :hi PmenuThumb ctermbg=247 cterm=NONE guibg=#929cad gui=NONE
    " coc 高亮
    " 更多参数 :help CocWarningHighlight@cn
    " ---
    " 错误
    " 错误标记
    :hi CocErrorSign ctermfg=124 ctermbg=NONE
    " 错误文本
    :hi CocErrorHighlight ctermfg=124 ctermbg=NONE cterm=underline,bold guifg=#697383 guibg=#d3d1cc gui=NONE
    " 错误悬浮窗
    :hi CocErrorFloat ctermfg=124 ctermbg=252 cterm=NONE guifg=#697383 guibg=#d3d1cc gui=NONE
    " 警告⚠
    " 警告符⚠
    :hi CocWarningSign ctermfg=124 ctermbg=NONE cterm=bold guifg=#697383 guibg=#d3d1cc gui=NONE
    " 警告文本
    :hi CocWarningHighlight ctermfg=124 ctermbg=252 cterm=NONE guifg=#697383 guibg=#d3d1cc gui=NONE
    " 警告悬浮窗
    :hi CocWarningFloat ctermfg=124 ctermbg=252 cterm=NONE guifg=#697383 guibg=#d3d1cc gui=NONE

## 更改配色
    使用第三方配色:
    下载配色 .vim 包
    放到 ~/.vim/colors/
    设置配色
    :colorscheme [配色名]
    背景
    :set background=[light/dark]
    另一种方法改背景
    :hi Normal ctermfg=16 ctermbg=255
    
## coc-snippets 使用 vim-snippets
    Plug 'honza/vim-snippets'
    
