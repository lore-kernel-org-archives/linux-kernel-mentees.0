Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B81EB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jun 2023 13:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE2940969;
	Sun, 18 Jun 2023 13:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE2940969
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SnvACYEP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0d27ntmZhxQ; Sun, 18 Jun 2023 13:05:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9D0904025A;
	Sun, 18 Jun 2023 13:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D0904025A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C71BC007A;
	Sun, 18 Jun 2023 13:05:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFD23C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E8EF402F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E8EF402F6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SnvACYEP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHYnOUQSllmr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:05:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC88E400FB
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC88E400FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:05:50 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-666683eb028so1327848b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687093550; x=1689685550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Awvoaf5eSwNCHFdEadyIQRz9usUvjf5nZIyeulxK9fU=;
 b=SnvACYEPoPdUseu8hBkro1tuItr+rEyu2aa27tx7DHMkjC/9oXwfzg/R6cDOrSie6x
 wZls5Gu9hOtqWtK2cvK4qYeulAJL89Vt8sE3OLCd0UbDVBFmLFPMpoOgTwN0y5t1j+KQ
 /P2yC//YMPxlfdHa1uLhvT/MzGAeD3CR41tAPldRCM3+VZk3keLInzlOWDRqLM2IKOs2
 sdjtE1yvvCzW7n/LjnuIKl8kvYnHNMaMZwBtP5QXdZDXxwQkov8FlET2LPdtP3OmsHR8
 V3ZYRkDY2z+6z2bYkXjnmZGScXxXaTste1BnR/w7mx4LvP18oPS3iUgyfirgT9fWxYbk
 4NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093550; x=1689685550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Awvoaf5eSwNCHFdEadyIQRz9usUvjf5nZIyeulxK9fU=;
 b=KX4k65jMmMB6b7YzPrERqLMPgtp3U4HIACVAiaLH034qXkB7bfBax/kRS7YcVzfoPX
 lqmkeG5y2wSnfRPSjmyWLzCei/jnTKy5VNYcCgmLldPfUgVUpUtqFUd1i90LR0bEwmpM
 L2w8RA6nydt4z9uvepBuIWOh5wpWF94dcYsqHC8ieaIlWdsRghVGtAHau6nWedVzusaS
 p1TvQHfGnqfCOG262vSWKoNEY49keTnzTbKPAvL9Cf2SqucyWOKy4A+beHCXAWeKGoZ6
 4j3I3k9oRTe0Q3GgazX8QjGZZoQ86jeuKJ49HKUZyezXpJvUr5dwG9iAYD36tdYvWcjq
 GXnQ==
X-Gm-Message-State: AC+VfDz3JsI53RL8aKL4/k33K2UeBjWirTJDVjnDg1Ng+0kj3uP2IXHA
 bo2yid4WUDQwa8Nh740SZcA=
X-Google-Smtp-Source: ACHHUZ5TtP+nQJsdLRDy+mFSw0pnq3nU3bxvH9A/VP5IWjTe8oYDGsEuqaFI7iEVhYUDuR3sgm21wQ==
X-Received: by 2002:a05:6a20:8f06:b0:104:873:c3b5 with SMTP id
 b6-20020a056a208f0600b001040873c3b5mr5440001pzk.44.1687093550144; 
 Sun, 18 Jun 2023 06:05:50 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0063d2cd02d69sm16137148pfm.54.2023.06.18.06.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 06:05:49 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:35:43 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] staging: rtl8192e: Rename variable SetBWModeHandler
Message-ID: <6c929da448e04393d1259de820bbcb78f0e2a409.1687092111.git.yogi.kernel@gmail.com>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1687092111.git.yogi.kernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
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

Rename variable SetBWModeHandler to set_bw_mode_handler to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 699c4accf2db..68e921a3a0a8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -718,7 +718,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
 	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
-	priv->rtllib->SetBWModeHandler		= rtl92e_set_bw_mode;
+	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
 	priv->rtllib->start_send_beacons = rtl92e_start_beacon;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index fe30a291e64c..1fe504244437 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -835,11 +835,11 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
 			ieee->set_chan(ieee->dev,
 				       ieee->current_network.channel);
 
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20_40,
+		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20_40,
 				       ht_info->CurSTAExtChnlOffset);
 	} else {
 		ieee->set_chan(ieee->dev, ieee->current_network.channel);
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20,
+		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20,
 				       HT_EXTCHNL_OFFSET_NO_EXT);
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index f91355de17f7..e79510258447 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1704,9 +1704,9 @@ struct rtllib_device {
 
 	/* check whether Tx hw resource available */
 	short (*check_nic_enough_desc)(struct net_device *dev, int queue_index);
-	void (*SetBWModeHandler)(struct net_device *dev,
-				 enum ht_channel_width bandwidth,
-				 enum ht_extchnl_offset Offset);
+	void (*set_bw_mode_handler)(struct net_device *dev,
+				    enum ht_channel_width bandwidth,
+				    enum ht_extchnl_offset Offset);
 	bool (*GetNmodeSupportBySecCfg)(struct net_device *dev);
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d6d90e6ba2d3..6a7738a828e1 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -335,7 +335,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 		b40M = 1;
 		chan_offset = ieee->ht_info->CurSTAExtChnlOffset;
 		bandwidth = (enum ht_channel_width)ieee->ht_info->bCurBW40MHz;
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20,
+		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20,
 				       HT_EXTCHNL_OFFSET_NO_EXT);
 	}
 
@@ -348,7 +348,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 			ieee->set_chan(ieee->dev, chan - 2);
 		else
 			ieee->set_chan(ieee->dev, chan);
-		ieee->SetBWModeHandler(ieee->dev, bandwidth, chan_offset);
+		ieee->set_bw_mode_handler(ieee->dev, bandwidth, chan_offset);
 	} else {
 		ieee->set_chan(ieee->dev, chan);
 	}
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
