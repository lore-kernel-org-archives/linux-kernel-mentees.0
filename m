From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:41 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 04/11] PCI: Move PCI Virtual
	Channel declarations to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-5-skunberg.kelsey@gmail.com>
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
index f41dde136648..0eb0fb7ad353 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -133,6 +133,11 @@ void pci_vpd_release(struct pci_dev *dev);
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
index cd49427e198e..d1944e3e7eb2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1239,11 +1239,6 @@ bool pcie_relaxed_ordering_enabled(struct pci_dev *dev);
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
