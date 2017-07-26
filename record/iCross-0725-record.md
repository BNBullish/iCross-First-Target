### Example

**Github**



### Question

```
[ALL  ]      mv -f /home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/i686-FormalTest3-linux-gnu/build/build-libc-startfiles/multilib/csu/stamp.oST /home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/i686-FormalTest3-linux-gnu/build/build-libc-startfiles/multilib/csu/stamp.oS
[ERROR]      make[3]: *** [Makefile:94: /home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/i686-FormalTest3-linux-gnu/build/build-libc-startfiles/multilib/csu/crti.o] Error 1
[ERROR]      make[3]: *** Waiting for unfinished jobs....
[ALL  ]      /tmp/ccVtm1GK.s: Assembler messages:
[ALL  ]      /tmp/ccVtm1GK.s:33: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:35: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:36: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:38: Error: .cfi_endproc without corresponding .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:53: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:55: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:56: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]      /tmp/ccVtm1GK.s:58: Error: .cfi_endproc without corresponding .cfi_startproc
[ERROR]      make[3]: *** [Makefile:94: /home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/i686-FormalTest3-linux-gnu/build/build-libc-startfiles/multilib/csu/crtn.o] Error 1
[ALL  ]      make[3]: Leaving directory '/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/src/glibc-2.12.1/csu'
[ERROR]      make[2]: *** [Makefile:207: csu/subdir_lib] Error 2
[ALL  ]      make[2]: Leaving directory '/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/src/glibc-2.12.1'
[ERROR]      make[1]: *** [Makefile:12: csu/subdir_lib] Error 2
[ALL  ]      make[1]: Leaving directory '/home/lk/crosstool-ng/crosstool-ng-1.23.0_build/.build/i686-FormalTest3-linux-gnu/build/build-libc-startfiles/multilib'
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Building for multilib 1/1: '''
[ERROR]  >>        called in step 'Installing C library headers & start files'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@338]
[ERROR]  >>        called from: do_libc_backend_once[scripts/build/libc/glibc.sh@433]
[ERROR]  >>        called from: CT_IterateMultilibs[scripts/functions@1760]
[ERROR]  >>        called from: do_libc_backend[scripts/build/libc/glibc.sh@150]
[ERROR]  >>        called from: do_libc_start_files[scripts/build/libc/glibc.sh@112]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh@653]
```



```
[ALL  ]    /tmp/cciFUBVo.s: Assembler messages:
[ALL  ]    /tmp/cciFUBVo.s:33: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:35: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:36: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:38: Error: .cfi_endproc without corresponding .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:53: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:55: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:56: Error: CFI instruction used without previous .cfi_startproc
[ALL  ]    /tmp/cciFUBVo.s:58: Error: .cfi_endproc without corresponding .cfi_startproc
[ALL  ]    /tmp/cc4uD0Uo.s: Assembler messages:
[ALL  ]    /tmp/cc4uD0Uo.s: Error: open CFI at the end of file; missing .cfi_endproc directive
[ALL  ]    /tmp/cc4uD0Uo.s: Error: open CFI at the end of file; missing .cfi_endproc directive
[ERROR]    gmake[3]: *** [/home/lk/crosstool-ng_build/.build/i386-FormalTest2-linux-gnu/build/build-libc-startfiles/csu/crtn.o] Error 1
[ALL  ]    gmake[3]: *** Waiting for unfinished jobs....
[ERROR]    gmake[3]: *** [/home/lk/crosstool-ng_build/.build/i386-FormalTest2-linux-gnu/build/build-libc-startfiles/csu/crti.o] Error 1
[ALL  ]    gmake[3]: Leaving directory `/home/lk/crosstool-ng_build/.build/src/glibc-2.11.1/csu'
[ERROR]    gmake[2]: *** [csu/subdir_lib] Error 2
[ALL  ]    gmake[2]: Leaving directory `/home/lk/crosstool-ng_build/.build/src/glibc-2.11.1'
[ERROR]    gmake[1]: *** [csu/subdir_lib] Error 2
[ALL  ]    gmake[1]: Leaving directory `/home/lk/crosstool-ng_build/.build/i386-FormalTest2-linux-gnu/build/build-libc-startfiles'
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing C library headers & start files'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions@257]
[ERROR]  >>        called from: do_libc_backend_once[scripts/build/libc/glibc.sh@450]
[ERROR]  >>        called from: do_libc_backend[scripts/build/libc/glibc.sh@153]
[ERROR]  >>        called from: do_libc_start_files[scripts/build/libc/glibc.sh@70]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh@646]
[ERROR]  >>
```



### 已经解决上述问题：

vim .build/src/glibc-2.11.1/sysdeps/i386/Makefile     在末尾处添加一下内容

```
ifeq ($(subdir),csu)
CFLAGS-initfini.s += -fno-unwind-tables -fno-asynchronous-unwind-tables
endif

ifeq ($(subdir),nptl)
CFLAGS-pt-initfini.s += -fno-unwind-tables -fno-asynchronous-unwind-tables
endif
```

问题解决， 参见 http://techqa.info/programming/question/30848492/  

至于这些参数的作用，参见 https://software.intel.com/en-us/blogs/2013/01/17/x86-gcc-code-size-optimizations





