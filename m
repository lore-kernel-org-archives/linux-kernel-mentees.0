Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA1EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Jul 2023 12:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468C441527;
	Sun,  2 Jul 2023 12:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468C441527
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cAi0Aiva
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GF3GQa-mELED; Sun,  2 Jul 2023 12:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 39EF84150F;
	Sun,  2 Jul 2023 12:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39EF84150F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18DD2C0071;
	Sun,  2 Jul 2023 12:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 840DEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D8D341503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8D341503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwtC1qryw_6P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74468408AD
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74468408AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:16:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-263036d4bc3so2529728a91.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Jul 2023 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688300176; x=1690892176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LI5xtyL2k2cBitbepn6US1F6e5Ej9j9z5n1WZ2zQtfs=;
 b=cAi0AivaoyBUmInw7KpCb/jsQAYZS+Rq+v2vjn8Jtq2wlacDU2vUHAwaSlPNyzDod4
 UTJWJy7s0Xa3OhUh5xMPWzhh27yf4/vp2lzAe6JJz5Q8+POegERnqiY1hd5jXN8UwV1i
 pUwapcc6ttM7NjnGdnIzxJQzZlKH13KBiK1+nh4/YEZ37jtPS8baOjBViZJ0Jud3bQ3V
 HZdMrSYkfhePqAAurgUQTa9HtJHBhULxOUSQnS/xfPh6Hdwg1xuCo+N1ao7XCq5Ucncm
 LcZR7JRR5cFbQY1XTqHX5UhosyhAMeFEWBTd2YF6fWZY40ZEjQyXR5SThR44aFi1QaQx
 0C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688300176; x=1690892176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LI5xtyL2k2cBitbepn6US1F6e5Ej9j9z5n1WZ2zQtfs=;
 b=KfANFe88kEeVa0vQCTcx6ctorLhcPmpDLtlBSJ5BZPWzea3rcXtG1J/HyIYYWE5qMq
 c42Q+dg9XWXs+feq+rNU79558700ljpXQnMGvry3cvo09qji5nMkmB4r87q2EdCzgUUx
 RxKiYet8z57DgSYwnEziiYDh/hHLCcvHkijvviXZpI3LOFd6j3/O2NYVkKkewauPh6IL
 PqlAEloPCqxfh+YepUkV+bM7BSVZDxnDJCsXGEDL2Z6MiLw+PVKrZsxHCSSVnu6AX8Jg
 FeoZzgpHQbUQIXRcZCSL0/KFAN7O72ZXdSKT4BtM8Xx46DTvi/Vjjp+X8+aR5+Vy9Jvb
 HgNQ==
X-Gm-Message-State: ABy/qLZWpMv1gXgCpS3dz2UTIaVPO+6rxTmzjB7+SAUx38Jbgr9YH/dj
 X64nqV6qCSv3TUPMXe6IouE=
X-Google-Smtp-Source: APBJJlHF4Wdd3nuQiVZBSb9dYApRmcLqlVqkm3nVD3k3QUQGvK3mgSNWcWdCX2B2hqCBuE/YtMC0RQ==
X-Received: by 2002:a17:902:e9d1:b0:1b5:361:cefe with SMTP id
 17-20020a170902e9d100b001b50361cefemr7811279plk.52.1688300175778; 
 Sun, 02 Jul 2023 05:16:15 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709027b8500b001ab2592ed33sm13580074pll.171.2023.07.02.05.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 05:16:15 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:46:10 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: Rename variable LowRSSIThreshForRA
Message-ID: <ebea3e75dc84a6d77750c0598ab12d04ad55c676.1688299890.git.yogi.kernel@gmail.com>
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

Rename variable LowRSSIThreshForRA to low_rssi_thresh_for_ra to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a535a63ce9f7..d266d2d047ca 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -278,7 +278,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
 	u32 current_ratr, target_ratr = 0;
-	u32 LowRSSIThreshForRA = 0, HighRSSIThreshForRA = 0;
+	u32 low_rssi_thresh_for_ra = 0, HighRSSIThreshForRA = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
 
@@ -320,15 +320,15 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 
 		if (pra->ratr_state == DM_RATR_STA_HIGH) {
 			HighRSSIThreshForRA = pra->high2low_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		} else if (pra->ratr_state == DM_RATR_STA_LOW) {
 			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low2high_rssi_thresh_for_ra40M) : (pra->low2high_rssi_thresh_for_ra20M);
 		} else {
 			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		}
 
@@ -337,7 +337,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 			pra->ratr_state = DM_RATR_STA_HIGH;
 			target_ratr = pra->upper_rssi_threshold_ratr;
 		} else if (priv->undecorated_smoothed_pwdb >=
-			   (long)LowRSSIThreshForRA) {
+			   (long)low_rssi_thresh_for_ra) {
 			pra->ratr_state = DM_RATR_STA_MIDDLE;
 			target_ratr = pra->middle_rssi_threshold_ratr;
 		} else {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
