Return-Path: <SRS0=mH9I=AG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3111EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Jun 2020 12:13:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA27A2065D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Jun 2020 12:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnOrs5yo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA27A2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BBF0386365;
	Thu, 25 Jun 2020 12:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LI2c1fZCYncu; Thu, 25 Jun 2020 12:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56D57862A9;
	Thu, 25 Jun 2020 12:13:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D4FCC08A2;
	Thu, 25 Jun 2020 12:13:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB057C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 12:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C9FC386341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 12:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUnWLKNhTymv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 12:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F75886311
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 12:13:52 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 35so2732292ple.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubc4Gg+BEfiNxapUGxVhJAuDv/Rff5i5QsFdcnV45cs=;
 b=TnOrs5yokCv1Mc4KvBgTT6zgaNBKX3gdB4s2nX0/yNuhDZRpmJWdHRPVUoUwLcTbfO
 waqfAg1cU9PXSRoBZlzN84wZXGxi3znXMcwhT/a8mqfIcWp/4VMgF7Vpb+Pv8oFMMf+n
 qiqux1Tz+01goQOUmLbApkagGzBYnjOE3EdmbIXguCUUKaci4EG58HkBmwI0r134xcPk
 OeVNMeytPDRSWlXCMA/ex8k6/iEMt79lfHo81z5pk9M2xkvKmvqfG57F9uD817Qp84EJ
 Hvv22EAPPc/6nH5+dKELkdJgdfnwYhp5dWcQjANH8Emoi3TlV7IdnlTntxyaRvxG+qo4
 61Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubc4Gg+BEfiNxapUGxVhJAuDv/Rff5i5QsFdcnV45cs=;
 b=N9tJN67bEaXWgBNbEW5uCkFEKgCbD3lhcUt9BQ0Dn2cyhM8fgf/6NTRWcQhSPthvQi
 1ZlFv/8GN9253h/2agWDezD9HXIappS0qyLKdsFDG1QpX+54TYFn/UoMphl8ZDwAICtp
 ES1d3NLCrsUWiHuaPqXc9tz/cfc6YistXocmU1qppcmB+A/uMI/gzn8Tq9hD4F2N+yez
 Y5/ears5oWHUcGFebF+xnXcyrr3ny90wiZzScR7LouD4xh4n/UTzI2YXXB9yQ1r8N52A
 XPKH4NlO7wShgG6Z4yNnwQu/9i0LmZsmuVd0mwHs1nPlYqZ+n3S+y3jkl3NEzilgRCI7
 KcYw==
X-Gm-Message-State: AOAM530ASCPSGfauIek798f1t2A0HS/7eWqySPAGo8OYWCA0FU6NsdH7
 r6yoTE79IdWv8XPajhCph+c=
X-Google-Smtp-Source: ABdhPJxj1q2eRTDQxKkLSf9KIinlmLNMYuJUY3hAQ+CRhpY8fDA0gfOleRlpFuaXyoSKRsmUDYTmtg==
X-Received: by 2002:a17:902:8681:: with SMTP id
 g1mr31738394plo.161.1593087231896; 
 Thu, 25 Jun 2020 05:13:51 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id i125sm19507361pgd.21.2020.06.25.05.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 05:13:51 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Thu, 25 Jun 2020 17:40:43 +0530
Message-Id: <20200625121042.99369-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] ptp_pch: use generic power
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

In the case of ptp_pch, after removing PCI helper functions, .suspend()
and .resume() became empty-body functions. Hence, define them NULL and
use dev_pm_ops.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/ptp/ptp_pch.c | 37 +++----------------------------------
 1 file changed, 3 insertions(+), 34 deletions(-)

diff --git a/drivers/ptp/ptp_pch.c b/drivers/ptp/ptp_pch.c
index dcd6e00c8046..ce10ecd41ba0 100644
--- a/drivers/ptp/ptp_pch.c
+++ b/drivers/ptp/ptp_pch.c
@@ -508,40 +508,8 @@ static const struct ptp_clock_info ptp_pch_caps = {
 	.enable		= ptp_pch_enable,
 };
 
-
-#ifdef CONFIG_PM
-static s32 pch_suspend(struct pci_dev *pdev, pm_message_t state)
-{
-	pci_disable_device(pdev);
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-
-	if (pci_save_state(pdev) != 0) {
-		dev_err(&pdev->dev, "could not save PCI config state\n");
-		return -ENOMEM;
-	}
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
-	return 0;
-}
-
-static s32 pch_resume(struct pci_dev *pdev)
-{
-	s32 ret;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "pci_enable_device failed\n");
-		return ret;
-	}
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	return 0;
-}
-#else
 #define pch_suspend NULL
 #define pch_resume NULL
-#endif
 
 static void pch_remove(struct pci_dev *pdev)
 {
@@ -684,13 +652,14 @@ static const struct pci_device_id pch_ieee1588_pcidev_id[] = {
 	{0}
 };
 
+static SIMPLE_DEV_PM_OPS(pch_pm_ops, pch_suspend, pch_resume);
+
 static struct pci_driver pch_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pch_ieee1588_pcidev_id,
 	.probe = pch_probe,
 	.remove = pch_remove,
-	.suspend = pch_suspend,
-	.resume = pch_resume,
+	.driver.pm = &pch_pm_ops,
 };
 
 static void __exit ptp_pch_exit(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
