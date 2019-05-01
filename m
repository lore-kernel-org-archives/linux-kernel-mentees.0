From: puranjay12@gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 01:53:49 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
 indentation errors by removing extra spaces
Message-ID: <20190501202349.GA24360@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501202349.JArSH_id5VHSQEq14LJIxmH1fB6iI_H1zHfKCdw1p58@z>

Remove extra spaces before statements to fix
following indentation warnings reported by checkpatch.pl.

WARNING: Statements should start on a tabstop
+	 struct rtl_80211_hdr_3addr *delba = NULL;

WARNING: Statements should start on a tabstop
+	 struct rtl_80211_hdr_3addr *rsp = NULL;

WARNING: Statements should start on a tabstop
+	 struct rtl_80211_hdr_3addr *req = NULL;

WARNING: Statements should start on a tabstop
+	 struct rtl_80211_hdr_3addr *Delba = NULL;

WARNING: Statements should start on a tabstop
+	 struct rtl_80211_hdr_3addr *BAReq = NULL;

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
index af396c53a929..37ec3eee8651 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -108,7 +108,7 @@ void ResetBaEntry(struct ba_record *pBA)
 static struct sk_buff *ieee80211_ADDBA(struct ieee80211_device *ieee, u8 *Dst, struct ba_record *pBA, u16 StatusCode, u8 type)
 {
 	struct sk_buff *skb = NULL;
-	 struct rtl_80211_hdr_3addr *BAReq = NULL;
+	struct rtl_80211_hdr_3addr *BAReq = NULL;
 	u8 *tag = NULL;
 	u16 len = ieee->tx_headroom + 9;
 	//category(1) + action field(1) + Dialog Token(1) + BA Parameter Set(2) +  BA Timeout Value(2) +  BA Start SeqCtrl(2)(or StatusCode(2))
@@ -187,7 +187,7 @@ static struct sk_buff *ieee80211_DELBA(
 {
 	union delba_param_set	DelbaParamSet;
 	struct sk_buff *skb = NULL;
-	 struct rtl_80211_hdr_3addr *Delba = NULL;
+	struct rtl_80211_hdr_3addr *Delba = NULL;
 	u8 *tag = NULL;
 	//len = head len + DELBA Parameter Set(2) + Reason Code(2)
 	u16 len = 6 + ieee->tx_headroom;
@@ -314,7 +314,7 @@ static void ieee80211_send_DELBA(struct ieee80211_device *ieee, u8 *dst,
  ********************************************************************************************************************/
 int ieee80211_rx_ADDBAReq(struct ieee80211_device *ieee, struct sk_buff *skb)
 {
-	 struct rtl_80211_hdr_3addr *req = NULL;
+	struct rtl_80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
 	struct ba_record *pBA = NULL;
@@ -414,7 +414,7 @@ int ieee80211_rx_ADDBAReq(struct ieee80211_device *ieee, struct sk_buff *skb)
  ********************************************************************************************************************/
 int ieee80211_rx_ADDBARsp(struct ieee80211_device *ieee, struct sk_buff *skb)
 {
-	 struct rtl_80211_hdr_3addr *rsp = NULL;
+	struct rtl_80211_hdr_3addr *rsp = NULL;
 	struct ba_record        *pPendingBA, *pAdmittedBA;
 	struct tx_ts_record     *pTS = NULL;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
@@ -538,7 +538,7 @@ int ieee80211_rx_ADDBARsp(struct ieee80211_device *ieee, struct sk_buff *skb)
  ********************************************************************************************************************/
 int ieee80211_rx_DELBA(struct ieee80211_device *ieee, struct sk_buff *skb)
 {
-	 struct rtl_80211_hdr_3addr *delba = NULL;
+	struct rtl_80211_hdr_3addr *delba = NULL;
 	union delba_param_set   *pDelBaParamSet = NULL;
 	u8			*dst = NULL;
 
-- 
2.21.0
