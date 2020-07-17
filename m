Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D00C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D64520704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKMT7VO6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D64520704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01F1188056;
	Fri, 17 Jul 2020 07:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LPis37zPUqi; Fri, 17 Jul 2020 07:51:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4743F8803D;
	Fri, 17 Jul 2020 07:51:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 363A7C0893;
	Fri, 17 Jul 2020 07:51:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9E42C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D8D788704A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gHxPTwJCUyI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DC7781CFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u5so5013525pfn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXXHt8+DPkVprDBBChiV85baUHo9NZb8056HrL8z4ac=;
 b=nKMT7VO6DqHGKROxMl7G6Awn7bB9Hv3cpJRT/kPlkk+1G0DhgN8vtNQ1qhjhcHjxQ0
 ZbGgypqmXtMNPfPvqq4QsGqD2TqG/UA0hcpfwF3PWMy7bG+fhSquK2Pmvrajv4CjLliL
 PihP0mIMVYURhvFv0l65KGC6R69Zf12DnMOxQvE6pWQm4Q81sQAKuf6vlk90HUe1elU2
 wha201nheuDZyDHsAxID7VxaB4nQpqATrDgvOSnh211cDL69XkRbUc+E+zo3IFLmziRH
 yB7wla/1hGCR3rM6N5Djm0moL0xFen9Aj9pxON7ZEKQb9vxRfimxwPZp6PNeHBotDoRC
 yK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXXHt8+DPkVprDBBChiV85baUHo9NZb8056HrL8z4ac=;
 b=OVuK64wjGnG/n+myhP96a4dFQS39SSQ6iyBUA2/QQfsIVahsxPSPGdnk3PK7cc/LfJ
 U7Q1bKiT+4nfnOTa8Ac6PN4WSHyGclBiGbDKRCwSYvMP5+lbttJ0m5iJy3/yp3gE3AZ7
 868cYGUquMNeHzaBtjZ8KagGeR+5oYPHWvTNJb5rJf7xfm60Zoct7swufpJfBS/mIuip
 CfGxW8tDhDi1ONxQtcCOiyjXdLdJcoI37a81wLwGwcvKvCmaAxEc0/zx/fMkLEcVZmvB
 SsEPzrxK+MRdgRSJaOELQeu6CoL0rzvbqhcF6nfHr2dA9VZnxf7JhxLifb1ZzumJUGc1
 qI7g==
X-Gm-Message-State: AOAM532dElGxORABRh90K8AzkWCRZV0Yy2rh6TKQLD+OSIi/ID7wxtaF
 knJ1KL4JSwzI6jMouGUS00A=
X-Google-Smtp-Source: ABdhPJxAh8Qm+1I1c+dDYZJIfvbYs3crQxXI4y9cojL+rmjVpLRVyolyeVmejwHACXtBihNfuU8+/w==
X-Received: by 2002:a62:1c8b:: with SMTP id c133mr7245432pfc.134.1594972284059; 
 Fri, 17 Jul 2020 00:51:24 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s68sm1924332pjb.38.2020.07.17.00.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:51:23 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 Jul 2020 13:19:35 +0530
Message-Id: <20200717074937.296192-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/3] amd64-agp: use generic power
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state() and pci_set_power_state() to do required
operations. In generic mode, they are no longer needed.

Change function parameter in .resume() to "struct device*" type. Use
to_pci_dev() to get "struct pci_dev*" variable.

After upgrading, .suspend() became an empty-body function, hence defined as
NULL.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index b40edae32817..57fdcc61f88a 100644
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
+	.driver.pm	= &agp_amd64_pm_ops,
 };
 
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
