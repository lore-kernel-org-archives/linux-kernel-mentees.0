From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:33 -0600
Subject: [Linux-kernel-mentees] [PATCH 03/11] PCI: Move
	*_host_bridge_device() declarations to drivers/pci.pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-4-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222333.lMwpztWKWPMQIAORiwdW6RXEEkaWM2cUJmz_9xrzwow@z>

pci_get_host_bridge_device() and pci_put_host_bridge_device() are only
called within drivers/pci/pci.h. Since declarations do not need to be visible
to the rest of the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 800fe8989f48..f2ba33613c21 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -100,6 +100,9 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 
+struct device *pci_get_host_bridge_device(struct pci_dev *dev);
+void pci_put_host_bridge_device(struct device *dev);
+
 static inline void pci_wakeup_event(struct pci_dev *dev)
 {
 	/* Wait 100 ms before the system can be put into a sleep state. */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cedebb08a32d..39e609ea316e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -639,9 +639,6 @@ static inline struct pci_dev *pci_upstream_bridge(struct pci_dev *dev)
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
