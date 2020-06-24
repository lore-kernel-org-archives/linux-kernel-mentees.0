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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549E7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAA120768
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq3jmg6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAA120768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB4C1864F4;
	Wed, 24 Jun 2020 17:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YT-ZqAS3Y98f; Wed, 24 Jun 2020 17:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85C12864D0;
	Wed, 24 Jun 2020 17:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82D8CC088E;
	Wed, 24 Jun 2020 17:30:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77556C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6933920424
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4gRRMdjGUsP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id EA3EA20371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f3so1740992pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HVSIsIhF4vtA9M97P2wIfI+PdikMXEfJ9b+6szRz+k=;
 b=Fq3jmg6viJhUzrrzBnM9gPXNXEbFgCrImbOXtH5xts6XpWmb5+BtyusDL897IoSNec
 lFUL8GGVo1w3QxzTvfSCtZzMUdLsbEWhDFx/E4HB2gvvDevXaiSsvOoRuPG+5h3/gKxM
 9PrOLyO2GK8J1RvN/hxg3skw4+gxo7l6WOC/A7WG/YtXU0xHHYLcZJITERyAz4EjN+Iu
 jiO6e6quoM8/pncGxDhnQRworCqCW+HxYcJtpF6TVV9AReReCoIXy+j+EUX428i7LwuE
 jXw+18WBbqUcIK5PIMkDtvie35lmCH3YQxPbfVtSOqN0YQrKqNllMGqUIQcEtiq+1mL+
 UOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HVSIsIhF4vtA9M97P2wIfI+PdikMXEfJ9b+6szRz+k=;
 b=YVpuSYf+gNvSK5pzeOvqh9kNEWbL1fth73KTQjsVHRLwUaeFK/h88DFYg4JznHfKKw
 dneFlS4iQqeyFdhzhYnWg/2PERXRoLHtJ7oujHl44OdvpYZFu7nzFtTYpzJz1UgxlJYA
 cKs3aRolFofKOdBp99OP27UQM7oykFHNEF6ruJ4jOfIypWPZHpiWrCNPgFb3fj48xQDx
 5OEH9FHBPGudVgYeGfLVwDUaIu6NIl4RpzFnRIHv0Zte9ksPyJ97oIfor5PMsoF7t2Ii
 iPs5sxtNuGoKC2PXQo+Tm9Mlmq6IQOc2kR6GmRjTFKvfjnDyudyXiGXh5HNNIBd15Cay
 b1rA==
X-Gm-Message-State: AOAM532KsmpZTqSlWcxBh2gaCSlrge8RYwU9jLUDtwAuT8hakAkSxcrP
 lXbG6AX5+1ovUOes/XQJpcI=
X-Google-Smtp-Source: ABdhPJyr353InAhP3GPBTsaACmUaSmfDnL6l6uOv9TYFVlWaY/FPStDKebr2lqV4JJ/wMB7HUYyE0g==
X-Received: by 2002:a63:c58:: with SMTP id 24mr12305638pgm.343.1593019837527; 
 Wed, 24 Jun 2020 10:30:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z11sm21187215pfk.141.2020.06.24.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:30:37 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 24 Jun 2020 22:58:57 +0530
Message-Id: <20200624172857.60915-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
References: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 4/4] ide: delkin_cb: use generic
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. All required operations are
done by PCI core.

After converting it into generic model, suspend() became an empty function.
Hence, it is defined as NULL.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/ide/delkin_cb.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/ide/delkin_cb.c b/drivers/ide/delkin_cb.c
index 300daabaa575..8a3dc4dd6e66 100644
--- a/drivers/ide/delkin_cb.c
+++ b/drivers/ide/delkin_cb.c
@@ -123,39 +123,17 @@ delkin_cb_remove (struct pci_dev *dev)
 	pci_disable_device(dev);
 }
 
-#ifdef CONFIG_PM
-static int delkin_cb_suspend(struct pci_dev *dev, pm_message_t state)
-{
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
-	return 0;
-}
+#define delkin_cb_suspend NULL
 
-static int delkin_cb_resume(struct pci_dev *dev)
+static int __maybe_unused delkin_cb_resume(struct device *dev_d)
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
+	struct ide_host *host = dev_get_drvdata(dev_d);
 
 	if (host->init_chipset)
-		host->init_chipset(dev);
+		host->init_chipset(to_pci_dev(dev_d));
 
 	return 0;
 }
-#else
-#define delkin_cb_suspend NULL
-#define delkin_cb_resume NULL
-#endif
 
 static struct pci_device_id delkin_cb_pci_tbl[] = {
 	{ 0x1145, 0xf021, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -164,13 +142,14 @@ static struct pci_device_id delkin_cb_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, delkin_cb_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(delkin_cb_pm_ops, delkin_cb_suspend, delkin_cb_resume);
+
 static struct pci_driver delkin_cb_pci_driver = {
 	.name		= "Delkin-ASKA-Workbit Cardbus IDE",
 	.id_table	= delkin_cb_pci_tbl,
 	.probe		= delkin_cb_probe,
 	.remove		= delkin_cb_remove,
-	.suspend	= delkin_cb_suspend,
-	.resume		= delkin_cb_resume,
+	.driver.pm	= &delkin_cb_pm_ops,
 };
 
 module_pci_driver(delkin_cb_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
