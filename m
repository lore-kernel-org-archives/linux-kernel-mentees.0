From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:37 -0600
Subject: [Linux-kernel-mentees] [PATCH 07/11] PCI: Move
	pcie_update_link_speed() to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-8-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pcie_update_line_speed() is only called within drivers/pci/. Since
declaration does not need to be visible to the rest of the kernel, move to
drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 1 +
 include/linux/pci.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9b87309f5c12..59321488da03 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -295,6 +295,7 @@ u32 pcie_bandwidth_capable(struct pci_dev *dev, enum pci_bus_speed *speed,
 			   enum pcie_link_width *width);
 void __pcie_print_link_status(struct pci_dev *dev, bool verbose);
 void pcie_report_downtraining(struct pci_dev *dev);
+void pcie_update_link_speed(struct pci_bus *bus, u16 link_status);
 
 /* Single Root I/O Virtualization */
 struct pci_sriov {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 54946423d901..3221d9f61ab4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -938,7 +938,6 @@ struct pci_bus *pci_scan_root_bus(struct device *parent, int bus,
 int pci_scan_root_bus_bridge(struct pci_host_bridge *bridge);
 struct pci_bus *pci_add_new_bus(struct pci_bus *parent, struct pci_dev *dev,
 				int busnr);
-void pcie_update_link_speed(struct pci_bus *bus, u16 link_status);
 struct pci_slot *pci_create_slot(struct pci_bus *parent, int slot_nr,
 				 const char *name,
 				 struct hotplug_slot *hotplug);
-- 
2.20.1
