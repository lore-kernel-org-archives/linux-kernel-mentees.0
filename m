From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:45 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 08/11] PCI: Move pci_ats_init() to
	drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-9-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724233845.AF8NxnpY2By7DfKkGaYT2KnEZTzuUKufkuHWciOM2Ns@z>

pci_ats_init() is only called with drivers/pci/. Since declarations do not
need to be visible to the rest of the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 7 ++++---
 include/linux/pci.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index feec29853a44..7c0488b64faf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -439,11 +439,12 @@ static inline void pci_restore_dpc_state(struct pci_dev *dev) {}
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
index c6a25c32a49a..5760e19cb625 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1766,13 +1766,11 @@ static inline bool pci_ats_disabled(void) { return true; }
 
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
