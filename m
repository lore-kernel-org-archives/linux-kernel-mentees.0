Return-Path: <SRS0=4rFl=FT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CD9C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Dec 2020 15:28:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9B2224B8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Dec 2020 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9B2224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3790787371;
	Tue, 15 Dec 2020 15:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DU7UKyJKYwi; Tue, 15 Dec 2020 15:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E3138732D;
	Tue, 15 Dec 2020 15:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13D69C088E;
	Tue, 15 Dec 2020 15:28:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8A3DC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 15:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B71448732D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 15:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBcj6ay52gSr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 15:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0297B87313
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 15:27:59 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id iq13so1402038pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 07:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BUmMgbKMXD+F/rOVHrhVVwj0NXGhzEvTjYXbJhVb3l8=;
 b=svDOzLe1svs15NMSQhZwnsF5yxxriqF36plt1eD6fb7HUGABjpytCqM27Nr5M6vc9I
 UXodW7tCiMaCSgOfqcZQrQbpLuWb+8OlgHmOpzIxcjhakbhJlK9KUylT7cFzsHJ3HkZp
 bcR8EWmq4SzI4j2BX8oi50FWqXLzvyawqOi3aWm2k+WJU8SOcV+20jag81dRwDhk47zW
 hMSxMjiKi9Emyy+oyYOqBWf+hgmBkD1+9I9wntgFBB9Uin1l7hrBEDrXpYBaM2WMD8FZ
 BMUU1SWqwpqSTEdm+f9iWDfY2Pu5N3lpFcWvbdjOMkoADZO+AteD2HQk0pHo7ljoGXBO
 xE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BUmMgbKMXD+F/rOVHrhVVwj0NXGhzEvTjYXbJhVb3l8=;
 b=HgicckqEjZ3xNstRH04fM8RSV9uMlt3RBCSczKNFiyb4OxnO5nK4O3xQ54X0HwWtYQ
 E70l9DuM0uTczKZ8YGDuE5ivEVyS0hD7MT2uLDV6oPzBm67fWRlaI3/zhqaxpg+XHnwJ
 Tl0wUT+nnT3e6TrH+VPiGgSq9y2xbfNO87UsbRUHLK2weunqafN+abLjzRWvzAhm28Lx
 AzCoPN9kNdJyiRFBTN2q2J9Ls3ZEmTZV59USpuC5yscBxYszajjD25QR4yPMbFLDuYQM
 vwcdT6Vd1KwrEBTVNfNR+41fBnhR+Her/FuR/wFx2RKCJBQV5kPVrOZmmEa+aXmAxrLF
 G6Pw==
X-Gm-Message-State: AOAM533z+bVViBJSZBWNE3XEjGarftgoMZJrBx1KVuTNargwwlJ9I7Xf
 YQa4G7GABwqe3ce2Ny17AuA=
X-Google-Smtp-Source: ABdhPJympkPJgU+1nyx4kJfFct0nD1ovHMtGoW5vf/zkqxATy+Vgrma0G2Gg76L8PJb+Z9PMVRsWrQ==
X-Received: by 2002:a17:902:6b45:b029:d6:c43e:ad13 with SMTP id
 g5-20020a1709026b45b02900d6c43ead13mr27857219plt.77.1608046078195; 
 Tue, 15 Dec 2020 07:27:58 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:424:94c3:88c6:2dfd:26b:f3e3])
 by smtp.googlemail.com with ESMTPSA id
 b19sm23964387pfo.24.2020.12.15.07.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:27:57 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 15 Dec 2020 20:57:47 +0530
