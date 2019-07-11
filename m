From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:31 -0600
Subject: [Linux-kernel-mentees] [PATCH 01/11] PCI: Move #define PCI_PM_*
	lines to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-2-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222331.-2rfY0V8uG5o2Hi6sjc1vLpNH5o2OhcPa0TdfX4QXKw@z>

The #define PCI_PM_* lines are only used within drivers/pci/ and they do not
need to be seen by the rest of the kernel. Move #define PCI_* to
drivers/pci/pci.h

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 5 +++++
 include/linux/pci.h | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9cb99380c61e..7e30fbde5c84 100644
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
index dd436da7eccc..3bda6a87a815 100644
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
  * The pci_channel state describes connectivity between the CPU and
  * the PCI device.  If some PCI bus between here and the PCI device
-- 
2.20.1
