From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:34 -0600
Subject: [Linux-kernel-mentees] [PATCH 04/11] PCI: Move PCI Virtual Channel
	declarations to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-5-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

PCI Virtual Channel declarations are only called within drivers/pci/.
Since declarations do not need to be visible to the rest of the kernel,
move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 5 +++++
 include/linux/pci.h | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f2ba33613c21..6ba790a77be4 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -128,6 +128,11 @@ void pci_vpd_release(struct pci_dev *dev);
 void pcie_vpd_create_sysfs_dev_files(struct pci_dev *dev);
 void pcie_vpd_remove_sysfs_dev_files(struct pci_dev *dev);
 
+/* PCI Virtual Channel */
+int pci_save_vc_state(struct pci_dev *dev);
+void pci_restore_vc_state(struct pci_dev *dev);
+void pci_allocate_vc_save_buffers(struct pci_dev *dev);
+
 /* PCI /proc functions */
 #ifdef CONFIG_PROC_FS
 int pci_proc_attach_device(struct pci_dev *dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 39e609ea316e..2c5609b5782e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1190,11 +1190,6 @@ bool pcie_relaxed_ordering_enabled(struct pci_dev *dev);
 void pci_wakeup_bus(struct pci_bus *bus);
 void pci_bus_set_current_state(struct pci_bus *bus, pci_power_t state);
 
-/* PCI Virtual Channel */
-int pci_save_vc_state(struct pci_dev *dev);
-void pci_restore_vc_state(struct pci_dev *dev);
-void pci_allocate_vc_save_buffers(struct pci_dev *dev);
-
 /* For use by arch with custom probe code */
 void set_pcie_port_type(struct pci_dev *pdev);
 void set_pcie_hotplug_bridge(struct pci_dev *pdev);
-- 
2.20.1
