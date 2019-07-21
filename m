From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Sun, 21 Jul 2019 04:56:49 -0700
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] global-out-of-bounds Read in
	hdpvr_probe
Message-ID: <20190721115649.GA6644@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hello,

This is an analysis of the following report

https://syzkaller.appspot.com/bug?id=69bf3422c0eb7a37dec8c1a6c2d56ea40bf6bacf

The error was reproduced with 5.1-rc4 with gcc 9.1.0. 

The offending line is:

retval = hdpvr_register_videodev(dev, &interface->dev,
				 video_nr[atomic_inc_return(&dev_nr)]);

Analysis:

Immediately we see that the video_nr array is being accessed without
a checking increment. Meaning that if we were to go up to the size of
the array and it were to access it, we would get this kind of global out
of bounds error as reported by syzbot. 

Fix: 

The fix would be to "checkout" a place in the register array before we
actually register the device and see if we havent already reached the
max amount of devices we want to register. If we did this and found that
we have reached max, we can report our findings and return safely probe
function, thus avoiding this global out of bounds access error and
reporting useful information to the user.

I have already prepared a patch that is awaiting review that fixes this
issue. 

https://lore.kernel.org/lkml/757f11e5-8463-4f48-1f42-1ecf9bd0a86e at eng.ucsd.edu/

Thanks, 

Luke
