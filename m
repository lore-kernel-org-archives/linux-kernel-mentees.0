Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DCEC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554FF610E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554FF610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9C240001;
	Tue, 18 May 2021 04:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBtlEzPTRinE; Tue, 18 May 2021 04:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 394EF4039E;
	Tue, 18 May 2021 04:43:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22409C000D;
	Tue, 18 May 2021 04:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31F4FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1439C60671
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeScxs7-PDu6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71B6960659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:19 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id v13so4384392ple.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
 b=EWNm3sT8VONYUaxKQdVSbDHgSV57aFBf9ShB/WWGFlLAnrKd1TBZIgYlyHA0f9Mun4
 xZvYqpOXaR90R1vWLu+XvpUliqLcVYh2s5U4Ks3P1Npzm1d9lt9BMXZB+zJNJBZNOaG0
 YrKuv9iceFrTF3ZvqMu/5LQq3zAR+Wm2hnJ82zXsVcXsqBWHjQHf0aJIprhmk4mDExgl
 qOmLL/kzFCs07AbE1vHvAGEMiZ+0L2JtYs1v/6nBN5FDS0wagsUhg2GbUNY+5RyIXYms
 5OtRi5PSfKYo7OeZcGfkSODqK+Sg6OJsZm50FZoDOH5665q7ek9gHasYxdnyMee08a3x
 8jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
 b=YEBqfMYVIHK7w0kej107xc2K3otKLxb+EpnsTaFaD9d1VjvQVo364zfGz++PbDd80L
 wWGlML9cv22DxN3rMwIDSppmrSc4ANvqccb2ARpUU17C24YlBxgTYCAM302YGkFsqcfc
 izM/t0LJ9Uaz97GwkS2EvjP8tZFvoL9C8f985H+EMdpnGQkJzajV6URKEIrxcpYwDlfP
 9WS7g0GiiLh1/iwHa8VKgF4fkzjY9MJeuleQ/f37oKxKIu7dnoXTiZi0DQpFl948zayV
 boyOEEcR2Tlzs3I7iwMZzPlPBZLN0RY1zTcILVKtcD3CWCEuVG1N8VyYbKeGhVH3nz6O
 3K5A==
X-Gm-Message-State: AOAM531VTRzvfmqJs/qIZr0lG4WhbhrW4fuQoMi0cWKPuWZpx1OSyZo3
 ZuhbSg6IelQgwF52SJzfVEw=
X-Google-Smtp-Source: ABdhPJwdaTjhcVBqBnXjCbwU90yrrcSGf3XVzEEaZs7y4abhvIoHuCiTUAaI4EuKnLVtxji5xI3w0w==
X-Received: by 2002:a17:90a:ac12:: with SMTP id
 o18mr2992507pjq.65.1621312998910; 
 Mon, 17 May 2021 21:43:18 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
 by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:43:18 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH v2 2/7] Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:14 -0400
Message-Id: <20210518044119.2960494-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
References: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
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

This commit fixes the following checkpatch.pl errors:

WARNING: please, no space before tabs
+^I/* ^IRx Aggregation related setting */$

WARNING: please, no space before tabs
+^Iu8 ^IH2C_Parameter[1] = {0};$

WARNING: please, no space before tabs
+^Iu8 ^IH2C_Parameter[6] = {0};$

WARNING: please, no space before tabs
+^I/* u32 ^I^IfwVer = 0; */$

WARNING: please, no space before tabs
+/* ^ISoftware Coex Mechanism start */$

WARNING: please, no space before tabs
+/* ^INon-Software Coex Mechanism start */$

WARNING: please, no space before tabs
+^I/* ^IBIT0: "0" for no antenna inverse; "1" for antenna inverse */$

WARNING: please, no space before tabs
+^I/* ^IBIT1: "0" for internal switch; "1" for external switch */$

WARNING: please, no space before tabs
+^I/* ^IBIT2: "0" for one antenna; "1" for two antenna */$

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 85bf45cabecd..49f37aa16cc4 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -231,7 +231,7 @@ static void halbtc8723b1ant_LimitedRx(
 	u8 rxAggSize = aggBufSize;
 
 	/*  */
-	/* 	Rx Aggregation related setting */
+	/*	Rx Aggregation related setting */
 	/*  */
 	pBtCoexist->fBtcSet(
 		pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
@@ -250,7 +250,7 @@ static void halbtc8723b1ant_LimitedRx(
 
 static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8 H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -606,7 +606,7 @@ static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8 H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -1038,7 +1038,7 @@ static void halbtc8723b1ant_PsTdma(
 	u8 rssiAdjustVal = 0;
 	u8 psTdmaByte4Val = 0x50, psTdmaByte0Val = 0x51, psTdmaByte3Val =  0x10;
 	s8 nWiFiDurationAdjust = 0x0;
-	/* u32 		fwVer = 0; */
+	/* u32 fwVer = 0; */
 
 	pCoexDm->bCurPsTdmaOn = bTurnOn;
 	pCoexDm->curPsTdma = type;
@@ -1575,13 +1575,13 @@ static void halbtc8723b1ant_PowerSaveState(
 
 /*  */
 /*  */
-/* 	Software Coex Mechanism start */
+/*	Software Coex Mechanism start */
 /*  */
 /*  */
 
 /*  */
 /*  */
-/* 	Non-Software Coex Mechanism start */
+/*	Non-Software Coex Mechanism start */
 /*  */
 /*  */
 static void halbtc8723b1ant_ActionWifiMultiPort(struct btc_coexist *pBtCoexist)
@@ -2166,9 +2166,9 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
-	/* 	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
-	/* 	BIT1: "0" for internal switch; "1" for external switch */
-	/* 	BIT2: "0" for one antenna; "1" for two antenna */
+	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
+	/*	BIT1: "0" for internal switch; "1" for external switch */
+	/*	BIT2: "0" for one antenna; "1" for two antenna */
 	/*  NOTE: here default all internal switch and 1-antenna ==> BIT1 = 0 and BIT2 = 0 */
 	if (pBtCoexist->chipInterface == BTC_INTF_USB) {
 		/*  fixed at S0 for USB interface */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
