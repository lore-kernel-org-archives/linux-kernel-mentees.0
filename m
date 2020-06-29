Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57882335A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZKdu8bO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57882335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B7814863DD;
	Mon, 29 Jun 2020 08:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0BFj0vpnYFn; Mon, 29 Jun 2020 08:17:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F2688630F;
	Mon, 29 Jun 2020 08:17:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5C4C0865;
	Mon, 29 Jun 2020 08:17:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B69FC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97A45887E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP-SIJYcogzP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1BCF5887C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:22 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d10so6806054pls.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TjEWlxkCQ6jKCxDwmv47XB9uFr9TMvZOX5G8CmUuAM=;
 b=EZKdu8bOP57qq+jePoS28spu6jXDUcNKNX/SqDXKCfUs8XTvsWvvaNtuGhMo461lk8
 8aiEOOLQOfQQZjjdrS3fCnhBHwgQ0IfKCzscQILS+N8cn4a213SmONNRyXr8IWaqvSC1
 1+E/LTN3bLQVeASon4K2bizVn77Gx5msFa7EaVu+5UIUrctOyOmlWbHKIZZM5Obj/bY4
 eQcioLZ/eF8ImQQ/GfZAr7s8/VZ2yfaOpZLo4wthmacuL0PsdV43B9RhZtwpUcp4O2r+
 /iGOO5VqbkL30LC8Tv8O6rLTYEiGVf/UvJg3I+ygwajstoSEAEczB5j3dmdx+tWm44h9
 QSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TjEWlxkCQ6jKCxDwmv47XB9uFr9TMvZOX5G8CmUuAM=;
 b=hbrDgu+ZpnlVEVRZQ4CNJ88iFOrP4mbxZ/r9qo1HrcjBNMWQ/H93SohhGPqV1UgDkc
 Nmtc/Fg398ig7IhoEPSsPMVzVvvIZHTpmo1g0esIXuUXXmmSFaVX5+OIVTwLSzgJb8yB
 LP9xdK/WrrSq5emgZwbdR/wDQAYPN/HgiKP1MuSc1c2sfRV0+5iAz5L+llPVk46JIoTb
 q1hc8RM/n8Hg2G+wBRKl95z3q+b8HG1HfIiFCQoijcxUrIJFTHZGIEZfq4PD2A0iaJal
 32oGnmxpzVaRvG7XTCQxhPjkqv5nrdBE+Lu4lgFnpJDXGH8vQGZIgOu0d1vRWNZIwyhD
 cxeQ==
X-Gm-Message-State: AOAM5311E4BwwslcRy0m/5xyZ+Xgljt7JECJ23sZqBv9LVCl/wBH42XP
 oEzXhTmnKuIvzNDOmr9dWFE=
X-Google-Smtp-Source: ABdhPJygQ8DmbhA4ifvNfZdy5+PSbPTWeeSFEQp1uqWB8k23uWji2yFChpuajG9uZYSsbsiBFQB8Cg==
X-Received: by 2002:a17:90a:c295:: with SMTP id
 f21mr3800489pjt.208.1593418641726; 
 Mon, 29 Jun 2020 01:17:21 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id co1sm3345154pjb.34.2020.06.29.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:17:21 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@gmail.com>, Alex Dubov <oakad@yahoo.com>
Date: Mon, 29 Jun 2020 13:45:27 +0530
Message-Id: <20200629081531.214734-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
References: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/5] cb710/core.c: use generic
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

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/misc/cb710/core.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/cb710/core.c b/drivers/misc/cb710/core.c
index b290bc2ee240..55b7ee0e8f93 100644
--- a/drivers/misc/cb710/core.c
+++ b/drivers/misc/cb710/core.c
@@ -166,37 +166,24 @@ void cb710_set_irq_handler(struct cb710_slot *slot,
 }
 EXPORT_SYMBOL_GPL(cb710_set_irq_handler);
 
-#ifdef CONFIG_PM
-
-static int cb710_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused cb710_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct cb710_chip *chip = pci_get_drvdata(pdev);
 
 	devm_free_irq(&pdev->dev, pdev->irq, chip);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	if (state.event & PM_EVENT_SLEEP)
-		pci_set_power_state(pdev, PCI_D3hot);
 	return 0;
 }
 
-static int cb710_resume(struct pci_dev *pdev)
+static int __maybe_unused cb710_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct cb710_chip *chip = pci_get_drvdata(pdev);
-	int err;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	err = pcim_enable_device(pdev);
-	if (err)
-		return err;
 
 	return devm_request_irq(&pdev->dev, pdev->irq,
 		cb710_irq_handler, IRQF_SHARED, KBUILD_MODNAME, chip);
 }
 
-#endif /* CONFIG_PM */
-
 static int cb710_probe(struct pci_dev *pdev,
 	const struct pci_device_id *ent)
 {
@@ -312,15 +299,14 @@ static const struct pci_device_id cb710_pci_tbl[] = {
 	{ 0, }
 };
 
+static SIMPLE_DEV_PM_OPS(cb710_pm_ops, cb710_suspend, cb710_resume);
+
 static struct pci_driver cb710_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = cb710_pci_tbl,
 	.probe = cb710_probe,
 	.remove = cb710_remove_one,
-#ifdef CONFIG_PM
-	.suspend = cb710_suspend,
-	.resume = cb710_resume,
-#endif
+	.driver.pm = &cb710_pm_ops,
 };
 
 static int __init cb710_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
