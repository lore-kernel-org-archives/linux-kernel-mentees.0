From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 15 Aug 2019 09:33:51 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 2/4] PCI: sysfs: Change
	permissions from symbolic to octal
In-Reply-To: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
Message-ID: <20190815153352.86143-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190815153351.A7EoFxvFVTGle76X4WXWUHQZEGhPhH6gILrEx58TRS0@z>

Symbolic permissions such as "(S_IWUSR | S_IWGRP)" are not
preferred and octal permissions should be used instead. Change all
symbolic permissions to octal permissions.

Example of old:

"(S_IWUSR | S_IWGRP)"

Example of new:

"0220"

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci-sysfs.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 8af7944fdccb..346193ca4826 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -464,7 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
+static DEVICE_ATTR(rescan, 0220, NULL, dev_rescan_store);
 
 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
@@ -478,7 +478,7 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 		pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
 	return count;
 }
-static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
+static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
 				  remove_store);
 
 static ssize_t dev_bus_rescan_store(struct device *dev,
@@ -501,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
+static DEVICE_ATTR(bus_rescan, 0220, NULL, dev_bus_rescan_store);
 
 #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
 static ssize_t d3cold_allowed_store(struct device *dev,
@@ -685,13 +685,12 @@ static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
 }
 
 static DEVICE_ATTR_RO(sriov_totalvfs);
-static DEVICE_ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
-				  sriov_numvfs_show, sriov_numvfs_store);
+static DEVICE_ATTR(sriov_numvfs, 0664, sriov_numvfs_show, sriov_numvfs_store);
 static DEVICE_ATTR_RO(sriov_offset);
 static DEVICE_ATTR_RO(sriov_stride);
 static DEVICE_ATTR_RO(sriov_vf_device);
-static DEVICE_ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
-		   sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
+static DEVICE_ATTR(sriov_drivers_autoprobe, 0664, sriov_drivers_autoprobe_show,
+		   sriov_drivers_autoprobe_store);
 #endif /* CONFIG_PCI_IOV */
 
 static ssize_t driver_override_store(struct device *dev,
@@ -1080,7 +1079,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	sysfs_bin_attr_init(b->legacy_io);
 	b->legacy_io->attr.name = "legacy_io";
 	b->legacy_io->size = 0xffff;
-	b->legacy_io->attr.mode = S_IRUSR | S_IWUSR;
+	b->legacy_io->attr.mode = 0600;
 	b->legacy_io->read = pci_read_legacy_io;
 	b->legacy_io->write = pci_write_legacy_io;
 	b->legacy_io->mmap = pci_mmap_legacy_io;
@@ -1094,7 +1093,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	sysfs_bin_attr_init(b->legacy_mem);
 	b->legacy_mem->attr.name = "legacy_mem";
 	b->legacy_mem->size = 1024*1024;
-	b->legacy_mem->attr.mode = S_IRUSR | S_IWUSR;
+	b->legacy_mem->attr.mode = 0600;
 	b->legacy_mem->mmap = pci_mmap_legacy_mem;
 	pci_adjust_legacy_attr(b, pci_mmap_mem);
 	error = device_create_bin_file(&b->dev, b->legacy_mem);
@@ -1301,7 +1300,7 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
 		}
 	}
 	res_attr->attr.name = res_attr_name;
-	res_attr->attr.mode = S_IRUSR | S_IWUSR;
+	res_attr->attr.mode = 0600;
 	res_attr->size = pci_resource_len(pdev, num);
 	res_attr->private = (void *)(unsigned long)num;
 	retval = sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
@@ -1414,7 +1413,7 @@ static ssize_t pci_read_rom(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute pci_config_attr = {
 	.attr =	{
 		.name = "config",
-		.mode = S_IRUGO | S_IWUSR,
+		.mode = 0644,
 	},
 	.size = PCI_CFG_SPACE_SIZE,
 	.read = pci_read_config,
@@ -1424,7 +1423,7 @@ static const struct bin_attribute pci_config_attr = {
 static const struct bin_attribute pcie_config_attr = {
 	.attr =	{
 		.name = "config",
-		.mode = S_IRUGO | S_IWUSR,
+		.mode = 0644,
 	},
 	.size = PCI_CFG_SPACE_EXP_SIZE,
 	.read = pci_read_config,
@@ -1506,7 +1505,7 @@ int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
 		sysfs_bin_attr_init(attr);
 		attr->size = rom_size;
 		attr->attr.name = "rom";
-		attr->attr.mode = S_IRUSR | S_IWUSR;
+		attr->attr.mode = 0600;
 		attr->read = pci_read_rom;
 		attr->write = pci_write_rom;
 		retval = sysfs_create_bin_file(&pdev->dev.kobj, attr);
-- 
2.20.1
