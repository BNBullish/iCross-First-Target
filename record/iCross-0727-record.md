### Done

- 在虚拟机里安装了当前需要的32bit/64bit的不同Linux发行版

- 测试了 curl 的编译， 成功运行在其他系统

- Centos7 64bit 编译出了 32bit 的工具链

- ct-ng 1.22.0 的 scripts/addToolVersion.sh 需要移到源码目录下执行，另外有语法错误，把140行的elif改为if

- 一旦从 menuconfig 更改配置，需要重新开始编译，这样才可以使新配置生效，猜想有缓存文件

- 先执行 addToolVersion.sh 再安装ct-ng, 即可根据添加的版本配置

- 报错：

  ```
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

  ​



### Next

- 给工作host加硬盘
- 找库的依赖关系
- 打开或者关闭./configure的某些选项   (NSS主要是这个)
- 自展编译构建最终需要的库
- ​