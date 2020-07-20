Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0441C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:33:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D9A22C9C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t/koDa48"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D9A22C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6413585C05;
	Mon, 20 Jul 2020 10:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Blz9jJjeZpWo; Mon, 20 Jul 2020 10:33:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C20E585BD5;
	Mon, 20 Jul 2020 10:33:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3475C0894;
	Mon, 20 Jul 2020 10:33:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1476C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9FEA386B48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 170zaYj7yDBw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:33:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B50685F9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:33:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t6so10110440pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hevPUmGQ66hCXkNyonbVBGz6ryQo6snqDBjlm4ZlRA=;
 b=t/koDa4817hL+YgrfCUpkhYDx+MSqZ2FHSvZqWNL4e4jbaiSvM6lqOIjTh4hOoq6tU
 hxCAbeO+8GzyqDRrObVMRjQjnBQ9rY/sDK0dPCwYejFBqHa6Cino5/+ZyOEJCt6MDPBO
 YOFnb6HAeuaH/ez5bTvJJ78vQYAPTBxcjq164TcScI8Sutqe6Lb55yrO8oK3e6Osb+r7
 jnr0bohhBoGN+9X7al1guRNdfuNXLQjFHWs+VQEcJ/NaXc4QrVoWbwcTCKth29Rkj6j9
 CvDO79MJoe/LCUjcccJUjK1wNBRprB6WbQjTndS1lvxWtmOch1RyyMP5+PrwEtgGmXmu
 DLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hevPUmGQ66hCXkNyonbVBGz6ryQo6snqDBjlm4ZlRA=;
 b=caraJ5UfNv+p9+vpzK5pDQI3k9QkaVWYeS9f7kVqfw22pYyr8jxbcijcnn1fiKk7gv
 LfNyVI8GDepesZ/E6R36ROyqWIMtxjSosNbylSs3G6foKB+1WtTVaVxQfsePLwEqw+ve
 sl7odJEsbPHeQOwMeP0M6U9w8EfGvdJW6KwBZyX+cG3XGuly/hNYb5ZKyHqrZWG//km8
 NOJrvq6CQ7kQ4NXFqL3JkO1C8MyeYX7NVwQSNvV2CbDz5mAGbrqQsPbChykA9+EHWzx9
 p6L8WhnCPZ5PMpCtKxRO4t+Dq4ebaFnAL3dcf7am3p0V+TBXdgKBevzdEuHLNv/YoFTG
 ZElg==
X-Gm-Message-State: AOAM533KqQjGHyEm1122OSxlWp4XQoE+/ijpdg0uzfNLZuAPcGlb+YZy
 KOvjK7fZbTcXPji/zoAGeq8=
X-Google-Smtp-Source: ABdhPJzLwORkHMw6BCcQKdOeZ30UkE01yU0r5rdC/F8LYunnbY0f9/dtf3kjjljQEMwv5WzOcMJPMQ==
X-Received: by 2002:a63:7b15:: with SMTP id w21mr18971517pgc.386.1595241182623; 
 Mon, 20 Jul 2020 03:33:02 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id e18sm16412186pff.37.2020.07.20.03.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 03:33:02 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 20 Jul 2020 15:57:01 +0530
Message-Id: <20200720102700.191371-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] [media] saa7164: use generic
	power management
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

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from struct "pci_driver".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 126d085be9a7..4b637891b79a 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1539,9 +1539,6 @@ static struct pci_driver saa7164_pci_driver = {
 	.id_table = saa7164_pci_tbl,
 	.probe    = saa7164_initdev,
 	.remove   = saa7164_finidev,
-	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 static int __init saa7164_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
