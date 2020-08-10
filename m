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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037B7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD65420782
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfIC0l+q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD65420782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 745DB85D6C;
	Mon, 10 Aug 2020 19:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlNS9MEozSMU; Mon, 10 Aug 2020 19:00:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 004AC85D59;
	Mon, 10 Aug 2020 19:00:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0BCEC013C;
	Mon, 10 Aug 2020 19:00:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68F78C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A9B620380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TUDbcjvL2YY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 6F8E220110
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g19so5544553plq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+174NPN5cAUcf6KvtsV0Xpgm37coEdke8RyoD2D7Ak=;
 b=XfIC0l+qtuFLY5WzdRxHWjMwbOKObVzDTzniqDiZ1cjXBSyr01K921ZPVsmzFKeO/8
 /KfYYuOz+4H63OM45aMQ2cAYNVs0izkwa0eHLowgDJZ84f9TOTNHwPuKo3WHWS8YispL
 j1nwaXnnFtcHlIdENaQIlwfdWl98bx0IqDAhuOKwIVkkI7McegP6DJVotXolhVp69OMY
 ev7FJeNLM/wyWr8TPU2arOhEerY3oyHUMl0CrRarjueBjEAKJM8/PRvvt3vfCqn9cMR2
 8pArOdp5XsEj5hq6j/Cb9E7+uk2gzm67X7bL2AtWUDsuCABpfEmW9+QmkSUlMVjsT92e
 S/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+174NPN5cAUcf6KvtsV0Xpgm37coEdke8RyoD2D7Ak=;
 b=QpxDKO09l4PgjkaUcfuQpKJRYiVQSmOr1Xki8H+E6KPQFZrOMmReKrvUEkMQydC6RN
 X0oVxB2r70GAwDMl5rklybN4FL8jdeyHhYkdeTd3jQ+TuZ0CZEm9G/QqHhBGhUY52d7u
 ts6AXcml2ObnxGYxpWRUatTFzMSFppL9dPI+tnZ0kLF+2gkNLf3ARbpoKZEMTxwb7Orj
 RLMGGjNDvDQi12qbeRPwQhI7PG4gfVrd0nGfG1S9JEoYli3H5WL/lruZ1Wu52laqs3pc
 D6gdJE0jAUxG92Auq5ziMcKN0Tgq0sZOQ8NMM38q1khoOo4myyYrYaSJ3f4HyOZeM5C3
 ZM1Q==
X-Gm-Message-State: AOAM531RpT1bDZ/DaSpmSHRHH6/tT+ZPpSbwv/Ap70DEubqDg6MH4lz5
 oHMUmpsbN7T4lOyIj6Og8W8=
X-Google-Smtp-Source: ABdhPJxt23r0SFVVEHLjk3fUIuS+XluMj98GM01cCkKsQcmnOLrOSdIgi+TvLREGQy1zK92jrxYbjg==
X-Received: by 2002:a17:90a:4e8f:: with SMTP id
 o15mr685304pjh.220.1597086041938; 
 Mon, 10 Aug 2020 12:00:41 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:41 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:22 +0530
Message-Id: <20200810185723.15540-12-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 11/12] fbdev: s3fb: use generic
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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
