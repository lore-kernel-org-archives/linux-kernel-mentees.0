Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FE5C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C074C22D2C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C074C22D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3207385A5A;
	Tue, 12 Jan 2021 08:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcEsUjUe0BYg; Tue, 12 Jan 2021 08:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5F4F85A49;
	Tue, 12 Jan 2021 08:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEEEFC088B;
	Tue, 12 Jan 2021 08:13:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82FD8C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7241286845
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYlN6I9o2QgC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 569C786841
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:59 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id iq13so1124375pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+5AY09mfGyaAgyXWDCF4dcfRL6QuYPJBXH3t6/wgY4=;
 b=tgoWzJQEWSCrjTpWAuH+eOFGUIx0zm8xNscUoWzeut2TGtSyxXnZLizlperYZgt8D2
 LiqVZWsBCBZtA1hE2qf9EoEGSNBQxGaizlDTweAFYpG+8eIaCdhNlF/iTzZjsAUAaAqm
 4u7iCrCBPbV/1llWf97rBO0MCgvvMJNf1H8Cetl3kwVG/vU3HB+Aj31KMnb6/DuZKUZQ
 6X6dtrS0Jxa35L5aJGTlF+w5FzUgTCdT/ttRwEopMrB8k9vyqdCZdhN/FVcc39PUhgGM
 QLsPeCw6/WUfY2vXq2ird3hRJDUFb1JZ+oDvmKyT7dwMo5gTwUQrUPQJsGNC4yECz6wF
 BBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+5AY09mfGyaAgyXWDCF4dcfRL6QuYPJBXH3t6/wgY4=;
 b=F6jmYGyh1s8c24O4ntdSqPGgEV+soKvOETKD80beuGUico1cnpE2ad6evs2RJPwNvN
 WRvXpLGKqHzIa/3DBpkuJsiw5/bn7s0l+D2IT3O4AwU9AjUtsFTGUFraHK+yxve+ZNGs
 PE/3MuuG3H7DKSXhwo82zoTk/r21f8umfE/zVAfpTZBKxoO/YK74d7FFe8MxuYGaobhI
 +Dq+0Qu4EMHFNYVOkhZp6k5lOELM1rzk1lCYrNPwb+J3Kc7h5/lTnEtl9ChFb/f21ZCO
 IfmG54cw5L28zjmJt5N8kFzNR5WaWi6xeQAgy8G/zhRe1+b+3AnKcpiit1/S2VuVn6ep
 HmoQ==
X-Gm-Message-State: AOAM533EiYkt3NzgN8CYUGN+Ey764cHb8eG+3pYDB/wKAwX7Cf3iKnBm
 Pms3NB5Gw/VBzN3XcIG587w=
X-Google-Smtp-Source: ABdhPJz+kOsfexRaeZVC+/bOVCCXJVkFRicDzfL/dEPH8TbaccLDVNeWfxZoAfb4dOkfjxZXvsuBBg==
X-Received: by 2002:a17:902:d694:b029:dc:9820:12fb with SMTP id
 v20-20020a170902d694b02900dc982012fbmr3643095ply.19.1610439178993; 
 Tue, 12 Jan 2021 00:12:58 -0800 (PST)
Received: from varodek.localdomain ([106.215.30.102])
 by smtp.gmail.com with ESMTPSA id l2sm2152381pjz.27.2021.01.12.00.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:12:58 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>
Date: Tue, 12 Jan 2021 13:39:22 +0530
Message-Id: <20210112080924.1038907-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112080924.1038907-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
 <20210112080924.1038907-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] amd64-agp: use generic power
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
 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index b40edae32817..dc78a4fb879e 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -588,20 +588,11 @@ static void agp_amd64_remove(struct pci_dev *pdev)
 	agp_bridges_found--;
 }
 
-#ifdef CONFIG_PM
+#define agp_amd64_suspend NULL
 
-static int agp_amd64_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused agp_amd64_resume(struct device *dev)
 {
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
-	return 0;
-}
-
-static int agp_amd64_resume(struct pci_dev *pdev)
-{
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct pci_dev *pdev = to_pci_dev(dev);
 
 	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA)
 		nforce3_agp_init(pdev);
@@ -609,8 +600,6 @@ static int agp_amd64_resume(struct pci_dev *pdev)
 	return amd_8151_configure();
 }
 
-#endif /* CONFIG_PM */
-
 static const struct pci_device_id agp_amd64_pci_table[] = {
 	{
 	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
@@ -738,15 +727,14 @@ static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
 	{ }
 };
 
+static SIMPLE_DEV_PM_OPS(agp_amd64_pm_ops, agp_amd64_suspend, agp_amd64_resume);
+
 static struct pci_driver agp_amd64_pci_driver = {
 	.name		= "agpgart-amd64",
 	.id_table	= agp_amd64_pci_table,
 	.probe		= agp_amd64_probe,
 	.remove		= agp_amd64_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_amd64_suspend,
-	.resume		= agp_amd64_resume,
-#endif
+	.driver.pm  = &agp_amd64_pm_ops,
 };
 
 
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
