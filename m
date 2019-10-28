From: csx at disroot.org (Dhanuka Warusadura)
Date: Mon, 28 Oct 2019 16:37:44 +0530
Subject: [Linux-kernel-mentees] [PATCH] Fixes documentation warning.
Message-ID: <20191028110744.6523-1-csx@disroot.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes - warning: Function parameter or member 'of_match_table'
not described in 'w1_family'

Signed-off-by: Dhanuka Warusadura <csx at disroot.org>
---
 include/linux/w1.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/w1.h b/include/linux/w1.h
index 7da0c7588e04..cebf3464bc03 100644
--- a/include/linux/w1.h
+++ b/include/linux/w1.h
@@ -262,6 +262,7 @@ struct w1_family_ops {
  * @family_entry:	family linked list
  * @fid:		8 bit family identifier
  * @fops:		operations for this family
+ * @of_match_table: open firmware match table
  * @refcnt:		reference counter
  */
 struct w1_family {
-- 
2.24.0.rc1
