Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:00:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E02207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPOdczkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E02207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5306D876A6;
	Wed, 19 Aug 2020 19:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOXnRrdJfaH0; Wed, 19 Aug 2020 19:00:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C81A88761E;
	Wed, 19 Aug 2020 19:00:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C45CEC07FF;
	Wed, 19 Aug 2020 19:00:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD034C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C7E9860F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9uUAuRAJiRM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13A9F860F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:09 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f5so11260110plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 12:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLfkemIewMnv6fWXsuoj50p89vkQ+fIdkZyVTqqSC0w=;
 b=NPOdczkm8lCaPc6hqEnbm8QT2k0i8mBDItJfr17oxdrZunK8ENFSzHEv5xVfidUNIW
 OGYdNBuVRARt7mJXqI17qIFiN9cWIVi81qrAlw/vJG5uvQ3F7dqO995Ht6gVR2pPiCRO
 P+LUHIR+gikF9BD2ZcOZdMZjZMtnQ2ho64gLApnObthVMxslDtsvrAOYL8BPlsVfpzTQ
 lQYbUGWLxU4ge5mmjlUoZIeeFP4540khThN3/5+2lC3IKQz/Fjbt1OGPhgPjTyCTB2h6
 E06FFPhYwUu/0p6gdqmVodpJjW5c1hBqnR1flrko5R54+pcTHV1SLiuCuUwks1eJ+d5s
 xgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLfkemIewMnv6fWXsuoj50p89vkQ+fIdkZyVTqqSC0w=;
 b=pdOooJbh0Fe7w5yie1pRoCgVYIZweO2wT9EktEJwiyWpqS4KpUrG/Y/G64MKKLIS6R
 ckk3X4GyKVtRoh+27IfRiFmnSJQGP5mzkH524lt7M/hTnej6y4hwZFcpZAamiOe4yHPC
 +oskGana8h5clOoqzLimJomqphF87NPgU/MogrLYW61x6W5OFKXKNmgBgzxGpwdB+IWC
 oqapeXsbUpKRR+tTjH0nT9a11yrhShg3DclZ9+1jXgj3y77o+BaUjHeWzC1YSyr52LFo
 bYqDfsI/jtqOi40HVsmNYClPh0NZzq9W0OraAVh/Rw6RvlQC+RV2TR6eHfVfhwChG1xQ
 TkvA==
X-Gm-Message-State: AOAM530Imsy7E+tGP8PTl03+cmWXLWq734bPWAzO/CU4//tkG8/8NXii
 ZQjfR//KA7ImOs4VPe7Xlhg=
X-Google-Smtp-Source: ABdhPJwUudB7IAaebcACVT0UwUwTEHj0ow63qmV1JZSDadWqM6xmOLbjCyJqGdDo7xDmGHtKh7qYLg==
X-Received: by 2002:a17:90a:9485:: with SMTP id
 s5mr1100437pjo.189.1597863608327; 
 Wed, 19 Aug 2020 12:00:08 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.12.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:00:07 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:53 +0530
Message-Id: <20200819185654.151170-12-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 11/12] fbdev: s3fb: use generic
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

Drivers should do only device-specific jobs. But in general, drivers using
legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
PM-related tasks themselves which can be done by PCI Core itself. This
brings extra load on the driver and it directly calls PCI helper functions
to handle them.

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
unnecessary calls to the PCI Helper functions along with the legacy
.suspend & .resume bindings.

The s3_pci_suspend() is not designed to function in the case of Freeze.
Thus, the code checked for "if (state.event == PM_EVENT_FREEZE....)". This
is because, in the legacy framework, this callback was invoked even in the
event of Freeze. Hence, added the load of unnecessary function-call.

The goal can be achieved by binding the callback with only ".suspend" and
".poweroff" in the "s3_pci_pm_ops" const variable. This also avoids the
step of checking "state.event == PM_EVENT_FREEZE" every time the callback
is invoked.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/s3fb.c | 39 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 60c424fae988..5c74253e7b2c 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1410,9 +1410,9 @@ static void s3_pci_remove(struct pci_dev *dev)
 
 /* PCI suspend */
 
-static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
+static int __maybe_unused s3_pci_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct s3fb_info *par = info->par;
 
 	dev_info(info->device, "suspend\n");
@@ -1420,7 +1420,7 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
-	if ((state.event == PM_EVENT_FREEZE) || (par->ref_count == 0)) {
+	if (par->ref_count == 0) {
 		mutex_unlock(&(par->open_lock));
 		console_unlock();
 		return 0;
@@ -1428,10 +1428,6 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
@@ -1441,11 +1437,10 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 /* PCI resume */
 
-static int s3_pci_resume(struct pci_dev* dev)
+static int __maybe_unused s3_pci_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct s3fb_info *par = info->par;
-	int err;
 
 	dev_info(info->device, "resume\n");
 
@@ -1458,17 +1453,6 @@ static int s3_pci_resume(struct pci_dev* dev)
 		return 0;
 	}
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	err = pci_enable_device(dev);
-	if (err) {
-		mutex_unlock(&(par->open_lock));
-		console_unlock();
-		dev_err(info->device, "error %d enabling device for resume\n", err);
-		return err;
-	}
-	pci_set_master(dev);
-
 	s3fb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -1478,6 +1462,16 @@ static int s3_pci_resume(struct pci_dev* dev)
 	return 0;
 }
 
+static const struct dev_pm_ops s3_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= s3_pci_suspend,
+	.resume		= s3_pci_resume,
+	.freeze		= NULL,
+	.thaw		= s3_pci_resume,
+	.poweroff	= s3_pci_suspend,
+	.restore	= s3_pci_resume,
+#endif
+};
 
 /* List of boards that we are trying to support */
 
@@ -1510,8 +1504,7 @@ static struct pci_driver s3fb_pci_driver = {
 	.id_table	= s3_devices,
 	.probe		= s3_pci_probe,
 	.remove		= s3_pci_remove,
-	.suspend	= s3_pci_suspend,
-	.resume		= s3_pci_resume,
+	.driver.pm	= &s3_pci_pm_ops,
 };
 
 /* Parse user specified options */
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
