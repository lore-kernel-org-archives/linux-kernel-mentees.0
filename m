From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Fri,  9 Aug 2019 13:57:21 -0600
Subject: [Linux-kernel-mentees] [PATCH] PCI/IOV: Move sysfs SR-IOV functions
	to iov.c
Message-ID: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

The sysfs SR-IOV functions are for an optional feature and will be better
organized to keep with the feature's code. Move the sysfs SR-IOV functions
to /pci/iov.c.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/iov.c       | 173 +++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci-sysfs.c | 176 ----------------------------------------
 drivers/pci/pci.h       |   2 +-
 3 files changed, 174 insertions(+), 177 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 9b48818ced01..661051adf23f 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -240,6 +240,179 @@ void pci_iov_remove_virtfn(struct pci_dev *dev, int id)
 	pci_dev_put(dev);
 }
 
+static ssize_t sriov_totalvfs_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%u\n", pci_sriov_get_totalvfs(pdev));
+}
+
+static ssize_t sriov_numvfs_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%u\n", pdev->sriov->num_VFs);
+}
+
+/*
+ * num_vfs > 0; number of VFs to enable
+ * num_vfs = 0; disable all VFs
+ *
+ * Note: SRIOV spec does not allow partial VF
+ *       disable, so it's all or none.
+ */
+static ssize_t sriov_numvfs_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+	u16 num_vfs;
+
+	ret = kstrtou16(buf, 0, &num_vfs);
+	if (ret < 0)
+		return ret;
+
+	if (num_vfs > pci_sriov_get_totalvfs(pdev))
+		return -ERANGE;
+
+	device_lock(&pdev->dev);
+
+	if (num_vfs == pdev->sriov->num_VFs)
+		goto exit;
+
+	/* is PF driver loaded w/callback */
+	if (!pdev->driver || !pdev->driver->sriov_configure) {
+		pci_info(pdev, "Driver does not support SRIOV configuration via sysfs\n");
+		ret = -ENOENT;
+		goto exit;
+	}
+
+	if (num_vfs == 0) {
+		/* disable VFs */
+		ret = pdev->driver->sriov_configure(pdev, 0);
+		goto exit;
+	}
+
+	/* enable VFs */
+	if (pdev->sriov->num_VFs) {
+		pci_warn(pdev, "%d VFs already enabled. Disable before enabling %d VFs\n",
+			 pdev->sriov->num_VFs, num_vfs);
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	ret = pdev->driver->sriov_configure(pdev, num_vfs);
+	if (ret < 0)
+		goto exit;
+
+	if (ret != num_vfs)
+		pci_warn(pdev, "%d VFs requested; only %d enabled\n",
+			 num_vfs, ret);
+
+exit:
+	device_unlock(&pdev->dev);
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t sriov_offset_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%u\n", pdev->sriov->offset);
+}
+
+static ssize_t sriov_stride_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%u\n", pdev->sriov->stride);
+}
+
+static ssize_t sriov_vf_device_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%x\n", pdev->sriov->vf_device);
+}
+
+static ssize_t sriov_drivers_autoprobe_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sprintf(buf, "%u\n", pdev->sriov->drivers_autoprobe);
+}
+
+static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	bool drivers_autoprobe;
+
+	if (kstrtobool(buf, &drivers_autoprobe) < 0)
+		return -EINVAL;
+
+	pdev->sriov->drivers_autoprobe = drivers_autoprobe;
+
+	return count;
+}
+
+static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);
+static struct device_attribute sriov_numvfs_attr =
+		__ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
+		       sriov_numvfs_show, sriov_numvfs_store);
+static struct device_attribute sriov_offset_attr = __ATTR_RO(sriov_offset);
+static struct device_attribute sriov_stride_attr = __ATTR_RO(sriov_stride);
+static struct device_attribute sriov_vf_device_attr =
+		__ATTR_RO(sriov_vf_device);
+static struct device_attribute sriov_drivers_autoprobe_attr =
+		__ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
+		       sriov_drivers_autoprobe_show,
+		       sriov_drivers_autoprobe_store);
+
+static struct attribute *sriov_dev_attrs[] = {
+	&sriov_totalvfs_attr.attr,
+	&sriov_numvfs_attr.attr,
+	&sriov_offset_attr.attr,
+	&sriov_stride_attr.attr,
+	&sriov_vf_device_attr.attr,
+	&sriov_drivers_autoprobe_attr.attr,
+	NULL,
+};
+
+static umode_t sriov_attrs_are_visible(struct kobject *kobj,
+				       struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	if (!dev_is_pf(dev))
+		return 0;
+
+	return a->mode;
+}
+
+const struct attribute_group sriov_dev_attr_group = {
+	.attrs = sriov_dev_attrs,
+	.is_visible = sriov_attrs_are_visible,
+};
+
 int __weak pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	return 0;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 965c72104150..d5c35434810b 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -551,154 +551,6 @@ static ssize_t devspec_show(struct device *dev,
 static DEVICE_ATTR_RO(devspec);
 #endif
 
-#ifdef CONFIG_PCI_IOV
-static ssize_t sriov_totalvfs_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%u\n", pci_sriov_get_totalvfs(pdev));
-}
-
-
-static ssize_t sriov_numvfs_show(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%u\n", pdev->sriov->num_VFs);
-}
-
-/*
- * num_vfs > 0; number of VFs to enable
- * num_vfs = 0; disable all VFs
- *
- * Note: SRIOV spec doesn't allow partial VF
- *       disable, so it's all or none.
- */
-static ssize_t sriov_numvfs_store(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t count)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-	u16 num_vfs;
-
-	ret = kstrtou16(buf, 0, &num_vfs);
-	if (ret < 0)
-		return ret;
-
-	if (num_vfs > pci_sriov_get_totalvfs(pdev))
-		return -ERANGE;
-
-	device_lock(&pdev->dev);
-
-	if (num_vfs == pdev->sriov->num_VFs)
-		goto exit;
-
-	/* is PF driver loaded w/callback */
-	if (!pdev->driver || !pdev->driver->sriov_configure) {
-		pci_info(pdev, "Driver doesn't support SRIOV configuration via sysfs\n");
-		ret = -ENOENT;
-		goto exit;
-	}
-
-	if (num_vfs == 0) {
-		/* disable VFs */
-		ret = pdev->driver->sriov_configure(pdev, 0);
-		goto exit;
-	}
-
-	/* enable VFs */
-	if (pdev->sriov->num_VFs) {
-		pci_warn(pdev, "%d VFs already enabled. Disable before enabling %d VFs\n",
-			 pdev->sriov->num_VFs, num_vfs);
-		ret = -EBUSY;
-		goto exit;
-	}
-
-	ret = pdev->driver->sriov_configure(pdev, num_vfs);
-	if (ret < 0)
-		goto exit;
-
-	if (ret != num_vfs)
-		pci_warn(pdev, "%d VFs requested; only %d enabled\n",
-			 num_vfs, ret);
-
-exit:
-	device_unlock(&pdev->dev);
-
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
-static ssize_t sriov_offset_show(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%u\n", pdev->sriov->offset);
-}
-
-static ssize_t sriov_stride_show(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%u\n", pdev->sriov->stride);
-}
-
-static ssize_t sriov_vf_device_show(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%x\n", pdev->sriov->vf_device);
-}
-
-static ssize_t sriov_drivers_autoprobe_show(struct device *dev,
-					    struct device_attribute *attr,
-					    char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-
-	return sprintf(buf, "%u\n", pdev->sriov->drivers_autoprobe);
-}
-
-static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
-					     struct device_attribute *attr,
-					     const char *buf, size_t count)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	bool drivers_autoprobe;
-
-	if (kstrtobool(buf, &drivers_autoprobe) < 0)
-		return -EINVAL;
-
-	pdev->sriov->drivers_autoprobe = drivers_autoprobe;
-
-	return count;
-}
-
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
-#endif /* CONFIG_PCI_IOV */
-
 static ssize_t driver_override_store(struct device *dev,
 				     struct device_attribute *attr,
 				     const char *buf, size_t count)
