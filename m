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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735E8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4473220774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXiBXr6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4473220774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0819E877C9;
	Mon, 10 Aug 2020 19:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXcJDAkUwz81; Mon, 10 Aug 2020 18:59:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5726D87781;
	Mon, 10 Aug 2020 18:59:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 537EFC013C;
	Mon, 10 Aug 2020 18:59:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2B35C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91FA887C41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6tvNm+RnjKk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA8AA87C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:55 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r11so6119602pfl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puMAU16yPRJjcWrBBbirtIhNXaGIaRb087rXL9a93dY=;
 b=dXiBXr6E0TYKVe5evLcBJVsXAmowNxpsmGxjs5usDMfgqZiDNBp07ub/f1J2Tn/lk2
 30Ye7V77uvvn1d0xyyH5N2KwzDyNy9YtTyjXu8Oe3mZCf7acoTgeg0D/c40WRn+Zx9AV
 YLh5bOGmIOHuunBZ9CmRl1j+pacYeNhMpghSYprgJ0CXYtd1LoEF3oWPBVWQHhRsaKCA
 S21MN1pNfEesIxslEGmKrp4RxeHSa8TUV5B1G8NmqfyDxQ29+o1xJjwPATWw8JzzEJ/4
 7AhZwkOz205ia1OGQv1FWyDyUwl+tx+hfZzMKwVUv7GQQk8IVLRv5L/oqa8cPkKNYE/y
 pbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puMAU16yPRJjcWrBBbirtIhNXaGIaRb087rXL9a93dY=;
 b=FB4GBfJbeWPHPEP0yyNFMgG2VVLJBPlr1BaRr5KMJ48Fw+xxLCGczoTwiEjsRmxM73
 LWFrQKzyxYPmnR6aIzoNlyaDRx/7ZCwsGGbb1v9FBejXlkQwkf+oK2jAYvugEa0aZ8aw
 SIFfjd2CVJeBLChbxVZF93LLnALyY10EP8Abn8dZZHrTG/V5EGa7NRJvprBabxGXArBN
 I/Ff0GFSrrvMmqNn/N+aP7q1PvAFIr1qYIzqHCgE++VYD5DLoGphuwE3xg2LTxC8LXpm
 u2MbaPlyW9YqhwhLUJ7bkjn4HIZ2d6NbBa7mXUSt0I0ehew8nZCY2UuuGgqkC+qKiCeo
 f/bw==
X-Gm-Message-State: AOAM533t1tXpzcSriMceChQIx+CCjVHtNQiyrygKC/+647YJUiUVYfaw
 ns7JWdvppMNgFdk3249nLQI=
X-Google-Smtp-Source: ABdhPJw/8SWq4UyW3sAzJltPdzA+52NELmb6lAQ+XEPrB165bwZBbAYZXhx32FFAx3Jit3f0k7T6fQ==
X-Received: by 2002:a63:aa04:: with SMTP id e4mr7515802pgf.318.1597085995343; 
 Mon, 10 Aug 2020 11:59:55 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:54 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:16 +0530
Message-Id: <20200810185723.15540-6-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 05/12] fbdev: aty128fb: use
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
 drivers/video/fbdev/aty/aty128fb.c | 51 ++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index d05d4195acad..dd7762fea058 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -162,10 +162,22 @@ static char * const r128_family[] = {
 static int aty128_probe(struct pci_dev *pdev,
                                const struct pci_device_id *ent);
 static void aty128_remove(struct pci_dev *pdev);
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state);
-static int aty128_pci_resume(struct pci_dev *pdev);
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state);
+static int __maybe_unused aty128_pci_suspend(struct device *dev);
+static int __maybe_unused aty128_pci_hibernate(struct device *dev);
+static int __maybe_unused aty128_pci_freeze(struct device *dev);
+static int __maybe_unused aty128_pci_resume(struct device *dev);
 static int aty128_do_resume(struct pci_dev *pdev);
 
+static const struct dev_pm_ops aty128_pci_pm_ops = {
+	.suspend	= aty128_pci_suspend,
+	.resume		= aty128_pci_resume,
+	.freeze		= aty128_pci_freeze,
+	.thaw		= aty128_pci_resume,
+	.poweroff	= aty128_pci_hibernate,
+	.restore	= aty128_pci_resume,
+};
+
 /* supported Rage128 chipsets */
 static const struct pci_device_id aty128_pci_tbl[] = {
 	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RAGE128_LE,
@@ -272,8 +284,7 @@ static struct pci_driver aty128fb_driver = {
 	.id_table	= aty128_pci_tbl,
 	.probe		= aty128_probe,
 	.remove		= aty128_remove,
-	.suspend	= aty128_pci_suspend,
-	.resume		= aty128_pci_resume,
+	.driver.pm	= &aty128_pci_pm_ops,
 };
 
 /* packed BIOS settings */
@@ -2320,7 +2331,6 @@ static int aty128fb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
 static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 {
 	u32	pmgt;
-	struct pci_dev *pdev = par->pdev;
 
 	if (!par->pdev->pm_cap)
 		return;
@@ -2347,23 +2357,15 @@ static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 		aty_st_le32(BUS_CNTL1, 0x00000010);
 		aty_st_le32(MEM_POWER_MISC, 0x0c830000);
 		msleep(100);
-
-		/* Switch PCI power management to D2 */
-		pci_set_power_state(pdev, PCI_D2);
 	}
 }
 
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct aty128fb_par *par = info->par;
 
-	/* Because we may change PCI D state ourselves, we need to
-	 * first save the config space content so the core can
-	 * restore it properly on resume.
-	 */
-	pci_save_state(pdev);
-
 	/* We don't do anything but D2, for now we return 0, but
 	 * we may want to change that. How do we know if the BIOS
 	 * can properly take care of D3 ? Also, with swsusp, we
@@ -2422,6 +2424,21 @@ static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
+static int __maybe_unused aty128_pci_suspend(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused aty128_pci_hibernate(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused aty128_pci_freeze(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static int aty128_do_resume(struct pci_dev *pdev)
 {
 	struct fb_info *info = pci_get_drvdata(pdev);
@@ -2468,12 +2485,12 @@ static int aty128_do_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-static int aty128_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused aty128_pci_resume(struct device *dev)
 {
 	int rc;
 
 	console_lock();
-	rc = aty128_do_resume(pdev);
+	rc = aty128_do_resume(to_pci_dev(dev));
 	console_unlock();
 
 	return rc;
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
