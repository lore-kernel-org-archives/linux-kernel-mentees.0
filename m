From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 3 May 2019 02:36:33 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
	coding style errors
Message-ID: <20190502210633.GA12978@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix coding style errors related to braces for if-else statements.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 .../staging/rtl8192u/ieee80211/ieee80211_tx.c | 60 +++++++------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
index 8e1ec4409b4f..b0668cf4a857 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
@@ -169,8 +169,7 @@ int ieee80211_encrypt_fragment(
 	struct ieee80211_crypt_data *crypt = ieee->crypt[ieee->tx_keyidx];
 	int res;
 
-	if (!(crypt && crypt->ops))
-	{
+	if (!(crypt && crypt->ops)) {
 		printk("=========>%s(), crypt is null\n", __func__);
 		return -1;
 	}
@@ -309,32 +308,25 @@ static void ieee80211_tx_query_agg_cap(struct ieee80211_device *ieee,
 	if (!Adapter->HalFunc.GetNmodeSupportBySecCfgHandler(Adapter))
 		return;
 #endif
-	if (!ieee->GetNmodeSupportBySecCfg(ieee->dev))
-	{
+	if (!ieee->GetNmodeSupportBySecCfg(ieee->dev)) {
 		return;
 	}
-	if (pHTInfo->bCurrentAMPDUEnable)
-	{
-		if (!GetTs(ieee, (struct ts_common_info **)(&pTxTs), hdr->addr1, skb->priority, TX_DIR, true))
-		{
+	if (pHTInfo->bCurrentAMPDUEnable) {
+		if (!GetTs(ieee, (struct ts_common_info **)(&pTxTs), hdr->addr1, skb->priority, TX_DIR, true)) {
 			printk("===>can't get TS\n");
 			return;
 		}
-		if (!pTxTs->tx_admitted_ba_record.valid)
-		{
+		if (!pTxTs->tx_admitted_ba_record.valid) {
 			TsStartAddBaProcess(ieee, pTxTs);
 			goto FORCED_AGG_SETTING;
-		}
-		else if (!pTxTs->using_ba)
-		{
+		} else if (!pTxTs->using_ba) {
 			if (SN_LESS(pTxTs->tx_admitted_ba_record.start_seq_ctrl.field.seq_num, (pTxTs->tx_cur_seq + 1) % 4096))
 				pTxTs->using_ba = true;
 			else
 				goto FORCED_AGG_SETTING;
 		}
 
-		if (ieee->iw_mode == IW_MODE_INFRA)
-		{
+		if (ieee->iw_mode == IW_MODE_INFRA) {
 			tcb_desc->bAMPDUEnable = true;
 			tcb_desc->ampdu_factor = pHTInfo->CurrentAMPDUFactor;
 			tcb_desc->ampdu_density = pHTInfo->CurrentMPDUDensity;
@@ -366,12 +358,9 @@ static void ieee80211_qurey_ShortPreambleMode(struct ieee80211_device *ieee,
 					      struct cb_desc *tcb_desc)
 {
 	tcb_desc->bUseShortPreamble = false;
-	if (tcb_desc->data_rate == 2)
-	{//// 1M can only use Long Preamble. 11B spec
+	if (tcb_desc->data_rate == 2) {//// 1M can only use Long Preamble. 11B spec
 		return;
-	}
-	else if (ieee->current_network.capability & WLAN_CAPABILITY_SHORT_PREAMBLE)
-	{
+	} else if (ieee->current_network.capability & WLAN_CAPABILITY_SHORT_PREAMBLE) {
 		tcb_desc->bUseShortPreamble = true;
 	}
 	return;
@@ -386,8 +375,7 @@ ieee80211_query_HTCapShortGI(struct ieee80211_device *ieee, struct cb_desc *tcb_
 	if (!pHTInfo->bCurrentHTSupport||!pHTInfo->bEnableHT)
 		return;
 
-	if (pHTInfo->bForcedShortGI)
-	{
+	if (pHTInfo->bForcedShortGI) {
 		tcb_desc->bUseShortGI = true;
 		return;
 	}
@@ -535,27 +523,25 @@ static void ieee80211_txrate_selectmode(struct ieee80211_device *ieee,
 					struct cb_desc *tcb_desc)
 {
 #ifdef TO_DO_LIST
-	if(!IsDataFrame(pFrame))
-	{
+	if (!IsDataFrame(pFrame)) {
 		pTcb->bTxDisableRateFallBack = true;
 		pTcb->bTxUseDriverAssingedRate = true;
 		pTcb->RATRIndex = 7;
 		return;
 	}
 
-	if(pMgntInfo->ForcedDataRate!= 0)
-	{
+	if (pMgntInfo->ForcedDataRate!= 0) {
 		pTcb->bTxDisableRateFallBack = true;
 		pTcb->bTxUseDriverAssingedRate = true;
 		return;
 	}
 #endif
-	if(ieee->bTxDisableRateFallBack)
+	if (ieee->bTxDisableRateFallBack)
 		tcb_desc->bTxDisableRateFallBack = true;
 
-	if(ieee->bTxUseDriverAssingedRate)
+	if (ieee->bTxUseDriverAssingedRate)
 		tcb_desc->bTxUseDriverAssingedRate = true;
-	if(!tcb_desc->bTxDisableRateFallBack || !tcb_desc->bTxUseDriverAssingedRate)
+	if (!tcb_desc->bTxDisableRateFallBack || !tcb_desc->bTxUseDriverAssingedRate)
 	{
 		if (ieee->iw_mode == IW_MODE_INFRA || ieee->iw_mode == IW_MODE_ADHOC)
 			tcb_desc->RATRIndex = 0;
@@ -614,7 +600,7 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 
-	if(likely(ieee->raw_tx == 0)){
+	if (likely(ieee->raw_tx == 0)) {
 		if (unlikely(skb->len < SNAP_SIZE + sizeof(u16))) {
 			printk(KERN_WARNING "%s: skb too small (%d).\n",
 			ieee->dev->name, skb->len);
@@ -690,15 +676,13 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (is_multicast_ether_addr(header.addr1)) {
 			frag_size = MAX_FRAG_THRESHOLD;
 			qos_ctl |= QOS_CTL_NOTCONTAIN_ACK;
-		}
-		else {
+		} else {
 			frag_size = ieee->fts;//default:392
 			qos_ctl = 0;
 		}
 
 		//if (ieee->current_network.QoS_Enable)
-		if(qos_actived)
-		{
+		if (qos_actived) {
 			hdr_len = IEEE80211_3ADDR_LEN + 2;
 
 			skb->priority = ieee80211_classify(skb, &ieee->current_network);
@@ -746,12 +730,12 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 		txb->payload_size = __cpu_to_le16(bytes);
 
 		//if (ieee->current_network.QoS_Enable)
-		if(qos_actived)
-		{
+		if (qos_actived)
+
 			txb->queue_index = UP2AC(skb->priority);
-		} else {
+		else
 			txb->queue_index = WME_AC_BK;
-		}
+
 
 
 
-- 
2.21.0
