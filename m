From: helgaas at kernel.org (Bjorn Helgaas)
Date: Wed, 4 Sep 2019 13:45:38 -0500
Subject: [Linux-kernel-mentees] [PATCH 2/2] PCI: Unify
 pci_dev_is_disconnected() and pci_dev_is_inaccessible()
In-Reply-To: <20190904053523.7lmuoo5zempxtsdq@wunner.de>
References: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
	<20190904043633.65026-3-skunberg.kelsey@gmail.com>
	<20190904053523.7lmuoo5zempxtsdq@wunner.de>
Message-ID: <20190904184538.GC103977@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

[+cc Carolyn, author of 17a402a0075c]

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

Oh, I think I see what you mean: Previously pci_read_config_byte() et
al called pci_dev_is_disconnected(), which only checked
dev->error_state.

If we applied this patch, those sites would call
pci_dev_is_inaccessible(), which would check error_state and then (in
the common case where we haven't set error_state) do a config read of
the vendor ID.

So we would basically double the config access overhead because we'd
be doing an extra read of the vendor ID before every access.  That
indeed doesn't seem practical.

I think what we need to figure out is whether we really need two
interfaces (one that looks only at dev->error_state and a second that
looks at dev->error_state and also reads the vendor ID).  If we do
need both, then I think we need a little guidance in the function
comments about when to use one vs the other.

There are only a few uses of pci_device_is_present() (which looks at
dev->error_state and also reads the vendor ID) and they were added
here:

  8496e85c20e7 ("PCI / tg3: Give up chip reset and carrier loss handling if PCI device is not present")
  17a402a0075c ("igb: Fixes needed for surprise removal support")
  6db28eda2660 ("nvme/pci: Disable on removal when disconnected")
  b8a62d540240 ("ACPI / hotplug / PCI: Use pci_device_is_present()")
  4ebe34503baa ("ACPI / hotplug / PCI: Check for new devices on enabled slots")
  a6a64026c0cd ("PCI: Recognize D3cold in pci_update_current_state()")

The ACPI and PCI core uses are basically enumeration-type things so
that mostly makes sense to me.

I'm not so sure about the driver uses though.  I wonder if those could
be better handled by having the drivers check for ~0 error response
data from MMIO and config reads.

Bjorn
