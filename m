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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A6C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2F22071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVorRNjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2F22071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F994860C8;
	Fri, 17 Jul 2020 07:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdNExshbbV5o; Fri, 17 Jul 2020 07:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9CA54860CD;
	Fri, 17 Jul 2020 07:36:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BF98C0893;
	Fri, 17 Jul 2020 07:36:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9785BC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 876B188012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXGLiLvNxhcd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0817987F50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a9so483047pjd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
 b=bVorRNjURfPpm/ZSKqoTOVMR2C7tuSII04c0fZPgoqxiw+TqPgU/zea0VfdX0tY28p
 ePSlmNOrYHl/3msFvHYRzacBAnn11tqA5lVhGLjVv6mol7+1E/4VpY5rXHIQ0ZOx0WE4
 2Q2RkzYpgg1DzaK/lHWk3cGOH5KI68m8hHaLc/YMx4LQH6CvEIgNLXsfjXmBp1s8nUaT
 ape+r6gbYCgo+UK5Yb9FxiRzfdE1G83JPO91er6wTnZvhrv0WEUN9OYyz8i+fv8HJTXz
 KJjifQgJYzpqLB6OJBPCOKcApR2jhUIyHZZqHs+NqMMXceyWaCV/youL4Yf0MTxXCx8S
 /wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
 b=mfyMt+pGAFgMB7szY7nckWzNj3jwxONOEwaiFzq2tIQ6bxPMfOxR2KXGxBu12JjAKZ
 d84bV2Zw7IxybcDIFWjOCM9pdlhlWLtOfRpfl0/tw6DI23yrLXwmlliIQPZFWjJqlq4Q
 vDSbEypfKkLQGwfjMAVRAC6ZjD6RQcYh/EYQOhiww2E1JIQa2r1GtHoyabuGGMLKi3/Y
 UpWGd6KpZHS1E6MAmPia+wR1MPE7qXpRot0rb2oHysRFB+q0ybFKxE4ScF3qz4YLSjeq
 vCmjFjOiDcfLmEAqbx2WEA4scYZ27Ge6DTweanHBSrZBESuVj+83CM+n+nV/W2puwlFz
 X0Tw==
X-Gm-Message-State: AOAM531cRLbRbqI4IR2wBWvOx9y5vFpdVsKVVGeN6q/HgQpxNzaKZQrf
 4sgPBdHGC4eyomZSarIEq1s=
X-Google-Smtp-Source: ABdhPJxW65z1lWnxDX/TTJuegvDEfRlYsjEWa8/jsuGw1+KM8ruoBqM7qzWrTX0AYxVD0xQRndRLqQ==
X-Received: by 2002:a17:902:8491:: with SMTP id
 c17mr6569011plo.262.1594971397589; 
 Fri, 17 Jul 2020 00:36:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:36:37 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 13:04:36 +0530
Message-Id: <20200717073436.249623-7-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 6/6] tw68: use generic power
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

The driver was invoking PCI helper functions like pci_save/restore_state()
which is not recommended.

Compile-Tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/tw68/tw68-core.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index b45f3ffa3de5..065420b09250 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -359,10 +359,9 @@ static void tw68_finidev(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 }
 
-#ifdef CONFIG_PM
-
-static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
+static int __maybe_unused tw68_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 				struct tw68_dev, v4l2_dev);
@@ -373,24 +372,19 @@ static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
 
 	synchronize_irq(pci_dev->irq);
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
 	vb2_discard_done(&dev->vidq);
 
 	return 0;
 }
 
-static int tw68_resume(struct pci_dev *pci_dev)
+static int __maybe_unused tw68_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 					    struct tw68_dev, v4l2_dev);
 	struct tw68_buf *buf;
 	unsigned long flags;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	/* Do things that are done in tw68_initdev ,
 		except of initializing memory structures.*/
 
@@ -408,19 +402,17 @@ static int tw68_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
+static SIMPLE_DEV_PM_OPS(tw68_pm_ops, tw68_suspend, tw68_resume);
+
 static struct pci_driver tw68_pci_driver = {
-	.name	  = "tw68",
-	.id_table = tw68_pci_tbl,
-	.probe	  = tw68_initdev,
-	.remove	  = tw68_finidev,
-#ifdef CONFIG_PM
-	.suspend  = tw68_suspend,
-	.resume   = tw68_resume
-#endif
+	.name	   = "tw68",
+	.id_table  = tw68_pci_tbl,
+	.probe	   = tw68_initdev,
+	.remove	   = tw68_finidev,
+	.driver.pm = &tw68_pm_ops,
 };
 
 module_pci_driver(tw68_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
