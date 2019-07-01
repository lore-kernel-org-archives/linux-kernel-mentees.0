From: sanjana99reddy99@gmail.com (Sanjana Sanikommu)
Date: Mon,  1 Jul 2019 20:27:32 +0530
Subject: [Linux-kernel-mentees] [PATCH] include: uapi: vfio.h: Fix shifting
	signed 32-bit value by 31 bits problem
Message-ID: <20190701145732.7673-1-sanjana99reddy99@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190701145732.ykVS_NuEX9amN9PJxJCT7059As66YCFSrM4s6J8fKGs@z>

Fix CRAMFS_BLK_FLAG_UNCOMPRESSED to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem. This isn't a problem for kernel builds
with gcc.

This could be problem since this header is part of public API which
could be included for builds using compilers that don't handle this
condition safely resulting in undefined behavior.

Signed-off-by: Sanjana Sanikommu <sanjana99reddy99 at gmail.com>
---
 include/uapi/linux/vfio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 02bb7ad6e986..bb61f5d443cf 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -295,7 +295,7 @@ struct vfio_region_info_cap_type {
 	__u32 subtype;	/* type specific */
 };
 
-#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE	(1 << 31)
+#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE	(1U << 31)
 #define VFIO_REGION_TYPE_PCI_VENDOR_MASK	(0xffff)
 
 /* 8086 Vendor sub-types */
-- 
2.17.1
