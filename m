From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:47 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 10/11] PCI: Move PTM declaration
	to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-11-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724233847.T4QJLqqLEWEEMQuURY-iMhjla4wBKvcmlo_e3Wvi0D4@z>

pci_enable_ptm() is only called within drivers/pci/. Since declaration
does not need to be visible to the rest of the kernel, move to
drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5e5ce04bda59..6cdc3500de15 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -551,8 +551,11 @@ static inline void pcie_ecrc_get_policy(char *str) { }
 
 #ifdef CONFIG_PCIE_PTM
 void pci_ptm_init(struct pci_dev *dev);
+int pci_enable_ptm(struct pci_dev *dev, u8 *granularity);
 #else
 static inline void pci_ptm_init(struct pci_dev *dev) { }
+static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
+{ return -EINVAL; }
 #endif
 
 struct pci_dev_reset_methods {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5dd4abeef8b0..a483b7598059 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1561,13 +1561,6 @@ static inline bool pci_aer_available(void) { return false; }
 
 bool pci_ats_disabled(void);
 
-#ifdef CONFIG_PCIE_PTM
-int pci_enable_ptm(struct pci_dev *dev, u8 *granularity);
-#else
-static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
-{ return -EINVAL; }
-#endif
-
 void pci_cfg_access_lock(struct pci_dev *dev);
 bool pci_cfg_access_trylock(struct pci_dev *dev);
 void pci_cfg_access_unlock(struct pci_dev *dev);
-- 
2.20.1