Message-Id: <20201215152747.20573-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8192e: fix bool
	comparison in expressions
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are certain conditional expressions in rtl8192e, where a boolean
variable is compared with true/false, in forms such as (foo == true) or
(false != bar), which does not comply with checkpatch.pl (CHECK:
BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g. in drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c,
"if (Type == true)" can be replaced with: "if (Type)"

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
- changes are compile tested
- the patch applies over next-20201204

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c           | 4 ++--
 drivers/staging/rtl8192e/rtllib_tx.c           | 8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9f869fb3eaa8..c4a3fc79fb40 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -129,9 +129,9 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 		RegRCR = rtl92e_readl(dev, RCR);
 		priv->ReceiveConfig = RegRCR;
 
-		if (Type == true)
+		if (Type)
 			RegRCR |= (RCR_CBSSID);
-		else if (Type == false)
+		else if (!Type)
 			RegRCR &= (~RCR_CBSSID);
 
 		rtl92e_writel(dev, RCR, RegRCR);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 663675efcfe4..9078fadd65f9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1389,7 +1389,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 
 	rtl92e_dm_watchdog(dev);
 
-	if (rtllib_act_scanning(priv->rtllib, false) == false) {
+	if (!rtllib_act_scanning(priv->rtllib, false)) {
 		if ((ieee->iw_mode == IW_MODE_INFRA) && (ieee->state ==
 		     RTLLIB_NOLINK) &&
 		     (ieee->eRFPowerState == eRfOn) && !ieee->is_set_key &&
@@ -2471,7 +2471,7 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 
 	priv->ops = ops;
 
-	if (rtl92e_check_adapter(pdev, dev) == false)
+	if (!rtl92e_check_adapter(pdev, dev))
 		goto err_unmap;
 
 	dev->irq = pdev->irq;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 462835684e8b..e340be3ebb97 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1765,7 +1765,7 @@ static void _rtl92e_dm_cts_to_self(struct net_device *dev)
 	unsigned long curTxOkCnt = 0;
 	unsigned long curRxOkCnt = 0;
 
-	if (priv->rtllib->bCTSToSelfEnable != true) {
+	if (!priv->rtllib->bCTSToSelfEnable) {
 		pHTInfo->IOTAction &= ~HT_IOT_ACT_FORCED_CTS2SELF;
 		return;
 	}
@@ -2447,7 +2447,7 @@ static void _rtl92e_dm_dynamic_tx_power(struct net_device *dev)
 	unsigned int txhipower_threshold = 0;
 	unsigned int txlowpower_threshold = 0;
 
-	if (priv->rtllib->bdynamic_txpower_enable != true) {
+	if (!priv->rtllib->bdynamic_txpower_enable) {
 		priv->bDynamicTxHighPower = false;
 		priv->bDynamicTxLowPower = false;
 		return;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d31b5e1c8df4..217557ac8d80 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -924,7 +924,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 	sc = le16_to_cpu(hdr->seq_ctl);
 	frag = WLAN_GET_SEQ_FRAG(sc);
 
-	if ((ieee->pHTInfo->bCurRxReorderEnable == false) ||
+	if ((!ieee->pHTInfo->bCurRxReorderEnable) ||
 		!ieee->current_network.qos_data.active ||
 		!IsDataFrame(skb->data) ||
 		IsLegacyDataFrame(skb->data)) {
@@ -1442,7 +1442,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	}
 
 	/* Indicate packets to upper layer or Rx Reorder */
-	if (ieee->pHTInfo->bCurRxReorderEnable == false || pTS == NULL ||
+	if (!ieee->pHTInfo->bCurRxReorderEnable || pTS == NULL ||
 	    bToOtherSTA)
 		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
 	else
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index e0d79daca24a..8add17752eed 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -297,7 +297,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			netdev_info(ieee->dev, "%s: can't get TS\n", __func__);
 			return;
 		}
-		if (pTxTs->TxAdmittedBARecord.bValid == false) {
+		if (!pTxTs->TxAdmittedBARecord.bValid) {
 			if (ieee->wpa_ie_len && (ieee->pairwise_key_type ==
 			    KEY_TYPE_NA)) {
 				;
@@ -307,7 +307,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 				TsStartAddBaProcess(ieee, pTxTs);
 			}
 			goto FORCED_AGG_SETTING;
-		} else if (pTxTs->bUsingBa == false) {
+		} else if (!pTxTs->bUsingBa) {
 			if (SN_LESS(pTxTs->TxAdmittedBARecord.BaStartSeqCtrl.field.SeqNum,
 			   (pTxTs->TxCurSeq+1)%4096))
 				pTxTs->bUsingBa = true;
@@ -365,9 +365,9 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 		return;
 	}
 
-	if ((pHTInfo->bCurBW40MHz == true) && pHTInfo->bCurShortGI40MHz)
+	if (pHTInfo->bCurBW40MHz && pHTInfo->bCurShortGI40MHz)
 		tcb_desc->bUseShortGI = true;
-	else if ((pHTInfo->bCurBW40MHz == false) && pHTInfo->bCurShortGI20MHz)
+	else if (!pHTInfo->bCurBW40MHz && pHTInfo->bCurShortGI20MHz)
 		tcb_desc->bUseShortGI = true;
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
