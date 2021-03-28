#### 关于vim的优化和其他说明


- Plug 'honza/vim-snippets'  提供强大的代码块，对于Java 开发环境可装可不装，coc-java够用了，对于其他开发环境比如 C 建议装上，可以快速导入头文件及其他操作
- 我的编译运行，保存代码快捷键是通过修改termux扩展键盘以及vimrc自定义快捷键实现的，扩展按键代码[在这里(最长的一行\)](https://github.com/zongou/autoBuildTermux/blob/master/.github/workflows/build_termux.yml)
- 一键编译自动检测(检测当前工作目录是不是src)单文件还是项目，通过[我修改的JavaRun](https://github.com/zongou/JavaRun), 如果是单文件则用java命令直接执行，如果是项目则编译到out目录执行
- 以后会用maven的命令编辑运行，等我有空再写下快捷键
- 使用maven推荐coc插件：coc-xml  
[我的vimrc](https://github.com/zongou/notes/edit/master/vim/termux-vimrc)  
