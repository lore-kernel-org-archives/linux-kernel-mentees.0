From: sushmaunnibhavi425 at gmail.com (Sushma Unnibhavi)
Date: Fri, 21 Jun 2019 22:37:35 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: replace symbolic
	permission with octal permission
Message-ID: <20190621170735.30373-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Resolved following checkpatch issue:
WARNING: symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index 5f950fda48ea..fd9dfb953ada 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -21,7 +21,7 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
 {
 	struct proc_dir_entry *entry;
 
-	entry = proc_mkdir_data(name, S_IRUGO|S_IXUGO, parent, data);
+	entry = proc_mkdir_data(name, 0444|S_IXUGO, parent, data);
 
 	return entry;
 }
@@ -31,7 +31,7 @@ inline struct proc_dir_entry *rtw_proc_create_entry(const char *name, struct pro
 {
 	struct proc_dir_entry *entry;
 
-	entry = proc_create_data(name,  S_IFREG|S_IRUGO, parent, fops, data);
+	entry = proc_create_data(name,  S_IFREG|0444, parent, fops, data);
 
 	return entry;
 }
-- 
2.17.1
