From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 18 Jun 2019 16:12:11 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - WARNING: refcount bug in
 kobject_get
Message-ID: <20190618211210.e7eqqtlqpgl2bmgh@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618211211.xeMnbeNyePKo4u0efGLcVBVJ9rhIGf_bV33gvW62tTA@z>

Hello,

This is an analysis of:

https://syzkaller.appspot.com/bug?id=06c8522152c9325bf0f1a3dc5b33d1b95a47431f

I was able to reproduce crash on upstream v5.1-rc4 with gcc 9.1 using *.syz program.
Syzbot has found similiar warnings in 4.19 and 4.14.

Site of WARN_ON in lib/refcount.c from RIP:

void refcount_inc_checked(refcount_t *r)
{
        WARN_ONCE(!refcount_inc_not_zero_checked(r), "refcount_t: increment on 0; use-after-free.\n");
}

This warning is a precaution on RCU structures where there is a possible
use-after-free since RCU structures with a refcount of 0 are freed.

Backtrace stack sample:

[  596.532838][T10020]  kobject_get+0x66/0xc0
[  596.532838][T10020]  kobject_add_internal+0x14f/0x380
[  596.532838][T10020]  ? kfree_const+0x5e/0x70
[  596.532838][T10020]  kobject_add+0x150/0x1c0
[  596.532838][T10020]  ? kobject_add_internal+0x380/0x380
[  596.532838][T10020]  get_device_parent.isra.0+0x413/0x560
[  596.532838][T10020]  device_add+0x2df/0x17a0
[  596.532838][T10020]  ? get_device_parent.isra.0+0x560/0x560
[  596.532838][T10020]  ? start_creating+0x163/0x1e0
[  596.532838][T10020]  ? __sanitizer_cov_trace_const_cmp8+0x18/0x20
[  596.532838][T10020]  hci_register_dev+0x2e8/0x860

Since no *.c reproducer was provided, I generated one from the *.syz program.

#include <endian.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

uint64_t r[1] = {0xffffffffffffffff};

int main(void)
{
  syscall(__NR_mmap, 0x20000000, 0x1000000, 3, 0x32, -1, 0);
  intptr_t res = 0;
  memcpy((void*)0x20000000, "/dev/vhci\000", 10);
  res = syscall(__NR_openat, 0xffffffffffffff9c, 0x20000000, 0x246, 0);
  if (res != -1)
    r[0] = res;
  memcpy((void*)0x200000c0, "\xff\x80", 2);
  syscall(__NR_write, r[0], 0x200000c0, 2);
  return 0;
}

Analysis:

>From the C code, syzkaller is mapping a vhci device.  This will require
resources from the block layer.  I begin by looking at the call to
hci_register_dev from net/bluetooth/hci_core.c:3305.  There is a call to
device_add.

If I take a look at the kernel documentation, I see that device_register
is also in core.c.  device register will perform both an add and initialize.
The initialize is where the refcount is incremented to 1.  This can be seen
as device_initialize will call kobject_init and eventually call kref_init:

static inline void kref_init(struct kref *kref)
{
        refcount_set(&kref->refcount, 1);
}

I do not believe this is a bug in kobject_get.

Fix:

IMHO, the fix is to have hci_register_dev call device_initialize instead of
device_add.  I will be happy to submit a patch if this is the actual fix.  I
have listed the resources I used below.

Resources used:
https://www.kernel.org/doc/html/v4.14/driver-api/infrastructure.html#device-drivers-base
https://lwn.net/Articles/262464/

THX
