From: sushmaunnibhavi425@gmail.com (Sushma Unnibhavi)
Date: Sat, 22 Jun 2019 12:19:00 +0530
Subject: [Linux-kernel-mentees] [PATCH] changes in v2: changed both the
	symbolic permissions S_IFREG and S_IXUGO into octal
	permissions 0100000 and 0444 respectively
Message-ID: <20190622064900.8830-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622064900.g9wu2en2tX8Xbg-8ISLcq84y_tlHXCZq0nM8gVpdPWM@z>

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index f4292a2fd011..5fcdcb47e657 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -31,7 +31,7 @@ inline struct proc_dir_entry *rtw_proc_create_entry(const char *name, struct pro
 {
 	struct proc_dir_entry *entry;
 
-	entry = proc_create_data(name,  S_IFREG|0444, parent, fops, data);
+	entry = proc_create_data(name,  0100000|0444, parent, fops, data);
 
 	return entry;
 }
-- 
2.17.1
