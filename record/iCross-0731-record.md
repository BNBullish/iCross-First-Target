### Centos5/SUSE10 环境编译不通过

###  

### 猜想



#### 1

安装头文件出错，出错内容为之前记录中的错误

- 从 SUSE10 的kernel目录中复制.config文件(或有其他文件？)到下载的2.6.16源码包中重新打包

  --> 没有源码文件夹，找不到想要的Makefile和.config

  ---> /boot/config*  

- 尝试使用Centos6构建，或者Ubuntu10.04

- 尝试使用更老的ct-ng版本--包含2.6.16内核的版本

-  ​

- 可以不用内核源码，尝试使用头文件？ Use pre-installed headers tree

  把源码中的include目录打包压缩，然后在menuconfig中选中上述选项和文件为压缩包选项，构建过程中的安装头文件这一步不报错



#### 2

下一步 as 和 ld 版本检查不通过

```
[ERROR]    configure: error:
[CFG  ]    *** These critical programs are missing or too old: as ld
[CFG  ]    *** Check the INSTALL file for required versions.
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing C library headers & start files'
[ERROR]  >>        called in step '(top-level)'
```



vim .build/src/glibc-2.4/configure 中找到如下版本要求

```
Accept binutils 2.13 or newer

For versioning you need recent binutils (binutils-2.8.1.0.23 or newer)

```

- 据说修改该文件欺骗或者屏蔽版本检查会在之后仍然出错，所以尝试如下所说

```
在网上下载了binutils-2.19，并编译和安装（先把自己的ld和as备份起来），然后在回到glibc里的configure中把原来的测试ld和as版本的代码改回去，

再编译，就通过了。
```

- 还有一种说法是autoconf版本不对，先把这个说法放在这里，我觉得没有直接关系。

- ```
  CFLAGS="-Wno-unused-but-set-variable" ../configure --disable-warnings-as-errors --prefix=/usr/local/binutils-2.17
  用这个忽略不致命的错误
  ```

- 尝试了2.17版本的binutils，结果仍然测试不通过，尝试更老版本的binutils

- ```
  export PATH=/usr/local/binutils-2.17/bin:$PATH    #放在前面
  hash -r    #刷新缓存

  即可将as等工具实际指向新安装的版本
  ```

- ​