From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Tue, 13 Aug 2019 14:45:11 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] PCI: sysfs: Define device
	attributes with DEVICE_ATTR*()
In-Reply-To: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-1-skunberg.kelsey@gmail.com>
Message-ID: <20190813204513.4790-2-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Defining device attributes should be done through the helper
DEVICE_ATTR*(_name, _mode, _show, _store). Change all instances using
__ATTR*() to now use DEVICE_ATTR*().

Example of old:

struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show,
						  _store)

Example of new:

static DEVICE_ATTR(foo, S_IWUSR | S_IRUGO, show_foo, store_foo)

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 965c72104150..8af7944fdccb 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static struct device_attribute dev_rescan_attr = __ATTR(rescan,
-							(S_IWUSR|S_IWGRP),
-							NULL, dev_rescan_store);
+static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
 
 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
@@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 		pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
 	return count;
 }
-static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
-							(S_IWUSR|S_IWGRP),
-							NULL, remove_store);
+static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
+				  remove_store);
 
 static ssize_t dev_bus_rescan_store(struct device *dev,
 				    struct device_attribute *attr,
@@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
+static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
 
 #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
 static ssize_t d3cold_allowed_store(struct device *dev,
@@ -687,16 +684,14 @@ static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
 	return count;
 }
 
-static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);
-static struct device_attribute sriov_numvfs_attr =
-		__ATTR(sriov_numvfs, (S_IRUGO|S_IWUSR|S_IWGRP),
-		       sriov_numvfs_show, sriov_numvfs_store);
-static struct device_attribute sriov_offset_attr = __ATTR_RO(sriov_offset);
-static struct device_attribute sriov_stride_attr = __ATTR_RO(sriov_stride);
-static struct device_attribute sriov_vf_device_attr = __ATTR_RO(sriov_vf_device);
-static struct device_attribute sriov_drivers_autoprobe_attr =
-		__ATTR(sriov_drivers_autoprobe, (S_IRUGO|S_IWUSR|S_IWGRP),
-		       sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
+static DEVICE_ATTR_RO(sriov_totalvfs);
+static DEVICE_ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
+				  sriov_numvfs_show, sriov_numvfs_store);
+static DEVICE_ATTR_RO(sriov_offset);
+static DEVICE_ATTR_RO(sriov_stride);
+static DEVICE_ATTR_RO(sriov_vf_device);
+static DEVICE_ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
+		   sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
 #endif /* CONFIG_PCI_IOV */
 
 static ssize_t driver_override_store(struct device *dev,
@@ -792,7 +787,7 @@ static struct attribute *pcie_dev_attrs[] = {
 };
 
 static struct attribute *pcibus_attrs[] = {
-	&dev_attr_rescan.attr,
+	&dev_attr_bus_rescan.attr,
 	&dev_attr_cpuaffinity.attr,
 	&dev_attr_cpulistaffinity.attr,
 	NULL,
@@ -820,7 +815,7 @@ static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
 		!!(pdev->resource[PCI_ROM_RESOURCE].flags &
 		   IORESOURCE_ROM_SHADOW));
 }
-static struct device_attribute vga_attr = __ATTR_RO(boot_vga);
+static DEVICE_ATTR_RO(boot_vga);
 
 static ssize_t pci_read_config(struct file *filp, struct kobject *kobj,
 			       struct bin_attribute *bin_attr, char *buf,
@@ -1458,7 +1453,7 @@ static ssize_t reset_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static struct device_attribute reset_attr = __ATTR(reset, 0200, NULL, reset_store);
+static DEVICE_ATTR(reset, 0200, NULL, reset_store);
 
 static int pci_create_capabilities_sysfs(struct pci_dev *dev)
 {
@@ -1468,7 +1463,7 @@ static int pci_create_capabilities_sysfs(struct pci_dev *dev)
 	pcie_aspm_create_sysfs_dev_files(dev);
 
 	if (dev->reset_fn) {
-		retval = device_create_file(&dev->dev, &reset_attr);
+		retval = device_create_file(&dev->dev, &dev_attr_reset);
 		if (retval)
 			goto error;
 	}
@@ -1553,7 +1548,7 @@ static void pci_remove_capabilities_sysfs(struct pci_dev *dev)
 	pcie_vpd_remove_sysfs_dev_files(dev);
 	pcie_aspm_remove_sysfs_dev_files(dev);
 	if (dev->reset_fn) {
-		device_remove_file(&dev->dev, &reset_attr);
+		device_remove_file(&dev->dev, &dev_attr_reset);
 		dev->reset_fn = 0;
 	}
 }
@@ -1606,7 +1601,7 @@ static int __init pci_sysfs_init(void)
 late_initcall(pci_sysfs_init);
 
 static struct attribute *pci_dev_dev_attrs[] = {
-	&vga_attr.attr,
+	&dev_attr_boot_vga.attr,
 	NULL,
 };
 
@@ -1616,7 +1611,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (a == &vga_attr.attr)
+	if (a == &dev_attr_boot_vga.attr)
 		if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
 			return 0;
 
@@ -1624,8 +1619,8 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 }
 
 static struct attribute *pci_dev_hp_attrs[] = {
-	&dev_remove_attr.attr,
-	&dev_rescan_attr.attr,
+	&dev_attr_remove.attr,
+	&dev_attr_rescan.attr,
 	NULL,
 };
 
@@ -1699,12 +1694,12 @@ static const struct attribute_group pci_dev_hp_attr_group = {
 
 #ifdef CONFIG_PCI_IOV
 static struct attribute *sriov_dev_attrs[] = {
-	&sriov_totalvfs_attr.attr,
-	&sriov_numvfs_attr.attr,
-	&sriov_offset_attr.attr,
-	&sriov_stride_attr.attr,
-	&sriov_vf_device_attr.attr,
-	&sriov_drivers_autoprobe_attr.attr,
+	&dev_attr_sriov_totalvfs.attr,
+	&dev_attr_sriov_numvfs.attr,
+	&dev_attr_sriov_offset.attr,
+	&dev_attr_sriov_stride.attr,
+	&dev_attr_sriov_vf_device.attr,
+	&dev_attr_sriov_drivers_autoprobe.attr,
 	NULL,
 };
 
-- 
2.20.1
