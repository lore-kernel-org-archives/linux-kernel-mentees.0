From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Thu, 20 Jun 2019 17:45:15 -0700
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] Use-after-free in v4l2
	release
Message-ID: <20190621004515.GA9209@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This is an analysis of 
https://syzkaller.appspot.com/bug?extid=a4387f5b6b799f6becbf

I reproduced the bug with kernel version 5.1.0-rc3 using the C
reproducer provided. 

The offending code in this report is: 
 if (vdev->fops->release) {
 in v4l2-release method of line 453 of v4l2-dev.c

This bug gets triggered after multiple USB devices are being
disconnected simultaneously (In this case the program uses 6 dummy
radios that are each assigned by a USB device). The device driver used
in this case is the radio-raremono.c device driver.

Analysis: 

The problem as Hans Verkuil pointed out to me is that radio-raremono
used devm_kalloc to allocate memory of the video device, which is
automatically freed by the USB interface when the USB device
disconnects. The problem arrises when the USB device is disconnected,
the memory is freed, and there still exists a reference to the radio
(something like /dev/radioX) that has not been resolved and closed. If
this reference is used, then we get these use after free errors, I
believe. 

Fix: 

The first thing to do would be to allocate memory manually through
regular kalloc and free the memory using a callback that frees device
memory after all references to it have been resolved, etc. 

The call back we should use is the v4l2.release call back that gets
called when the ref count of a device reaches 0. This is opposed to
using the vdev.release call back which seems to get called when any
video device is released, which leads to more use-after-free errors if
there are multiple radio references to a single radio device. Meaning if
one of them were to close, it freed the resources for everyone else. 

I have been preparing a patch that has implemented and fixed these
issues. 

Again, most of this I found out and learned about thanks to Hans
Verkuil. 

Thanks, 
- Luke Nowakowski-Krijger
