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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76FAC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846AF2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBcnrI+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846AF2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3201F8573E;
	Wed, 19 Aug 2020 18:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-e9xW3z-4za; Wed, 19 Aug 2020 18:59:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F17E085725;
	Wed, 19 Aug 2020 18:59:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0126C07FF;
	Wed, 19 Aug 2020 18:59:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E52EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A822860F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dp37PS55A0aV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00294860EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:11 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d22so12148908pfn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EueH97o6VIVtEIiLMj1CkjU5GKTUR/PQiOa7YU1wTr0=;
 b=NBcnrI+ILjh3jELjrGG+qDgvlGLTfpZWaAD8dfjOYKDeId+yC5B/nedpjjEDPs7MJt
 ibC4avtU4xcpmoE5ULoOcJAmmYq4qNB7MUEmgYPubcHq2yGCcKTDG+yTvrs6xY1+duLn
 MJoV/YDWfMQJJ8xM1MvvfzlICMUDpBWEKZyOkmSI0S6rGlGxJwU4BMhwzeeaBJLpAhWn
 Y/q7sMI+06WGFnSR1Jku2olJy2n4ROcztnPEXC78DSlVZPg1TDbD1jchPUnoa6BdHZR+
 S0WZ/lmNZ5AcpUf6QP4Im7SBijhLCA2/2VprKYFChPl+VrA5wp86Ko3I6BpmT9eL2O6M
 kGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EueH97o6VIVtEIiLMj1CkjU5GKTUR/PQiOa7YU1wTr0=;
 b=g2HV0RB6iuLjp7VkNmvRlN3b93GIz4+tGUVudRNocBdQqWt5AKYYqqem9QH9hMWqRk
 0KbvVH1mxZSUdlKFTdwx5RdL1Zp+hS4ILB9YlxzKEVPP33OXMUKNxBvKwXBsMi7969Ns
 nUpZZZctpvtUzNulbQV9aZovV8JmSfiMtN7mMF/DQKsU6W9F1xx458tFBeZDFyyEmHsB
 qQjSoZoHSyaICxEVlVus/PkOHMRkPuONvugK70JDDUGLOaZ+Z9peqAJ0l2szt2IoSUVB
 9n4ESfP/eABuXKUysGuyrqUAJPsbv7LnasxKGVNU1xeq2GBlN77nD7bxTTKKqHIrSGdA
 BRDQ==
X-Gm-Message-State: AOAM533zUV8hYt3WLij2kwidufpv/O7uvTItCt/agtKXL64PpERgtXtk
 6YXiZjjoLihJgN9QQqobeyo=
X-Google-Smtp-Source: ABdhPJzycF9YEJOQ5XOCi+2XKILR/b07UiFGPGDk2y6A/OtI9ObJBJksHh+9i+w9mHTz6yRi1btLzQ==
X-Received: by 2002:a63:de4e:: with SMTP id y14mr18144996pgi.106.1597863551453; 
 Wed, 19 Aug 2020 11:59:11 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:44 +0530
Message-Id: <20200819185654.151170-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 02/12] fbdev: lxfb: use generic
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

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. This way we can
remove the legacy .suspend & .resume bindings from "lxfb_driver".

The lxfb_suspend() is designed to function only in the case of Suspend.
Thus, the code was kept inside "if (state.event == PM_EVENT_SUSPEND)"
container. This is because, in the legacy framework, this callback was
invoked even in the event of Freeze and Hibernate. Hence, added the load of
unnecessary function-calls.

