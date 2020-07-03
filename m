Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBCCC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F60620884
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vOZfyO1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F60620884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C65A89577;
	Fri,  3 Jul 2020 08:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSgd0dWO5z46; Fri,  3 Jul 2020 08:16:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB415894B2;
	Fri,  3 Jul 2020 08:16:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9B2EC0888;
	Fri,  3 Jul 2020 08:16:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47EF4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44C7688D9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11EB7JRixXHQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CFCCA88D8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:26 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gc15so4784456pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Jul 2020 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UL6+9R7vje0BZ0kQ5AFUpy2CeEkUyuEVadPnyq+JkCk=;
 b=vOZfyO1WAiqg1QRdEXq/qgxvjuqJQJ8oI+Utf7kPwIa5AM7PJSKzNIYSMJoDIHwMoZ
 3uhc7vHe40p6dR9jWlhIihLnO+DYHoitu0wUyIRF3RdQpiusqkNPquq0R1kUJPdvjt0d
 +ny24UoUbQ9nwdTTVOG0nydNfKkc+Qc28np4jtbXR3y0ys4w9W/cV4ZNElhzvvm3NBvM
 8YBdd3CXWT1Ku19EzSwZ+a/yfKkDbfUa5IvC4FvapLKjvs4CxBhNkYCmD+gOy3jh/gbP
 venVCiqqsRgim1m7sDshGUAMhpbiGIvyh7cWk2tvpHeIp9gKAZekuf3ccZQmPYsHto2e
 LY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UL6+9R7vje0BZ0kQ5AFUpy2CeEkUyuEVadPnyq+JkCk=;
 b=FhY1J4tjU09rIVpjo/N1NDv5wcoAEMGSeyPuzNfTrppWhaOky+lGmkI4hU4to6gcun
 9n/mtJKmOIDxXA128tBfyHy69rk/0srmI7BT7g8V+8gT9OAsb5hpQUr6t1wY4FOhB5fw
 PjgKpWt3HtTNs5opHYP4YyJN6RjjRv3hvOmPDz6eN7qC64tqg9NwqDdMFozfAi7hs6mh
 x8/VMsCLXskN/4xy7csRbjUN/A2XoviAPQC4JSEDWBC30ufVHG/oXqtaJGtHMm17wtYY
 UfIi8HfwYDJghF6VYJ1OSBcwrDp8Q6krJDAltAGie5xXOlrbHpshyp+bQs7nSymwSS/y
 GUyw==
X-Gm-Message-State: AOAM530oDoIBQOz/f+KZvVQnu7k3xHjm/VUggpiRV6pBUkdjP2Brg7F8
 vElEOJnARgXDMJNbWJewy8U=
X-Google-Smtp-Source: ABdhPJzgvXfwOhiSxhFXSeCk71Y5AdrtaoedTbMnZkaDsN+ETUN7cefI6v61LLojF6YoAqwOmbmi8A==
X-Received: by 2002:a17:90b:194f:: with SMTP id
 nk15mr22777711pjb.189.1593764186406; 
 Fri, 03 Jul 2020 01:16:26 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id y198sm8437085pfg.116.2020.07.03.01.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:16:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Fri,  3 Jul 2020 13:44:26 +0530
Message-Id: <20200703081428.1011527-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703081428.1011527-1-vaibhavgupta40@gmail.com>
References: <20200703081428.1011527-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/4] ide: triflex: use generic
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
