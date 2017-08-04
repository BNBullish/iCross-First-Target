### 小记

- 为每次build都新建一个目录，即每次的每次的工作目录都不同
- 各种配置搭配太多了，是否有可能一一试下去？---> X
- 专注于解决一种配置的错误 可能更为有效  ---> Y



### 试验

##### B1 : ct1.22 + K 2.6.32.68 + B 2.19.10 + g 2.4 + G 5.2.0

##### B2 : ct1.22 + K 2.6.32.68 + B 2.19.10 + g 2.4 + G 4.8.5

- 找不到 limits.h

  ```
  vim /home/lk/b2/.build/src/glibc-2.4/include/limits.h +125
  指定绝对路径
  //# include_next <limits.h>
  #include "/home/lk/b2/.build/x86_64-B2-linux-gnu/buildtools/lib/gcc/x86_64-B2-linux-gnu/4.8.5/include-fixed/limits.h"
  ```

- 隐式规则和显式规则混合

  ```
  vim /home/lk/b3/.build/src/glibc-2.4/manual/Makefile +235
  把
  $(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
         $(make-target-directory)
         touch $@
  改为
  $(objpfx)stubs: $(make-target-directory)
          touch $@
  ../po/manual.pot: $(make-target-directory)
          touch $@
  $(objpfx)stamp%: $(make-target-directory)
          touch $@
  注意touch前面应该为一个tab,不能是八个空格
  ```

- 之后遇到了

  ```
  [ERROR]    ../sysdeps/ieee754/dbl-64/s_signbit.c:26:1: error: redefinition of '__signbit'
  [ALL  ]     __signbit (double x)
  [ALL  ]     ^
  [ALL  ]    In file included from ../include/sys/cdefs.h:3:0,
  [ALL  ]                     from ../include/features.h:323,
  [ALL  ]                     from ../math/math.h:28,
  [ALL  ]                     from ../include/math.h:3,
  [ALL  ]                     from ../sysdeps/ieee754/dbl-64/s_signbit.c:21:
  [ALL  ]    ../sysdeps/x86_64/fpu/bits/mathinline.h:42:8: note: previous definition of '__signbit' was here
  [ALL  ]     __NTH (__signbit (double __x))
  [ALL  ]            ^
  [ALL  ]    ../misc/sys/cdefs.h:48:52: note: in definition of macro '__NTH'
  [ALL  ]     #  define __NTH(fct) __attribute__ ((__nothrow__)) fct
  [ALL  ]                                                        ^
  [ERROR]    gmake[3]: *** [/home/lk/b2/.build/x86_64-B2-linux-gnu/build/build-libc-final/math/s_signbit.o] Error 1
  [ALL  ]    gmake[3]: *** Waiting for unfinished jobs....
  [ALL  ]    gmake[3]: Leaving directory `/home/lk/b2/.build/src/glibc-2.4/math'
  [ERROR]    gmake[2]: *** [math/subdir_lib] Error 2
  [ALL  ]    gmake[2]: Leaving directory `/home/lk/b2/.build/src/glibc-2.4'
  [ERROR]    gmake[1]: *** [all] Error 2
  [ALL  ]    gmake[1]: Leaving directory `/home/lk/b2/.build/x86_64-B2-linux-gnu/build/build-libc-final'
  [ERROR]
  [ERROR]  >>
  [ERROR]  >>  Build failed in step 'Installing C library'
  [ERROR]  >>        called in step '(top-level)'
  [ERROR]  >>
  ```

  据说是glibc版本问题，遂尝试B3

##### FT23 : ct1.16 + K 2.6.31 + B 2.19.1a + g 2.5 + G 4.6.3

##### B3 :  相比 B2 对2.4的glibc加了patch

- 结果仍然遇到了B2的问题



### 后记

- glibc 2.3.6 有 inotify 的 patch
- ​