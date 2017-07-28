### Done

- 在虚拟机里安装了当前需要的32bit/64bit的不同Linux发行版

- 测试了 curl 的编译， 成功运行在其他系统

- Centos7 64bit 编译出了 32bit 的工具链

- ct-ng 1.22.0 的 scripts/addToolVersion.sh 需要移到源码目录下执行，另外有语法错误，把140行的elif改为if

- 一旦从 menuconfig 更改配置，需要重新开始编译，这样才可以使新配置生效，猜想有缓存文件

- 执行一次./configure和make后才可执行addToolVerwsion.sh，或者直接重新安装前执行该脚本

  执行 addToolVersion.sh 后再安装ct-ng, 即可根据添加的版本配置

- 报错：

  ```shell
  [ALL  ]    /home/lk/crosstool-ng_build-test/.build/src/gcc-4.8.5/gcc/doc/md.texi:6: warning: node prev `Machine Desc' in menu `Loop Analysis and Representation' and in sectioning `Control Flow' differ
  [ALL  ]    makeinfo: error on closing doc/gcc.info: No space left on device
  [ALL  ]    build/genemit /home/lk/crosstool-ng_build-test/.build/src/gcc-4.8.5/gcc/config/i386/i386.md    insn-conditions.md > tmp-emit.c
  [ALL  ]    /usr/bin/bash: tmp-emit.c: No space left on device
  [ERROR]    gmake[2]: *** [s-emit] Error 1
  [ALL  ]    gmake[2]: *** Waiting for unfinished jobs....
  [ALL  ]    genattrtab: cannot close file tmp-attrtab.c: No space left on device
  [ERROR]    gmake[2]: *** [s-attrtab] Error 1
  [ERROR]    gmake[2]: *** [s-automata] Error 1
  [ALL  ]    makeinfo: error on closing doc/gccint.info: No space left on device
  [ALL  ]    rm gcc.pod
  [ALL  ]    gmake[2]: Leaving directory `/home/lk/crosstool-ng_build-test/.build/x86_64-FormalTest6-linux-gnu/build/build-cc-gcc-core-pass-1/gcc'
  [ERROR]    gmake[1]: *** [all-gcc] Error 2
  [ALL  ]    gmake[1]: Leaving directory `/home/lk/crosstool-ng_build-test/.build/x86_64-FormalTest6-linux-gnu/build/build-cc-gcc-core-pass-1'
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing pass-1 core C gcc compiler'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
  [ERROR]  >>        called from: do_gcc_core_backend[scripts/build/cc/100-gcc.sh@537]
  [ERROR]  >>        called from: do_gcc_core_pass_1[scripts/build/cc/100-gcc.sh@112]
  [ERROR]  >>        called from: do_cc_core_pass_1[scripts/build/cc.sh@35]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
  ```

  加大磁盘空间即可

