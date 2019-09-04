From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Tue,  3 Sep 2019 22:36:35 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/2] PCI: Unify
	pci_dev_is_disconnected() and pci_dev_is_inaccessible()
In-Reply-To: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
References: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
Message-ID: <20190904043633.65026-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Combine pci_dev_is_disconnected() with pci_dev_is_inaccessible() so only
one function is used to learn if we should avoid accessing a device that's
inaccessible due to surprise removal or an error condition.

The use cases for pci_dev_is_disconnected() do not need to distinguish
between a device being inaccessible due to a surprise removal or an error
condition. This provides the opportunity to unify
pci_dev_is_disconnected() and pci_dev_is_inaccessible() to reduce multiple
functions used for the same task.

Change pci_dev_is_disconnected() call inside pci_dev_is_inaccessible() to:

	pdev->error_state == pci_channel_io_perm_failure

Change remaining pci_dev_is_disconnected() calls to
pci_dev_is_inaccessible() calls.

Remove pci_dev_is_disconnected() from /pci/pci.h which would now no longer
be used.

Demonstration of changes to pci_dev_is_disconnected() and
pci_dev_is_inaccessible():

Before combining:

	static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
	{
		return dev->error_state == pci_channel_io_perm_failure;
	}

	bool pci_dev_is_inaccessible(struct pci_dev *pdev)
	{
		u32 v;

		if (pci_dev_is_disconnected(pdev))
			return true;
		return !pci_bus_read_dev_vendor_id(pdev->bus, pdev->devfn, &v, 0);
	}

After combining:

	bool pci_dev_is_inaccessible(struct pci_dev *pdev)
	{
		u32 v;

		if (pdev->error_state == pci_channel_io_perm_failure)
			return true;
		return !pci_bus_read_dev_vendor_id(pdev->bus, pdev->devfn, &v, 0);
	}

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/access.c            | 12 ++++++------
 drivers/pci/msi.c               |  4 ++--
 drivers/pci/pci.c               |  2 +-
 drivers/pci/pci.h               |  5 -----
 drivers/pci/pcie/portdrv_core.c |  2 +-
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 544922f097c0..c096340afb8c 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -535,7 +535,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
 
 int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
 {
-	if (pci_dev_is_disconnected(dev)) {
+	if (pci_dev_is_inaccessible(dev)) {
 		*val = ~0;
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
@@ -545,7 +545,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
 
 int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
 {
-	if (pci_dev_is_disconnected(dev)) {
+	if (pci_dev_is_inaccessible(dev)) {
 		*val = ~0;
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
@@ -556,7 +556,7 @@ EXPORT_SYMBOL(pci_read_config_word);
 int pci_read_config_dword(const struct pci_dev *dev, int where,
 					u32 *val)
 {
-	if (pci_dev_is_disconnected(dev)) {
+	if (pci_dev_is_inaccessible(dev)) {
 		*val = ~0;
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
@@ -566,7 +566,7 @@ EXPORT_SYMBOL(pci_read_config_dword);
 
 int pci_write_config_byte(const struct pci_dev *dev, int where, u8 val)
 {
-	if (pci_dev_is_disconnected(dev))
+	if (pci_dev_is_inaccessible(dev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	return pci_bus_write_config_byte(dev->bus, dev->devfn, where, val);
 }
@@ -574,7 +574,7 @@ EXPORT_SYMBOL(pci_write_config_byte);
 
 int pci_write_config_word(const struct pci_dev *dev, int where, u16 val)
 {
-	if (pci_dev_is_disconnected(dev))
+	if (pci_dev_is_inaccessible(dev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	return pci_bus_write_config_word(dev->bus, dev->devfn, where, val);
 }
@@ -583,7 +583,7 @@ EXPORT_SYMBOL(pci_write_config_word);
 int pci_write_config_dword(const struct pci_dev *dev, int where,
 					 u32 val)
 {
-	if (pci_dev_is_disconnected(dev))
+	if (pci_dev_is_inaccessible(dev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	return pci_bus_write_config_dword(dev->bus, dev->devfn, where, val);
 }
diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 0884bedcfc7a..4680043aa315 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -311,7 +311,7 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
 	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
 
-	if (dev->current_state != PCI_D0 || pci_dev_is_disconnected(dev)) {
+	if (dev->current_state != PCI_D0 || pci_dev_is_inaccessible(dev)) {
 		/* Don't touch the hardware now */
 	} else if (entry->msi_attrib.is_msix) {
 		void __iomem *base = pci_msix_desc_addr(entry);
@@ -1008,7 +1008,7 @@ static void pci_msix_shutdown(struct pci_dev *dev)
 	if (!pci_msi_enable || !dev || !dev->msix_enabled)
 		return;
 
-	if (pci_dev_is_disconnected(dev)) {
+	if (pci_dev_is_inaccessible(dev)) {
 		dev->msix_enabled = 0;
 		return;
 	}
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7b4e248db5f9..e5f46d98dbe1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5910,7 +5910,7 @@ bool pci_dev_is_inaccessible(struct pci_dev *pdev)
 {
 	u32 v;
 
-	if (pci_dev_is_disconnected(pdev))
+	if (pdev->error_state == pci_channel_io_perm_failure)
 		return true;
 	return !pci_bus_read_dev_vendor_id(pdev->bus, pdev->devfn, &v, 0);
 }
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1be03a97cb92..f0dc86dc8aab 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -363,11 +363,6 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 	return 0;
 }
 
-static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
-{
-	return dev->error_state == pci_channel_io_perm_failure;
-}
-
 /* pci_dev priv_flags */
 #define PCI_DEV_ADDED 0
 
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 308c3e0c4a34..8bf6b47dd2c6 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -416,7 +416,7 @@ static void wait_for_downstream_link(struct pci_dev *pdev)
 	    pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM)
 		return;
 
-	if (pci_dev_is_disconnected(pdev))
+	if (pci_dev_is_inaccessible(pdev))
 		return;
 
 	if (!pdev->subordinate || list_empty(&pdev->subordinate->devices) ||
-- 
2.20.1
