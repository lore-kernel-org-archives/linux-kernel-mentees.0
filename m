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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F717C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59D3207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e09DB0UN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59D3207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 898F020110;
	Mon, 10 Aug 2020 19:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l53CwrRZ9xPc; Mon, 10 Aug 2020 19:00:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BACDD20022;
	Mon, 10 Aug 2020 19:00:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A088AC013C;
	Mon, 10 Aug 2020 19:00:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96A73C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F4A285D6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiGqcaNARJ1J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9202B85D59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u20so6139898pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUIX3oUq+BAamlZJBJ9IeD9BMm5oq8vVqQ2hIGTjUng=;
 b=e09DB0UN479Wa7sOUsksxC+y9mEDbv+QeRkQHDjr1Qt60svQT4MdFY5VxfTOAgjpMG
 L2+ffCpqK+8lUCtZBwah6ByxwCJKvDg2mHB/CgdkOGiaHT1wwuaTZ0nc5XZCeh/fVWSx
 CsbfQPYrnMT/pQioI2J0aYhe5Eh4n8J/QCY6CRT3l9DmE9u6qJ84s/nqRZuTDclF29cb
 pqV5FFy+FT7854Vmt9PpZM90yCBBxgKysyJTJlAibeexsE0L+cNlw07wHrNsPODw01jL
 YwohlLPyb0Gs8uCOGcM3IAUfCAOIYV4tGd4CUusvtfcXWq8W7hIcdaAt7pJq1yDPcpWA
 XcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUIX3oUq+BAamlZJBJ9IeD9BMm5oq8vVqQ2hIGTjUng=;
 b=a4P7ykyv8d2j8Pyh2k/40pdPBhvJaiLAspnoI7tO6JuADYsAp+lUaJrs0CknRKTals
 T0fd8JrM4fT0k03fSAvUSCyee1p6FvLDVd5JgcwmDIPt5GPcnYmoDv704wbDTPnNAMXb
 irZUOU5/qx9EtHzvN5l8OZRUK55MX+Kk/YOJyqj6HQdE0zjtmPJaaasu6GpbbdY0TzLc
 ciYyJ1d2wUBD8XIZtBrtjKF6kq4miC9Rw6L22cFlqVN0zGI0Tzs5SW3pR778erTIHPXv
 BQ8/ScSLpKBvV58rJCorVbGmBtg1gdB7QUC9c3gzVufUiNciwzDJY9t+AvdjlvY0c+n5
 76tQ==
X-Gm-Message-State: AOAM530+KLGnl3KDv5/xx5jj5xc36um9vo/Q0ExbkcmigmBItA2qyXYw
 g3HWBVxusIs1PYVcA1yq00Y=
X-Google-Smtp-Source: ABdhPJzqgUCaTLlwt9nMhPO/MyOHNOXTkAdRl1Eno3KtywE7hA2LRQfyZ5RFqehkSxqUE0saJ+h5Yw==
X-Received: by 2002:aa7:9a09:: with SMTP id w9mr2398983pfj.206.1597086020112; 
 Mon, 10 Aug 2020 12:00:20 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:19 +0530
Message-Id: <20200810185723.15540-9-vaibhavgupta40@gmail.com>
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
Subject: [Linux-kernel-mentees] [PATCH v2 08/12] fbdev: cyber2000fb: use
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

Although the cyber2000fb driver does not have that extra load, we should
switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks so that we can
remove the legacy .suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/cyber2000fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 42d37bed518a..d45355b9a58c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1810,7 +1810,7 @@ static void cyberpro_pci_remove(struct pci_dev *dev)
 	}
 }
 
-static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused cyberpro_pci_suspend(struct device *dev)
 {
 	return 0;
 }
@@ -1818,9 +1818,9 @@ static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
 /*
  * Re-initialise the CyberPro hardware
  */
-static int cyberpro_pci_resume(struct pci_dev *dev)
+static int __maybe_unused cyberpro_pci_resume(struct device *dev)
 {
-	struct cfb_info *cfb = pci_get_drvdata(dev);
+	struct cfb_info *cfb = dev_get_drvdata(dev);
 
 	if (cfb) {
 		cyberpro_pci_enable_mmio(cfb);
@@ -1846,12 +1846,15 @@ static struct pci_device_id cyberpro_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, cyberpro_pci_table);
 
+static SIMPLE_DEV_PM_OPS(cyberpro_pci_pm_ops,
+			 cyberpro_pci_suspend,
+			 cyberpro_pci_resume);
+
 static struct pci_driver cyberpro_driver = {
 	.name		= "CyberPro",
 	.probe		= cyberpro_pci_probe,
 	.remove		= cyberpro_pci_remove,
-	.suspend	= cyberpro_pci_suspend,
-	.resume		= cyberpro_pci_resume,
+	.driver.pm	= &cyberpro_pci_pm_ops,
 	.id_table	= cyberpro_pci_table
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
