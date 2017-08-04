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
  ```

  ​

##### FT23 : ct1.16 + K 2.6.31 + B 2.19.1a + g 2.5 + G 4.6.3

##### B3 :  相比 B2 对2.4的glibc加了patch



### 后记

- glibc 2.3.6 有 inotify 的 patch
- ​