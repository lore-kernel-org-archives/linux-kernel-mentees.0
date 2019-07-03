From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 3 Jul 2019 00:00:56 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - KASAN: use-after-free Read
 in v4l2_fh_init
Message-ID: <20190703050055.ogbrphyw3yavrwjc@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hello,

This is an analysis of the following Syzbot report:

https://syzkaller.appspot.com/bug?id=378c929b412e1ceac0d515df2156365827384ba4

I am able to reproduce this bug on the Kasan kernel with one loopback dummy_hcd
emulator.  I compiled with gcc 9.1 and used the syz program provided.

[   32.904044][  T599] Call Trace:
[   32.904044][  T599]  dump_stack+0xca/0x13e
[   32.904044][  T599]  print_address_description+0x67/0x232
[   32.904044][  T599]  kasan_report.cold+0x1a/0x33
[   32.904044][  T599]  v4l2_fh_init+0x247/0x290
[   32.904044][  T599]  v4l2_fh_open+0x88/0xc0
[   32.904044][  T599]  em28xx_v4l2_open+0x11c/0x470
[   32.904044][  T599]  v4l2_open+0x1af/0x350

The syz program is:

https://syzkaller.appspot.com/text?tag=ReproSyz&x=13ff6cf2a00000

Analysis:

The syz program will open a specific usb device: 0x438, 0xb002, 0x73db

The kernel message buffer contains the root cause:

[   30.714089][  T162] usb 1-1: New USB device found, idVendor=0438, idProduct=b002, bcdDevice
=73.db
[   30.717552][  T162] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   30.721475][  T162] usb 1-1: config 0 descriptor??
[   30.756703][  T162] em28xx 1-1:0.79: New device   @ 480 Mbps (0438:b002, interface 79, clas
s 79)
[   30.759758][  T162] em28xx 1-1:0.79: Video interface 79 found:
[   31.045139][  T162] em28xx 1-1:0.79: unknown em28xx chip ID (0)
[   31.294996][  T162] em28xx 1-1:0.79: reading from i2c device at 0xa0 failed (error=-5)
[   31.299176][  T162] em28xx 1-1:0.79: board has no eeprom
[   31.404832][  T162] em28xx 1-1:0.79: Identified as AMD ATI TV Wonder HD 600 (card=20)
[   31.407025][  T162] em28xx 1-1:0.79: analog set to bulk mode.
[   31.409699][  T162] usb 1-1: USB disconnect, device number 8
[   31.411702][  T162] em28xx 1-1:0.79: Disconnecting em28xx
[   31.413383][    T5] em28xx 1-1:0.79: Registering V4L2 extension
[   31.425796][    T5] em28xx 1-1:0.79: Config register raw data: 0xffffffed
[   31.427850][    T5] em28xx 1-1:0.79: AC97 chip type couldn't be determined
[   31.429826][    T5] em28xx 1-1:0.79: No AC97 audio processor
[   31.432071][    T5] usb 1-1: Decoder not found
[   31.433383][    T5] em28xx 1-1:0.79: failed to create media graph
[   31.439159][    T5] em28xx 1-1:0.79: V4L2 device video0 deregistered
[   31.441326][    T5] em28xx 1-1:0.79: Binding DVB extension
[   31.443017][    T5] em28xx 1-1:0.79: no endpoint for DVB mode and transfer type 0
[   31.445169][    T5] em28xx 1-1:0.79: failed to pre-allocate USB transfer buffers for DVB.
[   31.447623][    T5] em28xx 1-1:0.79: Registering input extension
[   31.454125][  T162] em28xx 1-1:0.79: Closing input extension
[   31.457450][  T162] em28xx 1-1:0.79: Freeing device

Notice the following message "V4L2 device video0 deregistered" right after
"failed to create media graph".  The message "failed to create media graph" is located
in em28xx_v4l2_init():em28xx_video.c:2867.  em28xx_v4l2_init() would be called from usb
core during the probe callback when a valid device is present and a suitable driver can
handle it. The probe callback checks for device existence and functionality and initializes
and registers the device conditionally.

This is where the problem occurs.  Since the media controller config failed, the
code immediately unregisters the device and deletes it--additionally all v4l2
control handlers are freed.  From the call trace, the site of the use-after-freed is in
v4l2_fh_init():v4l2-fh.c:31 where there is a reference to the control handler:

/* Inherit from video_device. May be overridden by the driver. */
fh->ctrl_handler = vdev->ctrl_handler;

So this is essentially a race condition when using the loopback dummy_hcd where
the device is continually disconnected and then discovered again.  This all occurs
as the syz program continually performs a device open--presumably on a device
that is available and registered.  There are appropriate mutex locks present on
device open but given the nature of race conditions is it only  matter of time
before the check for device availability and registration already happened but
the device is then unregistered and disconnected right before an device open
occurs.

Purposed fix:

If my analysis is correct, the simple fix is a null check right before accessing
the control handler.  But this seems to break the spirit of the workflow in the
v4l2 userspace API.  It might be the case that the control handler should never
be null when the code execution is aready in v4l2_fh_init().  I will need Hans
to tell me if this is true or not.  Maybe the test is invalid as well.  It would
be like someone plugging in and unplugging a v4l2 usb device while trying to
acceess it?

Resources:

https://www.kernel.org/doc/html/latest/media/v4l-drivers/em28xx-cardlist.html
https://static.lwn.net/images/pdf/LDD3/ch13.pdf

THX,

Jiunn
