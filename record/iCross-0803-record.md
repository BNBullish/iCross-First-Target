### 试验记录

#### FT21

Centos7 + ct-ng 1.16 + Kernel 2.6.27.62 + binutils 2.17a + gcc 4.1.2 + glibc 2.5

构建过程一帆风顺，只是不能使用产出的编译器，即使是helloworld也不能编译

```
[lk@localhost code-samples]$ x86_64-FT21-linux-gnu-gcc tmp.c -o tmp-from-FT21
x86_64-FT21-linux-gnu-gcc: Internal error: Segmentation fault (program as)
Please submit a full bug report.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.

[lk@localhost code-samples]$ cat tmp.c 
#include<stdio.h>

int main() {
    printf("Hello, just a test.\n");
    return 0;
}
```



#### FT22

Centos7 + ct-ng 1.16 + Kernel 2.6.27.62 + binutils 2.20.1a + gcc 4.4.4 + glibc 2.5

```
[ALL  ]    In file included from /home/lk/ct-ng-1.16_build/.build/src/ppl-0.10.2/src/Interval.defs.hh:980:0,
[ALL  ]                     from /home/lk/ct-ng-1.16_build/.build/src/ppl-0.10.2/src/Rational_Interval.hh:26,
[ALL  ]                     from /home/lk/ct-ng-1.16_build/.build/src/ppl-0.10.2/src/Rational_Box.hh:26,
[ALL  ]                     from /home/lk/ct-ng-1.16_build/.build/src/ppl-0.10.2/src/Polyhedron_widenings.cc:28:
[ALL  ]    /home/lk/ct-ng-1.16_build/.build/src/ppl-0.10.2/src/Interval.inlines.hh:113:1: note: 'template<class T> typename Parma_Polyhedra_Library::Enable_If<Parma_Polyhedra_Library::Is_Singleton<T>::value, Parma_Polyhedra_Library::Interval_Restriction_None<Parma_Polyhedra_Library::Interval_Info_Null_Open<Parma_Polyhedra_Library::Interval_NS::Scalar_As_Interval_Policy> > >::type Parma_Polyhedra_Library::Interval_NS::f_info(const T&, bool)' declared here, later in the translation unit
[ALL  ]     f_info(const T&, bool open) {
[ALL  ]     ^
[ERROR]    make[4]: *** [Polyhedron_widenings.lo] Error 1
[ALL  ]    make[4]: *** Waiting for unfinished jobs....
[ALL  ]    mv -f .deps/C_Polyhedron.Tpo .deps/C_Polyhedron.Plo
[ALL  ]    mv -f .deps/NNC_Polyhedron.Tpo .deps/NNC_Polyhedron.Plo
[ALL  ]    mv -f .deps/Polyhedron_public.Tpo .deps/Polyhedron_public.Plo
[ALL  ]    make[4]: Leaving directory `/home/lk/ct-ng-1.16_build/.build/x86_64-FT22-linux-gnu/build/build-ppl-host-x86_64-build_unknown-linux-gnu/src'
[ERROR]    make[3]: *** [all] Error 2
[ALL  ]    make[3]: Leaving directory `/home/lk/ct-ng-1.16_build/.build/x86_64-FT22-linux-gnu/build/build-ppl-host-x86_64-build_unknown-linux-gnu/src'
[ERROR]    make[2]: *** [all-recursive] Error 1
[ALL  ]    make[2]: Leaving directory `/home/lk/ct-ng-1.16_build/.build/x86_64-FT22-linux-gnu/build/build-ppl-host-x86_64-build_unknown-linux-gnu'
[ERROR]    make[1]: *** [all] Error 2
[ALL  ]    make[1]: Leaving directory `/home/lk/ct-ng-1.16_build/.build/x86_64-FT22-linux-gnu/build/build-ppl-host-x86_64-build_unknown-linux-gnu'
```



Centos7 + ct-ng 1.16 + Kernel 2.6.27.62 + binutils 2.20.1a + gcc 4.6.3+ glibc 2.5

```
[CFG  ]    checking for ld used by GCC... /bin/ld
[CFG  ]    checking if the linker (/bin/ld) is GNU ld... yes
[CFG  ]    checking for shared library run path origin... done
[CFG  ]    checking how to link with libgmp... -lgmp
[CFG  ]    checking how to link with libgmpxx... -lgmpxx -lgmp
[CFG  ]    checking for the GMP library version 4.1.3 or above... no
[ERROR]    configure: error: Cannot find GMP version 4.1.3 or higher.
[CFG  ]    GMP is the GNU Multi-Precision library:
[CFG  ]    see http://www.swox.com/gmp/ for more information.
[CFG  ]    When compiling the GMP library, do not forget to enable the C++ interface:
[CFG  ]    add --enable-cxx to the configuration options.
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing PPL for host'
[ERROR]  >>        called in step '(top-level)'
```





### 小记

gcc版本低的话，Companion libraries里面没有选项

随着gcc版本升高，Companion libraries可配置的组件越多

估计 FT21 的失败与之有关。