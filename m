From: sushmaunnibhavi425@gmail.com (Sushma Unnibhavi)
Date: Mon, 24 Jun 2019 19:26:54 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: replace symbolic
	permission with octal permission
Message-ID: <20190624135654.6092-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190624135654.u4u5jkhtLTjyIb-A-0eprUiIRf18OJqWafHcCdQLtPg@z>

Resolved following checkpatch issue:
WARNING: symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index 5f950fda48ea..701ea9e76141 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -21,7 +21,7 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
 {
 	struct proc_dir_entry *entry;
 
-	entry = proc_mkdir_data(name, S_IRUGO|S_IXUGO, parent, data);
+	entry = proc_mkdir_data(name, 0444|0111, parent, data);
 
 	return entry;
 }
-- 
2.17.1
