Return-Path: <SRS0=nWhl=GJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F34AC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E9422D6E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E9422D6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CFA1422D10;
	Wed,  6 Jan 2021 03:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kcQq4FGrCCW; Wed,  6 Jan 2021 03:05:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 95F1822D22;
	Wed,  6 Jan 2021 03:05:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E929C088B;
	Wed,  6 Jan 2021 03:05:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E17E5C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DB8D785321
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVxnI1Ma7FzD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C579B85308
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:05 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id 2so1265317qtt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 19:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKW/iSJjrbgSAXySgNzKmXZFqMqWpYYmhMcxC2gJPf4=;
 b=nZSO6iZbGxKJXcbAT25lwYlWrvKanic7Tx/yE8sO/QCCguQ8dgTkAl71IgfiMACxwM
 yjrWYxjxRE+GJZ8F5y3ByVdTMXihUE2Ai4vpDskSVE9KYWwVzzck62Yk/3lqsg9oLncr
 X+ndpgd5yGK8nkWs4gca+K+noqoVAMBonSU0ym6FHpp9E9+mQnbaTx/mKm+C/1dMCfnt
 kFMnwyW2Nh5gKTfmFU0KCsURA8D4TrKpbzrvd8+ku3ZQflAQl07cmVoU8w7wDcMUsPSI
 wPUJcHzbHCFECS1539ElqUk2yTVx08p+ba4Zz/ZSpmCFx4wCb0fdWOnmI7skrVLxzgdb
 pJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKW/iSJjrbgSAXySgNzKmXZFqMqWpYYmhMcxC2gJPf4=;
 b=GhcXO1HEUl2Kv0UJpgnAk0BInCy5xvcSIKlXJ0rH/r2gw+WB1NKJZC6uVvawoYze1j
 yxdWHC3L/xI6i5FyEwTpdcHfYYfP8QK65/GPcKAdyrsovoECa15SF2v23DpU43+GMHeO
 EUPdF6K6vMYhsWnjcB0kks/E8ItpjYhTWpxC4B+lsK7IwXRZ9w1OwxR+xCo5XtIg+IEc
 ZhcyyF+pNaR4ENBQv3jlI+LldMEHu0/Hv9XJJ63gfkxW6Atu40IShsZFH1XpYGaIuA1a
 1zJcrdVU6egZjZrccVAb/MXvKCTagMTuc1Nu+5XF0JmB8stKlkyKS6C0fs37lhEUUR07
 f+5g==
X-Gm-Message-State: AOAM530ieDuwyJ4b2Cro68WUCIbnX+exaYzo1EnGv27ek5MN/LSl6P1V
 9Vtouv+4Nu/gYQhxLinZLMI=
X-Google-Smtp-Source: ABdhPJxNJvoNg1gzhOenroDJ0dLzWeV8ux91mzHYWkvLQpKBJBPwu7y+jCoXYkxXw2XhxVPpUsZamg==
X-Received: by 2002:ac8:5cce:: with SMTP id s14mr2387647qta.135.1609902304761; 
 Tue, 05 Jan 2021 19:05:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 19:05:04 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Wed,  6 Jan 2021 00:04:48 -0300
Message-Id: <20210106030449.3223172-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/4] media: vidtv: use a simpler
	name in platform_{device|driver}
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

Change from "vidtv_bridge" to simply "vidtv" so that vidtv looks
more similar to the other media virtual drivers in /sys/bus/platform.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 4 ++--
 drivers/media/test-drivers/vidtv/vidtv_bridge.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 405e89f62b5a..9964d1331aff 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -564,13 +564,13 @@ static void vidtv_bridge_dev_release(struct device *dev)
 }
 
 static struct platform_device vidtv_bridge_dev = {
-	.name		= "vidtv_bridge",
+	.name		= VIDTV_PDEV_NAME,
 	.dev.release	= vidtv_bridge_dev_release,
 };
 
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
-		.name                = "vidtv_bridge",
+		.name = VIDTV_PDEV_NAME,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index d42899a31295..101a26a4415f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -16,6 +16,7 @@
  * For now, only one frontend is supported. See vidtv_start_streaming()
  */
 #define NUM_FE 1
+#define VIDTV_PDEV_NAME "vidtv"
 
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
