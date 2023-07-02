Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F625EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Jul 2023 12:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2CB84151C;
	Sun,  2 Jul 2023 12:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2CB84151C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V1hzgS4/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kebSoKJbCu6f; Sun,  2 Jul 2023 12:16:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 61536414FA;
	Sun,  2 Jul 2023 12:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61536414FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48C78C0071;
	Sun,  2 Jul 2023 12:16:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFCA9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1726079D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1726079D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V1hzgS4/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRXhAE_u02xj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DE060792
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52DE060792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:51 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-54f75f85a17so1834860a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Jul 2023 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688300211; x=1690892211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Dfo7hdwwVcnKMMgv844ECc9CeiQ+h3KUJdDMwa/uJE=;
 b=V1hzgS4/XWWDCxQpuSOHCIQ+CVOJQjNF8gAU38/f6S2UUXXiozgcfZLiPK8GHvtsPs
 ksVjJc9vdWqGQjoCxM7nRGCotaLa/qiP/1GEflpj1iDj0Mn9R5U01GTD4acDea6N3zka
 Ir8xSk6NAg+hsDBK2zeo15Z+MfwCOt0FC3VXVcTGEmBx2Y+VD6o9FEOXEdhdxtLWwuQZ
 kx1CnZBbmCOMwSQ5hDKARD/lkGOYvixxfSVaTsCzEILyVmTg4zI3zzRLfNCQwU/4kuuI
 DGhHZyhRcYplupxTSQYUzP3DPlkQcsGi66K9eH4E+pye3qOn2XBB6Mj7VfeJ5wdOpIdw
 krqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688300211; x=1690892211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Dfo7hdwwVcnKMMgv844ECc9CeiQ+h3KUJdDMwa/uJE=;
 b=HaeNri7Jxf+5n+oulYFwDSdFMfX/9+RZ4F14o7tbu3bIlpyJKidQ+h83jJe69Xd1Et
 lQ+k/8cNjL/REn+G7CvGMvZlKelOSxXfwh1WViwE9Bz3rxGWkGe7MRp+MxWunGvI5xIk
 c25Rg8QtNp1BtFuOTS4arAiJR+MG0sG1CVbm9ZS0yGIPFA75Bf4pMndJgOUmFghorB7y
 LicDSb/byKz/OkSmU3Xpz01v0k2G/nFITDrYT+fF9YknmdGl5DiFKQ+eid+34RjLJYsj
 yQywZEgtDUC6Q+ALpLBB5b48JoKyT3nnDo4ndAczsHeaL5/uQ9fl5Rv3nkuZcIburbxf
 ml8g==
X-Gm-Message-State: ABy/qLbaTPtwXHEj6s3CvgB0FGu9TSsFY980qz3UAPqam/1s30Kjt65R
 accNVBxbwvuQRe5Cp0DuqGI=
X-Google-Smtp-Source: APBJJlEx8IhwL7Ls1PtCIMynqP9igB26GQ3djtNRsIIHDuGNj2mmL0QWtrk5BEVqt6EpR2zMT2TlEw==
X-Received: by 2002:a05:6a20:3257:b0:12c:1193:a563 with SMTP id
 hm23-20020a056a20325700b0012c1193a563mr5580459pzc.58.1688300210710; 
 Sun, 02 Jul 2023 05:16:50 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 t18-20020aa79392000000b0063d24fcc2b7sm6636965pfe.1.2023.07.02.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 05:16:50 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:46:45 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8192e: Rename variable HighRSSIThreshForRA
Message-ID: <e4a09d927eaa9c185afce3a58cd434326de735dc.1688299890.git.yogi.kernel@gmail.com>
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

Rename variable HighRSSIThreshForRA to high_rssi_thresh_for_ra to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index d266d2d047ca..dbf765d601b3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -278,7 +278,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
 	u32 current_ratr, target_ratr = 0;
-	u32 low_rssi_thresh_for_ra = 0, HighRSSIThreshForRA = 0;
+	u32 low_rssi_thresh_for_ra = 0, high_rssi_thresh_for_ra = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
 
@@ -319,21 +319,21 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 				((bshort_gi_enabled) ? BIT31 : 0);
 
 		if (pra->ratr_state == DM_RATR_STA_HIGH) {
-			HighRSSIThreshForRA = pra->high2low_rssi_thresh_for_ra;
+			high_rssi_thresh_for_ra = pra->high2low_rssi_thresh_for_ra;
 			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		} else if (pra->ratr_state == DM_RATR_STA_LOW) {
-			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
+			high_rssi_thresh_for_ra = pra->high_rssi_thresh_for_ra;
 			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low2high_rssi_thresh_for_ra40M) : (pra->low2high_rssi_thresh_for_ra20M);
 		} else {
-			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
+			high_rssi_thresh_for_ra = pra->high_rssi_thresh_for_ra;
 			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		}
 
 		if (priv->undecorated_smoothed_pwdb >=
-		    (long)HighRSSIThreshForRA) {
+		    (long)high_rssi_thresh_for_ra) {
 			pra->ratr_state = DM_RATR_STA_HIGH;
 			target_ratr = pra->upper_rssi_threshold_ratr;
 		} else if (priv->undecorated_smoothed_pwdb >=
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
