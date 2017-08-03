### �������������

arch-vendor-kernel-system

---------------------------

### Դ����밲װ����

- ./configure �Chelp ���Բ鿴������ǰ�����֧����Щ��ϸ�Ĺ��ܺ�����

- ./configure 

  --prefix=YOUR_INSTALL_PATH	����ĳ��򣬰�װ�����

  �Cbuild=CURRENT_ENV	i686-pc-linux-gnu 

  �Ctarget=CROSS_COMPILER�ͨChost=CROSS_COMPILER ���õ��ǽ���������ģ�ǰ׺��

  CC=CROSS_COMPILER-gcc	1.�˴���CC������������ָ�����������ĸ���һ�㶼�Ƕ�Ӧ�Ľ����������ǰ׺������gcc

- make

- make install

----------------------------

### ѹ�����

- tar -xvf xxx.tar.gz
- tar -xvjf xxx.tar.bz2
- **lzcat** is equivalent to **xz --format=lzma --decompress --stdout**

-------

### �ļ��н���

```note
1. crosstool-ng-1.23.0
crosstool-ng��Դ�������ѹ����ļ���
������crosstool-ng�����Դ��

2. crosstool-ng-1.23.0_build
ר��Ϊ����ʹ��crosstool-ngȥ����������������ı��루build������ר�Ž������ļ���
��Ӧ�ģ�������ct-ng menuconfig��ct-ng build����������ڴ��ļ�����ִ�еġ�

3. src
Ϊcrosstool-ng�У�������Ҫ���ظ��������Դ�������׼���ģ�
crosstool-ng�У��ڿ�ʼִ��build֮�󣬻�ȥ���ض�Ӧ��Դ����������ŵ�����ļ�����

4. x-tools
����ļ�������crosstool-ng�����ɵĽ�������������ڵ�·����
��Ӧ�������У����У������ڣ�
(${HOME}/develop/crosstool-ng/x-tools/${CT_TARGET}) Prefix directory
�����ã�����ָ�����ɵĽ��������������ںδ���
��ʱ������ȥ����Ϊ�˴���Ӧ��·�����ɡ�

5. crosstool-ng-1.23.0.tar.bz2
�����ԣ��������֮ǰ��������crosstool-ng-1.18.0ʱ��ȥ���ص�Դ����ˡ�
��Ӧ�������1�����Ǵ�Դ�����ѹ���·����
```

---

### ����SSH�����Զ�����

���÷����� `/etc/ssh/sshd_config` �� `ClientAliveInterval 60`

---

### �鿴���汾��

OS: cat /etc/redhat-release

Kernel : cat /proc/version

glibc: rpm -qi glibc

gcc: cat /proc/version

### �鿴֧�ֵ�glibc�汾

strings /usr/lib64/libc.so.6 | grep GLIBC

*ע��* ��

- Debianϵ��Ҫ��װ binutils �ſ���ʹ�� strings


- Ubuntu���ϵİ汾���Դ�ustcȥ����Դ��ubuntu-old-releases

---

### Centos 6 mini ��������

�޸������ļ� `/etc/sysconfig/network-script/ifcfg-eth0`        

```
NM_CONTROLLED="no" 
ONBOOT="yes"
BOOTPROTO="dhcp"
TYPE="Ethernet"
```

### Centos 7 32bit û�������豸����

 ����Vmware����������linux�������⵼�������޷�������װ��Ĭ�ϵ��������Ͳ�����

�ҵ����ǵ�Vmware������ļ��У���VMware ��������� (.vmx)��׷��һ������������������ethernet0.virtualDev = "e1000"

---

### ����make�汾

1. Install the required packages (`gcc`, `make` and such).

2. Open up a shell (if you're using the GUI, a terminal window).

3. Type the following commands (or something equivalent, e.g. you can use `curl` instead of `wget`):

   ```
   cd /tmp
   wget http://ftp.gnu.org/gnu/make/make-3.81.tar.gz
   tar xvf make-4.1.tar.gz
   cd make-4.1/
   ./configure
   make
   sudo make install
   rm -rf make-4.1.tar.gz make-4.1
   ```

Now, `make 4.1` is in `/usr/local/bin/make`.

You can make it your default `make` by prefixing `/usr/local/bin` to your `$PATH` variable in your shell startup file; for instance, in `.profile` or `.bashrc` if you use the `bash` shell.

`export PATH="${PATH}:/some/place/bin"`

Don't try to install a self-compiled `make` (or anything else that doesn't come from the distribution's package manager) into `/bin` or `/usr/bin`; doing that will confuse your package manager.

��gmake���ӵ�����µ�make   `ln -s /usr/local/bin/make /usr/bin/gmake`

---

### �ػ�

shutdown -h now

---

### SUSE ʹSSHͨ������ǽ

```
��װ��suse10����ϵͳ��Ĭ�ϻ���Ӻܶ�iptables��ͬʱsuseĬ���ǿ���firewall�ģ������rhel���е�������SecureCRT����������е�suse���޷�����ssh���ӣ����Ƿ���suse firewall��û������ssh�ķ���������������ã�
1.ʹ���ն�����yast2: suse-linux:~ # yast2 
2.ѡ�񡰰�ȫ���û�����Security and Users��ѡ��: 
3.ѡ�񡰷���ǽ�� ��Firewall��
4.ѡ��Allowed Services�� 5.��Allowed Services for Selected Zone��ѡ��External Zone�� 
6.��Service to Allow��ѡ��SSH��
7.Ȼ������Add�������ŵ����Next�����б��档 
```

�����н�����Ա༭�ļ���������֮ǰ�Լ�û�����ú��ļ��Ĳ�����

---

### Centos 5 Դ ��չԴ

http://vault.centos.org

���磺baseurl=http://vault.centos.org/5.0/os/$basearch/

http://archives.fedoraproject.org/pub/archive/epel/

rpm -ivh http://archives.fedoraproject.org/pub/archive/epel/5/x86_64/epel-release-5-4.noarch.rpm

---

### ��������ʱ���

```
find ./* -exec touch {} \; 
```

---

### �г���ǰĿ¼�µ������ļ������������ļ����ľ���·���� ��Ŀ¼�����ݹ�

find  $PWD -maxdepth 1  | xargs ls -ld

### �ݹ��г���ǰĿ¼�µ������ļ������������ļ����ľ���·��

find  $PWD | xargs ls -ld

### ͳ���ļ������ļ��ĸ������������ļ������

ls -lR|grep "^-"|wc -l

---

### include_next<> ����

include_next <filename.h>

��˼����includeλ������·��λ�ڵ�ǰ�ļ�֮����ļ�filename.h

�����������ģ������������Լ��ĺ������������⺯��������
1. �����޸�Դ���룬
2. �����޸�ԭ����ͷ�ļ�
  ��ʱ�Ϳ�����#include_next�ˡ�

---

### git clone ĳ����֧�Ĵ���

```
git branch -r #�鿴Զ�̷�֧
```

����

```
git branch -a #�鿴���з�֧
```

Ȼ��

```
git checkout origin/1.16  #���������Ǿ���
```

����

---

