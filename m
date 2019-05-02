From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 10:56:08 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
	comment formating errors
Message-ID: <20190502052608.GA15578@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix comment formating warnings found by checkpatch.pl

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 .../rtl8192u/ieee80211/ieee80211_softmac.c    | 66 ++++++++++---------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 944c8894f9ff..be02f73f5618 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -196,13 +196,13 @@ static u8 MgntQuery_MgntFrameTxRate(struct ieee80211_device *ieee)
 	}
 
 	/*
-	// Data rate of ProbeReq is already decided. Annie, 2005-03-31
-	if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
-	if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
-	rate = 0x0c;
-	else
-	rate = 0x02;
-	}
+	 * // Data rate of ProbeReq is already decided. Annie, 2005-03-31
+	 * if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
+	 * if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
+	 * rate = 0x0c;
+	 * else
+	 * rate = 0x02;
+	 * }
 	 */
 	return rate;
 }
@@ -265,7 +265,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee
 			/* insert the skb packet to the management queue */
 			/* as for the completion function, it does not need
 			 * to check it any more.
-			 * */
+			 */
 			printk("%s():insert to waitqueue!\n", __func__);
 			skb_queue_tail(&ieee->skb_waitQ[tcb_desc->queue_index], skb);
 		} else {
@@ -1643,11 +1643,11 @@ static short ieee80211_sta_ps_sleep(struct ieee80211_device *ieee, u32 *time_h,
 	int timeout;
 	u8 dtim;
 	/*if(ieee->ps == IEEE80211_PS_DISABLED ||
-		ieee->iw_mode != IW_MODE_INFRA ||
-		ieee->state != IEEE80211_LINKED)
-
-		return 0;
-	*/
+	 *	ieee->iw_mode != IW_MODE_INFRA ||
+	 *	ieee->state != IEEE80211_LINKED)
+	 *	
+	 *	return 0;
+	 */
 	dtim = ieee->current_network.dtim_data;
 	if (!(dtim & IEEE80211_DTIM_VALID))
 		return 0;
@@ -1979,8 +1979,8 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
 	case IEEE80211_STYPE_DISASSOC:
 	case IEEE80211_STYPE_DEAUTH:
 		/* FIXME for now repeat all the association procedure
-		* both for disassociation and deauthentication
-		*/
+		 * both for disassociation and deauthentication
+		 */
 		if ((ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE) &&
 		    ieee->state == IEEE80211_LINKED &&
 		    ieee->iw_mode == IW_MODE_INFRA) {
@@ -2050,10 +2050,10 @@ void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *
 #endif
 		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) || \
 		    (ieee->queue_stop)) {
-			/* insert the skb packet to the wait queue */
-			/* as for the completion function, it does not need
+			/* insert the skb packet to the wait queue 
+			 * as for the completion function, it does not need
 			 * to check it any more.
-			 * */
+			 */
 			//printk("error:no descriptor left at queue_index %d\n", queue_index);
 			//ieee80211_stop_queue(ieee);
 #ifdef USB_TX_DRIVER_AGGREGATION_ENABLE
@@ -2379,18 +2379,18 @@ static void ieee80211_associate_retry_wq(struct work_struct *work)
 		goto exit;
 
 	/* until we do not set the state to IEEE80211_NOLINK
-	* there are no possibility to have someone else trying
-	* to start an association procedure (we get here with
-	* ieee->state = IEEE80211_ASSOCIATING).
-	* When we set the state to IEEE80211_NOLINK it is possible
-	* that the RX path run an attempt to associate, but
-	* both ieee80211_softmac_check_all_nets and the
-	* RX path works with ieee->lock held so there are no
-	* problems. If we are still disassociated then start a scan.
-	* the lock here is necessary to ensure no one try to start
-	* an association procedure when we have just checked the
-	* state and we are going to start the scan.
-	*/
+	 * there are no possibility to have someone else trying
+	 * to start an association procedure (we get here with
+	 * ieee->state = IEEE80211_ASSOCIATING).
+	 * When we set the state to IEEE80211_NOLINK it is possible
+	 * that the RX path run an attempt to associate, but
+	 * both ieee80211_softmac_check_all_nets and the
+	 * RX path works with ieee->lock held so there are no
+	 * problems. If we are still disassociated then start a scan.
+	 * the lock here is necessary to ensure no one try to start
+	 * an association procedure when we have just checked the
+	 * state and we are going to start the scan.
+	 */
 	ieee->state = IEEE80211_NOLINK;
 
 	ieee80211_softmac_check_all_nets(ieee);
@@ -2618,7 +2618,8 @@ void ieee80211_softmac_free(struct ieee80211_device *ieee)
 static int ieee80211_wpa_enable(struct ieee80211_device *ieee, int value)
 {
 	/* This is called when wpa_supplicant loads and closes the driver
-	 * interface. */
+	 * interface. 
+	 */
 	printk("%s WPA\n", value ? "enabling" : "disabling");
 	ieee->wpa_enabled = value;
 	return 0;
@@ -2923,7 +2924,8 @@ static int ieee80211_wpa_set_encryption(struct ieee80211_device *ieee,
 	 * generate new IEEE 802.11 authentication which may end up in looping
 	 * with IEEE 802.1X.  If your hardware requires a reset after WEP
 	 * configuration (for example... Prism2), implement the reset_port in
-	 * the callbacks structures used to initialize the 802.11 stack. */
+	 * the callbacks structures used to initialize the 802.11 stack. 
+	 */
 	if (ieee->reset_on_keychange &&
 	    ieee->iw_mode != IW_MODE_INFRA &&
 	    ieee->reset_port &&
-- 
2.21.0
