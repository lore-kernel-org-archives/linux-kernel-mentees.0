From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:40 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 03/11] PCI: Move
	*_host_bridge_device() declarations to drivers/pci.pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-4-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_get_host_bridge_device() and pci_put_host_bridge_device() are only
called within drivers/pci/pci.h. Since declarations do not need to be
visible to the rest of the kernel, move to drives/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ad1fe54ab8ee..f41dde136648 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -105,6 +105,9 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 
+struct device *pci_get_host_bridge_device(struct pci_dev *dev);
+void pci_put_host_bridge_device(struct device *dev);
+
 static inline void pci_wakeup_event(struct pci_dev *dev)
 {
 	/* Wait 100 ms before the system can be put into a sleep state. */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index e1f784de459f..cd49427e198e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -644,9 +644,6 @@ static inline struct pci_dev *pci_upstream_bridge(struct pci_dev *dev)
 	return dev->bus->self;
 }
 
-struct device *pci_get_host_bridge_device(struct pci_dev *dev);
-void pci_put_host_bridge_device(struct device *dev);
-
 #ifdef CONFIG_PCI_MSI
 static inline bool pci_dev_msi_enabled(struct pci_dev *pci_dev)
 {
-- 
2.20.1
