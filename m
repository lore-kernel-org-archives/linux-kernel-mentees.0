Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB865C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1D423158
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1hIH6mF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1D423158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69C8722721;
	Mon, 29 Jun 2020 07:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxYvrxA5VH-j; Mon, 29 Jun 2020 07:37:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B6FA207B0;
	Mon, 29 Jun 2020 07:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89378C07FF;
	Mon, 29 Jun 2020 07:37:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30D16C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2D9E48853B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFtZZc-Jiq8j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B5CDB86A0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:29 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id c1so396628pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wNBasksRn6HqqFy9YNin3k0xj1oUFrdl5Lr5u3FSELQ=;
 b=M1hIH6mFmORSCGE86XorMiBP7P08Gf4iZf58OyrKtzhu/cv2OISPl0WAHowytkfrXb
 Dxtp9KEV+JThYTPWvaCa029Z+U7sItPFnlKrjYO+P7uwh/rTbA4R4HTUSv5AlaBsq51O
 k8PDB3rzBRmgXTeZ8DdA/U/csAwKlTqGKtV4Y4qJkujlyGSF63nQAmcrkA61IBbPlvXI
 leqBFDNv9s7LvFlq4dGOdA+uUpzsrcRl36VOzX57aTt6Smf7gdRwvxKPLW1qT9TnG3Ds
 WZuuLNR/i/9WGDTcE6PYFhdE5tX2xgAWxR53fnb1MLYIY9J+qFyGGcOgglFfMOV/dy2n
 aiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNBasksRn6HqqFy9YNin3k0xj1oUFrdl5Lr5u3FSELQ=;
 b=BsaSeRsubMuDGjp5KdRyZNaU2L+KOt+KxlxgNIWiX2p/sAlOwqeHAEhJr1F8m/TUzY
 iYdjqFe5K/oZdlHeA61v173J1T1HA8jOdax70An9DEZBMJSTDISvqjZfvaNvaYOmgGz2
 0i2ZtM5kEYZT2SJJAoPqtRqyx5tDj0obyDiaAxW5SrUe11zg4640nce0qN0VgExPP6lY
 P4qUoB8hMXnb5tUtyuvH8AX5/A93qtNWXSg93slOEZs3BQgzM2Dw2H8OEuvfhHk93SDT
 27CRnr4l7dmKWwLUGmTn9rUFOUq/6dVFTW+zYAv+INfUpVb4dgLstfGkgjqx5R0Lm42P
 AQUA==
X-Gm-Message-State: AOAM533huJgP8MaugxugR4L/cXd7Ghp/udPdMLPFZuw2fA8w00hOcIrd
 zXGkVxoqRVHVKraDgBnfdwo=
X-Google-Smtp-Source: ABdhPJw5JV6v034J4F08OVzJgY5QNT872fYtNd1w2ulu2+H64M023gpnMHfQNOtSd3meU2msqry31Q==
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr12020846plf.76.1593416249351; 
 Mon, 29 Jun 2020 00:37:29 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:28 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:06:00 +0530
Message-Id: <20200629073604.205478-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/6] [media] cx23885: use generic
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
Still, their power managemgement stucture can be easily upgraded to
gemeric, without affecting its normal behaviour.

Hence, define them NULL and use struct dev_pm_ops type to bind them.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..da9ee7270dfd 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2230,14 +2230,18 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
 
+#define cx23885_suspend NULL
+#define cx23885_resume NULL
+
+static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
+
 static struct pci_driver cx23885_pci_driver = {
-	.name     = "cx23885",
-	.id_table = cx23885_pci_tbl,
-	.probe    = cx23885_initdev,
-	.remove   = cx23885_finidev,
+	.name      = "cx23885",
+	.id_table  = cx23885_pci_tbl,
+	.probe     = cx23885_initdev,
+	.remove    = cx23885_finidev,
 	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
+	.driver.pm = &cx23885_pm_ops,
 };
 
 static int __init cx23885_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
