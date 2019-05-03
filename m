From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 3 May 2019 13:51:28 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Add
	spaces around '&&' operator
Message-ID: <20190503082128.GA15317@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix coding style errors by adding spaces around '&&' operators.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 274eead8d24d..0eb073fe1783 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -102,7 +102,7 @@ ieee80211_frag_cache_get(struct ieee80211_device *ieee,
 	struct rtl_80211_hdr_4addrqos *hdr_4addrqos;
 	u8 tid;
 
-	if (((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS)&&IEEE80211_QOS_HAS_SEQ(fc)) {
+	if (((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS) && IEEE80211_QOS_HAS_SEQ(fc)) {
 	  hdr_4addrqos = (struct rtl_80211_hdr_4addrqos *)hdr;
 	  tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & IEEE80211_QCTL_TID;
 	  tid = UP2AC(tid);
@@ -169,7 +169,7 @@ static int ieee80211_frag_cache_invalidate(struct ieee80211_device *ieee,
 	struct rtl_80211_hdr_4addrqos *hdr_4addrqos;
 	u8 tid;
 
-	if(((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS)&&IEEE80211_QOS_HAS_SEQ(fc)) {
+	if(((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS) && IEEE80211_QOS_HAS_SEQ(fc)) {
 	  hdr_4addrqos = (struct rtl_80211_hdr_4addrqos *)hdr;
 	  tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & IEEE80211_QCTL_TID;
 	  tid = UP2AC(tid);
@@ -426,7 +426,7 @@ static int is_duplicate_packet(struct ieee80211_device *ieee,
 
 
 	//TO2DS and QoS
-	if(((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS)&&IEEE80211_QOS_HAS_SEQ(fc)) {
+	if(((fc & IEEE80211_FCTL_DSTODS) == IEEE80211_FCTL_DSTODS) && IEEE80211_QOS_HAS_SEQ(fc)) {
 	  hdr_4addrqos = (struct rtl_80211_hdr_4addrqos *)header;
 	  tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & IEEE80211_QCTL_TID;
 	  tid = UP2AC(tid);
@@ -773,7 +773,7 @@ static u8 parse_subframe(struct sk_buff *skb,
 	/* just for debug purpose */
 	SeqNum = WLAN_GET_SEQ_SEQ(le16_to_cpu(hdr->seq_ctl));
 
-	if ((IEEE80211_QOS_HAS_SEQ(fc))&&\
+	if ((IEEE80211_QOS_HAS_SEQ(fc)) && \
 			(((frameqos *)(skb->data + IEEE80211_3ADDR_LEN))->field.reserved)) {
 		bIsAggregateFrame = true;
 	}
@@ -1109,7 +1109,7 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
 	if (stype != IEEE80211_STYPE_DATA &&
 	    stype != IEEE80211_STYPE_DATA_CFACK &&
 	    stype != IEEE80211_STYPE_DATA_CFPOLL &&
-	    stype != IEEE80211_STYPE_DATA_CFACKPOLL&&
+	    stype != IEEE80211_STYPE_DATA_CFACKPOLL &&
 	    stype != IEEE80211_STYPE_QOS_DATA//add by David,2006.8.4
 	    ) {
 		if (stype != IEEE80211_STYPE_NULLFUNC)
@@ -2565,7 +2565,7 @@ static inline void ieee80211_process_probe_response(
 		//	printk("====>2 network->ssid=%s FLAG=%d target.ssid=%s FLAG=%d\n", network->ssid, network->flags, target->ssid, target->flags);
 		if(((network->flags & NETWORK_EMPTY_ESSID) == NETWORK_EMPTY_ESSID) \
 		    && (((network->ssid_len > 0) && (strncmp(target->ssid, network->ssid, network->ssid_len)))\
-		    ||((ieee->current_network.ssid_len == network->ssid_len)&&(strncmp(ieee->current_network.ssid, network->ssid, network->ssid_len) == 0)&&(ieee->state == IEEE80211_NOLINK))))
+		    ||((ieee->current_network.ssid_len == network->ssid_len) && (strncmp(ieee->current_network.ssid, network->ssid, network->ssid_len) == 0) && (ieee->state == IEEE80211_NOLINK))))
 			renew = 1;
 		//YJ,add,080819,for hidden ap,end
 
@@ -2575,7 +2575,7 @@ static inline void ieee80211_process_probe_response(
 	}
 
 	spin_unlock_irqrestore(&ieee->lock, flags);
-	if (is_beacon(beacon->header.frame_ctl)&&is_same_network(&ieee->current_network, network, ieee)&&\
+	if (is_beacon(beacon->header.frame_ctl) && is_same_network(&ieee->current_network, network, ieee) && \
 		(ieee->state == IEEE80211_LINKED)) {
 		if (ieee->handle_beacon != NULL) {
 			ieee->handle_beacon(ieee->dev,beacon,&ieee->current_network);
-- 
2.21.0
