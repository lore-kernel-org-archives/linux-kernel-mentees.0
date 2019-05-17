From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Fri, 17 May 2019 11:32:22 -0600
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] WARNING: Support for this
 device (Terratec Grabster AV400) is experimental
Message-ID: <20190517173220.GC5873@asus>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This is a duplicate in order to cc Shuah.


WARNING: Support for this device (Terratec Grabster AV400) is experimental.

https://syzkaller.appspot.com/bug?id=faae4720a75cadb8cd0dbda5c4d3542228d37340

This warning does not trigger a crash in the system and alternatively is
warning the device?s functionality might not be entirely working.
Since this isn?t a crash, it?s incorrectly being reported in Syzbot.

I was not able to reproduce this warning due to not having the Terratec Grabster
AV400, however, by checking the following file it can be verified if the Warning
will be triggered or not:

/drivers/media/usb/pvrusb2/pvrusb2-hdw.c

I was able to verify in kernel 5.1.2, it shows the warning would be trigged due to
the following line in pvrusb2-hdw.c:

pvr2_trace(PVR2_TRACE_INFO,
          "WARNING: Support for this device (%s) is experimental.",
                                            hdw_desc->description);

The "WARNING" in the format string is getting interpeted as a Warning
from WARN_ON() and then reported to syzbot.

Clarification on valid uses of WARN(), WARN_ON(), and WARN_ON_ONCE() can be found
in the following file:
include/asm-generic/bug.h

It states: "Do not include "BUG"/"WARNING" in format strings manually to make these
conditions distinguishable from kernel issues."

This error can be resolved by updating the format strings to output an
alternative to 'WARNING' which will avoid the string from being confused
with a kernel issue.

A patch was already submitted to address this problem:
https://syzkaller.appspot.com/x/patch.diff?x=1479a4b8a00000

This patch changes the "WARNING" in format strings to have "***" on each
side of the word:

	Previous Line:
-		   "WARNING: Support for this device (%s) is experimental.",

	New Line:
+		   "***WARNING*** Support for this device (%s) is experimental.",
 						      hdw_desc->description);
