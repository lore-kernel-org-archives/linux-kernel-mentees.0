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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B12DC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D436161185
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D436161185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD4283A64;
	Sun, 16 May 2021 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P07hjYcnffqH; Sun, 16 May 2021 12:30:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8042B81CA5;
	Sun, 16 May 2021 12:30:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D33C000E;
	Sun, 16 May 2021 12:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 717B0C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F96A403CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0r7nKFyFvZB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 960F2403B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:37 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t4so1720189plc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
 b=Itrqwyv9Q1NKvkvTocagH9e2hB520j0pJ1FyNmOBE0NzIZlB1W+of/x9pap6N07dOB
 bsxMulGPIeDKDXw3VajxKof6zyNoaqyijoQrL+lOn3PHogn3WrgiZ2OG8Cd6rHdrR8WG
 XLbVItMeN2ZPxOgqlekn4AfVJpbrOkZqWtcW/Ghn3NKTCQnbvMANHKnWuk77KLR2dWNO
 K551e43oRgygXTIUGeEWmSXUdxRGT7IsOY/w1n+Ps+Tp17XgDtfjEND96Lbgaq07NQIQ
 LIX4Kdkur0wQsBCA6kzQ2DoXKsZyk0XDf39FvK6VeiJde06bcqJIHFPuA6eqKDoolYEG
 iVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
 b=MWJXaFWcoBJA+3VHczhbYMRYNN6ReUMvpMhFaxgdo62njzuUmPMcKnOry3j5ZZxVb/
 3EkHJ4mNkaQ3y8LLRIMO+StmcXF9ZUVKN0BeYorx2sUFqTMpFx51d9kvIS0IkfXQaG0M
 tRpGstEV7Jr2spMaUsanXowoWt7kXc/rHB4fpRYfKFH8+vdO+slZrxQDVpNIN1jyLh35
 wDTOpnWhJ/QDxosThMAwUePn++nlhUYilMjyle8tpTqmbL3ritfGVYPq+S903p1niyQZ
 ZWbKAonl3x4AD2mGwueEbr/FcO5ajt4nqQFsYJnxA4NufN7gx+agE3ZlHpFl/ZzAX9fn
 DfDg==
X-Gm-Message-State: AOAM531qEC2XxDIM8a9l5wepvGTtKDVIoqWuJ/evk+MLfcVbrDiDMkWR
 NXivs2jNh7CcS6B2vIPYcP4=
X-Google-Smtp-Source: ABdhPJwfOir+XjFUxEPh6ep0IE4kU926wBpVZVC/DvuQ+YXcjnTrWiaVFLktDjSoNi73DalIhuQ9CA==
X-Received: by 2002:a17:90a:d909:: with SMTP id
 c9mr12647509pjv.190.1621168237068; 
 Sun, 16 May 2021 05:30:37 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:30:36 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 2/7] Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:22 -0400
Message-Id: <20210516122927.1132356-3-desmondcheongzx@gmail.com>
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
