#! /bin/sh
export PATH="${PATH}:/home/lk/x-tools/x86_64-FormalTest1-linux-gnu/bin/"
#export CPPFLAGS="-I"
export AR=x86_64-FormalTest1-linux-gnu-ar
export AS=x86_64-FormalTest1-linux-gnu-as
export LD=x86_64-FormalTest1-linux-gnu-ld
export RANLIB=x86_64-FormalTest1-linux-gnu-ranlib
export CC=x86_64-FormalTest1-linux-gnu-gcc
export NM=x86_64-FormalTest1-linux-gnu-nm
./configure --prefix=/home/lk/bin-opt-test/my-curl --disable-shared --enable-static --disable-ldap --disable-sspi --without-librtmp --disable-ftp --disable-file --disable-dict --disable-telnet --disable-tftp --disable-rtsp --disable-pop3 --disable-imap --disable-smtp --disable-gopher --disable-smb --without-libidn --disable-ares
