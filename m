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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B625C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A09C2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSsPXgdb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A09C2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF0BF85BCA;
	Wed, 19 Aug 2020 18:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifla8fBjZXM4; Wed, 19 Aug 2020 18:59:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A2BC85725;
	Wed, 19 Aug 2020 18:59:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2969BC07FF;
	Wed, 19 Aug 2020 18:59:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86881C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75CBE860EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4WHCArdeDhR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 78A70844AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d19so11833691pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SwW9DvsaTVzEe8rYytiBA176ZEm49NeUyegN/TvZxk=;
 b=YSsPXgdbsE6HMZQBWbvHa516SeqorDSP49+EHMEd67zIXPQeYtQtmOAjF56GHZ4ENC
 Xes44b5QftvrU0bHvqmBY/RJBqIT/mqJOJMuwq5oR550n1Dt39WkwKAtb56Jp/BNpapU
 n5xcaM+eXqCMXR11855GweHH4jxNv8qQVFzY8PxtYAY32anTsYLwg42iteXgiQv3cVoH
 jyaR9706HrP9cwbBlREmMl7vs9xrggzmsyU2mJgfjvc/r1XVeumsdfG61K8EDi+P9Vx0
 xOhdUfcyDgzEOOsSKCza8JUml+9+kIoZ2cc/CG4h5ByYWhQfiFmQ0so34lSoaOfYBJV1
 kbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SwW9DvsaTVzEe8rYytiBA176ZEm49NeUyegN/TvZxk=;
 b=PKenxs3MjEzVCsdmx57JMuJEpt31LxfcYHMPUhPZuqyaKZPuwtuZMzVP9LNBIfHRwQ
 zlXm/8tOdvoeprzHDs1QUfGijvm941KzoKKFvREdM9E2f1YvGELdDyMPcxQ1nhJg9Ei5
 J2bKMe/CcollN0uH2b4TRL5ivXnhg+vQUzZSr0T0HOwj8paL9N9ofajwjsNCoRXW1JtY
 USF55nodw5Gtn4PwDSi1TaagbrPtfADFI5E7jJ+Dnoi0rmBvroNToEVcRuWMUaDw+QXA
 PAbxZLDu+UmbFQiaetipctvRw7kdWIOBUnJaxiZ/jNZbOC/IB6nNIkeYVBJXgA7o5XOF
 FBGg==
X-Gm-Message-State: AOAM532WZGDozB3a8OVZE9IifIeBazS7PLGbUPECuBOfJp6tYRuH/G+X
 tbaZAoPsdlRnzsbryCKkuMM=
X-Google-Smtp-Source: ABdhPJzlZoB9mX9uX/0f4umZ3wploRhwn9d7X9NR1Pk93n4y87Cd9Zl8KupRYvEiMnjWyJTmoxrHHQ==
X-Received: by 2002:aa7:8757:: with SMTP id g23mr20042724pfo.283.1597863564965; 
 Wed, 19 Aug 2020 11:59:24 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:24 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:46 +0530
Message-Id: <20200819185654.151170-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 04/12] fbdev: aty: use generic
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

Now,
- atyfb_pci_suspend() had a "pm_message_t" type parameter as per legacy
  PCI PM framework, that got deprecated in generic.
- Rename the callback as atyfb_pci_suspend_late() and preserve the
  parameter.
- Define 3 new callbacks as:
        * atyfb_pci_suspend()
        * atyfb_pci_freeze()
        * atyfb_pci_hibernate()
  which in turn call atyfb_pci_suspend_late() by passing appropriate
  value for "pm_message_t" type parameter.
- Bind the callbacks in "struct dev_pm_ops" type variable
  "atyfb_pci_pm_ops".

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
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
