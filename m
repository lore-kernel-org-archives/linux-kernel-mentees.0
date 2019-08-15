From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 15 Aug 2019 09:33:52 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 3/4] PCI: sysfs: Change
	DEVICE_ATTR() to DEVICE_ATTR_WO()
In-Reply-To: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
Message-ID: <20190815153352.86143-4-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190815153352.RTOJWUssZRxgpHOUueExhxU7azpCwLrpOxYZPhqUN6g@z>

DEVICE_ATTR() should only be used when files have unusual permissions.
Change DEVICE_ATTR() with '0220' permissions to DEVICE_ATTR_WO().

Example of old:

static DEVICE_ATTR(_name, 0220, NULL, _store);

Example of new:

static DEVICE_ATTR_WO(_name);

Since _store is no longer passed, make the _name passed by
DEVICE_ATTR_WO() and the related _name##_store() name match with each
other.

Example:

DEVICE_ATTR_WO(bus_rescan) must be able to call bus_rescan_store()

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci-sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 346193ca4826..5bb301efec98 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -464,7 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR(rescan, 0220, NULL, dev_rescan_store);
+static DEVICE_ATTR_WO(dev_rescan);
 
 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
@@ -481,9 +481,9 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
 				  remove_store);
 
-static ssize_t dev_bus_rescan_store(struct device *dev,
-				    struct device_attribute *attr,
-				    const char *buf, size_t count)
+static ssize_t bus_rescan_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	unsigned long val;
 	struct pci_bus *bus = to_pci_bus(dev);
@@ -501,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR(bus_rescan, 0220, NULL, dev_bus_rescan_store);
+static DEVICE_ATTR_WO(bus_rescan);
 
 #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
 static ssize_t d3cold_allowed_store(struct device *dev,
@@ -1619,7 +1619,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 
 static struct attribute *pci_dev_hp_attrs[] = {
 	&dev_attr_remove.attr,
-	&dev_attr_rescan.attr,
+	&dev_attr_dev_rescan.attr,
 	NULL,
 };
 
-- 
2.20.1