@@ -1697,34 +1549,6 @@ static const struct attribute_group pci_dev_hp_attr_group = {
 	.is_visible = pci_dev_hp_attrs_are_visible,
 };
 
-#ifdef CONFIG_PCI_IOV
-static struct attribute *sriov_dev_attrs[] = {
-	&sriov_totalvfs_attr.attr,
-	&sriov_numvfs_attr.attr,
-	&sriov_offset_attr.attr,
-	&sriov_stride_attr.attr,
-	&sriov_vf_device_attr.attr,
-	&sriov_drivers_autoprobe_attr.attr,
-	NULL,
-};
-
-static umode_t sriov_attrs_are_visible(struct kobject *kobj,
-				       struct attribute *a, int n)
-{
-	struct device *dev = kobj_to_dev(kobj);
-
-	if (!dev_is_pf(dev))
-		return 0;
-
-	return a->mode;
-}
-
-static const struct attribute_group sriov_dev_attr_group = {
-	.attrs = sriov_dev_attrs,
-	.is_visible = sriov_attrs_are_visible,
-};
-#endif /* CONFIG_PCI_IOV */
-
 static const struct attribute_group pci_dev_attr_group = {
 	.attrs = pci_dev_dev_attrs,
 	.is_visible = pci_dev_attrs_are_visible,
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 61bbfd611140..7e3c6c8ae6f9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -455,7 +455,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
-
+extern const struct attribute_group sriov_dev_attr_group;
 #else
 static inline int pci_iov_init(struct pci_dev *dev)
 {
-- 
2.20.1
