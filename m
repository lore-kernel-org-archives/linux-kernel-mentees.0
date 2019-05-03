From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 3 May 2019 14:34:13 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Use !x
 in place of NULL comparison
Message-ID: <20190503090413.GA29430@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix comparison to NULL, chang to !x operation.
Issue found using checkpatch.pl

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 944c8894f9ff..79558fb797c2 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1796,7 +1796,7 @@ static void ieee80211_process_action(struct ieee80211_device *ieee,
 	u8 *act = ieee80211_get_payload(header);
 	u8 tmp = 0;
 //	IEEE80211_DEBUG_DATA(IEEE80211_DL_DATA|IEEE80211_DL_BA, skb->data, skb->len);
-	if (act == NULL) {
+	if (!act) {
 		IEEE80211_DEBUG(IEEE80211_DL_ERR, "error to get payload of action frame\n");
 		return;
 	}
@@ -1929,7 +1929,7 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
 						memcpy(ieee->pHTInfo->PeerHTCapBuf, network->bssht.bdHTCapBuf, network->bssht.bdHTCapLen);
 						memcpy(ieee->pHTInfo->PeerHTInfoBuf, network->bssht.bdHTInfoBuf, network->bssht.bdHTInfoLen);
 					}
-					if (ieee->handle_assoc_response != NULL)
+					if (ieee->handle_assoc_response)
 						ieee->handle_assoc_response(ieee->dev, (struct ieee80211_assoc_response_frame *)header, network);
 				}
 				ieee80211_associate_complete(ieee);
@@ -2856,7 +2856,7 @@ static int ieee80211_wpa_set_encryption(struct ieee80211_device *ieee,
 		goto done;
 	}
 
-	if (*crypt == NULL || (*crypt)->ops != ops) {
+	if (!(*crypt) || (*crypt)->ops != ops) {
 		struct ieee80211_crypt_data *new_crypt;
 
 		ieee80211_crypt_delayed_deinit(ieee, crypt);
@@ -2871,7 +2871,7 @@ static int ieee80211_wpa_set_encryption(struct ieee80211_device *ieee,
 			new_crypt->priv =
 				new_crypt->ops->init(param->u.crypt.idx);
 
-		if (new_crypt->priv == NULL) {
+		if (!new_crypt->priv) {
 			kfree(new_crypt);
 			param->u.crypt.err = IEEE_CRYPT_ERR_CRYPT_INIT_FAILED;
 			ret = -EINVAL;
-- 
2.21.0
