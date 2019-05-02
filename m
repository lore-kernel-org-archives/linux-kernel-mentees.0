From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 11:29:23 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211: Fix
	coding style warning
Message-ID: <20190502055923.GA21115@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove braces around a single if statement to fix following
checkpatch.pl warning.
WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 0e762e559675..c3433ade7144 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -2577,9 +2577,9 @@ static inline void ieee80211_process_probe_response(
 	spin_unlock_irqrestore(&ieee->lock, flags);
 	if (is_beacon(beacon->header.frame_ctl)&&is_same_network(&ieee->current_network, network, ieee)&&\
 		(ieee->state == IEEE80211_LINKED)) {
-		if (ieee->handle_beacon != NULL) {
+		if (ieee->handle_beacon != NULL) 
 			ieee->handle_beacon(ieee->dev,beacon,&ieee->current_network);
-		}
+		
 	}
 
 out:
-- 
2.21.0
