Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A02C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813BD20774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bigsBtDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 813BD20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 361EC20370;
	Mon, 10 Aug 2020 19:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suoKfehwSH+M; Mon, 10 Aug 2020 19:00:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E2EE20027;
	Mon, 10 Aug 2020 19:00:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78BEBC013C;
	Mon, 10 Aug 2020 19:00:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A19E6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8108D85DC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0uZfGLgAifZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E5B4785D7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:02 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id mw10so477488pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3xuxPCTDSagW3xzL4fG+ocHNWklWNizDyTgB78WOog=;
 b=bigsBtDZSW3nOEhsH9wJDhxPzbB0qI4gIf/X8MwmqFua6RE4mtL8HEXDK/o8ryll37
 UB8dnk+fMML76ml/Izn965dTLDf5MMMu95fqZ8GT0pb7urHTuyCIH6U3NvgEZTfGatcq
 Q96NnN33EwNmB9rikhvHlBm93KbiEy/GPdIH61iatn2wFT/Apqe6JiF5IWptCVQdb/nx
 8sl61J+3GwJASDOrigK0c22GgKC4HliOlsigJlPFGJh2vsZP2qQpzpFmO7Uudvp/dfo+
 tIuA3Lc2e7s2eL8tnL45LAzKDpPWYd5awUKXIIeYR+E1y+rOMP33STpgso6KXepnoDYy
 6SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3xuxPCTDSagW3xzL4fG+ocHNWklWNizDyTgB78WOog=;
 b=KTR2DYxMhgzscMizSNYO9mIf8lHEvMZLNXo8YmRcNItX35udgSeqw7WT6jNG5ZN4ye
 qG0UcOKWMcSJktqfeNGEPQnuSrUwMiXluHbt/UEc7c5hueQJUrOqv7EiLzRXcKhRNtjM
 izv9LzWqfiMgtM8TQXE7rPFGDWBMQEloUAjcWb1x7O7rYYY3jJ3w0oyknlpko40yLD9O
 gHoia+lLP7ixHFFuL+Po/1FBAoJWOhfaKMm0LkP3yOSlwN/ZKA1qpIGmW7avMv4Xk32/
 JSsyPr4kTJAtdt9P/pct/iCJT61CwK+XHQNcn5bD6H+cMpThb4nouEoilgN1JRnmEIFW
 dP9g==
X-Gm-Message-State: AOAM533XW65y0ayz5DvSHjhLa5Vi356nqbdYmmtGTgimOn+GhNjDCXad
 rJ4pV++gKzMpV/Fk9OnSaUs=
X-Google-Smtp-Source: ABdhPJwUeW+XUspMQ56W2MqWPkYpzKYQZsuakITfMlwnTpMV/2zAZ1IWlloRRTLWjsowW7RwwgOr9A==
X-Received: by 2002:a17:902:c286:: with SMTP id
 i6mr24403571pld.219.1597086002471; 
 Mon, 10 Aug 2020 12:00:02 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:02 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:17 +0530
Message-Id: <20200810185723.15540-7-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 06/12] fbdev: nvidia: use generic
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

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 64 ++++++++++++++++-------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index c24de9107958..3a1a4330e0d3 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1041,10 +1041,9 @@ static struct fb_ops nvidia_fb_ops = {
 	.fb_sync        = nvidiafb_sync,
 };
 
-#ifdef CONFIG_PM
-static int nvidiafb_suspend(struct pci_dev *dev, pm_message_t mesg)
+static int nvidiafb_suspend_late(struct device *dev, pm_message_t mesg)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct nvidia_par *par = info->par;
 
 	if (mesg.event == PM_EVENT_PRETHAW)
@@ -1056,46 +1055,54 @@ static int nvidiafb_suspend(struct pci_dev *dev, pm_message_t mesg)
 		fb_set_suspend(info, 1);
 		nvidiafb_blank(FB_BLANK_POWERDOWN, info);
 		nvidia_write_regs(par, &par->SavedReg);
-		pci_save_state(dev);
-		pci_disable_device(dev);
-		pci_set_power_state(dev, pci_choose_state(dev, mesg));
 	}
-	dev->dev.power.power_state = mesg;
+	dev->power.power_state = mesg;
 
 	console_unlock();
 	return 0;
 }
 
-static int nvidiafb_resume(struct pci_dev *dev)
+static int __maybe_unused nvidiafb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
-	struct nvidia_par *par = info->par;
+	return nvidiafb_suspend_late(dev, PMSG_SUSPEND);
+}
 
-	console_lock();
-	pci_set_power_state(dev, PCI_D0);
+static int __maybe_unused nvidiafb_hibernate(struct device *dev)
+{
+	return nvidiafb_suspend_late(dev, PMSG_HIBERNATE);
+}
 
-	if (par->pm_state != PM_EVENT_FREEZE) {
-		pci_restore_state(dev);
+static int __maybe_unused nvidiafb_freeze(struct device *dev)
+{
+	return nvidiafb_suspend_late(dev, PMSG_FREEZE);
+}
 
-		if (pci_enable_device(dev))
-			goto fail;
+static int __maybe_unused nvidiafb_resume(struct device *dev)
+{
+	struct fb_info *info = dev_get_drvdata(dev);
+	struct nvidia_par *par = info->par;
 
-		pci_set_master(dev);
-	}
+	console_lock();
 
 	par->pm_state = PM_EVENT_ON;
 	nvidiafb_set_par(info);
 	fb_set_suspend (info, 0);
 	nvidiafb_blank(FB_BLANK_UNBLANK, info);
 
-fail:
 	console_unlock();
 	return 0;
 }
-#else
-#define nvidiafb_suspend NULL
-#define nvidiafb_resume NULL
-#endif
+
+static const struct dev_pm_ops nvidiafb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= nvidiafb_suspend,
+	.resume		= nvidiafb_resume,
+	.freeze		= nvidiafb_freeze,
+	.thaw		= nvidiafb_resume,
+	.poweroff	= nvidiafb_hibernate,
+	.restore	= nvidiafb_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
 
 static int nvidia_set_fbinfo(struct fb_info *info)
 {
@@ -1496,12 +1503,11 @@ static int nvidiafb_setup(char *options)
 #endif				/* !MODULE */
 
 static struct pci_driver nvidiafb_driver = {
-	.name = "nvidiafb",
-	.id_table = nvidiafb_pci_tbl,
-	.probe    = nvidiafb_probe,
-	.suspend  = nvidiafb_suspend,
-	.resume   = nvidiafb_resume,
-	.remove   = nvidiafb_remove,
+	.name      = "nvidiafb",
+	.id_table  = nvidiafb_pci_tbl,
+	.probe     = nvidiafb_probe,
+	.driver.pm = &nvidiafb_pm_ops,
+	.remove    = nvidiafb_remove,
 };
 
 /* ------------------------------------------------------------------------- *
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
