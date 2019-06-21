From: helgaas at kernel.org (Bjorn Helgaas)
Date: Fri, 21 Jun 2019 11:44:29 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <20190621162024.53620dd9@alans-desktop>
References: <20190621094607.15011-1-puranjay12@gmail.com>
	<20190621162024.53620dd9@alans-desktop>
Message-ID: <20190621164429.GA187016@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Jun 21, 2019 at 04:20:24PM +0100, Alan Cox wrote:
> On Fri, 21 Jun 2019 15:16:04 +0530
> Puranjay Mohan <puranjay12 at gmail.com> wrote:
> 
> > This patch series removes the private duplicates of PCI definitions in
> > favour of generic definitions defined in pci_regs.h.
> 
> Why bother ? It's an ancient obsolete card ?

That's a fair question.

Is there anything that would indicate that "this file is obsolete and
problems shouldn't be fixed"?  Nobody wants to waste time on things
that don't need to be fixed, but I don't know how to tell if something
is obsolete.

My naive assumption is that if something is in the tree, it's fair
game for fixes and cleanups.

Bjorn
