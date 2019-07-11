From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:39 -0600
Subject: [Linux-kernel-mentees] [PATCH 09/11] PCI: Move ECRC declarations to
	drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-10-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pcie_set_ecrc_checking() and pcie_ecrc_get_policy() are only called within
drivers/pci/. Since declarations do not need to be visible to the rest of
the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 8 ++++++++
 include/linux/pci.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index bc677e97a262..74249c31325c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -537,6 +537,14 @@ static inline void pcie_aspm_create_sysfs_dev_files(struct pci_dev *pdev) { }
 static inline void pcie_aspm_remove_sysfs_dev_files(struct pci_dev *pdev) { }
 #endif
 
+#ifdef CONFIG_PCIE_ECRC
+void pcie_set_ecrc_checking(struct pci_dev *dev);
+void pcie_ecrc_get_policy(char *str);
+#else
+static inline void pcie_set_ecrc_checking(struct pci_dev *dev) { }
+static inline void pcie_ecrc_get_policy(char *str) { }
+#endif
+
 #ifdef CONFIG_PCIE_PTM
 void pci_ptm_init(struct pci_dev *dev);
 #else
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 263c087b95d5..8fbe3471e8f0 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1501,14 +1501,6 @@ bool pci_aer_available(void);
 static inline bool pci_aer_available(void) { return false; }
 #endif
 
-#ifdef CONFIG_PCIE_ECRC
-void pcie_set_ecrc_checking(struct pci_dev *dev);
-void pcie_ecrc_get_policy(char *str);
-#else
-static inline void pcie_set_ecrc_checking(struct pci_dev *dev) { }
-static inline void pcie_ecrc_get_policy(char *str) { }
-#endif
-
 bool pci_ats_disabled(void);
 
 #ifdef CONFIG_PCIE_PTM
-- 
2.20.1
