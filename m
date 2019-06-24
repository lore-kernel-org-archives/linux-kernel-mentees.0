From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Mon, 24 Jun 2019 03:15:33 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - WARNING: refcount bug
 in kobject_get
In-Reply-To: <20190621163439.is2e7i3bwz3jyfrj@rYz3n>
References: <20190618211210.e7eqqtlqpgl2bmgh@rYz3n>
	<3674099a-c1f2-f9a3-57f4-d4f4b59a126a@linuxfoundation.org>
	<20190618215612.rguyuy6maxt56l4n@rYz3n>
	<72705c91-d753-4c3c-071b-92825d2cd092@linuxfoundation.org>
	<20190619152100.GB29425@kroah.com>
	<45d50c39-38de-d5d3-4c45-9e5a77e224cb@linuxfoundation.org>
	<20190620222242.ux65vxces7ou62o3@rYz3n>
	<20190621064501.GB12643@kroah.com>
	<20190621163439.is2e7i3bwz3jyfrj@rYz3n>
Message-ID: <20190624081532.ihnrb475dduh77gj@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190624081533.rPniGuh7JwYIBv6bJKzpmzB45pJVWgfJwNzrZgKyxys@z>

On Fri, Jun 21, 2019 at 11:34:40AM -0500, Jiunn Chang wrote:
> On Fri, Jun 21, 2019 at 08:45:01AM +0200, Greg KH wrote:
> > On Thu, Jun 20, 2019 at 05:23:12PM -0500, Jiunn Chang wrote:
> > > On Wed, Jun 19, 2019 at 10:11:20AM -0600, Shuah Khan wrote:
> > > > On 6/19/19 9:21 AM, Greg KH wrote:
> > > > > On Tue, Jun 18, 2019 at 04:24:21PM -0600, Shuah Khan wrote:
> > > > > > On 6/18/19 3:56 PM, Jiunn Chang wrote:
> > > > > > > On Tue, Jun 18, 2019 at 03:49:13PM -0600, Shuah Khan wrote:
> > > > > > > > On 6/18/19 3:12 PM, Jiunn Chang wrote:
> > > > > > > > > Hello,
> > > > > > > > > 
> > > > > > > > > This is an analysis of:
> > > > > > > > > 
> > > > > > > > > https://syzkaller.appspot.com/bug?id=06c8522152c9325bf0f1a3dc5b33d1b95a47431f
> > > > > > > > > 
> > > > > > > > > I was able to reproduce crash on upstream v5.1-rc4 with gcc 9.1 using *.syz program.
> > > > > > > > > Syzbot has found similiar warnings in 4.19 and 4.14.
> > > > > > > > > 
> > > > > > > > > Site of WARN_ON in lib/refcount.c from RIP:
> > > > > > > > > 
> > > > > > > > > void refcount_inc_checked(refcount_t *r)
> > > > > > > > > {
> > > > > > > > >            WARN_ONCE(!refcount_inc_not_zero_checked(r), "refcount_t: increment on 0; use-after-free.\n");
> > > > > > > > > }
> > > > > > > > > 
> > > > > > > > > This warning is a precaution on RCU structures where there is a possible
> > > > > > > > > use-after-free since RCU structures with a refcount of 0 are freed.
> > > > > > > > > 
> > > > > > > > > Backtrace stack sample:
> > > > > > > > > 
> > > > > > > > > [  596.532838][T10020]  kobject_get+0x66/0xc0
> > > > > > > > > [  596.532838][T10020]  kobject_add_internal+0x14f/0x380
> > > > > > > > > [  596.532838][T10020]  ? kfree_const+0x5e/0x70
> > > > > > > > > [  596.532838][T10020]  kobject_add+0x150/0x1c0
> > > > > > > > > [  596.532838][T10020]  ? kobject_add_internal+0x380/0x380
> > > > > > > > > [  596.532838][T10020]  get_device_parent.isra.0+0x413/0x560
> > > > > > > > > [  596.532838][T10020]  device_add+0x2df/0x17a0
> > > > > > > > > [  596.532838][T10020]  ? get_device_parent.isra.0+0x560/0x560
> > > > > > > > > [  596.532838][T10020]  ? start_creating+0x163/0x1e0
> > > > > > > > > [  596.532838][T10020]  ? __sanitizer_cov_trace_const_cmp8+0x18/0x20
> > > > > > > > > [  596.532838][T10020]  hci_register_dev+0x2e8/0x860
> > > > > > > > > 
> > > > > > > > > Since no *.c reproducer was provided, I generated one from the *.syz program.
> > > > > > > > > 
> > > > > > > > > #include <endian.h>
> > > > > > > > > #include <stdint.h>
> > > > > > > > > #include <stdio.h>
> > > > > > > > > #include <stdlib.h>
> > > > > > > > > #include <string.h>
> > > > > > > > > #include <sys/syscall.h>
> > > > > > > > > #include <sys/types.h>
> > > > > > > > > #include <unistd.h>
> > > > > > > > > 
> > > > > > > > > uint64_t r[1] = {0xffffffffffffffff};
> > > > > > > > > 
> > > > > > > > > int main(void)
> > > > > > > > > {
> > > > > > > > >      syscall(__NR_mmap, 0x20000000, 0x1000000, 3, 0x32, -1, 0);
> > > > > > > > >      intptr_t res = 0;
> > > > > > > > >      memcpy((void*)0x20000000, "/dev/vhci\000", 10);
> > > > > > > > >      res = syscall(__NR_openat, 0xffffffffffffff9c, 0x20000000, 0x246, 0);
> > > > > > > > >      if (res != -1)
> > > > > > > > >        r[0] = res;
> > > > > > > > >      memcpy((void*)0x200000c0, "\xff\x80", 2);
> > > > > > > > >      syscall(__NR_write, r[0], 0x200000c0, 2);
> > > > > > > > >      return 0;
> > > > > > > > > }
> > > > > > > > > 
> > > > > > > > > Analysis:
> > > > > > > > > 
> > > > > > > > >    From the C code, syzkaller is mapping a vhci device.  This will require
> > > > > > > > > resources from the block layer.  I begin by looking at the call to
> > > > > > > > > hci_register_dev from net/bluetooth/hci_core.c:3305.  There is a call to
> > > > > > > > > device_add.
> > > > > > > > > 
> > > > > > > > > If I take a look at the kernel documentation, I see that device_register
> > > > > > > > > is also in core.c.  device register will perform both an add and initialize.
> > > > > > > > > The initialize is where the refcount is incremented to 1.  This can be seen
> > > > > > > > > as device_initialize will call kobject_init and eventually call kref_init:
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Right. You are on the right track so far.
> > > > > > > > 
> > > > > > > > > static inline void kref_init(struct kref *kref)
> > > > > > > > > {
> > > > > > > > >            refcount_set(&kref->refcount, 1);
> > > > > > > > > }
> > > > > > > > > 
> > > > > > > > > I do not believe this is a bug in kobject_get.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > That is correct. The problem isn't in kobject_get()
> > > > > > > > 
> > > > > > > > > Fix:
> > > > > > > > > 
> > > > > > > > > IMHO, the fix is to have hci_register_dev call device_initialize instead of
> > > > > > > > > device_add.  I will be happy to submit a patch if this is the actual fix.  I
> > > > > > > > > have listed the resources I used below.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > You are right that device_initialize() should be called, but you still
> > > > > > > > have to register the device. Calling device_initialize() instead of
> > > > > > > > device_add() won't register the device.
> > > > > > > 
> > > > > > >     You are correct.  My fault, I mistyped my fix.  I meant that since
> > > > > > >     device_register performs both device_initialize and
> > > > > > >     device_add--device_register is what hci_register_dev should call.
> > > > > > > 
> > > > > > 
> > > > > > Great. Generate the patch and test it out to see if it fixes the
> > > > > > problem.
> > > > > 
> > > > > That's odd if it does, the device structure should have been initialized
> > > > > already somewhere else (I can't find where...)  If not, that's a huge
> > > > > bug that has been there for a very long time :)
> > > > > 
> > > > > Ah, it already was, in hci_init_sysfs() which is called when you create
> > > > > the structure before registering it.  So I don't think this is the real
> > > > > solution here.
> > > > > 
> > > > 
> > > > You are right. More going on here.
> > > > 
> > > > > Is the device structure being "reused" somehow?  That might cause this
> > > > > problem and if so, that needs to be fixed as you can not register a
> > > > > structure with the driver core "twice" without deleting it and starting
> > > > > over from scratch.
> > > > > 
> > > > 
> > > > This looks like a race condition perhaps?
> > > > 
> > > > The test program does open and then a write.
> > > > 
> > > > vhci_open() goes through vhci_open_timeout() to create a device with
> > > > a call to vhci_create_device(). I don't think this step completes yet
> > > > before write comes along based on the stack trace.
> > > > 
> > > > vhci_write() calls vhci_get_user() which must be going through the
> > > > HCI_VENDOR_PKT path to cancel the open_timeout and the try to create
> > > > device.
> > > > 
> > > > It just might be that vhci_create_device() gets called in
> > > > vhci_get_user() HCI_VENDOR_PKT path after free'ing skb
> > > 
> > > 
> > > 
> > > > 
> > > > thanks,
> > > > -- Shuah
> > > > 
> > > 
> > > Hello,
> > > 
> > > I took a much closer look at the vhci refcount issue.
> > > 
> > > Per Greg, I looked for specific instances where the hci_dev device might be
> > > recycled.  I did not come across any--none that I could find at least.
> > > 
> > > As for the race condition mentioned by Shuah, I noticed mutex_lock logic in
> > > vhci_create_device().  So I decided to see if that was patched in the past.  I
> > > found commit: c7c999cb18da88a881e10e07f0724ad0bfaff770
> > > 
> > > Here is the patchwork link:  https://lore.kernel.org/patchwork/patch/668740/
> > > 
> > > This mutex logic will provide thread safe device creation.
> > > 
> > > Having said that, the new mutex patch created __vhci_create_device() which is
> > > where hci_alloc_dev() and hci_register_dev() are called.  The device is now
> > > registered.  This is what Greg was talking about with hci_init_sysfs().
> > > 
> > > The WARN_ON from syzbot is coming from the the device_add() call in
> > > hci_register_dev(), but it is not on the hci_dev device just registered.  There
> > > is a call to get_device_parent().  In get_device_parent() I see this comment:
> > > 
> > > /*$
> > >  * If we have no parent, we live in "virtual".$
> > >  * Class-devices with a non class-device as parent, live$
> > >  * in a "glue" directory to prevent namespace collisions.$
> > >  */$
> > 
> > Ok, that makes sense.
> > 
> > But, a valid parent pointer is returned here, right?  So:
> > 
> > > I looked at the code and parent is not set in hci_alloc_dev() or
> > > hci_register_dev() during registration.  Because parent is NULL, an eventual
> > > call to kobject_add_internal() is performed which leads to kref_get() with a
> > > refcount_t counter of 0 being incremented.
> > 
> > Wait, how did you jump to this conclusion?
> > 
> > if get_device_parent() is called, with no valid parent pointer set (i.e.
> > NULL), then virtual_device_parent() is called which returns a valid
> > parent pointer in its place.
> > 
> > Where are you seeing that kobject_add_internal() being called after
> > that?
> 
>   Hello Greg,
> 
>   Let me start with the call to get_device_parent() in device_add().
> 
>   1. device_add() --> get_device_parent()
> 
>   2. parent is NULL, so get_device_parent() --> virtual_device_parent()
> 
>   3. virtual_device_parent() --> kobject_create_and_add()
> 
>   4. In kobject_create_and_add() there are two calls:
> 	a. kobject_create() --> kobject_init() --> kobject_init_internal() -->
> 	kref_init() and refcount is set to 1
> 
> 	b. this is where kobject_internal() is called, kobject_add() -->
> 	kobject_add_varg() --> kobject_add_internal() --> kobject_get() -->
> 	kref_get() --> refcount_inc() --> refcount_inc_checked() but refcount is
> 	0.
> 
>   If I look at kobject_create_and_add(), I see that the virtual device parent
>   is using the devices_kset kobject.  kobject_create() will create a new kobject and
>   initialize it.  kobject_add() will then set the new kobject parent to the
>   devices_kset kobject through kobject_add_varg() and pass it to
>   kobject_add_internal().
> 
>   Next, in kobject_add_internal, which now has the new kobject with the
>   devices_kset kobject as parent, will call kobject_get() and pass it the
>   devices_kset kobject.
> 
>   Finally, kref_get() will try to increment the refcount on the parent devices_kset
>   kobject when it is 0.  So the question is since this is a vitrual device parent, where
>   does the devices_kset kobject get initialized which is what the virtual device
>   parent is set to?
> 
>   THX
> 
>   Jiunn
> 
> > > So now my question is if this WARN_ON is a false positive?  Any suggestions?
> > 
> > No, it's not false, it is saying something is really wrong here, and we
> > need to figure that out.
> > 
> > thanks,
> > 
> > greg k-h

Hello,

I would like to provide an update on new information found.  Taking a closer look
at each call in the trace, the call to get_device_parent() is interesting.

Using the offset, it points to class_dir_create_and_add() where there is a call to
kobject_add().  This will eventually lead to a call to kobj_kset_join() that calls
kset_get() and an increment to refcount.

To summarize:

hci_register_device() --> device_add() --> get_parent_device() -->
class_dir_create_and_add() --> kobject_add() --> kobject_add_varg() -->
kobject_add_internal().

In kobject_add_internal() if there is a kset, and there is since this is a
virtual device parent, then a call to kobj_kset_join() is made.

So, kobject_add_internal() --> kobj_kset_join() --> kset_get().

I did find kset_init() and kset_register() are available, but I do not believe either
should be called.  Again, if they were the issue, something more serious would
happen.  In device_initialize() kset is set but not initialized.  There are comments
in get_device_parent() that state no uvents should be created for a glue
directory so that leaves out a call to kset_register().

At this point, I need more help to attempt a fix.  If you have any suggestions please
let me know.

THX,

Jiunn
