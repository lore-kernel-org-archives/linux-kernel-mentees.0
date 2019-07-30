From: helgaas at kernel.org (Bjorn Helgaas)
Date: Tue, 30 Jul 2019 08:47:51 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 00/11] Hide PCI symbols that
 don't need to be global
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190730134751.GH203187@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jul 24, 2019 at 05:38:37PM -0600, Kelsey Skunberg wrote:
> The include/linux/pci.h header file defines several symbols that are used
> only in drivers/pci/. These symbols do not need to be visible to the rest
> of the kernel. Move PCI symbols that are only used in drivers/pci/ to
> drivers/pci/pci.h.
> 
> Changes in v2:
>         - Built patches to work with v5.3-rc1
>         - Changed line lengths on commit logs to stay below 80 characters
> 	- Changed cover-letter log to better explain patch series
> 
> 
> Kelsey Skunberg (11):
>   PCI: Move #define PCI_PM_* lines to drivers/pci/pci.h
>   PCI: Move PME declarations to drivers/pci/pci.h
>   PCI: Move *_host_bridge_device() declarations to drivers/pci.pci.h
>   PCI: Move PCI Virtual Channel declarations to drivers/pci/pci.h
>   PCI: Move pci_hotplug_*_size declarations to drivers/pci/pci.h
>   PCI: Move pci_bus_* declarations to drivers/pci/pci.h
>   PCI: Move pcie_update_link_speed() to drivers/pci/pci.h
>   PCI: Move pci_ats_init() to drivers/pci/pci.h
>   PCI: Move ECRC declarations to drivers/pci/pci.h
>   PCI: Move PTM declaration to drivers/pci/pci.h
>   PCI: Move pci_*_node() declarations to drivers/pci/pci.h
> 
>  drivers/pci/pci.h   | 48 ++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/pci.h | 47 --------------------------------------------
>  2 files changed, 45 insertions(+), 50 deletions(-)

Applied to pci/encapsulate for v5.4, thanks a lot!
