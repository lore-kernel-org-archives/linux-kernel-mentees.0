From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Tue,  3 Sep 2019 22:36:33 -0600
Subject: [Linux-kernel-mentees] [PATCH 0/2] PCI: Change to using
	pci_dev_is_inaccessible()
Message-ID: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190904043633.i9SPwMlMD6EBPzatOnj7uZoMKGPwgvJXTGNuyq4fKM4@z>

Patch 1: Change pci_device_is_present() name to pci_dev_is_inaccessible()
         to encourage only using to learn if we should not access a
         device that's inaccessible. Return value will need to be reversed
	 to reflect the name change.

Patch 2: Relies on patch 1. Unify pci_dev_is_disconnected() with
         pci_dev_is_inaccessible() so there is only one function
         needed to learn if a device is inaccessible due to surprise
         removal or an error condition.

Kelsey Skunberg (2):
  PCI: Change pci_device_is_present() to pci_dev_is_inaccessible()
  PCI: Unify pci_dev_is_disconnected() and pci_dev_is_inaccessible()

 drivers/net/ethernet/broadcom/tg3.c       |  4 ++--
 drivers/net/ethernet/intel/igb/igb_main.c |  2 +-
 drivers/nvme/host/pci.c                   |  2 +-
 drivers/pci/access.c                      | 12 ++++++------
 drivers/pci/hotplug/acpiphp_glue.c        |  2 +-
 drivers/pci/msi.c                         |  4 ++--
 drivers/pci/pci.c                         | 12 ++++++------
 drivers/pci/pci.h                         |  5 -----
 drivers/pci/pcie/portdrv_core.c           |  2 +-
 drivers/thunderbolt/nhi.c                 |  2 +-
 include/linux/pci.h                       |  2 +-
 11 files changed, 22 insertions(+), 27 deletions(-)

-- 
2.20.1
