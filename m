From: puranjay12@gmail.com (Puranjay Mohan)
Date: Fri, 3 May 2019 02:09:21 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
	spelling mistake
Message-ID: <20190502203921.GA6347@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502203921.1aam_nhC-QFNY2fBiwzSrBHi1NnANel3Nq6k1_hop2I@z>

Correct spelling mistakes at two places in comments.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 0e762e559675..274eead8d24d 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -557,7 +557,7 @@ void ieee80211_indicate_packets(struct ieee80211_device *ieee, struct ieee80211_
 			//stats->rx_packets++;
 			//stats->rx_bytes += sub_skb->len;
 
-		/* Indicat the packets to upper layer */
+		/* Indicate the packets to upper layer */
 			if (sub_skb) {
 				sub_skb->protocol = eth_type_trans(sub_skb, ieee->dev);
 				memset(sub_skb->cb, 0, sizeof(sub_skb->cb));
@@ -1311,7 +1311,7 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
 					stats->multicast++;
 				}
 
-				/* Indicat the packets to upper layer */
+				/* Indicate the packets to upper layer */
 				sub_skb->protocol = eth_type_trans(sub_skb, dev);
 				memset(sub_skb->cb, 0, sizeof(sub_skb->cb));
 				sub_skb->dev = dev;
-- 
2.21.0
