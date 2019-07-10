From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 10 Jul 2019 09:50:14 +0200
Subject: [Linux-kernel-mentees] [PATCH 5.1 00/96] 5.1.17-stable review
In-Reply-To: <c1498293-f0f6-0599-bd72-4156370a7599@gmail.com>
References: <20190708150526.234572443@linuxfoundation.org>
	<c1498293-f0f6-0599-bd72-4156370a7599@gmail.com>
Message-ID: <20190710075014.GC5186@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jul 09, 2019 at 12:49:48AM +0700, Phong Tran wrote:
> On 7/8/19 10:12 PM, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.1.17 release.
> > There are 96 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed 10 Jul 2019 03:03:52 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.1.17-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.1.y
> > and the diffstat can be found below.
> > 
> 
> build and boot fine with qemu-system-riscv64
> 
> root@(none):~# uname  -a
> Linux (none) 5.1.17-rc1-00097-gb64119f8dffe #4 SMP Tue Jul 9 00:44:23 +07
> 2019 riscv64 GNU/Linux
> root@(none):~# cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdcu
> mmu		: sv48
> 

riscv on quemu, interesting choice!

Note, Guenter's tests do check this type of thing already, but thanks
for doing this.

greg k-h
