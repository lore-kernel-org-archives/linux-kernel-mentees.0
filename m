From: hvubfoss@gmail.com (Harshavardhan Unnibhavi)
Date: Sat, 22 Jun 2019 13:01:58 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: change sscanf to
	kstrtoint
Message-ID: <20190622073158.6712-1-hvubfoss@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622073158.vdvGESQhSSVyFlfCw5VgjVWAh5H5mw46D6WC8C4WfiU@z>

Fixes following checkpath.pl warning:
Prefer kstrto<type> to single variable sscanf

Signed-off-by: Harshavardhan Unnibhavi <hvubfoss at gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index 5f950fda48ea..b700363c899c 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -468,7 +468,7 @@ ssize_t proc_set_odm_dbg_comp(struct file *file, const char __user *buffer, size
 
 	if (buffer && !copy_from_user(tmp, buffer, sizeof(tmp))) {
 
-		int num = sscanf(tmp, "%llx", &dbg_comp);
+		int num = kstrtoint(tmp, "%llx", &dbg_comp);
 
 		if (num != 1)
 			return count;
-- 
2.17.1
