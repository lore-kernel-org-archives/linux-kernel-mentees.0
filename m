Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07AFC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 04:50:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894622070A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 04:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML2ie6HQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894622070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4609A86B9A;
	Tue, 21 Jul 2020 04:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3oC4m5qJuYB; Tue, 21 Jul 2020 04:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7DC386B93;
	Tue, 21 Jul 2020 04:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC4C2C0894;
	Tue, 21 Jul 2020 04:50:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42463C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 04:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 269FB86B96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 04:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtHRlfEWoSyP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 04:50:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9078786B93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 04:50:40 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id b92so1034328pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 21:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrwxUxxJqLtX+URI9aE/ZP5XVdbCcJcGjmeWN225pNs=;
 b=ML2ie6HQUDKfOMg0lAmV4QnPIwNzuIYgklfOml7Fz353dtm1tJZkiTbPt6LVllTsgF
 kWH0zny7N1p1iTxUsGmmgtYX703/u5rR0kn2iNiFfrI76rbpQhHHZJDZASW9cDPCjc6/
 3F1R18E3U7J4mzsu5VCcoWrFN9ekFtdNNxzKIlNngbtaeKVTcXH2vb8TSfoSvvHcsI5y
 Z4Yr9UVp2hYj8mLUommLOt7sW6KL1p6A61JwK+f/g6q9nOulG6pAGwfNcBHeL0buN/5k
 6zsjm38BvKdWGPxgS9CPYwBNRt/rKUxsAFrcPJfL0ImbnjI/Lj2mrHLsKjOwWbC7ojcG
 xfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrwxUxxJqLtX+URI9aE/ZP5XVdbCcJcGjmeWN225pNs=;
 b=s0H/9jFyrAGJ73xD+hP8fJqTaQX52Eob0WwhGyUjyRHWUs/5X+rpqU5IZzhjIa5qdr
 eZSB5HKmyvbRj8lWmdKqN4OS+aNIQwCsQY6ht2mtTCjQsXJYmKR3IhCTITpdw0CpSa+c
 usZztPKXEDRJTOuXQ1fDDYNlEOwgZfKNTlli5WyxqXyMGx/R3UPl6lwxxJZ21j2D2ihS
 xvrunJkNfeEg2Nt2zVaK5VVT68lKF2YWy8V6szKORs6HrTQAw8I9Tmid5UI8ysJiHqMh
 Nd9nDGFokZ6YGgnABGIrXcYUXE71V6SqseoasdikE1jRHHW8VTBbCaTaORHWvW7RYWCB
 sn+g==
X-Gm-Message-State: AOAM531RY5gsnpkLb62VOoBeRM4b0hL80UOiU7BAhBL8xuWrvsiNOF8Y
 N+IXBanHnUiIuDBXw3OUJAw=
X-Google-Smtp-Source: ABdhPJzTxhL2hp/Zmf+wZmE/56zcRIraZLPgtyR9kGJ71brJl1A2SiOTxC9p0WBJ8m4Z7iBrTnVCuA==
X-Received: by 2002:a17:90b:3547:: with SMTP id
 lt7mr2771000pjb.181.1595307040086; 
 Mon, 20 Jul 2020 21:50:40 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id h1sm17002840pgn.41.2020.07.20.21.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:50:39 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 21 Jul 2020 10:17:45 +0530
Message-Id: <20200721044744.26690-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202007210444.LkUvoUpL%lkp@intel.com>
References: <202007210444.LkUvoUpL%lkp@intel.com>
MIME-Version: 1.0
Cc: kbuild-all@lists.01.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] media: cafe-driver: use generic
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state() and pci_enable/disable_device() to do required
operations. In generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../media/platform/marvell-ccic/cafe-driver.c | 31 +++++--------------
 .../media/platform/marvell-ccic/mcam-core.c   |  3 --
 .../media/platform/marvell-ccic/mcam-core.h   |  2 --
 3 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 9a09a10a3631..58b9915ac7a4 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -604,44 +604,28 @@ static void cafe_pci_remove(struct pci_dev *pdev)
 }
 
 
-#ifdef CONFIG_PM
 /*
  * Basic power management.
  */
-static int cafe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused cafe_pci_suspend(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct cafe_camera *cam = to_cam(v4l2_dev);
-	int ret;
 
-	ret = pci_save_state(pdev);
-	if (ret)
-		return ret;
 	mccic_suspend(&cam->mcam);
-	pci_disable_device(pdev);
 	return 0;
 }
 
 
-static int cafe_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused cafe_pci_resume(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct cafe_camera *cam = to_cam(v4l2_dev);
-	int ret = 0;
 
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-
-	if (ret) {
-		cam_warn(cam, "Unable to re-enable device on resume!\n");
-		return ret;
-	}
 	cafe_ctlr_init(&cam->mcam);
 	return mccic_resume(&cam->mcam);
 }
 
-#endif  /* CONFIG_PM */
-
 static const struct pci_device_id cafe_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL,
 		     PCI_DEVICE_ID_MARVELL_88ALP01_CCIC) },
@@ -650,15 +634,14 @@ static const struct pci_device_id cafe_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, cafe_ids);
 
+static SIMPLE_DEV_PM_OPS(cafe_pci_pm_ops, cafe_pci_suspend, cafe_pci_resume);
+
 static struct pci_driver cafe_pci_driver = {
 	.name = "cafe1000-ccic",
 	.id_table = cafe_ids,
 	.probe = cafe_pci_probe,
 	.remove = cafe_pci_remove,
-#ifdef CONFIG_PM
-	.suspend = cafe_pci_suspend,
-	.resume = cafe_pci_resume,
-#endif
+	.driver.pm = &cafe_pci_pm_ops,
 };
 
 
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 09775b6624c6..d81d0c130e3c 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1967,8 +1967,6 @@ EXPORT_SYMBOL_GPL(mccic_shutdown);
 /*
  * Power management
  */
-#ifdef CONFIG_PM
-
 void mccic_suspend(struct mcam_camera *cam)
 {
 	mutex_lock(&cam->s_mutex);
@@ -2015,7 +2013,6 @@ int mccic_resume(struct mcam_camera *cam)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mccic_resume);
-#endif /* CONFIG_PM */
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jonathan Corbet <corbet@lwn.net>");
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/media/platform/marvell-ccic/mcam-core.h
index 2e3a7567a76a..b55545822fd2 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -236,10 +236,8 @@ static inline void mcam_reg_set_bit(struct mcam_camera *cam,
 int mccic_register(struct mcam_camera *cam);
 int mccic_irq(struct mcam_camera *cam, unsigned int irqs);
 void mccic_shutdown(struct mcam_camera *cam);
-#ifdef CONFIG_PM
 void mccic_suspend(struct mcam_camera *cam);
 int mccic_resume(struct mcam_camera *cam);
-#endif
 
 /*
  * Register definitions for the m88alp01 camera interface.  Offsets in bytes
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
