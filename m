Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A963EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Jul 2023 12:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94F760A64;
	Sun,  2 Jul 2023 12:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94F760A64
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iyviPkCh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1ouh-u0DRN4; Sun,  2 Jul 2023 12:15:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF00F6079D;
	Sun,  2 Jul 2023 12:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF00F6079D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCBF1C0071;
	Sun,  2 Jul 2023 12:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD4EBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6FCE8149A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6FCE8149A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iyviPkCh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5fbupCylCYT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7E681468
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7E681468
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:25 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-262fa79e9b3so1665500a91.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Jul 2023 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688300125; x=1690892125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5cFvQbq7diNNN0bpBR8H7bBLc7lI4nnwBQk2weQsLw4=;
 b=iyviPkChWoFVJ5Q9yfgPuX+wGACeYXOZi7NWTe0N+dGDIm561PvInBcZ1S2r8lhNUE
 UBZn78lCPe2QaKRB4b5ECsX8ZvliF2d81bAGLpllw1YR3PYOfqzYn5z5SgYtP37k2aKL
 smrdUfQbiTf+/5t6mYCvMnY8iakmQcq45HNDeMhO/OlVbwjisv+cNo29UrKhJG1s9VTT
 I+l5d2aUOfzd+MWqi757W8t+pYO4KBfmO59/EnScP5r3EzV9B63jH8bt9rDefOnEXeam
 jijGpWPah4Z0+kxKRY3Pto1x3WOYgvda0CAqc9sYd4Y242zuiGrQ+VL4S0fnvvICQtKZ
 o1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688300125; x=1690892125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cFvQbq7diNNN0bpBR8H7bBLc7lI4nnwBQk2weQsLw4=;
 b=KUrHhF5ioj8j9bGdeqg2ZvQyrrUbqCcA/k2hrh4eCcoVESejdvYfDBZmvE+1Ny7KA4
 wW8W6Ac8Q0qEo9KJK6MU5bUYsDTRLPjof3Ysm11hGag5yohdgSPgHc4gf2M5dKFS8EEk
 PSf9+Zcmgclw4Ei0Uj8z4QCvlr3HLVyTq3o0FpeuBsC4DtZ743vSnBrMInaaYigMkgN/
 LMXY6OJ206quFSfXZlPFiIhwZ/OGUqFYHKEBO+DBQQo9k7KjItndI0RbMEDPgM7ViksB
 3C3H+9TcgF1W38GnGYuXH5rLH1WEmfC/WIgrAI9y5VCIgQV2rrARFlinC7v/p91cxmAk
 cL4g==
X-Gm-Message-State: ABy/qLbO1RI9VO8ksEbAhRxCWJ5tLhsVoFo9l4v0a0eHB+ipHYZVpjSy
 b+YBXhADMAKCMN5rO00uwTk=
X-Google-Smtp-Source: APBJJlE1MnWjQdQ9dJe/mq1H0nt1nQxEvX4PMyDPZvHXffaDRgCRgKiz8dmKw0vIUwfY4yP6Gsqbsw==
X-Received: by 2002:a17:90b:50d:b0:262:f798:b60d with SMTP id
 r13-20020a17090b050d00b00262f798b60dmr5959855pjz.6.1688300124661; 
 Sun, 02 Jul 2023 05:15:24 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a63f344000000b0052c22778e64sm13031137pgj.66.2023.07.02.05.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 05:15:24 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:45:19 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8192e: Rename variable currentRATR
Message-ID: <091a5abb231fb5c88d47f329ec3b5133b08d6b23.1688299890.git.yogi.kernel@gmail.com>
References: <cover.1688299890.git.yogi.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1688299890.git.yogi.kernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Rename variable currentRATR to current_ratr to avoid CamelCase
which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 37c275cac40b..14c78f740366 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -277,7 +277,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
-	u32 currentRATR, targetRATR = 0;
+	u32 current_ratr, targetRATR = 0;
 	u32 LowRSSIThreshForRA = 0, HighRSSIThreshForRA = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
@@ -363,8 +363,8 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 		if (priv->rtllib->GetHalfNmodeSupportByAPsHandler(dev))
 			targetRATR &=  0xf00fffff;
 
-		currentRATR = rtl92e_readl(dev, RATR0);
-		if (targetRATR !=  currentRATR) {
+		current_ratr = rtl92e_readl(dev, RATR0);
+		if (targetRATR !=  current_ratr) {
 			u32 ratr_value;
 
 			ratr_value = targetRATR;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
