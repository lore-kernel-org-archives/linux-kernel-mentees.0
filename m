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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44B3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E2A20782
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Juf/h3g2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E2A20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C14B877A7;
	Mon, 10 Aug 2020 19:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMO4g-QDjULY; Mon, 10 Aug 2020 19:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0C9887781;
	Mon, 10 Aug 2020 19:00:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD10AC013C;
	Mon, 10 Aug 2020 19:00:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEC1CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 911DA20110
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzD0t44SMyBl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 65DEE20022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:35 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ha11so483484pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwdaUknL4rdvB5HTQUho7uy432BpLxYt1hCirGV4hmw=;
 b=Juf/h3g26+XnrEKNZVz5n2n2pGUKaCW5O6qMuYdXpvdf23cJyXEckJMPEt+gpWketC
 rDn/Hxe/6IQYtsEILl9PY+Jr5goiPi8e9ku73qjjWiorN9MFfbja/CIPoEDSFIapfuqf
 wD/c6i3A0ZL0IFLwRgmLXAYm+507s7O4STHpWEbbD6hCwmgkEszEWlrx/c0qkgBOXilT
 Gnf16CtVgclX54qUUdDuhkrHrCktTBchID8s8WVIygrYCEZtQ9m2j2GgApQAqqUERgwS
 R+I4Mxb85zRfSv47BJ8LJ3gSUVlS5/pubJGO5qzwa/CPCob1uiyoUbYi/36v5/SwaSUX
 +1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwdaUknL4rdvB5HTQUho7uy432BpLxYt1hCirGV4hmw=;
 b=mydsJ5J2n2YIi8uDvBlEkYALT/RwdfkQD14agUErx1rSVeEGeWPpNLZPBIzOi8JgbG
 4TSx4g3fqprkZb7D0KDViu/yNydxhIxa0yUN9XYHEUiq22zftDY0ZtsFaQkkM+Pq1eh2
 M+1LGJpiGeTzFXw2B3yVUISXcCJMU156z2fceqB326E625hxR095/HzEC6gDbjGwGZlb
 g2wpWG153FyiaGUUW/S9T6KdaJnfHpoWxDEJwXNeN7G0Glh0uY2+e9M5Bhi12ifvgOFr
 Vluw7nqhPCaNjL6DqpSDQ6pMjRhBw8u7a5UFiQoZpk9PsuUlDzumXNg7al6KQSSxdhKo
 53uw==
X-Gm-Message-State: AOAM530YUm4DG6hA2rjCBf16Wh1s4Pg9XhXRXm3j2yQIclozepuxSP/o
 c1BVHHbpscfGOQGlC3pEshQ=
X-Google-Smtp-Source: ABdhPJxUZto4jhAY9RUX8TuzBPuP1R5uRzCd/R3dOVFRaOOdjRibdkKzuIEL8aM1uQvu+sRJ5sDbAg==
X-Received: by 2002:a17:90b:23c8:: with SMTP id
 md8mr771000pjb.176.1597086034896; 
 Mon, 10 Aug 2020 12:00:34 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:34 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:21 +0530
Message-Id: <20200810185723.15540-11-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 10/12] fbdev: vt8623fb: use
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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
