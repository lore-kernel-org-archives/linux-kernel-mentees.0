From: puranjay12@gmail.com (Puranjay Mohan)
Date: Tue, 18 Jun 2019 22:03:52 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 RESEND] fs: cramfs_fs.h: Fix
	shifting signed 32-bit value by 31 bits problem
Message-ID: <20190618163352.4177-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618163352.DylMtKbKaH2T1lDVtLr2Z8sqy_CORXe8gA5XsSnwVAQ@z>

Fix CRAMFS_BLK_FLAG_UNCOMPRESSED to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem. This isn't a problem for kernel builds
with gcc.

This could be problem since this header is part of public API which
could be included for builds using compilers that don't handle this
condition safely resulting in undefined behavior.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
Reviewed-by: Christoph Hellwig <hch at lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Reviewed-by: Shuah Khan <skhan at linuxfoundation.org>
---
V2 - use the unsigned constants for all flags, not just one
RESEND - Added Nicolas Pitre to CC list, added reviewed by tags.

 include/uapi/linux/cramfs_fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/cramfs_fs.h b/include/uapi/linux/cramfs_fs.h
index 6713669aa2ed..71cb602d4198 100644
--- a/include/uapi/linux/cramfs_fs.h
+++ b/include/uapi/linux/cramfs_fs.h
@@ -98,8 +98,8 @@ struct cramfs_super {
  *
  * That leaves room for 3 flag bits in the block pointer table.
  */
-#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1 << 31)
-#define CRAMFS_BLK_FLAG_DIRECT_PTR	(1 << 30)
+#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1U << 31)
+#define CRAMFS_BLK_FLAG_DIRECT_PTR	(1U << 30)
 
 #define CRAMFS_BLK_FLAGS	( CRAMFS_BLK_FLAG_UNCOMPRESSED \
 				| CRAMFS_BLK_FLAG_DIRECT_PTR )
-- 
2.21.0
