Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC561C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8244822240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8244822240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F00187103;
	Tue,  5 Jan 2021 13:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9UieU1lW4SZ; Tue,  5 Jan 2021 13:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD2B887108;
	Tue,  5 Jan 2021 13:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8513C0891;
	Tue,  5 Jan 2021 13:10:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73D34C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6228186861
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8EHDGGUjLdY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 810658686D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:16 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id h4so26357644qkk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWMInHwooADPJ2IZX0gau/tRDi3Ku0nsq1jMdbuuQKQ=;
 b=SdhR7VUy+XjFkEKy+ZENOGPqEwiWxcOsrKd97ZPeDuCgVYQkBIbyHfeE/J8irEsRr3
 +G20pgigqE3jjNzti2RfX0/sOrY5Zfu8PwkkinqvbdO8/cN0VncSKij7WFb3Za9dZ7L6
 MASA7Iy5Ep6k4dYJAXJNx4Rwl2Ey4E3BZNCmNL1aiEjgsZYdq8QQWgA05KyjoiM3Niif
 mOjRy9M1JX/IRdbCIW1HaaTA/XJ7bGsm8NrkZ/ADYWv8TMGPSCT7EO5hGlxjXCuxTaJr
 KYaqU72iaMPoNZwA4/gp5FIsqk2qGxBDp8HTURCD7DvLwUKM4V0vWjtBMAX3uxnofIqo
 Jazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWMInHwooADPJ2IZX0gau/tRDi3Ku0nsq1jMdbuuQKQ=;
 b=OToe8EWJ6iThBQ+O9Z1YCCMdCvDBgk7xRBRIZ0h9Bn4mfltyc4iwwh8mR595lV7fkm
 eoJiMy0gZQjVZNKc8wJFVAf7870zJu3iPmrtVGAI9VKY9CSPh4iTk7yzeAPjic7U8Sic
 ovf2ntXZV+wUGSex2PVLtJiM1JVd+xg9IC5kqiPN3bEkOqyx6sWkYEHIwgIl4FJhqXlk
 V1gDxgbRwovZ/r6yn9frcmURQQ8IhWN6qvaJ9OifqGiWqhLEYfi44mNIEfuX/5yoQ9eB
 oELnpNvZcVdKO4PIV0O9WSCDfVhFfGjvqIkCEJFb0g1zwkKQebYgZw8QvDDgWZLA0BWm
 VJ+A==
X-Gm-Message-State: AOAM532VMaELgdDp3WdIgDyoaK4NtPWRTHt1Bc3vktmLFq0v2JIdJ4fS
 6vyEJP1uvhNTpCDAvIYdxmdAy9sVBqS7UA==
X-Google-Smtp-Source: ABdhPJzNxGB1ZxuonbrbvEtm2nD0Hxg5iIdcjLEO90KcVsUW1uaNMzqeanW9pJWVLbrfHhYTLAHYQw==
X-Received: by 2002:a05:620a:13c2:: with SMTP id
 g2mr74182513qkl.174.1609852215608; 
 Tue, 05 Jan 2021 05:10:15 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:10:14 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:09:53 -0300
Message-Id: <20210105130956.1133222-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 1/4] media: vidtv: Add media
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
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 26 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  6 +++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fc64d0c8492a..4424f9585f86 100644
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
@@ -501,9 +503,28 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
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
 
+err_media_device_register:
+	media_device_cleanup(&dvb->mdev);
 err_dvb:
 	kfree(dvb);
 	return ret;
@@ -516,6 +537,11 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 
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
