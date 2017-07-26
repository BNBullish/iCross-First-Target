#! /bin/sh
export PATH="${PATH}:/home/lk/x-tools/i686-FormalTest5-linux-gnu/bin/"
#export CPPFLAGS="-I"
export AR=i686-FormalTest5-linux-gnu-ar
export AS=i686-FormalTest5-linux-gnu-as
export LD=i686-FormalTest5-linux-gnu-ld
export RANLIB=i686-FormalTest5-linux-gnu-ranlib
export CC=i686-FormalTest5-linux-gnu-gcc
export NM=i686-FormalTest5-linux-gnu-nm
./configure --host=i686-pc-linux-gnu --prefix=/home/lk/bin-opt-test-32bit/my-curl --disable-shared --enable-static --disable-ldap --disable-sspi --without-librtmp --disable-ftp --disable-file --disable-dict --disable-telnet --disable-tftp --disable-rtsp --disable-pop3 --disable-imap --disable-smtp --disable-gopher --disable-smb --without-libidn --disable-ares
