From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:42 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 05/11] PCI: Move
	pci_hotplug_*_size declarations to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-6-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_hotplug_*_size declarations are only called within drivers/pci/pci/.
Since declarations do not need to be seen by the rest of the kernel, move
to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0eb0fb7ad353..9391330805e9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -211,6 +211,9 @@ extern const struct attribute_group *pcibus_groups[];
 extern const struct device_type pci_dev_type;
 extern const struct attribute_group *pci_bus_groups[];
 
+extern unsigned long pci_hotplug_io_size;
+extern unsigned long pci_hotplug_mem_size;
+extern unsigned long pci_hotplug_bus_size;
 
 /**
  * pci_match_one_device - Tell if a PCI device structure has a matching
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1944e3e7eb2..9c9554906659 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2015,10 +2015,6 @@ extern unsigned long pci_cardbus_mem_size;
 extern u8 pci_dfl_cache_line_size;
 extern u8 pci_cache_line_size;
 
-extern unsigned long pci_hotplug_io_size;
-extern unsigned long pci_hotplug_mem_size;
-extern unsigned long pci_hotplug_bus_size;
-
 /* Architecture-specific versions may override these (weak) */
 void pcibios_disable_device(struct pci_dev *dev);
 void pcibios_set_master(struct pci_dev *dev);
-- 
2.20.1
