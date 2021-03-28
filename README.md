# vim-IDE
  利用coc插件打造开发环境
  [效果视频](https://b23.tv/5i9w0B)
  
## vim + plug + coc
#### 安装 vim 和依赖
<details markdown='1'><summary>Termux 下: </summary>

```shell
#termux下nodejs已包含npm  
apt install vim nodejs git -y  
```
</details>
<details markdown='1'><summary>debian 下: </summary>

```shell
apt install vim nodejs npm git -y 
```
</details>

<details markdown='1'><summary>依赖说明</summary>

- plug依赖git  
- coc依赖nodejs, npm  
</details>

#### 配置[vim-plug](https://github.com/junegunn/vim-plug)管理器
[下载plug.vim文件](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)（用手动下载, git, 或wget等等），并放到.vim/autoload下  
```shell
#创建~/.vim/autoload/文件夹
mkdir -p ~/.vim/autoload/
#复制plug.vim包到这个目录下
cp [你的plug.vim] ~/.vim/autoload
# 编写vim配置文件,配置plug和coc
vim ~/.vimrc
```
plug添加coc
```vim
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
```
保存(按ESC,输入:w)  
刷新vimrc(按ESC,输入:so ~/.vimrc)  
安装插件coc(按ESC,输入:PlugInstall)
#### 配置coc
(coc是一个插件,也是一个包管理器平台)  
添加coc配置到.vimrc中去,下面是来自[coc项目](https://github.com/neoclide/coc.nvim)的模版
<details markdown='1'><summary>官方模版</summary>

```vim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
```
</details>  
到这里，一个简单的vim开发环境就搭建完成!

下面是为各种语言配置

## Java
#### 安装JDK
<details markdown='1'><summary>Termux安装openjdk11</summary>


[获取 JDK11 安装包](https://github.com/zongou/packages/releases/tag/openjdk11.0.1)  
> 
```shell
#安装任一jdk
dpkg -i [你的jdk包.deb]
#重启termux
#查看是否安装成功
java -version
```
- 感谢[xiliuya](https://github.com/xiliuya/openjdk11-termux)提供的方法  
- 感谢Lzhiyong编译的 [openjdk11](https://github.com/Lzhiyong/termux-ndk/releases/tag/openjdk)
   
</details>

<details markdown='1'><summary>debian安装JDK</summary>

```shell
sudo apt install openjdk-11-jdk-headless -y  
```
</details>


重新进入vim,输入命令安装推荐java插件
```vim
:CocInstall coc-java coc-snippets  
```
<details markdown='1'><summary>插件说明</summary>

- coc-java java自动补全
- coc-snippets 自动补全代码块  
</details>

打开一个java文件, 就会自动下载jdt.ls(java语言服务器)
```shell
vim Demo.java
```
如果下载太慢,可以手动配置
<details markdown='1'><summary>手动配置jdt.ls</summary>

下载jdtls包:     
官方: [最新包](https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz) [包在线目录](https://download.eclipse.org/jdtls/snapshots/?d)  
清华源代理: [最新包](https://mirrors.tuna.tsinghua.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz) [包在线目录](https://mirrors.tuna.tsinghua.edu.cn/eclipse/jdtls/)


```shell
#创建原目录
mkdir -p ~/.config/coc/extensions/coc-java-data/server/
#将jdt.ls的包解压到这个目录下  
tar -xzvf [jdt.ls的包] -C ~/.config/coc/extensions/coc-java-data/server/
```
重新打开vim,看看jdt.ls是否运行  
</details>

大功告成！到这里，一个简单的Java开发环境就搭建完成!你还可以[点这里](https://github.com/zongou/vimIde/blob/master/vimJavaIdeOptimization_zh.md)看看我的优化和配置  
## C/C++
    # termux  
    apt install clang  
    # vim  
    :CocInstall coc-clangd  
## python
    # termux  
    apt install python  
    pip install jedi  
    # alibaba agent  
    pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/  
    # vim  
    :CocInstall coc-python  
## go-lang
    # termux  
    apt install golang  
    # vim  
    :CocInstall coc-go  
## web
    # termux  
    # add -g option to install to system  
    npm install typescript  
    # vim  
    :CocInstall coc-html coc-emmet coc-tsserver coc-css
## mysql
    # termux  
    apt install mariadb  
    # vim  
    :CocInstall coc-sql  
## bash
    # vim  
    :CocInstall coc-sh  
## vimscript
    # vim  
    :CocInstall coc-vimlsp  
## 其他
  其他还有很多，就不一一列举了，你可以在[这个页面](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)寻找你想要的coc插件  
