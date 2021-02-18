## 利用COC,可以轻松配置其他IDE.  
### C/C++
  \# termux  
  apt install clang  
  \# vim  
  :CocInstall coc-clangd  
### python
  \# termux  
  apt install python  
  pip install jedi  
  \# vim  
  :CocInstall coc-python  
### go-lang
  \# termux  
  apt install golang  
  \# vim  
  CocInstall coc-go  
### web
  \# termux  
  npm install typescript  
  \# vim  
  CocInstall coc-tsserver  
### mysql
  \# termux  
  apt install mariadb  
  \# vim  
  CocInstall coc-sql  
### bash
  \# vim  
  CocInstall coc-sh  
### vimscript
  \# vim  
  CocInstall coc-vimlsp  
### 其他
  其他还有很多，就不一一列举了，你可以在[这个页面](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)寻找你想要的coc插件  
