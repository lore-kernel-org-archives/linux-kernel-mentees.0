From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Fri, 17 May 2019 10:46:52 -0600
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] WARNING in
	vkms_vblank_simulate
Message-ID: <20190517164651.GA5873@asus>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

WARNING in vkms_vblank_simulate

https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb

Warning appears when a call to hrtimer_forward_now() fails.
A bisection was provided and determined warning started with
the following patch:

https://patchwork.freedesktop.org/patch/284352/

Introduction of WARNING is clear since the patch is adding a
WARN_ON() which alerts if the return of hrtimer_forward_now()
function is not 1. This error was likely being produced before
this patch was implemented.

Function where WARN_ON() is called after calling hrtimer_forward_now()
can be found here:
drivers/gpu/drm/vkms/vkms_crtc.c

hrtimer_forward_now() calls return hrtimer_forward() which
verifies if request to forward the timer expiry is valid.
hrtimer_forward() is further explored below:

Function Objective:
 * hrtimer_forward - forward the timer expiry

Function Location:
kernel/time/hrtimer.c

Variables:
 * @timer:      hrtimer to forward
 * @now:        forward past this time
 * @interval:   the interval to forward
 * @delta:      @now ? timer expiry

A warning is issued if one of the following are met:

	[1] If starting time expiry is greater than ?now?

	[2] If the number of intervals needed to pass ?now? is
	    greater than 1.

In the listed crashes with reproducers the kernel version is 5.0.0
and multiple reports without reproducers on kernel version 5.1.0

I had the option to test on kernel versions 5.1.0-rc7 and 5.1.2 with
no success of reproducing. I was able to verify that the WARN_ON() is
still checked in the vkms_crtc.c file. Reproducer was ran individually and in a
loop to attempt triggering, though to no avail. It?s possible for debugging
going to kernel 5.0.0 to test reproducer and find where the warning is typically
triggered from could help find the problem. Since the reports are only on 5.0.0
and 5.1.0 (atleast in this report), it's possible the changes in
newer kernels have resolved the error.

Any other suggestions on further exploring this warning or tips on reproducing
would be appreciated.

In the event anyone else is curious about hrtimer vs timer, here is the
documentation:
https://www.kernel.org/doc/Documentation/timers/hrtimers.txt
