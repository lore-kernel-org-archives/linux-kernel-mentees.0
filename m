From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Mon, 1 Jul 2019 06:23:11 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - WARNING in
	__vb2_queue_cancel
Message-ID: <20190701112310.6bxpjigplp4n56tp@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hello,

This is an analysis of the following Syzbot report:

https://syzkaller.appspot.com/bug?id=dd5aa153a2344f5f39e656692bc58dfe86e0423f

I am able to reproduce this warning on upstream v5.2-rc4.  I compiled with gcc 9.1
and used the syz program provided.

The RIP register is placing the site for the warning in:

drivers/media/common/videobuf2/videobuf2-core.c:1877

[  106.310118][ T6765] Call Trace:
[  106.310118][ T6765]  vb2_core_streamoff+0x60/0x150
[  106.310118][ T6765]  __vb2_cleanup_fileio+0x78/0x170
[  106.310118][ T6765]  vb2_core_queue_release+0x20/0x80
[  106.310118][ T6765]  _vb2_fop_release+0x1cf/0x2a0
[  106.310118][ T6765]  vb2_fop_release+0x75/0xc0
[  106.310118][ T6765]  vivid_fop_release+0x18e/0x440
[  106.310118][ T6765]  v4l2_release+0x21f/0x390

The syz program is:

r0 = syz_open_dev$vbi(0x0, 0xffffffffffffffff, 0x2)
ioctl$VIDIOC_S_INPUT(r0, 0xc0045627, &(0x7f0000000040)=0x2)
r1 = syz_open_dev$vbi(&(0x7f0000000140)='/dev/vbi#\x00', 0xffffffffffffffff, 0x2)
read$eventfd(r1, &(0x7f00000000c0), 0x1000001b2)

Analysis:

The syz program appears to open a VBI device and using the raw VBI interface to
select it as the current video input.  Then it tries to read from an event
notification file descriptor for any notifications from the VBI device open.

Although none of this is in the trace--my guess is that the v4l2_device is registered
and when refcount reaches zero it is released.  This brings us to the beginning of the
trace.

There are more than a few calls until the site of the warning appears.  The
root cause seems to be that start_streaming_called bit field is not set in the vb2_queue
object in v4l2_device.  The call trace will eventually lead to vb2_core_streamoff()
where I see this comment:

/*
 * Cancel will pause streaming and remove all buffers from the driver
 * and videobuf, effectively returning control over them to userspace.
 *
 * Note that we do this even if q->streaming == 0: if you prepare or$
 * queue buffers, and then call streamoff without ever having called$
 * streamon, you would still expect those buffers to be returned to$
 * their normal dequeued state.$
 */

vb2_start_streaming() is what sets the start_streaming_called bit field, and I
do not see this call in the trace.

A call to __vb2_queue_cancel() in vb2_core_streamoff() will only call stop_streaming()
if the start_streaming_called bit field is set.  Given the comments in the code, the
if statement wrapping the call to stop_streaming() should be checking the
streaming bit field and not the start_streaming_called bit field.  Another alternative
is to not wrap the call to stop_streaming() with an if statement at all.

Purposed fix:

Not sure if this is the right approach, but it seems logical.

/*
 * Tell driver to stop all transactions and release all queued
 * buffers.
 */
if (q->start_streaming_called)
	call_void_qop(q, stop_streaming, q);

Change the if statement to check: if q->streaming == 0: like the comment states
or remove the if statement entirely.

I will submit a patch should the fix present itself.

Resources:

https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/vidioc-g-input.html#vidioc-g-inputhttps://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-raw-vbi.html

THX,

Jiunn
