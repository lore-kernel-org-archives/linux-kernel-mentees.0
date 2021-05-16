Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64FFC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A246100A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A246100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5909B401B5;
	Sun, 16 May 2021 12:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G57DX8MDxzLN; Sun, 16 May 2021 12:30:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0590400CF;
	Sun, 16 May 2021 12:30:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE186C000E;
	Sun, 16 May 2021 12:30:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81989C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F112403F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2rr-_DYUdp9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9E0E403DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:56 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso4106960pjp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HKwu0lqBG+B5BRwBPFuYvjIJcXhBUQclaujuOz/bG0M=;
 b=QmasZ14XfdzvMYWcasO60hKaqeyeiVBsiACpOxRit1GYPJIdhE9ArDa7xY8lzIY2uX
 HSzEo7Y5skqVaNofcUBo5JK0bN2UfeABC6uKjICtXtrSzvopOPp1or+38x+ICSECwn5J
 1+LJlQQB8OrhAmuc0FIU3nkcebKH6/DsbrNq09tCdGWsA/mds4lRBHiS/F/ipPCWCyXl
 RogHAYzz7xyrtVw1kmI9NUEGvoFPV2oqo7oAtah9DS1eJhU6F9a2JRi7Zr6Vz2Uv9HNl
 S8IfUhsNSF7uLMbAzVqlWmRci4aU3kzmFUd2zrkJNIUZH/g4BQ9DEWPbGnXaqyUQY1Ns
 FDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKwu0lqBG+B5BRwBPFuYvjIJcXhBUQclaujuOz/bG0M=;
 b=sV+DqcA+oqL90mjOw3SW60pVVqi9mCr3k0MqBedhILII0PXhkkfjCfN+W4aEmp+AP7
 xFrsCWC1NVqy6Y2AFqWmF0zi25YgXKz4eW+hR4tmQhfaj5yKj682YvJbWpVuk6jCmzLC
 hQ48COgbWAQxeq0/1BhAuS9cmU9ouPEpQ2kQK622UU4nqYHs7r9bzYAPpmPo5GjVn869
 J4qo4XKzol3iQIv1q1POvpcO3XmcSSLWKN4Cx/Jf0phWuSF2Dadup148WeIT1l08Zn7l
 6BjmtUtnCZ12r01ef19x+FUlm80NvoPav+uK8E9vxVdxu6xcOKXCGOENrooczoJPTitl
 cu3Q==
X-Gm-Message-State: AOAM530BHsY+Js3MpyjU2gQmwXzrFfIkO1RFctDqoI0SNRfAx5RUIAhV
 mDBIcZZEiJN+jIUATUCidHc=
X-Google-Smtp-Source: ABdhPJxK6N4USTkUKce3L4cSlXdkV6ibMZq10OE7RwbMYByISHWN1y2/ezXMxw/RMhQlCqVMJlwSoA==
X-Received: by 2002:a17:90b:896:: with SMTP id bj22mr896005pjb.1.1621168256080; 
 Sun, 16 May 2021 05:30:56 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:30:55 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 4/7] Staging: rtl8723bs: fix comparison formatting in
 HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:24 -0400
Message-Id: <20210516122927.1132356-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This commit fixes the following checkpatch.pl warnings:

WARNING: Comparisons should place the constant on the right side of the test
+		BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE != pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN == wifiStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN == wifiStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SPECIAL_PKT == wifiStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		if (BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE == wifiStatus) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+	if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus &&

