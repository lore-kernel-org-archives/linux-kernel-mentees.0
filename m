From: bnvandana at gmail.com (Vandana BN)
Date: Sat, 27 Apr 2019 13:10:28 +0530
Subject: [Linux-kernel-mentees] [PATCH v4] staging: rtl8723bs: Fix
	checkpatch.pl warnings
In-Reply-To: <20190426131249.16198-1-bnvandana@gmail.com>
References: <20190426131249.16198-1-bnvandana@gmail.com>
Message-ID: <20190427074028.26089-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch resolves coding style brace warning and constant on right warning.
WARNING: Comparisons should place the constant on the right side of the test
WARNING: braces {} are not necessary for single statement blocks
CHECK: Comparison to NULL could be written "!pbuf"

Signed-off-by: Vandana BN <bnvandana at gmail.com>
------
 v2- Edited commit message and subject
 v3- Edited commit message
 v4- changed NULL check to use !pbuf
------
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 0de1e12a676e..9f8446ccf771 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -1425,9 +1425,8 @@ int proc_get_btcoex_info(struct seq_file *m, void *v)
 	padapter = (struct adapter *)rtw_netdev_priv(dev);
 
 	pbuf = rtw_zmalloc(bufsize);
-	if (NULL == pbuf) {
+	if (!pbuf)
 		return -ENOMEM;
-	}
 
 	rtw_btcoex_DisplayBtCoexInfo(padapter, pbuf, bufsize);
 
-- 
2.17.1
