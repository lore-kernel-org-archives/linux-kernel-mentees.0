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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E7C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A1A20838
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlNGeWoe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A1A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 42784203E7;
	Fri, 17 Jul 2020 03:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Kp-IKdryehT; Fri, 17 Jul 2020 03:58:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7C8FF2035B;
	Fri, 17 Jul 2020 03:58:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68D82C0893;
	Fri, 17 Jul 2020 03:58:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FEC5C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8B976203E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5elRsZr+hoWD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 787FB2035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:46 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o22so5742736pjw.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 20:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
 b=FlNGeWoeLNW1CueGjKJP4zKlf75P8yTic2DIyVAy5m4kr113nocQF4ToxNJQYkdJfQ
 dta7VnA8yHBeGnmorbQ1y6OY/Ee9NbWOujMaStD5nRxBBZ9l5AeVggtPN6OamSeO+lOE
 Npc4QbbQFB9uaRrXERaLyiShQYRqZeTCS3o1dBrM1GVn9dcXgq87MLtfI43CHlotWeqi
 cN2xsgqFPw6Yye4LJCc0T+TBPOILOOzSXUfEGLazwO9hbhbc0Rz4LEyzW4Cu5gFwZilS
 T8oTUpTuyzrkd85i4KWlBB01p0FEKRf0bftbZ34DQbFO5Vk9dP6/WOIwy7Otp2cHDvRG
 XeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
 b=D0VGWYOGQwEUzaHVI5vQ1tg9R7KMRytThomo7cHF6jqNUJFQCPDvTREJK+UDmZWLSi
 mGW6zw4vw83mtFyBBIwF51N31+3/POswHyZ0mjNWt4HiLpCKdNDz3TtoIDaiXD6vgrrS
 es5tAV62b5B6/8Vv5m9OS2pYtHyact6u9/U5ci4V5+IGbkZiFmXLdLdcbdNZJdivOmT9
 r3s+jZe30r7tDI/6uEt1TYN5W03Xo5Ey5EL90T1cyCyZvSPJLy3YEqClK93W/YOV2HlN
 SKM6x2jsxG7OnUXxgxfzCQ26OrjGGtLPrScg/l2JKre4FmELOGWmcp6ddEhHnlPiJ8ul
 740g==
X-Gm-Message-State: AOAM532sOamgesWRORR+NgblY3CpgOfGEOig7ZZjAlGJviDO1wW6/vWJ
 ulxK33it5E+1DrcE6g2/jJU=
X-Google-Smtp-Source: ABdhPJxkGOQucEZ3eHTJchpKUKUckA6j7S/vsruQEQBvkvTbVutpKPuX/9bYSB965EtwPAHJ694VOQ==
X-Received: by 2002:a17:902:b412:: with SMTP id
 x18mr5880528plr.116.1594958326050; 
 Thu, 16 Jul 2020 20:58:46 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 20:58:45 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 09:26:06 +0530
Message-Id: <20200717035608.97254-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 4/6] cx88: use generic power
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
 drivers/media/pci/cx88/cx88-video.c | 52 ++++++++---------------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index ba0e9660a047..a06d5b8f31b9 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1551,10 +1551,9 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
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
 
@@ -1575,40 +1574,17 @@ static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
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
-
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
 
-		return err;
-	}
-	pci_restore_state(pci_dev);
+	dev->state.disabled = 0;
 
 	/* FIXME: re-initialize hardware */
 	cx88_reset(core);
@@ -1631,7 +1607,6 @@ static int cx8800_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1647,15 +1622,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
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
