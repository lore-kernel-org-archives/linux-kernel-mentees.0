From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 02:37:17 +0530
Subject: [Linux-kernel-mentees] Seeking information about LKMP Project -
 "Linux PCI - Remove driver-local definitions of standard PCI symbols"
Message-ID: <20190501210717.GA30464@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hello,
I wanted to get a few things clarified in relation to the aforementioned project in the subject.

The description of the project states that some drivers define their own copies of PCI_COMMAND, PCI_STATUS, etc.

If we remove these definitions, 
then for the driver to work it has to include "include/uapi/linux/pci_regs.h", 
so should we also add the include statement in the driver source code or it is already included by some other way.

Kindly help me resolve this confusion as I am a beginner at this.
If the question sounds wrong or lame, please forgive me.
I want to work on this project as a part of the Linux kernel mentorship program.

Thanks and Regards
