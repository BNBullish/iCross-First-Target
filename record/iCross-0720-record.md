# 记录一些坑

环境：CentOS Linux release 7.3.1611 (Core) mini

安装：crosstool-ng 1.23.0

*每次完成一部分工作做一下快照和克隆，做好注释记录*

---

### ct-ng安装阶段

#### ./configure 阶段

- 缺啥装啥，例外情况
- 官方文档给出了事先需要安装的软件包，先安装完成在进行./configure
- 安装在普通用户有权限的路径下

#### make install 阶段

1. For auto-completion, do not forget to install 'ct-ng.comp' into your bash completion directory (usually /etc/bash_completion.d)

   可能是这个意思 cp ct-ng.comp /etc/bash_completion.d/

*之后添加环境变量即可*

*不可以用root用户build，所以安装步骤最好全在普通用户下操作*

---

### 目录设置

1. crosstool-ng-1.23.0
  crosstool-ng的源码包：解压后的文件夹，包含了crosstool-ng的相关源码
2. crosstool-ng-1.23.0_build
  专门为后期使用crosstool-ng去建立交叉编译器的编译（build），而专门建立的文件夹。
  对应的，后续的ct-ng menuconfig，ct-ng build等命令，都是在此文件夹下执行的。
3. src
  为crosstool-ng中，后续需要下载各种软件的源码包，而准备的，
  crosstool-ng中，在开始执行build之后，会去下载对应的源码包，都会存放到这个文件夹下
4. x-tools
  这个文件夹是用crosstool-ng所生成的交叉编译器，所在的路径。
  对应的配置中，会有，类似于：(/home/lk/crosstool-ng/x-tools/\${CT_TARGET}) **Prefix directory** 的配置，用来指定生成的交叉编译器，存放在何处。

---

### ct-ng 使用初探

#### 选择 samples

1.23.0版本的ct-ng提供的samples都很新，跟需求相差较大，所以需要在下一步费工夫

#### menuconfig

除了ct-ng本身的设置，如保存断点、交互环境、下载延迟时间、并行数目、路径设置 之外，最为关注**kernel, glibc, gcc** 的搭配设置

没有想要的版本需要**自己下载**，具体下载的格式和位置等成功build一次之后结合文档排查

已知变量名代表的意思有 

1. ${HOME}  --- `/home/lk`
2. ${CT_TOP_DIR} --- `/home/lk/crosstool-ng/xxx_build` 即执行ct-ng的目录
3. ${CT_TARGET} --- `/home/lk/crosstool-ng/x-tools/\${CT_TARGET}` 存放最终结果的路径

#### build

下载速度还可以，试一下手动下载，不过估计手动找包的时间会长一些

编译配置过程时间久，在这期间查什么版本对应的kernel、glibc、gcc 版本 (57min)



---



