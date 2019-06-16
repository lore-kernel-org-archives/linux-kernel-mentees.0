From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Sun, 16 Jun 2019 21:57:34 +0530
Subject: [Linux-kernel-mentees] [PATCH] fs: cramfs_fs.h: Fix shifting signed
	32-bit value by 31 bits problem
Message-ID: <20190616162734.29966-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix CRAMFS_BLK_FLAG_UNCOMPRESSED to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem. This isn't a problem for kernel builds
with gcc.

This could be problem since this header is part of public API which
could be included for builds using compilers that don't handle this
condition safely resulting in undefined behavior.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 include/uapi/linux/cramfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/cramfs_fs.h b/include/uapi/linux/cramfs_fs.h
index 6713669aa2ed..31df3e185b62 100644
--- a/include/uapi/linux/cramfs_fs.h
+++ b/include/uapi/linux/cramfs_fs.h
@@ -98,7 +98,7 @@ struct cramfs_super {
  *
  * That leaves room for 3 flag bits in the block pointer table.
  */
-#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1 << 31)
+#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1U << 31)
 #define CRAMFS_BLK_FLAG_DIRECT_PTR	(1 << 30)
 
 #define CRAMFS_BLK_FLAGS	( CRAMFS_BLK_FLAG_UNCOMPRESSED \
-- 
2.21.0
