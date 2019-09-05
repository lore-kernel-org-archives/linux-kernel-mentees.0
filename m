From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 5 Sep 2019 00:43:07 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/2] PCI: Unify
 pci_dev_is_disconnected() and pci_dev_is_inaccessible()
In-Reply-To: <20190904053523.7lmuoo5zempxtsdq@wunner.de>
References: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
	<20190904043633.65026-3-skunberg.kelsey@gmail.com>
	<20190904053523.7lmuoo5zempxtsdq@wunner.de>
Message-ID: <20190905064307.GA43579@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Sep 04, 2019 at 07:35:23AM +0200, Lukas Wunner wrote:
> On Tue, Sep 03, 2019 at 10:36:35PM -0600, Kelsey Skunberg wrote:
> > Change pci_dev_is_disconnected() call inside pci_dev_is_inaccessible() to:
> > 
> > 	pdev->error_state == pci_channel_io_perm_failure
> > 
> > Change remaining pci_dev_is_disconnected() calls to
> > pci_dev_is_inaccessible() calls.
> 
> I don't think that's a good idea because it introduces a config space read
> (for the vendor ID) in places where we don't want that.  E.g., after the
> check of pdev->error_state, a regular config space read may take place and
> if that returns all ones, we may already be able to determine that the
> device is inaccessible, obviating the need for a vendor ID check.
> Config space reads aren't for free.
> 
> Thanks,
> 
> Lukas

Good note. I definitely see why that would be undesirable. Thanks for
taking the time to point this out, Lukas. I'll look this over again to see
if a better solution can be done, or as Bjorn suggested, at least see if
clarification on when to use one vs. the other can be included.

Thanks again!

-Kelsey
