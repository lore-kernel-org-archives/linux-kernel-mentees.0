Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BDDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387E520774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO+/AjBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387E520774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BFFC87C9F;
	Mon, 10 Aug 2020 19:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2rbGaPoFZnf; Mon, 10 Aug 2020 19:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F9BD87C30;
	Mon, 10 Aug 2020 19:00:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C3DFC013C;
	Mon, 10 Aug 2020 19:00:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CC64C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3934A877C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW6MMrjBdG2U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B785687781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t11so5522157plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mzrXpDqX5i6vQZwjLr9S3RbpzEaKALa8Egnl+iixcM=;
 b=KO+/AjBTIwJEYPClBBf++vl71rCcmJ6mVDRfCXBJWqjCIwlWBlZVjNwoLJDK0XKw0J
 KN1e/UyOXJAsM2VUeFpXLMM6ud22P/z6v/vYXN+O/LKJNGBk0AC3l3TrCiFw8SnHFVP4
 gt4CE3k7Nr6fBjXgtRPWoRJwEcxY2BW1c6b3pMvhoti86z0RlVEVUsvrnkIfuFuS8LmU
 KsoXacgTEcozPBXOnWR8DAo5Rp1vbsr0KhvWKeEEVJKceJUHj4bVB48DCjeILPxd6jvo
 GRIfTX7Sw0nNtnZ3Ji6MoDu0fbhjq20+lgDqGpNl/CNSxN9QBCnJ66NGElsHEFDpBZt2
 yUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mzrXpDqX5i6vQZwjLr9S3RbpzEaKALa8Egnl+iixcM=;
 b=i2MW6mJkhcpSuWwFEu9oVKTqCib4aryOBMUOqo7Ra//MwibMHmz5LTkmbtfxqv0bxw
 zSCFZRu+V3+jJOnlLcPyK50y5MEAkixr+abRCa/2FozHB4dGP4GpImkX9zkYAGDpphmn
 J73ruKjkKjkAIThCfheqVbML6B2xLmCoMUOc27XzZy32rcEPD1SVB42k9yDolzFvvcQk
 mqa1RvBHrFn+k5MNfjyOfGDE5ngp0oiMktvlrN+JYpkeRuyPIlinE5ivgrxXP41LgHS5
 9iFF7Hfh1TdQ7KbHKtH6nCaGkbsjIBkDON2ZNL0pTmfSBFDxfQWj4Pif1J8Nez0+lczH
 9gLw==
X-Gm-Message-State: AOAM532lbu6bqO4SLuj7YNsVDNjXonS53WGxkG2UNOhX7mPvipCucWMR
 SKr+Flb4/V1Xtq1VDYGcDD0=
X-Google-Smtp-Source: ABdhPJw0ejL2XMFYue6TPVCj5nsTa/sv61cNxlaGSOGH2vUT0Pg61qnaVXZudCp2WQgRwKmPh13J1Q==
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr719824pjb.51.1597086012300; 
 Mon, 10 Aug 2020 12:00:12 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:18 +0530
Message-Id: <20200810185723.15540-8-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810185723.15540-1-vaibhavgupta40@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v2 07/12] fbdev: savagefb: use
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

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/savage/savagefb_driver.c | 52 ++++++++++++--------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 3c8ae87f0ea7..d6aae759e90f 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2346,9 +2346,9 @@ static void savagefb_remove(struct pci_dev *dev)
 	}
 }
 
-static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
+static int savagefb_suspend_late(struct device *dev, pm_message_t mesg)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct savagefb_par *par = info->par;
 
 	DBG("savagefb_suspend");
@@ -2356,7 +2356,7 @@ static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
 	if (mesg.event == PM_EVENT_PRETHAW)
 		mesg.event = PM_EVENT_FREEZE;
 	par->pm_state = mesg.event;
-	dev->dev.power.power_state = mesg;
+	dev->power.power_state = mesg;
 
 	/*
 	 * For PM_EVENT_FREEZE, do not power down so the console
@@ -2374,17 +2374,29 @@ static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
 	savagefb_blank(FB_BLANK_POWERDOWN, info);
 	savage_set_default_par(par, &par->save);
 	savage_disable_mmio(par);
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, mesg));
 	console_unlock();
 
 	return 0;
 }
 
-static int savagefb_resume(struct pci_dev* dev)
+static int __maybe_unused savagefb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	return savagefb_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused savagefb_hibernate(struct device *dev)
+{
+	return savagefb_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused savagefb_freeze(struct device *dev)
+{
+	return savagefb_suspend_late(dev, PMSG_FREEZE);
+}
+
+static int __maybe_unused savagefb_resume(struct device *dev)
+{
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct savagefb_par *par = info->par;
 	int cur_state = par->pm_state;
 
@@ -2396,20 +2408,11 @@ static int savagefb_resume(struct pci_dev* dev)
 	 * The adapter was not powered down coming back from a
 	 * PM_EVENT_FREEZE.
 	 */
-	if (cur_state == PM_EVENT_FREEZE) {
-		pci_set_power_state(dev, PCI_D0);
+	if (cur_state == PM_EVENT_FREEZE)
 		return 0;
-	}
 
 	console_lock();
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-
-	if (pci_enable_device(dev))
-		DBG("err");
-
-	pci_set_master(dev);
 	savage_enable_mmio(par);
 	savage_init_hw(par);
 	savagefb_set_par(info);
@@ -2420,6 +2423,16 @@ static int savagefb_resume(struct pci_dev* dev)
 	return 0;
 }
 
+static const struct dev_pm_ops savagefb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= savagefb_suspend,
+	.resume		= savagefb_resume,
+	.freeze		= savagefb_freeze,
+	.thaw		= savagefb_resume,
+	.poweroff	= savagefb_hibernate,
+	.restore	= savagefb_resume,
+#endif
+};
 
 static const struct pci_device_id savagefb_devices[] = {
 	{PCI_VENDOR_ID_S3, PCI_CHIP_SUPSAV_MX128,
@@ -2500,8 +2513,7 @@ static struct pci_driver savagefb_driver = {
 	.name =     "savagefb",
 	.id_table = savagefb_devices,
 	.probe =    savagefb_probe,
-	.suspend =  savagefb_suspend,
-	.resume =   savagefb_resume,
+	.driver.pm = &savagefb_pm_ops,
 	.remove =   savagefb_remove,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
