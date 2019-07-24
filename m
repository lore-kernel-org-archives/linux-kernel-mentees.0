From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:46 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 09/11] PCI: Move ECRC declarations
	to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-10-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724233846.5P-bUlkcqAetwwqQZyRJ8AKtH5NV1cjxcDGfokz6ao8@z>

pcie_set_ecrc_checking() and pcie_ecrc_get_policy() are only called within
drivers/pci/. Since declarations do not need to be visible to the rest of
the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 8 ++++++++
 include/linux/pci.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 7c0488b64faf..5e5ce04bda59 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -541,6 +541,14 @@ static inline void pcie_aspm_create_sysfs_dev_files(struct pci_dev *pdev) { }
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
index 5760e19cb625..5dd4abeef8b0 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1559,14 +1559,6 @@ bool pci_aer_available(void);
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
