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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E4FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5408320704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVE0X2HT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5408320704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C35D8805B;
	Fri, 17 Jul 2020 07:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BdY2rTKk-S0; Fri, 17 Jul 2020 07:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5613588056;
	Fri, 17 Jul 2020 07:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52B85C0893;
	Fri, 17 Jul 2020 07:51:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84FC3C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7386F88056
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7BDq8ZwGw9V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCF978803D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:36 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o22so5998446pjw.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cWqo/1iGGhIfGKCAu2qJyy90N6APTvXdwVB6pQxCcg0=;
 b=rVE0X2HTdehxwlgLKfFZNc2cCb/5/HluVTLh895T6EIOW9altfl3qdh4EQ+IXSzCWE
 XF2HTtZPy2Nu/IFQHuAfm5Wsa5gG3onbgQAc6U/PPxSQfoYQvK+BS0qFPN+OuPVWVhYh
 RtARknXTxz05y1CdfNR+Ymi8omU/rIxrrYZL+YKsuBWNCz2K8L3jpiMr8IOmBXomz1xs
 AEPz5fOnFqzQQzKSHEf5emk3lBjENVjkGaQLItuM0oV5DuVAdTM1K4CyO8r/UlLIhGYP
 b8QZW2JOPC0te8A9HAkdpYK03GFI1yujrC8AZ3uVebT7gAf5OGEDWVkMVgQVol5gMALR
 BKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWqo/1iGGhIfGKCAu2qJyy90N6APTvXdwVB6pQxCcg0=;
 b=EbtO9zMHNf1E4rld6Zv6QbU4UqTcxBLquR95R6gf8mX4SFAXXORRgnb1FkqxvqVMin
 m1YsLqTCpmX0aoMbEmb8IDwCiMYRx2nh1TqqAnJ+IH9yCUI2VWIhy3upOSAWLL7MA+t+
 YuwxBZ2P9WoPBwMso4wmou1UUlJ9W1YMPrqlVbWhshWNaF2yZANB8ZyoCs4FEZyYAqct
 OtZW5zSoMuEgUzaQR6H8q+nSPLuXCbCasOUf8dnCU8ZaLL6BF33fJHsM8Cvo+SLkPHPq
 H4I6p5nftdyOi3WFci9/TTRFXH3XJNQpaU2Z59Uqxvhf3hXojSCWlHvKx8scrvdCvFxp
 pFjQ==
X-Gm-Message-State: AOAM532dNSrDoqG6snS8+EEhcG9ghu/1sSn/+68iXvS0ozSqWr24gJIU
 LG3HoSPxDVVfpku8IO3uQ20=
X-Google-Smtp-Source: ABdhPJySEEEQ5UYc975TUV8nc4RCp7vrGbxiujqH0R+l12ZmCuOCbDd4oFs7dKBTa48Rm1ACHE6dEA==
X-Received: by 2002:a17:902:a389:: with SMTP id
 x9mr6633756pla.63.1594972296470; 
 Fri, 17 Jul 2020 00:51:36 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s68sm1924332pjb.38.2020.07.17.00.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:51:36 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 Jul 2020 13:19:36 +0530
Message-Id: <20200717074937.296192-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/3] sis-agp: use generic power
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
 drivers/char/agp/sis-agp.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/char/agp/sis-agp.c b/drivers/char/agp/sis-agp.c
index 14909fc5d767..e2e62d5a8914 100644
--- a/drivers/char/agp/sis-agp.c
+++ b/drivers/char/agp/sis-agp.c
@@ -217,26 +217,14 @@ static void agp_sis_remove(struct pci_dev *pdev)
 	agp_put_bridge(bridge);
 }
 
-#ifdef CONFIG_PM
+#define agp_sis_suspend NULL
 
-static int agp_sis_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused agp_sis_resume(
+	__attribute__((unused)) struct device *dev)
 {
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
-	return 0;
-}
-
-static int agp_sis_resume(struct pci_dev *pdev)
-{
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
 	return sis_driver.configure();
 }
 
-#endif /* CONFIG_PM */
-
 static const struct pci_device_id agp_sis_pci_table[] = {
 	{
 		.class		= (PCI_CLASS_BRIDGE_HOST << 8),
@@ -419,15 +407,14 @@ static const struct pci_device_id agp_sis_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_sis_pci_table);
 
+static SIMPLE_DEV_PM_OPS(agp_sis_pm_ops, agp_sis_suspend, agp_sis_resume);
+
 static struct pci_driver agp_sis_pci_driver = {
 	.name		= "agpgart-sis",
 	.id_table	= agp_sis_pci_table,
 	.probe		= agp_sis_probe,
 	.remove		= agp_sis_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_sis_suspend,
-	.resume		= agp_sis_resume,
-#endif
+	.driver.pm	= &agp_sis_pm_ops,
 };
 
 static int __init agp_sis_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
