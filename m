From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:38 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 01/11] PCI: Move #define PCI_PM_*
	lines to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-2-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

The #define PCI_PM_* lines are only used within drivers/pci/ and they do
not need to be seen by the rest of the kernel. Move #define PCI_* to
drivers/pci/pci.h

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 5 +++++
 include/linux/pci.h | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1be03a97cb92..708413632429 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -39,6 +39,11 @@ int pci_probe_reset_function(struct pci_dev *dev);
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 int pci_bus_error_reset(struct pci_dev *dev);
 
+#define PCI_PM_D2_DELAY         200
+#define PCI_PM_D3_WAIT          10
+#define PCI_PM_D3COLD_WAIT      100
+#define PCI_PM_BUS_WAIT         50
+
 /**
  * struct pci_platform_pm_ops - Firmware PM callbacks
  *
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9e700d9f9f28..238449460210 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -145,11 +145,6 @@ static inline const char *pci_power_name(pci_power_t state)
 	return pci_power_names[1 + (__force int) state];
 }
 
-#define PCI_PM_D2_DELAY		200
-#define PCI_PM_D3_WAIT		10
-#define PCI_PM_D3COLD_WAIT	100
-#define PCI_PM_BUS_WAIT		50
-
 /**
  * typedef pci_channel_state_t
  *
-- 
2.20.1
