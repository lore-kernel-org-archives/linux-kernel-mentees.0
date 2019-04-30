From: bnvandana@gmail.com (Vandana BN)
Date: Tue, 30 Apr 2019 23:59:44 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8192u: ieee80211:
	Resolve ERROR reported by checkpatch
Message-ID: <20190430182944.9539-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430182944.dWR8Y0__GKv0dj0V-FbU3pjgtdaJ9vObVxi27d1v5GU@z>

This patch resolves coding style space ERRORs reported by checkpatch

ERROR: spaces required around that '>' (ctx:VxV)
ERROR: space required after that ',' (ctx:VxO)
ERROR: space required before that '&' (ctx:OxV)
ERROR: spaces required around that '!=' (ctx:VxV)
ERROR: spaces required around that '=' (ctx:VxW)
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '?' (ctx:VxE)
ERROR: spaces required around that ':' (ctx:VxE)
ERROR: spaces required around that '==' (ctx:VxV)
Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 .../rtl8192u/ieee80211/rtl819x_TSProc.c       | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_TSProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_TSProc.c
index 418c92403904..7cac668bfb0b 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_TSProc.c
@@ -63,7 +63,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 		}
 	}
 
-	if (index>0) {
+	if (index > 0) {
 		// Set rx_timeout_indicate_seq to 0xffff to indicate no pending packets in buffer now.
 		pRxTs->rx_timeout_indicate_seq = 0xffff;
 
@@ -182,7 +182,7 @@ void TSInitialize(struct ieee80211_device *ieee)
 	INIT_LIST_HEAD(&ieee->RxReorder_Unused_List);
 //#ifdef TO_DO_LIST
 	for (count = 0; count < REORDER_ENTRY_NUM; count++) {
-		list_add_tail(&pRxReorderEntry->List,&ieee->RxReorder_Unused_List);
+		list_add_tail(&pRxReorderEntry->List, &ieee->RxReorder_Unused_List);
 		if (count == (REORDER_ENTRY_NUM-1))
 			break;
 		pRxReorderEntry = &ieee->RxReorderEntry[count+1];
@@ -196,7 +196,7 @@ static void AdmitTS(struct ieee80211_device *ieee,
 	del_timer_sync(&pTsCommonInfo->setup_timer);
 	del_timer_sync(&pTsCommonInfo->inact_timer);
 
-	if (InactTime!=0)
+	if (InactTime != 0)
 		mod_timer(&pTsCommonInfo->inact_timer,
 			  jiffies + msecs_to_jiffies(InactTime));
 }
@@ -214,25 +214,25 @@ static struct ts_common_info *SearchAdmitTRStream(struct ieee80211_device *ieee,
 	if (ieee->iw_mode == IW_MODE_MASTER) { //ap mode
 		if (TxRxSelect == TX_DIR) {
 			search_dir[DIR_DOWN] = true;
-			search_dir[DIR_BI_DIR]= true;
+			search_dir[DIR_BI_DIR] = true;
 		} else {
 			search_dir[DIR_UP]	= true;
-			search_dir[DIR_BI_DIR]= true;
+			search_dir[DIR_BI_DIR] = true;
 		}
 	} else if (ieee->iw_mode == IW_MODE_ADHOC) {
-		if(TxRxSelect == TX_DIR)
+		if (TxRxSelect == TX_DIR)
 			search_dir[DIR_UP]	= true;
 		else
 			search_dir[DIR_DOWN] = true;
 	} else {
 		if (TxRxSelect == TX_DIR) {
 			search_dir[DIR_UP]	= true;
-			search_dir[DIR_BI_DIR]= true;
-			search_dir[DIR_DIRECT]= true;
+			search_dir[DIR_BI_DIR] = true;
+			search_dir[DIR_DIRECT] = true;
 		} else {
 			search_dir[DIR_DOWN] = true;
-			search_dir[DIR_BI_DIR]= true;
-			search_dir[DIR_DIRECT]= true;
+			search_dir[DIR_BI_DIR] = true;
+			search_dir[DIR_DIRECT] = true;
 		}
 	}
 
@@ -357,20 +357,20 @@ bool GetTs(
 			struct tspec_body	TSpec;
 			struct qos_tsinfo	*pTSInfo = &TSpec.ts_info;
 			struct list_head	*pUnusedList =
-								(TxRxSelect == TX_DIR)?
-								(&ieee->Tx_TS_Unused_List):
+								(TxRxSelect == TX_DIR) ?
+								(&ieee->Tx_TS_Unused_List) :
 								(&ieee->Rx_TS_Unused_List);
 
 			struct list_head	*pAddmitList =
-								(TxRxSelect == TX_DIR)?
-								(&ieee->Tx_TS_Admit_List):
+								(TxRxSelect == TX_DIR) ?
+								(&ieee->Tx_TS_Admit_List) :
 								(&ieee->Rx_TS_Admit_List);
 
-			enum direction_value	Dir =		(ieee->iw_mode == IW_MODE_MASTER)?
-								((TxRxSelect==TX_DIR)?DIR_DOWN:DIR_UP):
-								((TxRxSelect==TX_DIR)?DIR_UP:DIR_DOWN);
+			enum direction_value	Dir =		(ieee->iw_mode == IW_MODE_MASTER) ?
+								((TxRxSelect == TX_DIR)?DIR_DOWN:DIR_UP) :
+								((TxRxSelect == TX_DIR)?DIR_UP:DIR_DOWN);
 			IEEE80211_DEBUG(IEEE80211_DL_TS, "to add Ts\n");
-			if(!list_empty(pUnusedList)) {
+			if (!list_empty(pUnusedList)) {
 				(*ppTS) = list_entry(pUnusedList->next, struct ts_common_info, list);
 				list_del_init(&(*ppTS)->list);
 				if (TxRxSelect == TX_DIR) {
@@ -435,13 +435,13 @@ static void RemoveTsEntry(struct ieee80211_device *ieee, struct ts_common_info *
 					spin_unlock_irqrestore(&(ieee->reorder_spinlock), flags);
 					return;
 				}
-				for(i =0; i < prxb->nr_subframes; i++)
+				for (i =  0; i < prxb->nr_subframes; i++)
 					dev_kfree_skb(prxb->subframes[i]);
 
 				kfree(prxb);
 				prxb = NULL;
 			}
-			list_add_tail(&pRxReorderEntry->List,&ieee->RxReorder_Unused_List);
+			list_add_tail(&pRxReorderEntry->List, &ieee->RxReorder_Unused_List);
 			spin_unlock_irqrestore(&(ieee->reorder_spinlock), flags);
 		}
 
-- 
2.17.1
