Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54821C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD7C22D58
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD7C22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D20A85A5A;
	Tue, 12 Jan 2021 08:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4nt8iNRg2cm; Tue, 12 Jan 2021 08:13:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B74985A49;
	Tue, 12 Jan 2021 08:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEC3CC088B;
	Tue, 12 Jan 2021 08:13:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F811C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C2CB86846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw5idfhZ6s8w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5966586841
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:12 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h186so954062pfe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HTIY82uemgwmbK0pP0s2dMMVpv9lSP3ccVzRYJgtA4=;
 b=L2A+459rpaVdfcKuOSTA/XmFKoSF2tSXbK0zhsphbh6quPoW9lkAAUYl3+EMX3jIfv
 DR/jqNoDrKAr9tu+XjJv92gJVH56BblFHKfdwBUCRO6V5lgmTAJfDk38i7zIeYlsW1eY
 fbxpdALhTGmEfAM0SAiyK3pj9cjW/pZnO0z5F4PI1CIMHp0uVbu9V1mTOwtx68Jr3rpf
 lOGEwzd9m3oQSG6VK40W+d0u2JvsmuYBpFYHJMGwt9e1WZ1rHJfPhoZRvgReQbSWyF2c
 NLsZXsAjwTp4xw9y6WquRQozczmtJyliqKyLKP7SikojAJ9JN6pvSmeUxLrc1kIrMRTQ
 trkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HTIY82uemgwmbK0pP0s2dMMVpv9lSP3ccVzRYJgtA4=;
 b=PGAsjRZUwIZPXD98eDAH5R11gJ+YzDWwHCjs+DddwZNFiJ6lOcNK41o9Kn1HQXL4Ls
 fAqMRbgLWI7KtKsQNhhvpDmqH5YUHR17vHRudiTbn5EVW96iYahtdEfRkfpWakiypU4d
 5vMxQdlAABzSNlARyT/guNiwy3M49kaqSFAcbs15eSirTlbYxVfBhG8FiT24J6zPFtX0
 z9xd6SbI9fhubEkrYY/OUlz8SFswoEesKBfycXVsvbDPvkt0Tj8+Nbyf+MxZZxlJ4PHY
 3fb9k6suxU+dv/cHO13QKMsjJCDe2itOe2CZg7/wMPpBFY0HwsiAXth+rhBOF5vC5fWE
 DEbQ==
X-Gm-Message-State: AOAM532t3adi0+q0+RbJkt9sAnQ132TDrtYJ/d/FgfrZb9XgeYKNOttY
 oy/GHD/LHQ7SyhU4khr+YN0=
X-Google-Smtp-Source: ABdhPJx6Hy/0wT6mZyfoCbIwRo/k5Z3PbU8MR4JZ1BFD3QJkvOM9DMExTYTl5vYUQhesr/P/xi7K1w==
X-Received: by 2002:aa7:9ab7:0:b029:19d:ac89:39aa with SMTP id
 x23-20020aa79ab70000b029019dac8939aamr3662822pfi.10.1610439191884; 
 Tue, 12 Jan 2021 00:13:11 -0800 (PST)
Received: from varodek.localdomain ([106.215.30.102])
 by smtp.gmail.com with ESMTPSA id l2sm2152381pjz.27.2021.01.12.00.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:13:11 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>
Date: Tue, 12 Jan 2021 13:39:24 +0530
Message-Id: <20210112080924.1038907-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112080924.1038907-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
 <20210112080924.1038907-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] via-agp: use generic power
	management
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

After upgrading, .suspend() became an empty-body function, hence defined as
NULL.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/char/agp/via-agp.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
index 87a92a044570..a460ae352772 100644
--- a/drivers/char/agp/via-agp.c
+++ b/drivers/char/agp/via-agp.c
@@ -492,22 +492,11 @@ static void agp_via_remove(struct pci_dev *pdev)
 	agp_put_bridge(bridge);
 }
 
-#ifdef CONFIG_PM
+#define agp_via_suspend NULL
 
-static int agp_via_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused agp_via_resume(struct device *dev)
 {
-	pci_save_state (pdev);
-	pci_set_power_state (pdev, PCI_D3hot);
-
-	return 0;
-}
-
-static int agp_via_resume(struct pci_dev *pdev)
-{
-	struct agp_bridge_data *bridge = pci_get_drvdata(pdev);
-
-	pci_set_power_state (pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct agp_bridge_data *bridge = dev_get_drvdata(dev);
 
 	if (bridge->driver == &via_agp3_driver)
 		return via_configure_agp3();
@@ -517,8 +506,6 @@ static int agp_via_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
 /* must be the same order as name table above */
 static const struct pci_device_id agp_via_pci_table[] = {
 #define ID(x) \
@@ -567,16 +554,14 @@ static const struct pci_device_id agp_via_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_via_pci_table);
 
+static SIMPLE_DEV_PM_OPS(agp_via_pm_ops, agp_via_suspend, agp_via_resume);
 
 static struct pci_driver agp_via_pci_driver = {
 	.name		= "agpgart-via",
 	.id_table	= agp_via_pci_table,
 	.probe		= agp_via_probe,
 	.remove		= agp_via_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_via_suspend,
-	.resume		= agp_via_resume,
-#endif
+	.driver.pm      = &agp_via_pm_ops,
 };
 
 
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