The goal can be achieved by binding the callback with only
"lxfb_pm_ops.suspend" in the new framework. This also avoids the step of
checking "if (state.event == PM_EVENT_SUSPEND)" every time the callback is
invoked.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/geode/lxfb.h      |  5 ----
 drivers/video/fbdev/geode/lxfb_core.c | 37 +++++++++++++++------------
 drivers/video/fbdev/geode/lxfb_ops.c  |  4 ---
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/geode/lxfb.h b/drivers/video/fbdev/geode/lxfb.h
index ef24bf6d49dc..d37b32dbcd68 100644
--- a/drivers/video/fbdev/geode/lxfb.h
+++ b/drivers/video/fbdev/geode/lxfb.h
@@ -29,7 +29,6 @@ struct lxfb_par {
 	void __iomem *gp_regs;
 	void __iomem *dc_regs;
 	void __iomem *vp_regs;
-#ifdef CONFIG_PM
 	int powered_down;
 
 	/* register state, for power mgmt functionality */
@@ -50,7 +49,6 @@ struct lxfb_par {
 	uint32_t hcoeff[DC_HFILT_COUNT * 2];
 	uint32_t vcoeff[DC_VFILT_COUNT];
 	uint32_t vp_coeff[VP_COEFF_SIZE / 4];
-#endif
 };
 
 static inline unsigned int lx_get_pitch(unsigned int xres, int bpp)
@@ -64,11 +62,8 @@ int lx_blank_display(struct fb_info *, int);
 void lx_set_palette_reg(struct fb_info *, unsigned int, unsigned int,
 			unsigned int, unsigned int);
 
-#ifdef CONFIG_PM
 int lx_powerdown(struct fb_info *info);
 int lx_powerup(struct fb_info *info);
-#endif
-
 
 /* Graphics Processor registers (table 6-29 from the data book) */
 enum gp_registers {
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index adc2d9c2395e..66c81262d18f 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -443,17 +443,14 @@ static struct fb_info *lxfb_init_fbinfo(struct device *dev)
 	return info;
 }
 
-#ifdef CONFIG_PM
-static int lxfb_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused lxfb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 
-	if (state.event == PM_EVENT_SUSPEND) {
-		console_lock();
-		lx_powerdown(info);
-		fb_set_suspend(info, 1);
-		console_unlock();
-	}
+	console_lock();
+	lx_powerdown(info);
+	fb_set_suspend(info, 1);
+	console_unlock();
 
 	/* there's no point in setting PCI states; we emulate PCI, so
 	 * we don't end up getting power savings anyways */
@@ -461,9 +458,9 @@ static int lxfb_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int lxfb_resume(struct pci_dev *pdev)
+static int __maybe_unused lxfb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	int ret;
 
 	console_lock();
@@ -477,10 +474,6 @@ static int lxfb_resume(struct pci_dev *pdev)
 	console_unlock();
 	return 0;
 }
-#else
-#define lxfb_suspend NULL
-#define lxfb_resume NULL
-#endif
 
 static int lxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -600,13 +593,23 @@ static struct pci_device_id lxfb_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, lxfb_id_table);
 
+static const struct dev_pm_ops lxfb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= lxfb_suspend,
+	.resume		= lxfb_resume,
+	.freeze		= NULL,
+	.thaw		= lxfb_resume,
+	.poweroff	= NULL,
+	.restore	= lxfb_resume,
+#endif
+};
+
 static struct pci_driver lxfb_driver = {
 	.name		= "lxfb",
 	.id_table	= lxfb_id_table,
 	.probe		= lxfb_probe,
 	.remove		= lxfb_remove,
-	.suspend	= lxfb_suspend,
-	.resume		= lxfb_resume,
+	.driver.pm	= &lxfb_pm_ops,
 };
 
 #ifndef MODULE
diff --git a/drivers/video/fbdev/geode/lxfb_ops.c b/drivers/video/fbdev/geode/lxfb_ops.c
index 5be8bc62844c..b3a041fce570 100644
--- a/drivers/video/fbdev/geode/lxfb_ops.c
+++ b/drivers/video/fbdev/geode/lxfb_ops.c
@@ -580,8 +580,6 @@ int lx_blank_display(struct fb_info *info, int blank_mode)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-
 static void lx_save_regs(struct lxfb_par *par)
 {
 	uint32_t filt;
@@ -837,5 +835,3 @@ int lx_powerup(struct fb_info *info)
 	par->powered_down = 0;
 	return 0;
 }
-
-#endif
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