-   报错 2.6.16 + 2.4 + 4.8.5

  ```shell
  [INFO ]  Installing kernel headers
  [DEBUG]    Using kernel's headers_install
  [EXTRA]    Installing kernel headers
  [DEBUG]    ==> Executing: '/usr/local/bin/make' '-C' '/home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16' 'CROSS_COMPILE=x86_64-FormalTest6-linux-gnu-' 'O=/home/lk/crosstool-ng_build-test/.build/x86_64-FormalTest6-linux-gnu/build/build-kernel-headers' 'ARCH=x86' 'INSTALL_HDR_PATH=/home/lk/x-tools/x86_64-FormalTest6-linux-gnu/x86_64-FormalTest6-linux-gnu/sysroot/usr' 'V=0' 'headers_install'
  [ALL  ]    make[1]: Entering directory `/home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16'
  [ALL  ]    /home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16/Makefile:476: .config: No such file or directory
  [ALL  ]    /home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16/Makefile:524: /home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16/arch/x86/Makefile: No such file or directory
  [ALL  ]    make[2]: *** No rule to make target `/home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16/arch/x86/Makefile'.  Stop.
  [ERROR]    make[1]: *** [headers_install] Error 2
  [ALL  ]    make[1]: Leaving directory `/home/lk/crosstool-ng_build-test/.build/src/linux-2.6.16'
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing kernel headers'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
  [ERROR]  >>        called from: do_kernel_install[scripts/build/kernel/linux.sh@119]
  [ERROR]  >>        called from: do_kernel_headers[scripts/build/kernel/linux.sh@91]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
  ```

  下载内核后解压，执行 make menuconfig 即可生成 .config 文件​

  ​

- 报错  2.6.18 + 2.5 + 4.9.3

  ```
  [INFO ]  Installing kernel headers
  [DEBUG]    Using kernel's headers_install
  [EXTRA]    Installing kernel headers
  [DEBUG]    ==> Executing: '/usr/local/bin/make' '-C' '/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18' 'CROSS_COMPILE=x86_64-FT8-linux-gnu-' 'O=/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT8-linux-gnu/build/build-kernel-headers' 'ARCH=x86' 'INSTALL_HDR_PATH=/home/lk/x-tools/x86_64-FT8-linux-gnu/x86_64-FT8-linux-gnu/sysroot/usr' 'V=0' 'headers_install'
  [ALL  ]    make[1]: Entering directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18'
  [ALL  ]    /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18/Makefile:486: /home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18/arch/x86/Makefile: No such file or directory
  [ALL  ]    make[2]: *** No rule to make target `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18/arch/x86/Makefile'.  Stop.
  [ERROR]    make[1]: *** [headers_install] Error 2
  [ALL  ]    make[1]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/src/linux-2.6.18'
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing kernel headers'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
  [ERROR]  >>        called from: do_kernel_install[scripts/build/kernel/linux.sh@119]
  [ERROR]  >>        called from: do_kernel_headers[scripts/build/kernel/linux.sh@91]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
  ```

-  ​

- 尝试使用更高内核版本

- 2.6.32 + 2.5 + 4.8.5 + binutils 2.22

  ```
  [CFG  ]    checking version of /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT8-linux-gnu/buildtools/lib/gcc/x86_64-FT8-linux-gnu/4.9.3/../../../../x86_64-FT8-linux-gnu/bin/as... 2.25.1, bad
  [CFG  ]    checking for /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT8-linux-gnu/buildtools/lib/gcc/x86_64-FT8-linux-gnu/4.9.3/../../../../x86_64-FT8-linux-gnu/bin/ld... /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT8-linux-gnu/buildtools/lib/gcc/x86_64-FT8-linux-gnu/4.9.3/../../../../x86_64-FT8-linux-gnu/bin/ld
  [CFG  ]    checking version of /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT8-linux-gnu/buildtools/lib/gcc/x86_64-FT8-linux-gnu/4.9.3/../../../../x86_64-FT8-linux-gnu/bin/ld... 2.25.1, bad
  [CFG  ]    checking for pwd... /usr/bin/pwd
  [CFG  ]    checking for x86_64-FT8-linux-gnu-gcc... (cached) x86_64-FT8-linux-gnu-gcc
  [CFG  ]    checking version of x86_64-FT8-linux-gnu-gcc    ... 4.9.3, ok
  [CFG  ]    checking for gnumake... no
  [CFG  ]    checking for gmake... gmake
  [CFG  ]    checking version of gmake... 3.81, ok
  [CFG  ]    checking for gnumsgfmt... no
  [CFG  ]    checking for gmsgfmt... no
  [CFG  ]    checking for msgfmt... msgfmt
  [CFG  ]    checking version of msgfmt... 0.18.2, ok
  [CFG  ]    checking for makeinfo... makeinfo
  [CFG  ]    checking version of makeinfo... 5.1, bad
  [CFG  ]    checking for sed... sed
  [CFG  ]    checking version of sed... v. ?.??, bad
  [CFG  ]    checking for autoconf... autoconf
  [CFG  ]    checking whether autoconf works... yes
  [ERROR]    configure: error:
  [CFG  ]    *** These critical programs are missing or too old: as ld
  [CFG  ]    *** Check the INSTALL file for required versions.
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing C library headers & start files'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
  [ERROR]  >>        called from: do_libc_backend_once[scripts/build/libc/glibc.sh@348]
  [ERROR]  >>        called from: do_libc_backend[scripts/build/libc/glibc.sh@153]
  [ERROR]  >>        called from: do_libc_start_files[scripts/build/libc/glibc.sh@70]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
  ```

  ​





### Next

- 找库的依赖关系
- 打开或者关闭./configure的某些选项   (NSS主要是这个)
- 自展编译构建最终需要的库
- ​