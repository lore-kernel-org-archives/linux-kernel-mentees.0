From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:43 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 06/11] PCI: Move pci_bus_*
	declarations to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-7-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724233843.hAVvOzwWhPu1VsFzO4JqqIlDYpYSeRG8SZ02QRIyr4A@z>

pci_bus_* declarations are only called within drivers/pci/. Since
declarations do not need to be visible to the rest of the kernel, move to
drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 2 ++
 include/linux/pci.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9391330805e9..3e9dfca4b661 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -274,6 +274,8 @@ bool pci_bus_clip_resource(struct pci_dev *dev, int idx);
 
 void pci_reassigndev_resource_alignment(struct pci_dev *dev);
 void pci_disable_bridge_window(struct pci_dev *dev);
+struct pci_bus *pci_bus_get(struct pci_bus *bus);
+void pci_bus_put(struct pci_bus *bus);
 
 /* PCIe link information */
 #define PCIE_SPEED2STR(speed) \
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9c9554906659..af59ecf8ccff 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1282,8 +1282,6 @@ int pci_request_selected_regions_exclusive(struct pci_dev *, int, const char *);
 void pci_release_selected_regions(struct pci_dev *, int);
 
 /* drivers/pci/bus.c */
-struct pci_bus *pci_bus_get(struct pci_bus *bus);
-void pci_bus_put(struct pci_bus *bus);
 void pci_add_resource(struct list_head *resources, struct resource *res);
 void pci_add_resource_offset(struct list_head *resources, struct resource *res,
 			     resource_size_t offset);
-- 
2.20.1
