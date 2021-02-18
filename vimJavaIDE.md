### 1: install neccesary programs

  JDK 

    get JDK package (it's simpler to use jdk11)

      JDK11 for termux [project](https://github.com/Lzhiyong/termux-ndk/releases)

        [install script example](https://github.com/zongou/vimJavaIDE/blob/master/termuxInstallJDK11.sh)

      JDK8 for termux (package: https://github.com/yaoxiaonie/Res-termux-java)

         install script (https://github.com/yaoxiaonie/Termux-Java)

      JDK for debian and others (https://mirrors.tuna.tsinghua.edu.cn/AdoptOpenJDK/)

      

  vim/nvim as editor

    apt install vim

    vim plugin manager

      vim-plug (project: https://github.com/junegunn/vim-plug)

        vim-plug dependency: git

          apt install git

        place plug.vim within ~/.vim/autolaod/

          (source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

          (project: https://github.com/junegunn/vim-plug)

        add scripts to the end of vimrc to add coc plug (if there is no ~/.vimrc, cp ~/../usr/share/vim/vim82/vimrc_example.vim ~/.vimrc)

          call plug#begin('~/.vim/plugged')

          Plug 'neoclide/coc.nvim', {'branch': 'release'}

          call plug#end()

        make sure git is installed, them start vim, type command :PlugInstall, this will instll coc,

        then make sure nodejs and npm are installed,

        coc depends on nodejs and npm

        (to install nodejs and npm, for termux , apt install nodejs, for debian, apt install nodejs npm)

  coc (project: https://github.com/neoclide/coc.nvim)

    setup vimrc scripts

      example copied from offical:(https://github.com/zongou/vimJavaIDE/blob/master/coc_scripts_example)

    for java: :CocInstall coc-java coc-pair coc-snippets

    then use vim open a java file, vim will download jdt.ls

    if download speed is slow, download package manually and extract and place them place in ~/.config/coc/extensions/coc-java-data/server

      package: https://download.eclipse.org/jdtls/snapshots/?d

      file structure under server is like:

      ~/.config/coc/extensions/coc-java-data/server# ls

        config.linux

        config.mac

        ...

        features

        plugins

      



    

//reference

  coc

    https://hellowar.club/2020/07/26/coc-nvim-ji-ben-pei-zhi/#more

  vim-plug 

    https://www.cnblogs.com/tcppdu/p/9789019.html

    https://www.php.cn/linux-451551.html

  nodejs and npm

    https://ywnz.com/linuxjc/5819.html

  
