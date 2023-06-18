Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C23EB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jun 2023 13:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E73D881E71;
	Sun, 18 Jun 2023 13:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73D881E71
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lZexxq7P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NO3epjvy0Hnu; Sun, 18 Jun 2023 13:06:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CA956818C0;
	Sun, 18 Jun 2023 13:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA956818C0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA155C007A;
	Sun, 18 Jun 2023 13:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AC7CC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483846059F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483846059F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lZexxq7P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXgZk8jLq_wK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:06:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0EF60067
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF0EF60067
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:06:32 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b55643507dso5581055ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687093592; x=1689685592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GrnRiINtmKsRPpdoYY28cns2m1Iqy+OAFvN9buTT+SU=;
 b=lZexxq7P3XtuZPtJJ5JNGgBbfUyPOyFIcg0Cf1k4PZUWTiouPub2JaLA0sUnZcqg7y
 sy5cTPc8wRDhABm2qeP7wQoyi0q2O/BZ00wmncwqtaP9WQssMnaKjq2B7BNnAz65FZlh
 RIKRJwVBJJF37fYkkIYX99CbN0gm0IFO+oHkUOjKLprNovaxDt6jlgDinvY+2IXrHbnB
 JyuAmnC1ULxFXQ1qWSvx6rpRoeM41/DR8Q6fnD8Nhty+eBdBVXAgJy163iv1sdu+MNQe
 xzh9ruZlmDgiDQzy8g4Chp4nDMXrKUP83aje03f68VOk3J8wzM/aPqwowMPLmk9ArNt6
 h28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093592; x=1689685592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrnRiINtmKsRPpdoYY28cns2m1Iqy+OAFvN9buTT+SU=;
 b=Gh7BT6Qw1d8dhYfVRmhOeO2Pj5e8lQ7E8z2t9SherVOgRvGlZ7O2ITZjKe2YFsFpek
 C8QT2QGFauTMoA68JC7GzoctNw+JDMo0MALsWBC4UEarLiH8tR6QUKV1ufxw9Bxai1wp
 NioRlyog7b59yfPyjRIwxfYG/obfY9ObHvkFtgjsrhGHSY7Osg16DstH1Xzr0muQhwui
 GDYX59N3TkvW8f7JRo63LhMdKNC3SLftuZbCMjG6qf48Z81PZiENp1PNNAHvaifKTlG8
 2HozOT1z7t/BygYGI5QW+JkEG7nhBTy/ExGhDavBpHxt+ghoRYgiyy4SsBT+grxIEDgm
 e9vw==
X-Gm-Message-State: AC+VfDzz9oMsG2iDKq9+S3hOpZm/G0qCcHdNKGLlBYVTHXlX3+Q/iBbM
 K6/Op0K+vKnFoE94z3r3Kp7gaYEnGmQ=
X-Google-Smtp-Source: ACHHUZ7u0MlTI1QnE1/QfcX+1B04t7ijeC3d4SMCyrPu+0RQ8QpwZMt4KJuaa1PbrX26Fyi54isqOw==
X-Received: by 2002:a17:902:ee41:b0:1b3:de1d:1ce1 with SMTP id
 1-20020a170902ee4100b001b3de1d1ce1mr6859808plo.61.1687093592061; 
 Sun, 18 Jun 2023 06:06:32 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902ea0b00b001b23eb0b4bbsm18670943plg.147.2023.06.18.06.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 06:06:31 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:36:26 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] staging: rtl8192e: Rename variable LeisurePSLeave
Message-ID: <b45c35593a3b080814cc3fc882907dfc1d367d76.1687092111.git.yogi.kernel@gmail.com>
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

Rename variable LeisurePSLeave to leisure_ps_leave to avoid
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
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 68e921a3a0a8..b82d2b7aa26c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -717,7 +717,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
-	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
+	priv->rtllib->leisure_ps_leave		= rtl92e_leisure_ps_leave;
 	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e79510258447..0ee9b99b4c5e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1721,7 +1721,7 @@ struct rtllib_device {
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-	void (*LeisurePSLeave)(struct net_device *dev);
+	void (*leisure_ps_leave)(struct net_device *dev);
 
 	/* This must be the last item so that it points to the data
 	 * allocated beyond this structure by alloc_rtllib
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 46c77ed335ab..c00f72316a3d 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1200,7 +1200,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				ieee->LeisurePSLeave(ieee->dev);
+				ieee->leisure_ps_leave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 6a7738a828e1..d7df6f698c0c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -316,7 +316,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	ieee->LeisurePSLeave(ieee->dev);
+	ieee->leisure_ps_leave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
