From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:36 -0600
Subject: [Linux-kernel-mentees] [PATCH 06/11] PCI: Move pci_bus_*
	declarations to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-7-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222336.rU2GBIHsA_b1A9uzQ_EJ5ixRMt--QyewjHBIOOwfGpU@z>

pci_bus_* declarations are only called within drivers/pci/. Since
declarations do not need to be visible to the rest of the kernel, move to
drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ee7b7383e497..9b87309f5c12 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -270,6 +270,9 @@ bool pci_bus_clip_resource(struct pci_dev *dev, int idx);
 void pci_reassigndev_resource_alignment(struct pci_dev *dev);
 void pci_disable_bridge_window(struct pci_dev *dev);
 
+struct pci_bus *pci_bus_get(struct pci_bus *bus);
+void pci_bus_put(struct pci_bus *bus);
+
 /* PCIe link information */
 #define PCIE_SPEED2STR(speed) \
 	((speed) == PCIE_SPEED_16_0GT ? "16 GT/s" : \
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ead399b8d136..54946423d901 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1233,8 +1233,6 @@ int pci_request_selected_regions_exclusive(struct pci_dev *, int, const char *);
 void pci_release_selected_regions(struct pci_dev *, int);
 
 /* drivers/pci/bus.c */
-struct pci_bus *pci_bus_get(struct pci_bus *bus);
-void pci_bus_put(struct pci_bus *bus);
 void pci_add_resource(struct list_head *resources, struct resource *res);
 void pci_add_resource_offset(struct list_head *resources, struct resource *res,
 			     resource_size_t offset);
-- 
2.20.1
