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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97197C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 17:49:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618EE20709
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 17:49:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg/iEt+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 618EE20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3655F87A62;
	Mon, 20 Jul 2020 17:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spqjI5kBdtkU; Mon, 20 Jul 2020 17:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B434887A39;
	Mon, 20 Jul 2020 17:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B972C089F;
	Mon, 20 Jul 2020 17:49:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70598C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C14587A52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLI4hv8S-lED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:49:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D9F5B87A39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:49:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o1so9012687plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96y7EAtauwpST2sJvN1xqRaaYTBW7xFiifRwkpVmX4I=;
 b=jg/iEt+0wHY/FV3Q81wX9QAl/uJk+XggykUcXKKHxIkxhXQ0AXB7HJA1n+VKyzthkI
 8hDC3mxxB86xuU1/zjVG17x2pWdnLQaexcu/kE5SYCLbJnNv7QyCO/RocBC4IeE3Dnk0
 xp/Q7wTP6ClTeePLDl1t4OkFpMCXWMCKPrc/6DqTxBF4PXQHHdQyPjQpJLlkFEffPB/w
 TStkgpuAiE0YkT/QEqdMS/wxmHQMVQNSg/Os+aDFc0ZvUo4Hyjn8j6VP15VVQN1Hf83S
 x1X9YrqeLocpYpqr7t4cjHsyYliRRciPUN+e/QX/p/1Op9g4bjSFRz/wdv21jNcjKgI0
 EKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96y7EAtauwpST2sJvN1xqRaaYTBW7xFiifRwkpVmX4I=;
 b=pBUuYzDpcezsHLnU4ECcbWFUVs3Pj6OXDnbMoROOY+HF//tNOATJz1F9Nw52RzjKMf
 T9KhxGznN/gpAnHE6+gsdsdu+gkf8KC9VoWH/aZwUS4UxcpkLmiWPSt2Wqr2E847OfZv
 gn9gLZH3xEEe0RY278EsDGg2tn5zqYSZZMvtz9DWxXZcJx0QOcD3pTQolzXE0E0lB9Fm
 RCnINinxGcNqh+2vHOHxGvAuD938s0I+Ej1lJRToXLePVcBSc2XHS8iSI+F11KDCcnQk
 8sF+Y91i2HxQvaGE/TSXg2J00KhQ5wZ77CMCMCdhLeZuxdM9k8P1KL+yBP5osGjqg5VF
 8KhA==
X-Gm-Message-State: AOAM530BQyzTtk5bzn98+ni+GPnudYAvRGLU7I2TcF03AGmRc+cQUHGd
 zSNFDDiaaEFvHtvQqGUwBMw=
X-Google-Smtp-Source: ABdhPJy/P1ezLwGpEG0knayswF4R/ww4dDpu6dy1QBZUaQEiSB0wwVhOtmGxkQyhBFmAypl7LGgj1g==
X-Received: by 2002:a17:90a:c295:: with SMTP id
 f21mr562409pjt.208.1595267352276; 
 Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id i196sm15538658pgc.55.2020.07.20.10.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 10:49:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 20 Jul 2020 23:15:46 +0530
Message-Id: <20200720174545.827778-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] media: cafe-driver: use generic
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
 2 files changed, 7 insertions(+), 27 deletions(-)

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
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
