From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu,  5 Sep 2019 00:32:26 -0600
Subject: [Linux-kernel-mentees] [PATCH] PCI/IOV: Make SR-IOV attributes with
	mode 0664 use 0644
Message-ID: <20190905063226.43269-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190905063226.weSIzQKXeIvXTeeSSsJS5BkeBghTQcn-rqC0iKbQsmQ@z>

sriov_numvfs and sriov_drivers_autoprobe have "unusual" permissions (0664)
with no reported or found reason for allowing group write permissions.
libvirt runs as root when dealing with PCI, and chowns files for qemu
needs. There is not a need for the "0664" permissions.

sriov_numvfs was introduced in:
	commit 1789382a72a5 ("PCI: SRIOV control and status via sysfs")

sriov_drivers_autoprobe was introduced in:
	commit 0e7df22401a3 ("PCI: Add sysfs sriov_drivers_autoprobe to
			      control VF driver binding")

Change sriov_numvfs and sriov_drivers_autoprobe from "0664" permissions to
"0644" permissions.

Exchange DEVICE_ATTR() with DEVICE_ATTR_RW() which sets the mode to "0644".
DEVICE_ATTR() should only be used for "unusual" permissions.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/iov.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index b335db21c85e..b3f972e8cfed 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -375,12 +375,11 @@ static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
 }
 
 static DEVICE_ATTR_RO(sriov_totalvfs);
-static DEVICE_ATTR(sriov_numvfs, 0664, sriov_numvfs_show, sriov_numvfs_store);
+static DEVICE_ATTR_RW(sriov_numvfs);
 static DEVICE_ATTR_RO(sriov_offset);
 static DEVICE_ATTR_RO(sriov_stride);
 static DEVICE_ATTR_RO(sriov_vf_device);
-static DEVICE_ATTR(sriov_drivers_autoprobe, 0664, sriov_drivers_autoprobe_show,
-		   sriov_drivers_autoprobe_store);
+static DEVICE_ATTR_RW(sriov_drivers_autoprobe);
 
 static struct attribute *sriov_dev_attrs[] = {
 	&dev_attr_sriov_totalvfs.attr,
-- 
2.20.1
