From: joe at perches.com (Joe Perches)
Date: Fri, 21 Jun 2019 10:59:21 -0700
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <20190621164429.GA187016@google.com>
References: <20190621094607.15011-1-puranjay12@gmail.com>
	<20190621162024.53620dd9@alans-desktop>
	<20190621164429.GA187016@google.com>
Message-ID: <5025da034080c6653b23d7362e06cf211d2cec3c.camel@perches.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, 2019-06-21 at 11:44 -0500, Bjorn Helgaas wrote:
> On Fri, Jun 21, 2019 at 04:20:24PM +0100, Alan Cox wrote:
> > On Fri, 21 Jun 2019 15:16:04 +0530
> > Puranjay Mohan <puranjay12 at gmail.com> wrote:
> > 
> > > This patch series removes the private duplicates of PCI definitions in
> > > favour of generic definitions defined in pci_regs.h.
> > 
> > Why bother ? It's an ancient obsolete card ?
> 
> That's a fair question.
> 
> Is there anything that would indicate that "this file is obsolete and
> problems shouldn't be fixed"?  Nobody wants to waste time on things
> that don't need to be fixed, but I don't know how to tell if something
> is obsolete.
> 
> My naive assumption is that if something is in the tree, it's fair
> game for fixes and cleanups.

I'd prefer to move the old, crufty, obsolete and generally
unsupported drivers to new directory trees and possibly
symlink those drivers to their current locations.

I suggested on the kernel summit list:
https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-June/006482.html

---

Perhaps a mechanism to move these old, generally unsupported
by an actual maintainer, and rarely tested drivers out of the
mainline drivers directory into a separate obsolete directory
would help isolate the whitespace and trivial api changes.
