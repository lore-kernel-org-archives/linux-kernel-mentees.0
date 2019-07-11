From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:35 -0600
Subject: [Linux-kernel-mentees] [PATCH 05/11] PCI: Move pci_hotplug_*_size
	declarations to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-6-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222335.qTFh-iJvW6NDwxXeiBqwxmPVN1QE54u6OSCkkhyfS2Q@z>

pci_hotplug_*_size declarations are only called within drivers/pci/pci/.
Since declarations do not need to be seen by the rest of the kernel, move
to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 3 +++
 include/linux/pci.h | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6ba790a77be4..ee7b7383e497 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -206,6 +206,9 @@ extern const struct attribute_group *pcibus_groups[];
 extern const struct device_type pci_dev_type;
 extern const struct attribute_group *pci_bus_groups[];
 
+extern unsigned long pci_hotplug_io_size;
+extern unsigned long pci_hotplug_mem_size;
+extern unsigned long pci_hotplug_bus_size;
 
 /**
  * pci_match_one_device - Tell if a PCI device structure has a matching
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c5609b5782e..ead399b8d136 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1957,10 +1957,6 @@ extern unsigned long pci_cardbus_mem_size;
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