WARNING: Comparisons should place the constant on the right side of the test
+		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {

WARNING: Comparisons should place the constant on the right side of the test
+			(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+			(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {

WARNING: Comparisons should place the constant on the right side of the test
+			(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+			(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		((bWifiUnderBMode) ? "11b" : ((BTC_WIFI_BW_LEGACY == wifiBw) ? "11bg" : (((BTC_WIFI_BW_HT40 == wifiBw) ? "HT40" : "HT20")))),

WARNING: Comparisons should place the constant on the right side of the test
+		((!bWifiBusy) ? "idle" : ((BTC_WIFI_TRAFFIC_TX == wifiTrafficDir) ? "uplink" : "downlink")),

WARNING: Comparisons should place the constant on the right side of the test
+		((pBtCoexist->btInfo.bBtDisabled) ? ("disabled") : ((pCoexSta->bC2hBtInquiryPage) ? ("inquiry/page scan") : ((BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus) ? "non-connected idle" :

WARNING: Comparisons should place the constant on the right side of the test
+		((BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus) ? "connected-idle" : "busy")))),

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_IPS_ENTER == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	} else if (BTC_IPS_LEAVE == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_LPS_ENABLE == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	} else if (BTC_LPS_DISABLE == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_SCAN_START == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_SCAN_START == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	} else if (BTC_SCAN_FINISH == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_ASSOCIATE_START == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_ASSOCIATE_START == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	} else if (BTC_ASSOCIATE_FINISH == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_MEDIA_CONNECT == type) {

WARNING: Comparisons should place the constant on the right side of the test
+	if ((BTC_MEDIA_CONNECT == type) && (wifiCentralChnl <= 14)) {

WARNING: Comparisons should place the constant on the right side of the test
+		if (BTC_WIFI_BW_HT40 == wifiBw)

WARNING: Comparisons should place the constant on the right side of the test
+		BTC_PACKET_DHCP == type ||

WARNING: Comparisons should place the constant on the right side of the test
+		BTC_PACKET_EAPOL == type ||

WARNING: Comparisons should place the constant on the right side of the test
+		BTC_PACKET_ARP == type

WARNING: Comparisons should place the constant on the right side of the test
+		if (BTC_PACKET_ARP == type) {

WARNING: Comparisons should place the constant on the right side of the test
+		BTC_PACKET_DHCP == type ||

WARNING: Comparisons should place the constant on the right side of the test
+		BTC_PACKET_EAPOL == type ||

WARNING: Comparisons should place the constant on the right side of the test
+		((BTC_PACKET_ARP == type) && (pCoexSta->bWiFiIsHighPriTask))

WARNING: Comparisons should place the constant on the right side of the test
+	if (BT_INFO_SRC_8723B_1ANT_WIFI_FW != rspSource) {

WARNING: Comparisons should place the constant on the right side of the test
+		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY != pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||

WARNING: Comparisons should place the constant on the right side of the test
+		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)

WARNING: Comparisons should place the constant on the right side of the test
+	if (BTC_WIFI_PNP_SLEEP == pnpState) {

WARNING: Comparisons should place the constant on the right side of the test
+	} else if (BTC_WIFI_PNP_WAKE_UP == pnpState) {

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 112 +++++++++---------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 63d0eec572ec..97831d04959b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1317,35 +1317,35 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 
 	if (
 		!bWifiConnected &&
-		BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus
+		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE
 	) {
 		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
-		(BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
-		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
-		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
-		(BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE != pCoexDm->btStatus)
+		(pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
@@ -1367,9 +1367,9 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 	u8 retryCount = 0, btInfoExt;
 
 	if (
-		(BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN == wifiStatus) ||
-		(BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN == wifiStatus) ||
-		(BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SPECIAL_PKT == wifiStatus)
+		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN) ||
+		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN) ||
+		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SPECIAL_PKT)
 	) {
 		if (
 			pCoexDm->curPsTdma != 1 &&
@@ -1676,7 +1676,7 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 		pCoexDm->bAutoTdmaAdjust = false;
 		return;
 	} else if (pBtLinkInfo->bA2dpOnly) { /* A2DP */
-		if (BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE == wifiStatus) {
+		if (wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE) {
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
 			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
 			pCoexDm->bAutoTdmaAdjust = false;
@@ -1731,7 +1731,7 @@ static void halbtc8723b1ant_ActionWifiNotConnectedScan(
 	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {
+	if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 		if (pBtLinkInfo->bA2dpExist) {
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
 			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
@@ -1743,8 +1743,8 @@ static void halbtc8723b1ant_ActionWifiNotConnectedScan(
 			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
 		}
 	} else if (
-		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
 		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
 			pBtCoexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
@@ -1788,7 +1788,7 @@ static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *pBtCoexi
 	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {
+	if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 		if (pBtLinkInfo->bA2dpExist) {
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
 			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
@@ -1800,8 +1800,8 @@ static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *pBtCoexi
 			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
 		}
 	} else if (
-		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
 		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
 			pBtCoexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
@@ -1867,7 +1867,7 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 	/*  power save state */
 	if (
 		!bApEnable &&
-		BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus &&
+		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY &&
 		!pBtCoexist->btLinkInfo.bHidOnly
 	) {
 		if (pBtCoexist->btLinkInfo.bA2dpOnly) { /* A2DP */
@@ -1898,14 +1898,14 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 
 	/*  tdma and coex table */
 	if (!bWifiBusy) {
-		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {
+		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 				pBtCoexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE
 			);
 		} else if (
-			(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-			(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
 			halbtc8723b1ant_ActionBtScoHidOnlyBusy(pBtCoexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE);
@@ -1918,14 +1918,14 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 				halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
 		}
 	} else {
-		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) {
+		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 				pBtCoexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_BUSY
 			);
 		} else if (
-			(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-			(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
 			halbtc8723b1ant_ActionBtScoHidOnlyBusy(
 				pBtCoexist,
@@ -2010,9 +2010,9 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		return;
 
 	if (
-		(BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	){
 		bIncreaseScanDevNum = true;
 	}
@@ -2361,8 +2361,8 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = %s / %s/ %s/ AP =%d/ %s ", "Wifi status", \
 		(bWifiUnder5G ? "5G" : "2.4G"),
-		((bWifiUnderBMode) ? "11b" : ((BTC_WIFI_BW_LEGACY == wifiBw) ? "11bg" : (((BTC_WIFI_BW_HT40 == wifiBw) ? "HT40" : "HT20")))),
-		((!bWifiBusy) ? "idle" : ((BTC_WIFI_TRAFFIC_TX == wifiTrafficDir) ? "uplink" : "downlink")),
+		((bWifiUnderBMode) ? "11b" : ((wifiBw == BTC_WIFI_BW_LEGACY) ? "11bg" : (((wifiBw == BTC_WIFI_BW_HT40) ? "HT40" : "HT20")))),
+		((!bWifiBusy) ? "idle" : ((wifiTrafficDir == BTC_WIFI_TRAFFIC_TX) ? "uplink" : "downlink")),
 		pCoexSta->nScanAPNum,
 		(pCoexSta->bCCKLock) ? "Lock" : "noLock"
 	);
@@ -2389,8 +2389,8 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = [%s/ %d/ %d/ %d] ", "BT [status/ rssi/ retryCnt/ popCnt]", \
-		((pBtCoexist->btInfo.bBtDisabled) ? ("disabled") : ((pCoexSta->bC2hBtInquiryPage) ? ("inquiry/page scan") : ((BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus) ? "non-connected idle" :
-		((BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus) ? "connected-idle" : "busy")))),
+		((pBtCoexist->btInfo.bBtDisabled) ? ("disabled") : ((pCoexSta->bC2hBtInquiryPage) ? ("inquiry/page scan") : ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE) ? "non-connected idle" :
+																					((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE) ? "connected-idle" : "busy")))),
 		pCoexSta->btRssi, pCoexSta->btRetryCnt, pCoexSta->popEventCnt
 	);
 	CL_PRINTF(cliBuf);
@@ -2680,13 +2680,13 @@ void EXhalbtc8723b1ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl ||	pBtCoexist->bStopCoexDm)
 		return;
 
-	if (BTC_IPS_ENTER == type) {
+	if (type == BTC_IPS_ENTER) {
 		pCoexSta->bUnderIps = true;
 
 		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
 		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 0);
 		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, false, true);
-	} else if (BTC_IPS_LEAVE == type) {
+	} else if (type == BTC_IPS_LEAVE) {
 		pCoexSta->bUnderIps = false;
 
 		halbtc8723b1ant_InitHwConfig(pBtCoexist, false, false);
@@ -2700,9 +2700,9 @@ void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
 		return;
 
-	if (BTC_LPS_ENABLE == type)
+	if (type == BTC_LPS_ENABLE)
 		pCoexSta->bUnderLps = true;
-	else if (BTC_LPS_DISABLE == type)
+	else if (type == BTC_LPS_DISABLE)
 		pCoexSta->bUnderLps = false;
 }
 
@@ -2720,7 +2720,7 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
 		return;
 
-	if (BTC_SCAN_START == type) {
+	if (type == BTC_SCAN_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
 
 		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
@@ -2763,12 +2763,12 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 		return;
 	}
 
-	if (BTC_SCAN_START == type) {
+	if (type == BTC_SCAN_START) {
 		if (!bWifiConnected)	/*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
 		else	/*  wifi is connected */
 			halbtc8723b1ant_ActionWifiConnectedScan(pBtCoexist);
-	} else if (BTC_SCAN_FINISH == type) {
+	} else if (type == BTC_SCAN_FINISH) {
 		if (!bWifiConnected)	/*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
 		else
@@ -2791,7 +2791,7 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 	)
 		return;
 
-	if (BTC_ASSOCIATE_START == type) {
+	if (type == BTC_ASSOCIATE_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
 		 pCoexDm->nArpCnt = 0;
 	} else {
@@ -2817,9 +2817,9 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 		return;
 	}
 
-	if (BTC_ASSOCIATE_START == type) {
+	if (type == BTC_ASSOCIATE_START) {
 		halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
-	} else if (BTC_ASSOCIATE_FINISH == type) {
+	} else if (type == BTC_ASSOCIATE_FINISH) {
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 		if (!bWifiConnected) /*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
@@ -2842,7 +2842,7 @@ void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 	)
 		return;
 
-	if (BTC_MEDIA_CONNECT == type) {
+	if (type == BTC_MEDIA_CONNECT) {
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &bWifiUnderBMode);
 
 		/* Set CCK Tx/Rx high Pri except 11b mode */
@@ -2867,13 +2867,13 @@ void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 
 	/*  only 2.4G we need to inform bt the chnl mask */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
-	if ((BTC_MEDIA_CONNECT == type) && (wifiCentralChnl <= 14)) {
+	if ((type == BTC_MEDIA_CONNECT) && (wifiCentralChnl <= 14)) {
 		/* H2C_Parameter[0] = 0x1; */
 		H2C_Parameter[0] = 0x0;
 		H2C_Parameter[1] = wifiCentralChnl;
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
 
-		if (BTC_WIFI_BW_HT40 == wifiBw)
+		if (wifiBw == BTC_WIFI_BW_HT40)
 			H2C_Parameter[2] = 0x30;
 		else
 			H2C_Parameter[2] = 0x20;
@@ -2902,11 +2902,11 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 		return;
 
 	if (
-		BTC_PACKET_DHCP == type ||
-		BTC_PACKET_EAPOL == type ||
-		BTC_PACKET_ARP == type
+		type == BTC_PACKET_DHCP ||
+		type == BTC_PACKET_EAPOL ||
+		type == BTC_PACKET_ARP
 	) {
-		if (BTC_PACKET_ARP == type) {
+		if (type == BTC_PACKET_ARP) {
 			pCoexDm->nArpCnt++;
 
 			if (pCoexDm->nArpCnt >= 10) /*  if APR PKT > 10 after connect, do not go to ActionWifiConnectedSpecialPacket(pBtCoexist) */
@@ -2946,9 +2946,9 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 	}
 
 	if (
-		BTC_PACKET_DHCP == type ||
-		BTC_PACKET_EAPOL == type ||
-		((BTC_PACKET_ARP == type) && (pCoexSta->bWiFiIsHighPriTask))
+		type == BTC_PACKET_DHCP ||
+		type == BTC_PACKET_EAPOL ||
+		((type == BTC_PACKET_ARP) && (pCoexSta->bWiFiIsHighPriTask))
 	)
 		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(pBtCoexist);
 }
@@ -2975,7 +2975,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 			btInfo = tmpBuf[i];
 	}
 
-	if (BT_INFO_SRC_8723B_1ANT_WIFI_FW != rspSource) {
+	if (rspSource != BT_INFO_SRC_8723B_1ANT_WIFI_FW) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf;
 
 		if (pCoexSta->btRetryCnt >= 1)
@@ -3068,7 +3068,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 	) {
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_SCO_BUSY;
 	} else if (btInfo & BT_INFO_8723B_1ANT_B_ACL_BUSY) {
-		if (BT_8723B_1ANT_BT_STATUS_ACL_BUSY != pCoexDm->btStatus)
+		if (pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_ACL_BUSY)
 			pCoexDm->bAutoTdmaAdjust = false;
 
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_ACL_BUSY;
@@ -3077,9 +3077,9 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 	}
 
 	if (
-		(BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	)
 		bBtBusy = true;
 	else
@@ -3104,14 +3104,14 @@ void EXhalbtc8723b1ant_HaltNotify(struct btc_coexist *pBtCoexist)
 
 void EXhalbtc8723b1ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState)
 {
-	if (BTC_WIFI_PNP_SLEEP == pnpState) {
+	if (pnpState == BTC_WIFI_PNP_SLEEP) {
 		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
 		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
 		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, false, true);
 
 		pBtCoexist->bStopCoexDm = true;
-	} else if (BTC_WIFI_PNP_WAKE_UP == pnpState) {
+	} else if (pnpState == BTC_WIFI_PNP_WAKE_UP) {
 		pBtCoexist->bStopCoexDm = false;
 		halbtc8723b1ant_InitHwConfig(pBtCoexist, false, false);
 		halbtc8723b1ant_InitCoexDm(pBtCoexist);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
