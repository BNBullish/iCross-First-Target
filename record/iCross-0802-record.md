### 解决昨天的疑问

- glibc检查的as和ld是配置项里面的binutils版本，不是工作主机的！

  ​



### 出现的问题

- 配置：kernel 2.6.32 + glibc 2.4 + binutils 2.19.1a + gcc 4.8.5

报错信息如下：

```sh
12942 [ALL  ]    LC_ALL=C gawk -v oldest_abi=default -f scripts/abi-versions.awk /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-st      artfiles/Versions.all > /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/abi-versions.hT

12943 [ALL  ]    mv -f /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/abi-versions.hT /home/lk/ct-ng-1.22.0build/.buil      d/x8664-FT14-linux-gnu/build/build-libc-startfiles/abi-versions.h

12944 [ALL  ]    rm -f /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/tls.makeT /home/lk/ct-ng-1.22.0build/.build/x86      64-FT14-linux-gnu/build/build-libc-startfiles/tls.make.dT

12945 [ALL  ]    (echo '# Generated from tls.make.c by Makerules.';    x8664-FT14-linux-gnu-gcc     -std=gnu99 -O2 -U_FORTIFY_SOURCE -Wall -Winline -Wwrite-      strings -fmerge-all-constants -Wstrict-prototypes      -Iinclude  -I/home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfile      s -Isysdeps/x8664/elf -Inptl/sysdeps/unix/sysv/linux/x8664 -Isysdeps/unix/sysv/linux/x8664 -Isysdeps/unix/sysv/linux/wordsize-64 -Inptl/sysdeps/unix      /sysv/linux -Inptl/sysdeps/pthread -Isysdeps/pthread -Isysdeps/unix/sysv/linux -Isysdeps/gnu -Isysdeps/unix/common -Isysdeps/unix/mman -Isysdeps/unix/i      net -Inptl/sysdeps/unix/sysv -Isysdeps/unix/sysv -Isysdeps/unix/x8664 -Inptl/sysdeps/unix -Isysdeps/unix -Isysdeps/posix -Isysdeps/x8664/fpu -Inptl/s      ysdeps/x8664 -Isysdeps/x8664 -Isysdeps/wordsize-64 -Isysdeps/ieee754/ldbl-96 -Isysdeps/ieee754/dbl-64 -Isysdeps/ieee754/flt-32 -Isysdeps/ieee754 -Isy      sdeps/generic/elf -Isysdeps/generic -Inptl   -Ilibio -I. -nostdinc -isystem /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/buildtools/lib/gcc      /x8664-FT14-linux-gnu/4.8.5/include -isystem /home/lk/x-tools/x8664-FT14-linux-gnu/x8664-FT14-linux-gnu/sysroot/usr/include -D_LIBC_REENTRANT -inclu      de include/libc-symbols.h       -E -DASSEMBLER tls.make.c              -MD -MP -MT '$(common-objpfx)tls.make' -MF /home/lk/ct-ng-1.22.0build/.build/x8      664-FT14-linux-gnu/build/build-libc-startfiles/tls.make.dT       | sed -n '/@@@/{s/@@@[  ](.)@@@/1/;s/[        ]*$//p;}';      echo 'common-generate      d += tls.make';    sed -e 's@ /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/@ $(common-objpfx)@g' -e 's@^/home/l      k/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/@(common-objpfx)@g' -e 's@  *([^    /]   )@ (..)1@g' -e 's@^([^             /]   )@$(..)1@g' /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/tls.make.dT;          rm -f /home/lk/ct-      ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/tls.make.dT) > /home/lk/ct-ng-1.22.0build/.build/x86_64-FT14-linux-gnu/build/      build-libc-startfiles/tls.makeT

12946 [ALL  ]    In file included from nptl/sysdeps/pthread/allocalim.h:21:0,

12947 [ALL  ]                     from include/alloca.h:20,

12948 [ALL  ]                     from ./stdlib/stdlib.h:612,

12949 [ALL  ]                     from include/stdlib.h:8,

12950 [ALL  ]                     from nptl/sysdeps/x86_64/tls.h:28,

12951 [ALL  ]                     from include/tls.h:6,

12952 [ALL  ]                     from tls.make.c:3:

12953 [ERROR]    include/limits.h:125:27: fatal error: limits.h: No such file or directory

12954 [ALL  ]      # include_next <limits.h>

12955 [ALL  ]                               ^

12956 [ALL  ]    compilation terminated.

12957 [ALL  ]    /usr/bin/sed: can't read /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/tls.make.dT: No such file or d      irectory

12958 [ALL  ]    mv -f /home/lk/ct-ng-1.22.0build/.build/x8664-FT14-linux-gnu/build/build-libc-startfiles/tls.makeT /home/lk/ct-ng-1.22.0build/.build/x86      64-FT14-linux-gnu/build/build-libc-startfiles/tls.make
```

