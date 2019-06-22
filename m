From: sushmaunnibhavi425 at gmail.com (Sushma Unnibhavi)
Date: Sat, 22 Jun 2019 11:03:58 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8732bs: replace symbolic
	permission with octal permission
Message-ID: <20190622053358.5832-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Resolved following checkpatch issue:
WARNING: Symbolic permissions 'S_IXUGO' are not preferred. Consider using octal permissions '0111'

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index fd9dfb953ada..f4292a2fd011 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -21,7 +21,7 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
 {
 	struct proc_dir_entry *entry;
 
-	entry = proc_mkdir_data(name, 0444|S_IXUGO, parent, data);
+	entry = proc_mkdir_data(name, 0444|0111, parent, data);
 
 	return entry;
 }
-- 
2.17.1
