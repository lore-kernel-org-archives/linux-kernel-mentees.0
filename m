Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9294EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 12:07:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DCB20732
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 12:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSqV8oLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58DCB20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 127098855F;
	Mon, 22 Jun 2020 12:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpEC+iX933zM; Mon, 22 Jun 2020 12:07:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23E88881B8;
	Mon, 22 Jun 2020 12:07:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0943EC088F;
	Mon, 22 Jun 2020 12:07:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98E19C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 429BB20784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6kRsT2ruCvl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:07:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 57758203EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:07:00 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id i4so8528930pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou9Z/Ox/FwTNRKwSYB37fOjhliFS4VQZs0FMTQAQC5I=;
 b=PSqV8oLCQOb7Tmzo31U7GZn+L294sHL3jjZIZwdpZ3FcDVcSyU1+IKfDX63ylkv/U4
 cxSiNOGrbjokKMbcEbqSSmXGoG/DxlJXTUeWnwG8oe2W4NvYHc+QTgMLdeFszPyvZzTr
 Uzy4Yp5J5K3unoJq0TgbjANslW/6rHLf7A6fVqwz3EKHMneyiAj1UNL2HPGKIOgPwSrU
 dI+xlWn2/AiZHK7rJsdSCzFPEXgCvEZggaeyoQn3UPzhHwkiGrKjsyBFZz8xKnMxFEyY
 MQSDu4D1qbSgLRiP83rr6LjNfHhOQGV/FQ7ZDotrV8OUMqgqjDfuDcloOLbC51wQTYX5
 vIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou9Z/Ox/FwTNRKwSYB37fOjhliFS4VQZs0FMTQAQC5I=;
 b=EhnWBNB8p+c0sw6OuLf4XVAbTH2KDQ5h1xPnuCe3NIxJ+NXJVfn+wOAqTeDh2bQ8vi
 3OTKPQYtFJ+/KlzISfyLyf4FqgLlEeVOzrmLlXoX07HhQmQQU4g/hhJnZB/qEwi0V5t9
 dHWc1QOlYh6pFvlnk4ZJGC8EQ5ve2tW88ZZ4w6bN2qWHJOmTR/R9kEYfbkd1xdmRUe80
 D50m5wB4vCfEc3ZWpzjZf1tXpfm97s8vi1ACcfbwUT3EbSGJ2Q1uEAV/uH0TZFklr8Ml
 dwqL9ecc2x1AawvLAun5D/O/LTXIaUjHZyLBk8t8mp0RUHsZQQ7NV+2vs9RrPKFlKvVG
 C1fg==
X-Gm-Message-State: AOAM533m22svdTPU3VxCCUVgntsUIIJj7Hx17CRa+X0HG0/5hask73gc
 X2Qf514saqUbTdaXZ4jn1O8=
X-Google-Smtp-Source: ABdhPJxWH1R7RNazyZb+CXYHrdyY/Qo/VwMC9R+HrORsdOghiTJDVI2x/EEpEoO0/7/ggGXeEFOFDg==
X-Received: by 2002:a17:902:7008:: with SMTP id
 y8mr20024907plk.84.1592827619747; 
 Mon, 22 Jun 2020 05:06:59 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j8sm13195391pji.3.2020.06.22.05.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 05:06:58 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:32:30 +0530
Message-Id: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] [media] saa7134: use generic
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. The required operations are
done by PCI core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 25 ++++++++----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index e4623ed2f831..eb01109d4f98 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1370,10 +1370,8 @@ static void saa7134_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-#ifdef CONFIG_PM
-
 /* resends a current buffer in queue after resume */
-static int saa7134_buffer_requeue(struct saa7134_dev *dev,
+static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
 				  struct saa7134_dmaqueue *q)
 {
 	struct saa7134_buf *buf, *next;
@@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
 	return 0;
 }
 
-static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
+static int __maybe_unused saa7134_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
 
@@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
 	if (dev->remote && dev->remote->dev->users)
 		saa7134_ir_close(dev->remote->dev);
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
-
 	return 0;
 }
 
-static int saa7134_resume(struct pci_dev *pci_dev)
+static int __maybe_unused saa7134_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
 	unsigned long flags;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	/* Do things that are done in saa7134_initdev ,
 		except of initializing memory structures.*/
 
@@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1522,15 +1514,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
 
 /* ----------------------------------------------------------- */
 
+static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
+
 static struct pci_driver saa7134_pci_driver = {
 	.name     = "saa7134",
 	.id_table = saa7134_pci_tbl,
 	.probe    = saa7134_initdev,
 	.remove   = saa7134_finidev,
-#ifdef CONFIG_PM
-	.suspend  = saa7134_suspend,
-	.resume   = saa7134_resume
-#endif
+	.driver.pm = &saa7134_pm_ops,
 };
 
 static int __init saa7134_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
