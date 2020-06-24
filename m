Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F96C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D84120773
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnLb42tQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D84120773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E279C883C0;
	Wed, 24 Jun 2020 17:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilNrcr6VFno4; Wed, 24 Jun 2020 17:30:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E2FC883C2;
	Wed, 24 Jun 2020 17:30:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5901FC088E;
	Wed, 24 Jun 2020 17:30:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C278C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 384D920371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB75JQoWaxLB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 7122920380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:27 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e9so1723424pgo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UL6+9R7vje0BZ0kQ5AFUpy2CeEkUyuEVadPnyq+JkCk=;
 b=UnLb42tQPS9hg3JnXZozz25v4pvQoNS34zoJ56oVVYBz5nVC87FFf+Oi1z1AtOuUMZ
 cMfElNuuN4O4g0UTxzLVbpaW1GykIvKhAGguR6BaKiSRK0Rf83kO/QQywLDrboW0br8M
 oyFzrZ8nwauun68VrBVUyuLt2qj9bLUI1ivbYVxjXuVSoWYRIeqlFdiGKNfLWjX5kAXL
 qjofIkJIUOwwyb9MSiGOTA9wAgXJszozSZWzK0og6tWSRvfWFJi766qdcAMlTbaYq4Ef
 q7hZ/fxUWSXKGH0sAcKeL4jGARM9UDwBw8IHQLu6GxnrJVJv97WZPQnwhwdzjv09Rv+s
 lMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UL6+9R7vje0BZ0kQ5AFUpy2CeEkUyuEVadPnyq+JkCk=;
 b=MGjjYAnmvNrlYJik4pan04gx/y+axSVvEw/KCnDiwaXwgjg31h9Kicq9z9h7ZLgBfB
 fnwYZgVQ9K+PJiKoUAF6SrLos4yA+T3iC1X/m9dQ62+D7D8TksLLCHQyqnRtmcj3REDJ
 CQBvlVhvW2ULg319NtmMSX2eSLKtOl/e/+CbelFHMu62FiZpro3osFe9w7JG49MufMI7
 bJ05w7XzUkdsjUebZ3I+6Aujz294Crz5lrt060AI3cvognnxrXgwMn2Zbo/XIynRMgIO
 dtmXY8WlaK+B5ADGVdvhLi+KTZpO9rPxIHshwZaDkIbJ3gj5gEZJbI4MLg/Anektfo1Y
 Q2BQ==
X-Gm-Message-State: AOAM53141dtMhPUezcNY/SXu7/gKxu4HCwjgGeqvI1mlYeEmt8WAu4RJ
 D8hjSKr3yc/G/aYG3u2u7tw=
X-Google-Smtp-Source: ABdhPJyfmfN0NevwIeJlwy0n0TdrqsSRHkuPtL4isO/xRnzAtczF8CVudTR+uCdC/389p0ioTL2aMQ==
X-Received: by 2002:a65:6799:: with SMTP id e25mr17316445pgr.364.1593019826946; 
 Wed, 24 Jun 2020 10:30:26 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z11sm21187215pfk.141.2020.06.24.10.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:30:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 24 Jun 2020 22:58:55 +0530
Message-Id: <20200624172857.60915-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
References: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/4] ide: triflex: use generic
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

While upgrading ide_pci_suspend() and ide_pci_resume(), all other source
files, using same callbacks, were also updated except
drivers/ide/triflex.c. This is because the driver does not want to power
off the device during suspend. A quirk was required for the same.

This patch provides the fix. Another driver,
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c, makes use of
a quirk for similar goal. Hence a similar quirk has been applied for
triflex.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/ide/triflex.c | 45 +++++++++++--------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/ide/triflex.c b/drivers/ide/triflex.c
index 1886bbfb9e5d..f707f11c296d 100644
--- a/drivers/ide/triflex.c
+++ b/drivers/ide/triflex.c
@@ -100,48 +100,25 @@ static const struct pci_device_id triflex_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, triflex_pci_tbl);
 
-#ifdef CONFIG_PM
-static int triflex_ide_pci_suspend(struct pci_dev *dev, pm_message_t state)
-{
-	/*
-	 * We must not disable or powerdown the device.
-	 * APM bios refuses to suspend if IDE is not accessible.
-	 */
-	pci_save_state(dev);
-	return 0;
-}
-
-static int triflex_ide_pci_resume(struct pci_dev *dev)
+/*
+ * We must not disable or powerdown the device.
+ * APM bios refuses to suspend if IDE is not accessible.
+ */
+static void triflex_pci_pm_cap_fixup(struct pci_dev *pdev)
 {
-	struct ide_host *host = pci_get_drvdata(dev);
-	int rc;
-
-	pci_set_power_state(dev, PCI_D0);
-
-	rc = pci_enable_device(dev);
-	if (rc)
-		return rc;
-
-	pci_restore_state(dev);
-	pci_set_master(dev);
-
-	if (host->init_chipset)
-		host->init_chipset(dev);
-
-	return 0;
+	dev_info(&pdev->dev, "Disable triflex to be turned off by PCI CORE\n");
+	pdev->pm_cap = 0;
 }
-#else
-#define triflex_ide_pci_suspend NULL
-#define triflex_ide_pci_resume NULL
-#endif
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_COMPAQ,
+			PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE,
+			triflex_pci_pm_cap_fixup);
 
 static struct pci_driver triflex_pci_driver = {
 	.name		= "TRIFLEX_IDE",
 	.id_table	= triflex_pci_tbl,
 	.probe		= triflex_init_one,
 	.remove		= ide_pci_remove,
-	.suspend	= triflex_ide_pci_suspend,
-	.resume		= triflex_ide_pci_resume,
+	.driver.pm	= &ide_pci_pm_ops,
 };
 
 static int __init triflex_ide_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
