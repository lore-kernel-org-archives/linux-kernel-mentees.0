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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1963C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD4F610E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD4F610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427E3606DC;
	Tue, 18 May 2021 04:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMA-ZaRLbPGA; Tue, 18 May 2021 04:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E1960659;
	Tue, 18 May 2021 04:43:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5106FC000D;
	Tue, 18 May 2021 04:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52928C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33DB360671
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1RIUXhngw45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8927260659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d78so5641701pfd.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 21:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEpsBQ7rbIhP4Lk4USk29pB1/Jh9hlfSvj6sx/s54ew=;
 b=T5zUbW45c6BVkoMmsswh42owtMM7k4zeAhTXGTzGofmwzPkrX1D9f3mlBatE6TvNw5
 8guiOoZLVX/eck67OiintMjzQl52WapyEpeigJOpWfLAPjaJsecsXO3XLl3iVsOyiW/1
 4bmMeyRFTlF9+DncG2gR5Z3bWtRqW6kMUa7DynH/NqLSxZf/2cx2b8lFmw1dkHYAt65n
 A0gDpdIxytqia72eFA1470yRAyhEsmOrOcRKwkiN86UXQDP0RtTgCJAh1cvpKZXaGfdZ
 kXkCTyilERxU3gYYgNBT4Pb1Fe/BCCRbdAX85RTPwVa4V2YtZPtcAwymVMAHOv2LMMfA
 v2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEpsBQ7rbIhP4Lk4USk29pB1/Jh9hlfSvj6sx/s54ew=;
 b=j/lqxURG4DgumwRixAGwF9pCl5LYPWYjMGWSj3kWNVuH87Xu9Ia7ZkfIZmyjtUlLsE
 nAwNUsLqeUZTfulIGCJAoRbJbKPFVP2G5/Yh1Q9XtUXnbjk9uRkKMa+TbM5rgGUwGcRd
 UIDKHFBfD3PPcSh/0bAM4R11P1EetLmTGiX1GqaItgjBK0M4dZzHo3ZCsSpUHYu+YgR7
 MotnhZH+E4nhNTAbLMifsqbW+0xGpOjiT4gGKJRKgXTyurdeUi34wOLkl2m0MTFV3qf/
 a0WYAhAYV7ldh1Yf+6eLItxun9ANynHDQhHT2R8Je5cAUoevxEuN/Z+V/FLxj4MboQqZ
 QcXw==
X-Gm-Message-State: AOAM5304ZL08BJKnQHw8AKzZadfgI7ZATDVeqYDKhwvav5wq5p1kJMFF
 IONl2OQNer7ImTtOWXN9wu4=
X-Google-Smtp-Source: ABdhPJxeYGrQzUynRjf15rgfUfkpAWLJTpnimfMRZbXDVXjcQcZztueFXFu8Xu9guAJsxnixZmzu2Q==
X-Received: by 2002:a63:f717:: with SMTP id x23mr3133606pgh.141.1621313019016; 
 Mon, 17 May 2021 21:43:39 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
 by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:43:38 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH v2 3/7] Staging: rtl8723bs: fix indentation in
 HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:15 -0400
Message-Id: <20210518044119.2960494-4-desmondcheongzx@gmail.com>
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

WARNING: suspect code indent for conditional statements (32, 33)
+				if (nCCKLockCounter < 5)
+				 nCCKLockCounter++;

WARNING: suspect code indent for conditional statements (32, 33)
+				if (nCCKLockCounter > 0)
+				 nCCKLockCounter--;

WARNING: suspect code indent for conditional statements (24, 26)
+			if (nCCKLockCounter > 0)
+			  nCCKLockCounter--;

WARNING: suspect code indent for conditional statements (16, 17)
+		if (nCCKLockCounter >= 5)
+		 pCoexSta->bCCKLock = true;

WARNING: suspect code indent for conditional statements (16, 17)
+		else
+		 pCoexSta->bCCKLock = false;

WARNING: suspect code indent for conditional statements (16, 17)
+		if (nCCKLockCounter == 0)
+		 pCoexSta->bCCKLock = false;

WARNING: suspect code indent for conditional statements (16, 17)
+		else
+		 pCoexSta->bCCKLock = true;

WARNING: suspect code indent for conditional statements (16, 25)
+		if (bScan || bLink || bRoam) {
+			 if (bScan)

WARNING: Statements should start on a tabstop
+			 if (bScan)

WARNING: Statements should start on a tabstop
+			 else

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 49f37aa16cc4..63d0eec572ec 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -361,15 +361,15 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 				)
 			) {
 				if (nCCKLockCounter < 5)
-				 nCCKLockCounter++;
+					nCCKLockCounter++;
 			} else {
 				if (nCCKLockCounter > 0)
-				 nCCKLockCounter--;
+					nCCKLockCounter--;
 			}
 
 		} else {
 			if (nCCKLockCounter > 0)
-			  nCCKLockCounter--;
+				nCCKLockCounter--;
 		}
 	} else {
 		if (nCCKLockCounter > 0)
@@ -379,14 +379,14 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 	if (!pCoexSta->bPreCCKLock) {
 
 		if (nCCKLockCounter >= 5)
-		 pCoexSta->bCCKLock = true;
+			pCoexSta->bCCKLock = true;
 		else
-		 pCoexSta->bCCKLock = false;
+			pCoexSta->bCCKLock = false;
 	} else {
 		if (nCCKLockCounter == 0)
-		 pCoexSta->bCCKLock = false;
+			pCoexSta->bCCKLock = false;
 		else
-		 pCoexSta->bCCKLock = true;
+			pCoexSta->bCCKLock = true;
 	}
 
 	pCoexSta->bPreCCKLock =  pCoexSta->bCCKLock;
@@ -2084,9 +2084,9 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
 
 		if (bScan || bLink || bRoam) {
-			 if (bScan)
+			if (bScan)
 				halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
-			 else
+			else
 				halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
 		} else
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
