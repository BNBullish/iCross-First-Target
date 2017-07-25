# iCross First Target



## Introduction

To building specific toolchain with crosstool-ng, which can meet the following requirements:

1. Compile C codes with C99 standard
2. Compile C++ codes with C++003 standard
3. The executable binary compiled by that can run in RHEL6.0 and later version.




## Environment

- OS: Centos-7-x86_64-1611
- crosstool-ng: 1.22.0    [download](http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.22.0.tar.bz2)




## Setting up host OS

1. The following packages need to be installed on CentOS 7:

   ```
   yum install autoconf gperf bison flex texinfo help2man gcc-c++ patch \
   	ncurses-devel python-devel perl-Thread-Queue bzip2 git \
   	libtool glibc-static libstdc++-static
   ```


2. Install make 3.81 version and link /usr/bin/gmake to it.

3. ```shell
   mkdir ~/crotool-ng_build  #Working directory need
   mkdir ~/src  #Local tarballs directory
   mkdir ~/x-tools  #Prefix directory need
   ```




## Installing crosstool-NG

```shell
./configure --prefix=/some/place
make
make install
export PATH="${PATH}:/some/place/bin"
```



## Configuring crosstool-NG

```
ct-ng x86_64-unknown-linux-gnu
ct-ng menuconfig
```

- ​

- Set Directory following what have been created before

- Linux kernel version:  2.6.32

- glibc version:  2.11.1

- gcc version:  4.9.3

- *Notes:* 

  *PPL version 0.10.2*

  *GMP version 4.3.2*



## Building the Toolchain

```
ct-ng build
```

*Tips:*

If you want to restart and continue a build at a specific step you are debugging, run `ct-ng last_step+` .*

*And to obtain the list of acceptable steps, please call: `ct-ng list-steps`.*



## Using the toolchain

Using the toolchain is as simple as adding the toolchain’s bin directory in your `PATH`, such as:

```
export PATH="${PATH}:/your/toolchain/path/bin"
```



## Outcome

- The project site on Github: [https://github.com/BNBullish/iCross-First-Target](https://github.com/BNBullish/iCross-First-Target)
- Remote desktop connection: 192.168.100.109


