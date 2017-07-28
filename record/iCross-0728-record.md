### Done

- build.log 文件绝不能删！

  最好每次编译前备份前一次编译生成的该文件。

- 找不到.config ----->   对于 2.6.16 kernel，解压后执行 make menuconfig 生成.config等文件，更改476行的.config路径，修改为实际编译时的绝对路径，例如我的是 /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16/.config ，再次打包压缩放入src目录下.

- ```shell
  [INFO ]  Installing kernel headers
  [DEBUG]    Using kernel's headers_install
  [EXTRA]    Installing kernel headers
  [DEBUG]    ==> Executing: '/usr/local/bin/make' '-C' '/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16' 'CROSS_COMPILE=x86_64-FT9-linux-gnu-' 'O=/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT9-linux-gnu/build/build-kernel-headers' 'ARCH=x86' 'INSTALL_HDR_PATH=/home/lk/x-tools/x86_64-FT9-linux-gnu/x86_64-FT9-linux-gnu/sysroot/usr' 'V=0' 'headers_install'
  [ALL  ]    make[1]: Entering directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16'
  [ALL  ]    /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16/Makefile:524: /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16/arch/x86/Makefile: No such file or directory
  [ALL  ]    make[2]: *** No rule to make target `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16/arch/x86/Makefile'.  Stop.
  [ERROR]    make[1]: *** [headers_install] Error 2
  [ALL  ]    make[1]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16'
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing kernel headers'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
  [ERROR]  >>        called from: do_kernel_install[scripts/build/kernel/linux.sh@119]
  [ERROR]  >>        called from: do_kernel_headers[scripts/build/kernel/linux.sh@91]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
  [ERROR]  >>
  [ERROR]  >>  For more info on this error, look at the file: 'build.log'
  [ERROR]  >>  There is a list of known issues, some with workarounds, in:
  [ERROR]  >>      '/home/lk/opt/ct-ng-1.22.0/share/doc/crosstool-ng/crosstool-ng-1.22.0/B - Known issues.txt'
  ```

  找不到x86/Makefile ----->   在arch目录下只有x86_64目录没有x86目录, 

  - vim /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16/Makefile

  ```
  175 #ARCH           ?= $(SUBARCH)  
   176 ARCH            ?= x86_64
  ```

  即更改175行为176行。Fail

  ```
  175 ARCH            := $(SUBARCH)
  ```

  - 即改 ?= 为 :=   Fail
  - 改 ?=  为 =       Fail

  ARCH=x86  这个编译参数的问题？

  ```
  SUBARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
                                    -e s/arm.*/arm/ -e s/sa110/arm/ \
                                    -e s/s390x/s390/ -e s/parisc64/parisc/ \
                                    -e s/ppc.*/powerpc/ )
        
  ARCH            ?= $(SUBARCH)
  ```

  - 是否会有其他参数影响编译参数中的ARCH的值？可是更改menuconfig中suffix和Architecture level的值时gcc编译出错。

  - 尝试直接更改arch/x86_64 为arch/x86  ， 2.6.32版本的内核其名字就为arch/x86

    更改后出现新的错误如下

    ```
    [INFO ]  Installing kernel headers
    [DEBUG]    Using kernel's headers_install
    [EXTRA]    Installing kernel headers
    [DEBUG]    ==> Executing: '/usr/local/bin/make' '-C' '/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16' 'CROSS_COMPILE=x86_64-FT9-linux-gnu-' 'O=/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT9-linux-gnu/build/build-kernel-headers' 'ARCH=x86' 'INSTALL_HDR_PATH=/home/lk/x-tools/x86_64-FT9-linux-gnu/x86_64-FT9-linux-gnu/sysroot/usr' 'V=0' 'headers_install'
    [ALL  ]    make[1]: Entering directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16'
    [ALL  ]    make[2]: *** No rule to make target `headers_install'.  Stop.
    [ERROR]    make[1]: *** [headers_install] Error 2
    [ALL  ]    make[1]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.16'
    [ERROR]
    [ERROR]  >>
    [ERROR]  >>  Build failed in step 'Installing kernel headers'
    [ERROR]  >>        called in step '(top-level)'
    [ERROR]  >>
    [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
    [ERROR]  >>        called from: do_kernel_install[scripts/build/kernel/linux.sh@119]
    [ERROR]  >>        called from: do_kernel_headers[scripts/build/kernel/linux.sh@91]
    [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
    [ERROR]  >>
    [ERROR]  >>  For more info on this error, look at the file: 'build.log'
    [ERROR]  >>  There is a list of known issues, some with workarounds, in:
    [ERROR]  >>      '/home/lk/opt/ct-ng-1.22.0/share/doc/crosstool-ng/crosstool-ng-1.22.0/B - Known issues.txt'
    [ERROR]
    [ERROR]  (elapsed: 112:38.36)
                                     
    ```

    估计是.config文件的内容不合适，两个思路，一个是在源码目录下执行make menuconfig配置，然后再次执行ct-ng命令，另一个是 直接手动编译内核，把生成结果放入ct-ng的生成目录中。或许可以参考ct-ng本身支持的内核版本是如何执行该部分的命令的。