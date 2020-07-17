Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51574C433F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A852071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suHcx/3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A852071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6FAF860CD;
	Fri, 17 Jul 2020 07:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uebLQ3XhAK-L; Fri, 17 Jul 2020 07:36:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 775B4860C6;
	Fri, 17 Jul 2020 07:36:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66AB1C0893;
	Fri, 17 Jul 2020 07:36:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3137AC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1DADB2040C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0sG9k+DNm8XO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 5EFFD20405
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:26 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id b92so5983609pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o38J/PFTSSSoTyJxL5VzCWpb+LzDe42nMqQ+a4HznfI=;
 b=suHcx/3aWCsbtLu9RFhYgVejfZI9ZwB0MgXm6F4LAgcnpr/Dgaf0rslVOFMwmE0vB9
 fTsrkjCTYH28hyTRRKhpnf+PhXJebgnkTyDk5ic+2vrmzQI/sVmt04Mg3/RFX1Jh3xS3
 edBUr9QH97UOD8FxGbwNnuDP4nY54HxxbHnhgYkp/NoRIZ1lHb+NeFl4chSkhEGEPNO7
 Pi6GYIfWb3TH2baRSVnf0AEV/EgwoBPWgpOoq0i2riJ2/FIoqvRkKh6saBMRfRcHHZII
 ExvbqIcE+dSZpPePM9gaWYzBUMWyimu2mmsH8oGyyhx6RZBKHBs7hebFi+IOumTEiY4K
 wQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o38J/PFTSSSoTyJxL5VzCWpb+LzDe42nMqQ+a4HznfI=;
 b=a9ATd970etAsS8zorepL8Wa//qcqgOSNtAAX+Hnl78K9Wla9znO7GiPT+eIOc1jJwX
 jgbQzDeoJDKSWzkBwob8S+p/zVlQRB6JuAzhKDKpj3DT1o1RCB9BERpGi2N5hGdkR9rU
 XKnNHYT4bHrfzs/gc55CqyR3/3jz4K7yE9yttvoQmMrNtltxdcxdoSfvF67Cuw7hhpvl
 O4sy65cNb2H+44ebZbVui/CNHwYW7vE+vrp2Cb3zsxiBC5RKrncaNmotSgbneesYlEEa
 99VmcU4xqOmwvvTUprTxzsEht8SRX01HsIU8JbF0Uj8sWfTxAYH7gn1/ecU/N453o1PR
 GJUQ==
X-Gm-Message-State: AOAM5321Yes6j21JtdPrWy2rY81JUvemsA74V1lK1Xu5iURVZFVSAVgj
 woh1I3DuddJz1VXILd86eBY=
X-Google-Smtp-Source: ABdhPJzFRBgouTCA7hhoRaiFdSsMlYPkyejIuYqDKAFtC6stuskQIYYkfZ+80ovw+KGW6XsqY/2CZw==
X-Received: by 2002:a17:90a:3689:: with SMTP id
 t9mr8609619pjb.28.1594971385928; 
 Fri, 17 Jul 2020 00:36:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:36:25 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 13:04:34 +0530
Message-Id: <20200717073436.249623-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 4/6] cx88: use generic power
	management
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx88/cx88-video.c | 58 ++++++++---------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index ba0e9660a047..ab55e3fafe00 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -385,8 +385,7 @@ static int start_video_dma(struct cx8800_dev    *dev,
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int stop_video_dma(struct cx8800_dev    *dev)
+static int __maybe_unused stop_video_dma(struct cx8800_dev    *dev)
 {
 	struct cx88_core *core = dev->core;
 
@@ -402,7 +401,7 @@ static int stop_video_dma(struct cx8800_dev    *dev)
 	return 0;
 }
 
-static int restart_video_queue(struct cx8800_dev    *dev,
+static int __maybe_unused restart_video_queue(struct cx8800_dev    *dev,
 			       struct cx88_dmaqueue *q)
 {
 	struct cx88_buffer *buf;
@@ -415,7 +414,6 @@ static int restart_video_queue(struct cx8800_dev    *dev,
 	}
 	return 0;
 }
-#endif
 
 /* ------------------------------------------------------------------ */
 
@@ -1551,10 +1549,9 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-#ifdef CONFIG_PM
-static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused cx8800_suspend(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
 
@@ -1575,40 +1572,17 @@ static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* FIXME -- shutdown device */
 	cx88_shutdown(core);
 
-	pci_save_state(pci_dev);
-	if (pci_set_power_state(pci_dev,
-				pci_choose_state(pci_dev, state)) != 0) {
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
-	}
+	dev->state.disabled = 1;
 	return 0;
 }
 
-static int cx8800_resume(struct pci_dev *pci_dev)
+static int __maybe_unused cx8800_resume(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
-	int err;
 
-	if (dev->state.disabled) {
-		err = pci_enable_device(pci_dev);
-		if (err) {
-			pr_err("can't enable device\n");
-			return err;
-		}
-
-		dev->state.disabled = 0;
-	}
-	err = pci_set_power_state(pci_dev, PCI_D0);
-	if (err) {
-		pr_err("can't set power state\n");
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
-
-		return err;
-	}
-	pci_restore_state(pci_dev);
+	dev->state.disabled = 0;
 
 	/* FIXME: re-initialize hardware */
 	cx88_reset(core);
@@ -1631,7 +1605,6 @@ static int cx8800_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1647,15 +1620,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx8800_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(cx8800_pm_ops, cx8800_suspend, cx8800_resume);
+
 static struct pci_driver cx8800_pci_driver = {
-	.name     = "cx8800",
-	.id_table = cx8800_pci_tbl,
-	.probe    = cx8800_initdev,
-	.remove   = cx8800_finidev,
-#ifdef CONFIG_PM
-	.suspend  = cx8800_suspend,
-	.resume   = cx8800_resume,
-#endif
+	.name      = "cx8800",
+	.id_table  = cx8800_pci_tbl,
+	.probe     = cx8800_initdev,
+	.remove    = cx8800_finidev,
+	.driver.pm = &cx8800_pm_ops,
 };
 
 module_pci_driver(cx8800_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
