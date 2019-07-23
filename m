From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Tue, 23 Jul 2019 17:24:14 -0600
Subject: [Linux-kernel-mentees] [PATCH 00/11] PCI: Move symbols to
	drivers/pci/pci.h
In-Reply-To: <20190723230701.GA47047@google.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190723230701.GA47047@google.com>
Message-ID: <20190723232414.GB16776@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jul 23, 2019 at 06:07:01PM -0500, Bjorn Helgaas wrote:
> On Thu, Jul 11, 2019 at 04:23:30PM -0600, Kelsey Skunberg wrote:
> > Move symbols defined in include/linux/pci.h that are only used in
> > drivers/pci/ to drivers/pci/pci.h.
> > 
> > Symbols only used in drivers/pci/ do not need to be visible to the rest of
> > the kernel.
> > 
> > Kelsey Skunberg (11):
> >   PCI: Move #define PCI_PM_* lines to drivers/pci/pci.h
> >   PCI: Move PME declarations to drivers/pci/pci.h
> >   PCI: Move *_host_bridge_device() declarations to drivers/pci.pci.h
> >   PCI: Move PCI Virtual Channel declarations to drivers/pci/pci.h
> >   PCI: Move pci_hotplug_*_size declarations to drivers/pci/pci.h
> >   PCI: Move pci_bus_* declarations to drivers/pci/pci.h
> >   PCI: Move pcie_update_link_speed() to drivers/pci/pci.h
> >   PCI: Move pci_ats_init() to drivers/pci/pci.h
> >   PCI: Move ECRC declarations to drivers/pci/pci.h
> >   PCI: Move PTM declaration to drivers/pci/pci.h
> >   PCI: Move pci_*_node() declarations to drivers/pci/pci.h
> > 
> >  drivers/pci/pci.h   | 48 ++++++++++++++++++++++++++++++++++++++++++---
> >  include/linux/pci.h | 47 --------------------------------------------
> >  2 files changed, 45 insertions(+), 50 deletions(-)
> 
> Hi Kelsey,
> 
> I didn't get these applied before v5.3-rc1, so now they don't apply
> cleanly.  Would you mind refreshing them and posting a v2 that does
> apply to my "master" branch (v5.3-rc1)?
> 
> Bjorn

Hi Bjorn,

I can absolutely do that. I'll have v2 sent out soon.

-Kelsey
