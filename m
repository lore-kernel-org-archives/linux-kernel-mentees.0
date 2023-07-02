Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70346EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Jul 2023 12:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBDE60A80;
	Sun,  2 Jul 2023 12:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBDE60A80
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AlxV7Pr7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRUDzdGHVnWj; Sun,  2 Jul 2023 12:15:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11F7F6079D;
	Sun,  2 Jul 2023 12:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F7F6079D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E88C0071;
	Sun,  2 Jul 2023 12:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46399C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213AF60A64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213AF60A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61orRhLCndMt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9246079D
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D9246079D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:15:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b891142681so1632045ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Jul 2023 05:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688300152; x=1690892152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ahNrA+kvPkt2jIv1WX2dJh9T0CTy/Hn3rwyQ5h/Idfs=;
 b=AlxV7Pr7eN7wuspl+PZcT1VxCqiyN0Yg1pDvW0lZJqo3S5/r1vX75iVS1psMMjBH0i
 IV20fVRGlLjs5CwK+9KqPM3dm8rwfUUME08+qFYdCZBvDl91rwHsnMyEjHQPJqlEdAHl
 QOWC5IwpeA4O+bJRVdsF9xAG1oy7IfTYBmQC41SeaTaPgK/uK7D4kvgJPeFKTaeauqIa
 LUcB1t52g7xgeaMGCOvKegIu44Tvh4W+dz0HWsmUof7vG9a0CwxMrUjrViQkFkcDhWDZ
 F++XClhrCQBjH2arYd9xCnOV+hlsWwH5gJRVMqp/JidblIIbDfL8fOOFuaPbdn4tPisH
 X+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688300152; x=1690892152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahNrA+kvPkt2jIv1WX2dJh9T0CTy/Hn3rwyQ5h/Idfs=;
 b=MapLgzxNTfTYXZtJ3q2W0v0S7kNufrsjnjnWUzQOHfQPFIpn557zMGzDUjowQV/a2v
 GqSy4//MvECmiCdqga1T2uNk9r8UfC+RjbGwI2X/v1ag/LbGQHD1W8N78yZkdByFmnJR
 ECDDUxBfFtSySg6MoHd9ngc8rF8g2g3tOCUI4+x95Ns9w7+FwcXE5KyPnw8DssGK43OG
 1RTfFTmluXawMImo3sBFd0KbRg62t8wgh5Lq5mZ07fjW0ZaQIhle8l4Le9Q//qNpE4Lq
 KySFh8Ag00eVeQjrdUfoTMa1Hi7KG73SkKcxaeNPBhd3qjV5PmFsNSRLnJqENCj1gZpE
 FhKg==
X-Gm-Message-State: ABy/qLaDISSlvvSNTTE9BfN3CKj2wtilOkKEwXxl+EqN7iPvV9O9PwKA
 djNkWX/4Rp45IlpwQcio8+4=
X-Google-Smtp-Source: APBJJlFxh2k5PKZ1iRR4/jkn4HJLDiUzOwrsdyihhLzIkblKK+aP46PVZUCLePZ7fiUY8T8X6VHrWw==
X-Received: by 2002:a17:903:230f:b0:1b8:8679:ab9f with SMTP id
 d15-20020a170903230f00b001b88679ab9fmr2978629plh.49.1688300152521; 
 Sun, 02 Jul 2023 05:15:52 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902748a00b001a98f844e60sm7218474pll.263.2023.07.02.05.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 05:15:52 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:45:47 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8192e: Rename variable targetRATR
Message-ID: <ef60d870d643a3774363efdac798e059ea5b8f85.1688299890.git.yogi.kernel@gmail.com>
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

Rename variable targetRATR to target_ratr to avoid CamelCase
which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 14c78f740366..a535a63ce9f7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -277,7 +277,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
-	u32 current_ratr, targetRATR = 0;
+	u32 current_ratr, target_ratr = 0;
 	u32 LowRSSIThreshForRA = 0, HighRSSIThreshForRA = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
@@ -335,14 +335,14 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 		if (priv->undecorated_smoothed_pwdb >=
 		    (long)HighRSSIThreshForRA) {
 			pra->ratr_state = DM_RATR_STA_HIGH;
-			targetRATR = pra->upper_rssi_threshold_ratr;
+			target_ratr = pra->upper_rssi_threshold_ratr;
 		} else if (priv->undecorated_smoothed_pwdb >=
 			   (long)LowRSSIThreshForRA) {
 			pra->ratr_state = DM_RATR_STA_MIDDLE;
-			targetRATR = pra->middle_rssi_threshold_ratr;
+			target_ratr = pra->middle_rssi_threshold_ratr;
 		} else {
 			pra->ratr_state = DM_RATR_STA_LOW;
-			targetRATR = pra->low_rssi_threshold_ratr;
+			target_ratr = pra->low_rssi_threshold_ratr;
 		}
 
 		if (pra->ping_rssi_enable) {
@@ -352,7 +352,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 				     (long)pra->ping_rssi_thresh_for_ra) ||
 				    ping_rssi_state) {
 					pra->ratr_state = DM_RATR_STA_LOW;
-					targetRATR = pra->ping_rssi_ratr;
+					target_ratr = pra->ping_rssi_ratr;
 					ping_rssi_state = 1;
 				}
 			} else {
@@ -361,18 +361,18 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 		}
 
 		if (priv->rtllib->GetHalfNmodeSupportByAPsHandler(dev))
-			targetRATR &=  0xf00fffff;
+			target_ratr &=  0xf00fffff;
 
 		current_ratr = rtl92e_readl(dev, RATR0);
-		if (targetRATR !=  current_ratr) {
+		if (target_ratr !=  current_ratr) {
 			u32 ratr_value;
 
-			ratr_value = targetRATR;
+			ratr_value = target_ratr;
 			ratr_value &= ~(RATE_ALL_OFDM_2SS);
 			rtl92e_writel(dev, RATR0, ratr_value);
 			rtl92e_writeb(dev, UFWP, 1);
 
-			pra->last_ratr = targetRATR;
+			pra->last_ratr = target_ratr;
 		}
 
 	} else {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
