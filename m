From: sushmaunnibhavi425 at gmail.com (Sushma Unnibhavi)
Date: Sat, 22 Jun 2019 12:47:03 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] replaced both the symbolic
	permissions S_IXUGO and S_IRUGO to octal permissions 0111 and 0444
Message-ID: <20190622071703.9664-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
Changes in v2:changed both symbolic permissions to octal
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
