From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:30 -0600
Subject: [Linux-kernel-mentees] [PATCH 00/11] PCI: Move symbols to
	drivers/pci/pci.h
Message-ID: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222330.9TUFJdRk150A3zEmeXupc3H1I8q-Le3h2XyvgnlFPAU@z>

Move symbols defined in include/linux/pci.h that are only used in
drivers/pci/ to drivers/pci/pci.h.

Symbols only used in drivers/pci/ do not need to be visible to the rest of
the kernel.

Kelsey Skunberg (11):
  PCI: Move #define PCI_PM_* lines to drivers/pci/pci.h
  PCI: Move PME declarations to drivers/pci/pci.h
  PCI: Move *_host_bridge_device() declarations to drivers/pci.pci.h
  PCI: Move PCI Virtual Channel declarations to drivers/pci/pci.h
  PCI: Move pci_hotplug_*_size declarations to drivers/pci/pci.h
  PCI: Move pci_bus_* declarations to drivers/pci/pci.h
  PCI: Move pcie_update_link_speed() to drivers/pci/pci.h
  PCI: Move pci_ats_init() to drivers/pci/pci.h
  PCI: Move ECRC declarations to drivers/pci/pci.h
  PCI: Move PTM declaration to drivers/pci/pci.h
  PCI: Move pci_*_node() declarations to drivers/pci/pci.h

 drivers/pci/pci.h   | 48 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/pci.h | 47 --------------------------------------------
 2 files changed, 45 insertions(+), 50 deletions(-)

-- 
2.20.1
