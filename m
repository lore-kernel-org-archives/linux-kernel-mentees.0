Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9D3C2BB48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 11:42:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3CC238A0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 11:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED3CC238A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1CE87516;
	Thu, 17 Dec 2020 11:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaPH-tUJPvhG; Thu, 17 Dec 2020 11:42:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 838B9874F1;
	Thu, 17 Dec 2020 11:42:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF5CC088E;
	Thu, 17 Dec 2020 11:42:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96AB7C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A74C2E230
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CP9oBJIZT7LG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by silver.osuosl.org (Postfix) with ESMTPS id 7559E2E213
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:42:16 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id w6so18893898pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 03:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iwQofkBQgw3cgjabXt5hlRwi6VP4h40UXirWvwqnPHo=;
 b=BDiS5DiTgIjGS1g3mPNIeyCNxm/HfEftIQB79tO0WJ95wfDH9LtEHbzFPk6YnWlysV
 1RIYnhTG6k4e+QEwqu2HywpkOKCxIJCcq96hslKrqx2vG8u1VwGJd56HFVNfVVgBW/dc
 QjmS5NpRc7v40TOnk9xpIDEO5bcNn1vOwKQ6YUfxAuufqjEBwqRaL9s/DtmbBVG93gRC
 jz0r/3odyFJZcmhIoUAFrDlBczenl+Qi/7Mx9F2eSu/KjxlaLMpevkwh0BdmQnhPwjnc
 WzBhYWHHQyzXgfvcuacLa03XTe/1yeGRZXf9MV2hPwhnnAE4jQ4RRvRJ6gIylnEn/Wke
 9a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iwQofkBQgw3cgjabXt5hlRwi6VP4h40UXirWvwqnPHo=;
 b=tMN6mmAiDUslykWfyAp8HfEnS7dR9hFqZkhq8Jj5rsyipMvu1ai4upMSStW69WmfQz
 0AcfcNoWucXiRvdGsOs5HOdx4tLOTHKWbIJq8SM8FLsCHk7qr0K8Qc6/TiXgYlqiTLF2
 ifdggr1HiiCtG0crt5lTr11qJVx9e4EjqNo0O7//Dn+5tEJii8EfZBl/NuPnn9e+GEhh
 AV4C+XrJCb0YP7CziBrwVB9wbgxBeowmA849ZyFrkDrng4YRoXUvCoOYUfYh8ETUrA51
 16TO5QNGhq8ZB18YO/4hqneuVK3qDJWycP464X1/MWk0hA2unCKevwJnsODT6bP0D6kB
 vmzw==
X-Gm-Message-State: AOAM530wWfqs3ErA28qASrDexgnrknxwmw0PPUsJ+YEe9Yb4qy47TTYl
 UlgtH23JRkgSe569i6G/X4s=
X-Google-Smtp-Source: ABdhPJy3ZyRwfTZtC3knrpc5fQngME5J9+pTs4eTHBYcLtQuGXaGmN4wxsRa4KFYbLkIbwlBOXYLXQ==
X-Received: by 2002:a63:1626:: with SMTP id w38mr6072860pgl.278.1608205335820; 
 Thu, 17 Dec 2020 03:42:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:403:493:5d38:be:6298:62ae])
 by smtp.googlemail.com with ESMTPSA id j12sm5208765pjd.8.2020.12.17.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 03:42:15 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu, 17 Dec 2020 17:12:04 +0530
Message-Id: <20201217114204.12029-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devel@driverdev.osuosl.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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
- the changes made are compile tested
- the patch applies perfectly over next-20201204

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
