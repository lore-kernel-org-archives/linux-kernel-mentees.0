Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE28C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF4823158
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIatfl+V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF4823158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4E008853B;
	Mon, 29 Jun 2020 07:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5dmeFkT+o4K; Mon, 29 Jun 2020 07:37:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3FED86A0B;
	Mon, 29 Jun 2020 07:37:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C95B9C07FF;
	Mon, 29 Jun 2020 07:37:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06757C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0373286AD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4dRZC0ekXpi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A49C85F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:43 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l63so7893460pge.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
 b=MIatfl+V/S3Ufh1oJKUjfSYjWTmUU/I4l8mB4A/EKjCUpWBHDGtAhP83RxBxd1bHvD
 lXMsMA8EOKV6umjuLT/2CYBWWzgQplUr4UznpJFcgv+pcDVuN6EZ5wQrxpKQjprComuT
 nHDJcRnQxbMqG/GFEl0rn6CeYVw/L+y13vvJcDDNTOzb6Q+4N39cwg8hZ6ZTcAngeVsF
 1cSxq625BZofQfgcUsXpYgXMp/vbZR/x/TgmZ8l05avVmFY0MGKJbbZzoBuKQVOiN6Yx
 EGow6axDN5/am1TjjJUN8SySu0kCKAgSufBzhuUxItbrNZXquDIGAdoPAKJ3gB67pf4P
 cbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
 b=fK+faKac+f59tNfBjZrMmAJDRhSWTgp5Ny2W+lNQBBL4InD9XXwgTuGkkihygQgvSF
 TtL+lntfI6lpvp4a5sFx01YyRlpTFXNIRf+eIWK+Hf+cDbouVsPvKcnxVE2ZW0PQ0l2k
 aJq5ug6xy+/G8BeGv9cbi87qpKK5cnxWyhi1FY8ZorfpFbkvM5CpLjWTv6LKpYTZXYmr
 HxtI7U8fGiIOw9voX08MyRofMBD+g61L0+akj9n+axv1pzChMpk5M/PQLetgpVVRNoF9
 Pn/IIQQ6bBbtOM6v1YaPJRZ0dJArpRwa0k0GN9UWJXXNRq+QTQKl076kLQ5pMDtamOuA
 M2fA==
X-Gm-Message-State: AOAM531LIIPFuVebCd4QlZveDferU+75i7wHwLLoEPOpR0R1xjByqts4
 2H1d8Ba6c6WY8HWLxUhoXr8=
X-Google-Smtp-Source: ABdhPJxu4ilTfacJ81Zt5Q839MN4J+yYfSr9e3LiZl9nj6Qi2F2XwvNT/FoD5dFAEy+ie8AFvMhcRw==
X-Received: by 2002:a62:54c4:: with SMTP id
 i187mr13504579pfb.263.1593416263218; 
 Mon, 29 Jun 2020 00:37:43 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:42 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:06:03 +0530
Message-Id: <20200629073604.205478-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 5/6] [media] meye: use generic
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was invoking PCI helper functions like pci_save/restore_state()
which is not recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/meye/meye.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 73e064e6f56d..7fb3b1853b87 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1528,19 +1528,16 @@ static const struct v4l2_ctrl_ops meye_ctrl_ops = {
 	.s_ctrl = meye_s_ctrl,
 };
 
-#ifdef CONFIG_PM
-static int meye_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused meye_suspend(struct device *dev)
 {
-	pci_save_state(pdev);
 	meye.pm_mchip_mode = meye.mchip_mode;
 	mchip_hic_stop();
 	mchip_set(MCHIP_MM_INTA, 0x0);
 	return 0;
 }
 
-static int meye_resume(struct pci_dev *pdev)
+static int __maybe_unused meye_resume(struct device *dev)
 {
-	pci_restore_state(pdev);
 	pci_write_config_word(meye.mchip_dev, MCHIP_PCI_SOFTRESET_SET, 1);
 
 	mchip_delay(MCHIP_HIC_CMD, 0);
@@ -1562,7 +1559,6 @@ static int meye_resume(struct pci_dev *pdev)
 	}
 	return 0;
 }
-#endif
 
 static int meye_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
 {
@@ -1788,15 +1784,14 @@ static const struct pci_device_id meye_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, meye_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(meye_pm_ops, meye_suspend, meye_resume);
+
 static struct pci_driver meye_driver = {
 	.name		= "meye",
 	.id_table	= meye_pci_tbl,
 	.probe		= meye_probe,
 	.remove		= meye_remove,
-#ifdef CONFIG_PM
-	.suspend	= meye_suspend,
-	.resume		= meye_resume,
-#endif
+	.driver.pm	= &meye_pm_ops,
 };
 
 static int __init meye_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
