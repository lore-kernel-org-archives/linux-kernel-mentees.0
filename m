From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:38 -0600
Subject: [Linux-kernel-mentees] [PATCH 08/11] PCI: Move pci_ats_init() to
	drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-9-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_ats_init() is only called with drivers/pci/. Since declarations do not
need to be visible to the rest of the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 7 ++++---
 include/linux/pci.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 59321488da03..bc677e97a262 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -436,11 +436,12 @@ static inline void pci_restore_dpc_state(struct pci_dev *dev) {}
 #endif
 
 #ifdef CONFIG_PCI_ATS
+/* Address Translation Service */
+void pci_ats_init(struct pci_dev *dev);
 void pci_restore_ats_state(struct pci_dev *dev);
 #else
-static inline void pci_restore_ats_state(struct pci_dev *dev)
-{
-}
+static inline void pci_ats_init(struct pci_dev *d) { }
+static inline void pci_restore_ats_state(struct pci_dev *dev) { }
 #endif /* CONFIG_PCI_ATS */
 
 #ifdef CONFIG_PCI_IOV
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3221d9f61ab4..263c087b95d5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1708,13 +1708,11 @@ static inline bool pci_ats_disabled(void) { return true; }
 
 #ifdef CONFIG_PCI_ATS
 /* Address Translation Service */
-void pci_ats_init(struct pci_dev *dev);
 int pci_enable_ats(struct pci_dev *dev, int ps);
 void pci_disable_ats(struct pci_dev *dev);
 int pci_ats_queue_depth(struct pci_dev *dev);
 int pci_ats_page_aligned(struct pci_dev *dev);
 #else
-static inline void pci_ats_init(struct pci_dev *d) { }
 static inline int pci_enable_ats(struct pci_dev *d, int ps) { return -ENODEV; }
 static inline void pci_disable_ats(struct pci_dev *d) { }
 static inline int pci_ats_queue_depth(struct pci_dev *d) { return -ENODEV; }
-- 
2.20.1
