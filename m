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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25900C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:59:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E767E20774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czbuPi5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E767E20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D100685D6E;
	Mon, 10 Aug 2020 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiGch2aLfDt3; Mon, 10 Aug 2020 18:59:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DAF585D52;
	Mon, 10 Aug 2020 18:59:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDD4C013C;
	Mon, 10 Aug 2020 18:59:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0ADAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AEB36877C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dftts8GrSDva
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EB7787781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:48 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t10so5514158plz.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITe/X6Xdx2CY6PsGQ/PduP0lNpkYq6j7vCmUAE4nQQU=;
 b=czbuPi5aq2XuD3n/veDuyK14hELrmZZeTQMlep+v0poheUKc/VGPDdaT3NGxicOZva
 nV/ngVMDinb52OW5KIsARx9WODXexCfN5ctiykdzyh5PxaDvtI1Yk4AXTFZxAXVcZu9I
 yjQ2mZTizSoPt4DuEpazlR61p+rT74RYezw6+TV8W+rjG93z8n5xeXTpFVm5FfoI3i3x
 ciqh4/PSLKbyhVQAg4eBcl2Ex0LaGKhfCl6rwNr6i6QESouOOkjJ8onckjM78SCI9Gio
 lCPj9c97zOEPE6mP0ldBLP+93GLitOE3juMoyVHuVs4cquYNurzkT5gPHX840vtNvLBq
 dTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ITe/X6Xdx2CY6PsGQ/PduP0lNpkYq6j7vCmUAE4nQQU=;
 b=H2OCSzBrAZjc9El2hi+ThK0VQu9O3TBWt65hnODPgf/WMXsL9lBj0rRbiH7R4BLL8x
 4qA99QUI4000AkeAgsvgqqM3nw03IlJAUEGA4DILlAYgVzJa9iuBkItpOTyBR/0uVjsE
 ainvL9epEwl/zUvguQlpg8oKa5S83b62vzpSsdleiO2iHGQUcZVtvw/4aUgdEDHpbL6Z
 NIBtO/VSygas73W7yOpxZlMLHgRzeF/M4IlcZA5J0Im99E1YoQWmtiHYNv5dbwhUsSID
 G16abyVogUIraJWrh3LpkNpudZIDPIRRpiQnRdAk6frYTVXbI6mtYisxQ7seNJ+VB3az
 xQxg==
X-Gm-Message-State: AOAM531WNb+J1HZik9Px/LsDICUkvS5RmN/90ulargtAmGL9MM8GQPao
 YJbQKlxka0IRwM/Jfps3ADY=
X-Google-Smtp-Source: ABdhPJyGCzd/g3kP7yTryz4gYqh3FqhtFV+ScqA2qpYpbUkOAXoXjPpd6Ub0MyoApFlIKxoFeh63TQ==
X-Received: by 2002:a17:90b:581:: with SMTP id t1mr670372pjz.215.1597085987631; 
 Mon, 10 Aug 2020 11:59:47 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:47 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:15 +0530
Message-Id: <20200810185723.15540-5-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 04/12] fbdev: aty: use generic
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
 drivers/video/fbdev/aty/atyfb_base.c | 50 ++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index b0ac895e5ac9..a24d5bf6ade1 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -132,8 +132,8 @@
 #define PRINTKI(fmt, args...)	printk(KERN_INFO "atyfb: " fmt, ## args)
 #define PRINTKE(fmt, args...)	printk(KERN_ERR "atyfb: " fmt, ## args)
 
-#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
-defined (CONFIG_FB_ATY_GENERIC_LCD) || defined(CONFIG_FB_ATY_BACKLIGHT)
+#if defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_GENERIC_LCD) || \
+defined(CONFIG_FB_ATY_BACKLIGHT)
 static const u32 lt_lcd_regs[] = {
 	CNFG_PANEL_LG,
 	LCD_GEN_CNTL_LG,
@@ -175,7 +175,7 @@ u32 aty_ld_lcd(int index, const struct atyfb_par *par)
 		return aty_ld_le32(LCD_DATA, par);
 	}
 }
-#endif /* defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
+#endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
 
 #ifdef CONFIG_FB_ATY_GENERIC_LCD
 /*
@@ -1994,7 +1994,7 @@ static int atyfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 
 
 
-#if defined(CONFIG_PM) && defined(CONFIG_PCI)
+#if defined(CONFIG_PCI)
 
 #ifdef CONFIG_PPC_PMAC
 /* Power management routines. Those are used for PowerBook sleep.
@@ -2055,8 +2055,9 @@ static int aty_power_mgmt(int sleep, struct atyfb_par *par)
 }
 #endif /* CONFIG_PPC_PMAC */
 
-static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int atyfb_pci_suspend_late(struct device *dev, pm_message_t state)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 
@@ -2082,7 +2083,6 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	 * first save the config space content so the core can
 	 * restore it properly on resume.
 	 */
-	pci_save_state(pdev);
 
 #ifdef CONFIG_PPC_PMAC
 	/* Set chip to "suspend" mode */
@@ -2094,8 +2094,6 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		console_unlock();
 		return -EIO;
 	}
-#else
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 #endif
 
 	console_unlock();
@@ -2105,6 +2103,21 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
+static int __maybe_unused atyfb_pci_suspend(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused atyfb_pci_hibernate(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused atyfb_pci_freeze(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static void aty_resume_chip(struct fb_info *info)
 {
 	struct atyfb_par *par = info->par;
@@ -2119,8 +2132,9 @@ static void aty_resume_chip(struct fb_info *info)
 			aty_ld_le32(BUS_CNTL, par) | BUS_APER_REG_DIS, par);
 }
 
-static int atyfb_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused atyfb_pci_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 
@@ -2162,7 +2176,18 @@ static int atyfb_pci_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /*  defined(CONFIG_PM) && defined(CONFIG_PCI) */
+static const struct dev_pm_ops atyfb_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= atyfb_pci_suspend,
+	.resume		= atyfb_pci_resume,
+	.freeze		= atyfb_pci_freeze,
+	.thaw		= atyfb_pci_resume,
+	.poweroff	= atyfb_pci_hibernate,
+	.restore	= atyfb_pci_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
+
+#endif /*  defined(CONFIG_PCI) */
 
 /* Backlight */
 #ifdef CONFIG_FB_ATY_BACKLIGHT
@@ -3801,10 +3826,7 @@ static struct pci_driver atyfb_driver = {
 	.id_table	= atyfb_pci_tbl,
 	.probe		= atyfb_pci_probe,
 	.remove		= atyfb_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= atyfb_pci_suspend,
-	.resume		= atyfb_pci_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &atyfb_pci_pm_ops,
 };
 
 #endif /* CONFIG_PCI */
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
