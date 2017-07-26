

### Examples

[主菜单](http://img.027cgb.cn/20170721/20177212811775731906.png)
[次级菜单](http://img.027cgb.cn/20170721/20177217181775731906.png)
[kernel](http://img.027cgb.cn/20170721/2017721781775731906.png)
[glibc](http://img.027cgb.cn/20170721/20177214841775731906.png)
[gcc](http://img.027cgb.cn/20170721/20177218751775731906.png)

### Revise

- 在 `ct-ng menuconfig` 里面可以设置，以允许 root 用户 build 。

### Done

- 版本之间的一些关系

- 安装centos6

- Test1 

  ```shell
  [INFO ]  =================================================================
  [INFO ]  Installing kernel headers
  [EXTRA]    Installing kernel headers
  [ERROR]    gmake[1]: *** [headers_install] Error 2
  [ERROR]   
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing kernel headers'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  [ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@338]
  [ERROR]  >>        called from: do_kernel_headers[scripts/build/kernel/linux.sh@106]
  [ERROR]  >>        called from: main[scripts/crosstool-NG.sh@653]
            

  Current command:
    'make' '-C' '/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/src/linux-2.6.18' 'BASH=/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/tools/bin/bash' 'HOSTCC=x86_64-build_pc-linux-gnu-gcc' 'CROSS_COMPILE=x86_64-centos6-linux-gnu-' 'O=/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/x86_64-centos6-linux-gnu/build/build-kernel-headers' 'ARCH=x86' 'INSTALL_HDR_PATH=/home/lk/crosstool-ng/x-tools/x86_64-centos6-linux-gnu/x86_64-centos6-linux-gnu/sysroot/usr' 'V=0' 'headers_install' 
  ```

- centos6test: kernel 2.6.32 + glibc 2.12.1 + gcc 4.8.5 成功

- centos6test2: 2.6.32 + 2.12.1 + 4.9.4 成功

- 过一遍官方文档

- **lzcat** is equivalent to **xz --format=lzma --decompress --stdout**

- 安装1.16.0版本configure时`configure: error: could not find GNU libtool >= 1.5.26` centos下需要安装`libtool`   ` libtool*`

### Question

- 自定义gcc glibc版本号   不可以

- 貌似可以

  ```markdown
  Adding a new version of a component
  When a new component, such as the Linux kernel, gcc or any other is released, adding the new version to crosstool-NG is quite easy. There is a script that will do all that for you:

  scripts/addToolVersion.sh

  Run it with no option to get some help.
  ```

  ​

### Next

- 版本之间的联系与限制
- 继续测试
- 这次编译结束后尝试添加新版本的glibc和gcc
- 大致浏览相关的issue