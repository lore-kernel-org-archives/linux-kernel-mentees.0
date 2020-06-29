Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4741EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184452335A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMQ90uHU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 184452335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9505863DD;
	Mon, 29 Jun 2020 08:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERvCBdei_gJL; Mon, 29 Jun 2020 08:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7EA078630F;
	Mon, 29 Jun 2020 08:17:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AEF5C0865;
	Mon, 29 Jun 2020 08:17:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13550C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFAEB204FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1MImycYXDfn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id E9EA4203A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e9so7945425pgo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arjTPx8IlIG3Faejt7byV8E3hxyauMop9P6uXWb4FG0=;
 b=AMQ90uHUA7E18kK7PM3qs+qkCHIEBr/2YsGM884IGiHe8bl9IF+TBUR41PqeoaPqzx
 OmeWZ9q8OnSCLd4PphAMKt1qHDDRzq1O1bPXIAeID6K4S+G2jtr+SvWIaZSJbe/EIRL3
 65jSxbF0YxiwOJrRC4Ddx0JDQICnkKioA0K88phNtx02WNdqIcRgJwsyChCVjjKoEohN
 YBSTlTeart+jflKn18fRZ2QxC7a11LzCPeIBzC+wXl44aTLz3zfmBAljb2Te/YrtT8g0
 q9a+1suAj2hYNzwMIfsMwfzQoyE5h6XIeglbLxIJqRsUFmv3UW+i9lHeK9EON+2ZXjEX
 lUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=arjTPx8IlIG3Faejt7byV8E3hxyauMop9P6uXWb4FG0=;
 b=OA7OfMv2KMtfk3RE7g9hmI57XriOwfgJ6oxZm0c47yv3j4Oeh/AZN3M59HlqvvbEj1
 sJsCra16tmcqYOVmA3AuyQEi5/gbF4QO1ap3d7iFVgMtiqmPF+f17/hHD54/eYdVqt5A
 EFkQJnPuvWUV500q/3IeeWF77t7Hm6oLgg8eozy43SlWCfywXRvQhTu78vNd5Lv1raug
 C2sqjmMDYdAOJzomCwzh+hnAiQEsD5Zoc4iKz3iOO3D+ncl0siA+tK49oImVChyn5Ke3
 oW8mv2jm19n0jYCrJwcfuaz1QHp1Zi8AwW/qj0P11FB77HxaWpF7MvX/J94HBJBKbGTB
 Wx8A==
X-Gm-Message-State: AOAM532BNWVhn1ZpuWASCV9b0O9AczBImP/+FQOrbVHYHQB75vSdio0+
 GWRrWfmMsuBrAZcOmXfaw+w=
X-Google-Smtp-Source: ABdhPJynwBo1/481k/kTslfiIhadtlrrNybnr1PxMyeVh81m/kwbIePqoYulSXlVcW7u8ianI6gxQg==
X-Received: by 2002:a65:644d:: with SMTP id s13mr9449614pgv.103.1593418654500; 
 Mon, 29 Jun 2020 01:17:34 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id co1sm3345154pjb.34.2020.06.29.01.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:17:34 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@gmail.com>, Alex Dubov <oakad@yahoo.com>
Date: Mon, 29 Jun 2020 13:45:29 +0530
Message-Id: <20200629081531.214734-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
References: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/5] misc/tifm_7xx1.c: use generic
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(), etc.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

The driver was also using pci_enable_wake(...,..., 0) to disable wake. Use
device_wakeup_disable() instead.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/misc/tifm_7xx1.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index e6b40aa8fb42..228f2eb1d476 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -207,10 +207,9 @@ static void tifm_7xx1_switch_media(struct work_struct *work)
 	spin_unlock_irqrestore(&fm->lock, flags);
 }
 
-#ifdef CONFIG_PM
-
-static int tifm_7xx1_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused tifm_7xx1_suspend(struct device *dev_d)
 {
+	struct pci_dev *dev = to_pci_dev(dev_d);
 	struct tifm_adapter *fm = pci_get_drvdata(dev);
 	int cnt;
 
@@ -221,15 +220,13 @@ static int tifm_7xx1_suspend(struct pci_dev *dev, pm_message_t state)
 			tifm_7xx1_sock_power_off(fm->sockets[cnt]->addr);
 	}
 
-	pci_save_state(dev);
-	pci_enable_wake(dev, pci_choose_state(dev, state), 0);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
+	device_wakeup_disable(dev_d);
 	return 0;
 }
 
-static int tifm_7xx1_resume(struct pci_dev *dev)
+static int __maybe_unused tifm_7xx1_resume(struct device *dev_d)
 {
+	struct pci_dev *dev = to_pci_dev(dev_d);
 	struct tifm_adapter *fm = pci_get_drvdata(dev);
 	int rc;
 	unsigned long timeout;
@@ -242,11 +239,6 @@ static int tifm_7xx1_resume(struct pci_dev *dev)
 	if (WARN_ON(fm->num_sockets > ARRAY_SIZE(new_ids)))
 		return -ENXIO;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	rc = pci_enable_device(dev);
-	if (rc)
-		return rc;
 	pci_set_master(dev);
 
 	dev_dbg(&dev->dev, "resuming host\n");
@@ -297,13 +289,6 @@ static int tifm_7xx1_resume(struct pci_dev *dev)
 	return 0;
 }
 
-#else
-
-#define tifm_7xx1_suspend NULL
-#define tifm_7xx1_resume NULL
-
-#endif /* CONFIG_PM */
-
 static int tifm_7xx1_dummy_has_ms_pif(struct tifm_adapter *fm,
 				      struct tifm_dev *sock)
 {
@@ -424,13 +409,14 @@ static const struct pci_device_id tifm_7xx1_pci_tbl[] = {
 	{ }
 };
 
+static SIMPLE_DEV_PM_OPS(tifm_7xx1_pm_ops, tifm_7xx1_suspend, tifm_7xx1_resume);
+
 static struct pci_driver tifm_7xx1_driver = {
 	.name = DRIVER_NAME,
 	.id_table = tifm_7xx1_pci_tbl,
 	.probe = tifm_7xx1_probe,
 	.remove = tifm_7xx1_remove,
-	.suspend = tifm_7xx1_suspend,
-	.resume = tifm_7xx1_resume,
+	.driver.pm = &tifm_7xx1_pm_ops,
 };
 
 module_pci_driver(tifm_7xx1_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