`vim  /home/lk/x-tools/x86_64-FT14-linux-gnu/x86_64-FT14-linux-gnu/sysroot/usr/include/limits.h`

```c
 /* Get the compiler's limits.h, which defines almost all the ISO constants.

    We put this #include_next outside the double inclusion check because
    it should be possible to include this file more than once and still get
    the definitions from gcc's header.  */
#if defined __GNUC__ && !defined _GCC_LIMITS_H_
/* `_GCC_LIMITS_H_' is what GCC's file defines.  */
# include_next <limits.h>
#endif
```

- 将这段全部注释掉会pass，不过感觉不对劲，因为没找到这个缺少的文件到底在哪个路径下，以及它是怎么产生的。如果是解压即有的话，那么就是include寻找环境没有配置好，可是这个工作是ct-ng做的，剩下一种可能就是glibc的版本不太对劲(也怪我，一旦出了很迷的错误就归罪于版本问题...)，这种.h文件应该也不会是在构建过程中产生的。----------->    


- 之后，不出意外地出错了

```sh
[ALL  ]    x86_64-FT14-linux-gnu-gcc     gconv_conf.c -c -std=gnu99 -O2 -U_FORTIFY_SOURCE -Wall -Winline -Wwrite-strings -fmerge-all-constants -Wstrict-prototypes   -DGCONV_PATH='"/usr/lib64/gconv"'   -I../include -I/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv -I/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final -I../sysdeps/x86_64/elf -I../nptl/sysdeps/unix/sysv/linux/x86_64 -I../sysdeps/unix/sysv/linux/x86_64 -I../sysdeps/unix/sysv/linux/wordsize-64 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/x86_64 -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/x86_64/fpu -I../nptl/sysdeps/x86_64 -I../sysdeps/x86_64 -I../sysdeps/wordsize-64 -I../sysdeps/ieee754/ldbl-96 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../nptl  -I.. -I../libio -I. -nostdinc -isystem /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/buildtools/lib/gcc/x86_64-FT14-linux-gnu/4.8.5/include -isystem /home/lk/x-tools/x86_64-FT14-linux-gnu/x86_64-FT14-linux-gnu/sysroot/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h       -o /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv/gconv_conf.o -MD -MP -MF /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv/gconv_conf.o.dt -MT /home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv/gconv_conf.o
[ALL  ]    gconv_db.c: In function 'find_derivation':
[ERROR]    gconv_db.c:422:22: error: 'INT_MAX' undeclared (first use in this function)
[ALL  ]       int best_cost_hi = INT_MAX;
[ALL  ]                          ^
[ALL  ]    gconv_db.c:422:22: note: each undeclared identifier is reported only once for each function it appears in
[ERROR]    make[3]: *** [/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv/gconv_db.o] Error 1
[ALL  ]    make[3]: *** Waiting for unfinished jobs....
[ERROR]    gconv_conf.c:70:16: error: 'INT_MAX' undeclared here (not in a function)
[ALL  ]         .cost_lo = INT_MAX,                             ^
[ALL  ]    gconv_builtin.h:32:1: note: in expansion of macro 'BUILTIN_TRANSFORMATION'
[ALL  ]     BUILTIN_TRANSFORMATION ("INTERNAL", "ISO-10646/UCS4/", 1, "=INTERNAL->ucs4",
[ALL  ]     ^
[ERROR]    make[3]: *** [/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final/iconv/gconv_conf.o] Error 1
[ALL  ]    make[3]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/src/glibc-2.4/iconv'
[ERROR]    make[2]: *** [iconv/subdir_lib] Error 2
[ALL  ]    make[2]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/src/glibc-2.4'
[ERROR]    make[1]: *** [all] Error 2
[ALL  ]    make[1]: Leaving directory `/home/lk/ct-ng-1.22.0_build/.build/x86_64-FT14-linux-gnu/build/build-libc-final'
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing C library'
[ERROR]  >>        called in step '(top-level)'
```

- 所以还是考虑要解决前面的那个问题，有相似的解决方案

  ```txt
  Hi,
   I reproduced it on a Fedora 21 x86 (same issue)
   find logs http://www.positiv-it.fr/ctng_logs.tgz

  look like an header conflict to me...

  I finally used CroosTool-NG version 1.16 and built a toolchain succesfully, but i would prefer use last ct-ng version.

  ```

  ​

### 更换ct-ng版本

使用 ct-ng 1.16 ,配置项为 Kernel 2.6.27.62 + binutils 2.19.1a + gcc 4.6.3 + glibc 2.5 + MPFR 3.0.0 + 选中自己编译autoconf和automake









### 后记

我开始怀疑这种方法能否可行了......

ct-ng 的模块化的确很棒，可是协调这些模块之间的关系貌似又是在比APP更低的层次做与之相同的工作？

