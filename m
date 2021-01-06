Return-Path: <SRS0=nWhl=GJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98292C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F5522D6E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F5522D6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7369322D22;
	Wed,  6 Jan 2021 03:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7+thil28cW7; Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 220FF2049F;
	Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EC6CC088B;
	Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00BBAC088B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E36BE86D73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiBCDCvLm5Lh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 34CA58621D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:00 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z3so1272085qtw.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 19:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nietjLUQJU/zJ/brz+Xm6cxAQwETU/f3MDRbRdqivaY=;
 b=FgZe9rJ0EbdtbrW6IfSOoZjsTSRBbFO17agIWlrEioMAK8j9pqrasM6XTg5KTYwDun
 rZetIXS91Zd2WszjxWNrfi2aAL2AvdZDTjpXBPfCEnS/Z4lywjFCp/rCkcHDJJPHs3/0
 kzU7/4G40xhcX85gNb169iKbeDBxIcir6+QonIe9TU0yHkAicZUcPwkFJCokQ4Fz9gpJ
 f5nBrvxvjeEBotjBwdaukw/YFU75D56ajb77Ai7gVWxgGOz5G3b68nYiX7T+16Sm8xar
 XlVCaCcXFpYm77afvq4QaIMrh+q5INKGRosnsnU6o9+gWY6ePx2tb0yraVNoVBqfqnfg
 NTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nietjLUQJU/zJ/brz+Xm6cxAQwETU/f3MDRbRdqivaY=;
 b=ulqzzUpF8EU6t7YT2tneUsI7JLYCTmQfCtESPb+OdlLunwwr93+k9avGbFx5tlVJAb
 yiVl5Xw1qlV3+cnQG+JAejIHiehiQfjbCe25v57NT+Agfzq2kmS0San13dJF7kBYhP/l
 hu6F2QQ7wx3yGHze459vi7eNiHP/wWyzVgZIzreQlIlT4dTVOpsZyyBHL6eeoQAxVGXR
 4F+/i3hlYpfrBWkESmJdfJsWajO0ud8VLRIFH2Gx38tDhp/UW1W6JYLZkOtvIDEtnrKC
 nG/MJjc04U1sqlbcuege3QDgVLdRmsHExNISRZHYG4OuRA6WjMDXg4HB8OlaSU4g2J0s
 dDqQ==
X-Gm-Message-State: AOAM533aYnVKIDWkFztDE0xvdrFgwu2p6NjaqUtvv/O9Y7gGTtUfVSKr
 d1yT5Lr2WBpVUGLAPC0LZXk=
X-Google-Smtp-Source: ABdhPJwgB/I/Do35yimDpUpsv9P5HlI9YjYF1LUBSCekxSR7anI6XhdM6KiKkEAEYOBaDzuIXrIV8g==
X-Received: by 2002:a05:622a:303:: with SMTP id
 q3mr2464654qtw.24.1609902299187; 
 Tue, 05 Jan 2021 19:04:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 19:04:58 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Wed,  6 Jan 2021 00:04:46 -0300
Message-Id: <20210106030449.3223172-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/4] media: vidtv: Add media
	controller support
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add media controller support when CONFIG_MEDIA_CONTROLLER_DVB is set
so that, in the future, a test sequence in v4l-utils can be written
without having to know which /dev/fooX device should be used.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 28 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  6 ++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fc64d0c8492a..a2fa9b58174d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -17,6 +17,8 @@
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include <media/dvbdev.h>
+#include <media/media-device.h>
 
 #include "vidtv_bridge.h"
 #include "vidtv_common.h"
@@ -501,9 +503,30 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dvb);
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	dvb->mdev.dev = &pdev->dev;
+
+	strscpy(dvb->mdev.model, "vidtv", sizeof(dvb->mdev.model));
+	strscpy(dvb->mdev.bus_info, "platform:vidtv", sizeof(dvb->mdev.bus_info));
+
+	media_device_init(&dvb->mdev);
+	ret = media_device_register(&dvb->mdev);
+	if (ret) {
+		dev_err(dvb->mdev.dev,
+			"media device register failed (err=%d)\n", ret);
+		goto err_media_device_register;
+	}
+
+	dvb_register_media_controller(&dvb->adapter, &dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
+
 	dev_info(&pdev->dev, "Successfully initialized vidtv!\n");
 	return ret;
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+err_media_device_register:
+	media_device_cleanup(&dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
 err_dvb:
 	kfree(dvb);
 	return ret;
@@ -516,6 +539,11 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 
 	dvb = platform_get_drvdata(pdev);
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	media_device_unregister(&dvb->mdev);
+	media_device_cleanup(&dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
+
 	mutex_destroy(&dvb->feed_lock);
 
 	for (i = 0; i < NUM_FE; ++i) {
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index 2528adaee27d..d42899a31295 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -24,6 +24,7 @@
 #include <media/dmxdev.h>
 #include <media/dvb_demux.h>
 #include <media/dvb_frontend.h>
+#include <media/media-device.h>
 
 #include "vidtv_mux.h"
 
@@ -42,6 +43,7 @@
  * @feed_lock: Protects access to the start/stop stream logic/data.
  * @streaming: Whether we are streaming now.
  * @mux: The abstraction responsible for delivering MPEG TS packets to the bridge.
+ * @mdev: The media_device struct for media controller support.
  */
 struct vidtv_dvb {
 	struct platform_device *pdev;
@@ -60,6 +62,10 @@ struct vidtv_dvb {
 	bool streaming;
 
 	struct vidtv_mux *mux;
+
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	struct media_device mdev;
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
 };
 
 #endif // VIDTV_BRIDG_H
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
