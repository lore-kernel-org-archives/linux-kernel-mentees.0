Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE3FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AEE022240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AEE022240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0751485F19;
	Tue,  5 Jan 2021 13:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkBMJSgAcSX2; Tue,  5 Jan 2021 13:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 038A485D9B;
	Tue,  5 Jan 2021 13:10:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6DB0C0891;
	Tue,  5 Jan 2021 13:10:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD22DC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ACB4587108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oihnd+v7LmOO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 49EDC87103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:27 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id p12so14573065qvj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQ0OJEOn97+wjoYhHmOVVLzYGUU35WOQxdoz8BzVbpo=;
 b=MOXVvFSD/yTZYfKFMRSRsdSzpkq0MFYG+RVMJriLzxtNntn2B7msayxE5Y3YFooiWW
 WqkXn229ZHIL/6D6iI1Z3NDTO0/1dD7nr0aCfwV1hB7Vsw5Dt0lfzGAsayY6KB6A+DPf
 hqPFPwm0p4C104afa5xcNhDrsV7YMs89a1gc08GTjA/capXtEAU91M8dbAKLEkT64Emw
 y+5ziOnoT4tMxp2RBfNqwfaOIkyXHcw+z26rPhWn/Dx8Pl+s1O6ltamZJ+tyw7JRlZyf
 vxwTGPiPZmCqykUQsQE3QV09VIo1MwZQ2wVwiaYsk+7VCetOx0F5et/wDE7bR2RzscgC
 pEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQ0OJEOn97+wjoYhHmOVVLzYGUU35WOQxdoz8BzVbpo=;
 b=K3ywxOzN45iz1Uk/MEL7aPnIR0q5D/ygtdYhysPvDlBhMg7yYbSAsV4UmRemmotNlL
 A5XiAA2F/XxrW06PlcLGEuNSzmihqr/D7Y6f4ofLal7+AIYMueKxoCubuNRwAqMuVHrl
 obja+g297kFLjfDKjpwLWFCOhQtxuuXvxcJU8i2LMTgAcwngV6WECC9u4+odsUlMhwXf
 773WfmLYRLJQXYMqxYAMVM20x3BhXleDGZvpmYNbROtQz7r04qKhj6D5UC0NZGIkRdNG
 1XId4DjZHJmcfnSSdKm5hI32IYZ/wIudj873Ej7pNf1ZAhi0kw1NUpGLVAk4AZ1sVkW+
 7gDg==
X-Gm-Message-State: AOAM5321iYU2MyDGSGEVocB7SA7KCX6bPR3lTfdH0tSv2+38eBgSN/A1
 AikWYf/NCQg6qo8W3wcEbu0=
X-Google-Smtp-Source: ABdhPJzIdycboSnJXvhU3084nK5JgJmsz2hiAgBIyXo6VNMIKZuwfEthdweT4BdmbAlpdoTKMfGU3Q==
X-Received: by 2002:a0c:f2cd:: with SMTP id c13mr81734677qvm.11.1609852226332; 
 Tue, 05 Jan 2021 05:10:26 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:10:25 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:09:55 -0300
Message-Id: <20210105130956.1133222-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 3/4] media: vidtv: use a simpler name
	in platform_{device|driver}
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
index 4ccaa0f00639..11ee87399375 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -562,13 +562,13 @@ static void vidtv_bridge_dev_release(struct device *dev)
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
