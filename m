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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EFCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F4422D6E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F4422D6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D48052047C;
	Wed,  6 Jan 2021 03:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3bKVsAYV3k7; Wed,  6 Jan 2021 03:05:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC2872049F;
	Wed,  6 Jan 2021 03:05:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6FE6C088B;
	Wed,  6 Jan 2021 03:05:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D681AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AE69B2049F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeK1qMD6N-RO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by silver.osuosl.org (Postfix) with ESMTPS id 7F65622C44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:05:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id u21so1265789qtw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 19:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHmmCBGfy4ShazVVVDUgrXKI7nP1Rs0OHaoIlOcZSyU=;
 b=JL2en4yo9zkQGXpTev0LLdXXCf2THcuyHqiHq08UV531nMDdozzMmBTMfv4RzN8CPQ
 lllYZNvjyJ9qgxB9+8DOs/huEduwu1lZbso+4dQ3cNlajt1gOKr51ZJvHmbYRfRhrZoE
 3fpH0TujSELp1PrZzpt4GHK1t+fB6YHnav4W7OtJfm2Xu5LMhz5AXSxTt6SaJtzsvXzs
 VAqhf+7S1YOfeninpvhpQO2O9LA4FZYvVjrBLAOAVKnsUVtuJc1L7TDMniIz+k2W+nGV
 MOvJX7FiKFv7LjrYYUga8GG1L2nZHe/KcDBkp5B8zBV/mTny9ane6Ci1USHBxQX7Illn
 cWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHmmCBGfy4ShazVVVDUgrXKI7nP1Rs0OHaoIlOcZSyU=;
 b=Mbg7kVgVnxj6O7390NbxZ5n3Oyn5AXUtNoi6bimj5qZ/l0s3EsGoXsp7aGYSSQLNjr
 JirWX9z7bBZCnLXttAxAPEksFIhgsZ8RtqwhY9GMqUwMi9JLEebWNIHZvLlPpPqoSRxK
 1UFW+Crk3d3RWUEAEznmJybiz5F8WUYT+/0WViecDjTlUZchyKnl8CED7PwPA5j3cO0e
 XYmJNnP98Z7wcZ2cEEfYJlNmefkTKLs10PF7z1FiZ5U0ZbVq7nKj9LMs778nswgaxaNg
 m/6+AbeXKOU6Sjhvdq4tOFLe4zcp2ON4bWe/+js/DTiwXvEEPC73GMj2yunNXC22sYTl
 3+jQ==
X-Gm-Message-State: AOAM531FZ99muBnxvPtMsTJkKJezqgrb4qRr3CxEeHxJ5d2RXFGpggxt
 XPAHpg6HTEjrCpg5QKfI1q0=
X-Google-Smtp-Source: ABdhPJzHN/EkN4HNuCCqLOYv9mdakCw4XwaOJPrDyI72TQNZVr0TOgJlIqrA83OL2S9wPgHFBL117g==
X-Received: by 2002:aed:29a5:: with SMTP id o34mr2365384qtd.379.1609902307535; 
 Tue, 05 Jan 2021 19:05:07 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 19:05:07 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Wed,  6 Jan 2021 00:04:49 -0300
Message-Id: <20210106030449.3223172-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/4] media: vidtv: print message
	when driver is removed
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

Print a message when the driver is removed so that we get some
visual confirmation when unbinding vidtv.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 9964d1331aff..bde3785333cd 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -555,6 +555,7 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
+	dev_info(&pdev->dev, "Successfully removed vidtv\n");
 
 	return 0;
 }
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
