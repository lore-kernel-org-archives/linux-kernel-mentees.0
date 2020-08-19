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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D21C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:00:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391B2207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:00:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx7mrlJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391B2207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE5AF87E93;
	Wed, 19 Aug 2020 19:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrRaV9ZsU2TT; Wed, 19 Aug 2020 19:00:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C39338708F;
	Wed, 19 Aug 2020 19:00:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2289C07FF;
	Wed, 19 Aug 2020 19:00:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4709DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4311C860F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGB33Mhbicpf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B8B43860F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:00:02 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d188so12149052pfd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQnwLM4dHzJRAnTfJIXhUQMR/ExLuRw9KF4MfB1j53g=;
 b=gx7mrlJc35T2/ZQi9Ht3XPkUZr4qb95Oiy+82MqtFzf59AJSK64W3nD5D3fcnSWRX0
 GL0MzqVUQTqzN6QVh20pRmm4cs2nTigUzBtI7lJWyOx8nme6vpWqrvujXYEZP0ZFMVnF
 5NcmEZTeEZbgtIm5jgRdekRSCAtjU2wN7iBsbqlcB7LRdNasMVRuh7VDUVwfI5vkXqNx
 9e903tRxOZIZXUTNPbQ+/y1y+Ij8Sj4FGiwjxF10BsepnmkBN5i4x3MMbQD23/v4dWQ4
 J+comHnnOQiu3+IYsOml/pdcZp4DqO1I2qSDpq8NYQD1Xr+dE8cT/9rqGrrv/Pcgi9Yw
 nlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQnwLM4dHzJRAnTfJIXhUQMR/ExLuRw9KF4MfB1j53g=;
 b=udqOyxxZpDbj8ykpLBgx0uIhYsNeFVnti8zw5UToRFAuX53d61s++AhkKGAMRsL6MU
 9609izitPsBdY+JMCeTIVG9nT1Ep8ieyw2o3KUZU17C8qu+SjSciUQtXYxI88ha4mPXV
 7li4RLsfAiMDSMsFt8prVO8i+G3eLBHRZssjy66u4gAz+GpoyR4kZeqa8CCsEijhz0kM
 VoiWqejLPJGlmUhyVumaEKZxYUl8Fk22o6uDprfEO+UfhoFY3VDTvoYLGrC1doXV7WKC
 rA6Hi8wobA/9t3bV+Qa3G5Mp5P25AEZk0/Emt1S1pzo9YSHPC2uPUsAO/HRbVMlGF2B8
 SEOg==
X-Gm-Message-State: AOAM530n3U8cySPmQxmyrHrp9pi8KZI90B1TZjwBTLsdTjBRR8mOofSA
 /nP/++4iGix6AMHDpKPW6UwrwNz6HGG9+/+2
X-Google-Smtp-Source: ABdhPJzm11Z34Nqrnp+qvsYMrTkcaR7D2rExSpbg+/9OJiJa4mSJ6ucaTtuHJAAE+GQf5g0kqlgVqg==
X-Received: by 2002:aa7:92c7:: with SMTP id k7mr19149604pfa.239.1597863602281; 
 Wed, 19 Aug 2020 12:00:02 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:00:01 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:52 +0530
Message-Id: <20200819185654.151170-11-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 10/12] fbdev: vt8623fb: use
	generic power management
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

The vt8623_pci_suspend() is not designed to function in the case of Freeze.
Thus, the code checked for "if (state.event == PM_EVENT_FREEZE....)". This
is because, in the legacy framework, this callback was invoked even in the
event of Freeze. Hence, added the load of unnecessary function-call.

The goal can be achieved by binding the callback with only ".suspend" and
".poweroff" in the "vt8623_pci_pm_ops" const variable. This also avoids the
step of checking "state.event == PM_EVENT_FREEZE" every time the callback
is invoked.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/vt8623fb.c | 41 ++++++++++++++--------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 7b3eef1b893f..c488e0117758 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -815,12 +815,11 @@ static void vt8623_pci_remove(struct pci_dev *dev)
 }
 
 
-#ifdef CONFIG_PM
 /* PCI suspend */
 
-static int vt8623_pci_suspend(struct pci_dev* dev, pm_message_t state)
+static int __maybe_unused vt8623_pci_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct vt8623fb_info *par = info->par;
 
 	dev_info(info->device, "suspend\n");
@@ -828,7 +827,7 @@ static int vt8623_pci_suspend(struct pci_dev* dev, pm_message_t state)
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
-	if ((state.event == PM_EVENT_FREEZE) || (par->ref_count == 0)) {
+	if (par->ref_count == 0) {
 		mutex_unlock(&(par->open_lock));
 		console_unlock();
 		return 0;
@@ -836,10 +835,6 @@ static int vt8623_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
@@ -849,9 +844,9 @@ static int vt8623_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 /* PCI resume */
 
-static int vt8623_pci_resume(struct pci_dev* dev)
+static int __maybe_unused vt8623_pci_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct vt8623fb_info *par = info->par;
 
 	dev_info(info->device, "resume\n");
@@ -862,14 +857,6 @@ static int vt8623_pci_resume(struct pci_dev* dev)
 	if (par->ref_count == 0)
 		goto fail;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-
-	if (pci_enable_device(dev))
-		goto fail;
-
-	pci_set_master(dev);
-
 	vt8623fb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -879,10 +866,17 @@ static int vt8623_pci_resume(struct pci_dev* dev)
 
 	return 0;
 }
-#else
-#define vt8623_pci_suspend NULL
-#define vt8623_pci_resume NULL
-#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops vt8623_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= vt8623_pci_suspend,
+	.resume		= vt8623_pci_resume,
+	.freeze		= NULL,
+	.thaw		= vt8623_pci_resume,
+	.poweroff	= vt8623_pci_suspend,
+	.restore	= vt8623_pci_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
 
 /* List of boards that we are trying to support */
 
@@ -898,8 +892,7 @@ static struct pci_driver vt8623fb_pci_driver = {
 	.id_table	= vt8623_devices,
 	.probe		= vt8623_pci_probe,
 	.remove		= vt8623_pci_remove,
-	.suspend	= vt8623_pci_suspend,
-	.resume		= vt8623_pci_resume,
+	.driver.pm	= &vt8623_pci_pm_ops,
 };
 
 /* Cleanup */
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
