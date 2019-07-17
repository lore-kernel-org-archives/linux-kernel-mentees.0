From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 17 Jul 2019 12:23:53 -0600
Subject: [Linux-kernel-mentees] [PATCH] PCI: Remove unused EXPORT_SYMBOL()s
	from drivers/pci/bus.c
Message-ID: <20190717182353.45557-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_bus_get() and pci_bus_put() are not used by a loadable kernel module
and do not need to be exported. Remove lines exporting pci_bus_get() and
pci_bus_put().

Functions were exported in commit fe830ef62ac6 ("PCI: Introduce
pci_bus_{get|put}() to manage PCI bus reference count"). No found history
of functions being used by a loadable kernel module.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/bus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 495059d923f7..8e40b3e6da77 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -417,11 +417,9 @@ struct pci_bus *pci_bus_get(struct pci_bus *bus)
 		get_device(&bus->dev);
 	return bus;
 }
-EXPORT_SYMBOL(pci_bus_get);
 
 void pci_bus_put(struct pci_bus *bus)
 {
 	if (bus)
 		put_device(&bus->dev);
 }
-EXPORT_SYMBOL(pci_bus_put);
-- 
2.20.1
