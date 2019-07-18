From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 17 Jul 2019 21:29:52 -0600
Subject: [Linux-kernel-mentees] [PATCH] PCI: Stop exporting pci_bus_sem
Message-ID: <20190718032951.40188-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_bus_sem is not used by a loadable kernel module and does not need to
be exported. Remove line exporting pci_bus_sem.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/search.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index 7f4e65872b8d..bade14002fd8 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -15,7 +15,6 @@
 #include "pci.h"
 
 DECLARE_RWSEM(pci_bus_sem);
-EXPORT_SYMBOL_GPL(pci_bus_sem);
 
 /*
  * pci_for_each_dma_alias - Iterate over DMA aliases for a device
-- 
2.20.1
