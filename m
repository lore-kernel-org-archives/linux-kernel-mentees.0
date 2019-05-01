From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 02:16:20 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
	if-else indentation warning
Message-ID: <20190501204620.GA29702@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Add tabs after if and else statements to
fix the following warnings from checkpatch.pl

WARNING: suspect code indent for conditional statements (8, 8)
+	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
+	pBA->param_set.field.buffer_size = 1;

WARNING: suspect code indent for conditional statements (8, 8)
+	else
+	pBA->param_set.field.buffer_size = 32;

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
index 37ec3eee8651..53869b3c985c 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -384,9 +384,9 @@ int ieee80211_rx_ADDBAReq(struct ieee80211_device *ieee, struct sk_buff *skb)
 	pBA->start_seq_ctrl = *pBaStartSeqCtrl;
 	//for half N mode we only aggregate 1 frame
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
-	pBA->param_set.field.buffer_size = 1;
+		pBA->param_set.field.buffer_size = 1;
 	else
-	pBA->param_set.field.buffer_size = 32;
+		pBA->param_set.field.buffer_size = 32;
 	ActivateBAEntry(ieee, pBA, pBA->timeout_value);
 	ieee80211_send_ADDBARsp(ieee, dst, pBA, ADDBA_STATUS_SUCCESS);
 
-- 
2.21.0
