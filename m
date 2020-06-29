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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F77AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:27:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A7E23134
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDYnSRCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A7E23134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D054D8859C;
	Mon, 29 Jun 2020 07:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMlnfEk6z40y; Mon, 29 Jun 2020 07:27:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 019C68850A;
	Mon, 29 Jun 2020 07:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E31F7C07FF;
	Mon, 29 Jun 2020 07:27:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58F1CC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48E1786C7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zso9cqWFZ-uj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B2DA9869B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:27:04 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d10so6754728pls.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HuX7n6s8ATp5pxRd5kQnUjstgno5Nwe0RMXtqfQUla8=;
 b=pDYnSRCZpVu5I32x0Nxg7b5RiMinhvu1m7ig/sDS2DrilwV6kc2H4SU63qswuVuFBt
 K/uom57uGLSY35+dmoXdmbHCDfFTs7W4mGzMza/dJ4DTaLLV9U7BSuXZ4JXiy6V40ok8
 9ZEd3epiKLqcrZ6NKhOhq0xg2xL6kY5wGvKgUuVzvEwlAeMWNVQbJf2jVRaQ17OnLRtR
 krQBf4tRpZj7oxUgIgnPdh0bpbJM3t3K51JELfBHuojT+qhn/tjAoxmnnunpu8FImfY7
 uj4h6e1EF+R2+bPpJHoFESVLSLIo7IVFXy/uDCW2QHbjeFH+aaUIjCkp9ED705ODvjyV
 R6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HuX7n6s8ATp5pxRd5kQnUjstgno5Nwe0RMXtqfQUla8=;
 b=phZu31TqAX6TciHX/mX6ibj/QQqYJNO+gyYHkrbD6QF+ttDW5K6+PL5e2mmpZ7N19C
 qqGbCvEsrMb+bX9kOaFmYnTWg1bjsTLQlCpf1HOgRjlHVJrAkKx320Dfl86HMNK7puav
 uIZ4Di2XYQd0qU9OxQriiCRdsj3EFJoslxEcUgb+f5cX3l5uL2ISXqovk9tJcLTcuMRQ
 L6+KHD4iWT8xKNZjmk4OIM/8AOAOvY3rMiMN1Tr1FWqTUDcQUTAYBmJmoak387xuJ5bh
 AgEoAy9Te18+0P5BkPfVUktdkaJyQLmnFZHcJLUH5eaz1EcBWOq7L9Urhx/MAULPAsVL
 JKCw==
X-Gm-Message-State: AOAM5304y/t90cKrmpww8RIBrCDkRcKmnVcqaoDuIziMHMkVF4K8i9rD
 9dAc3SLp7HN9+VS8y1eAXWI=
X-Google-Smtp-Source: ABdhPJxs3S103RJgDrdJ4wsL1LPaeZPraLcWPGBS916dR7B+qMtjNVhw3ONbUNamXhwngvDLgfGvxQ==
X-Received: by 2002:a17:902:7204:: with SMTP id
 ba4mr11861705plb.250.1593415624288; 
 Mon, 29 Jun 2020 00:27:04 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34637627pfk.86.2020.06.29.00.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:27:03 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 29 Jun 2020 12:55:25 +0530
Message-Id: <20200629072525.156154-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629072525.156154-1-vaibhavgupta40@gmail.com>
References: <20200629072525.156154-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 2/2] ipw2200: use generic power
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

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++---------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 661e63bfc892..39ff3a426092 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -11838,10 +11838,9 @@ static void ipw_pci_remove(struct pci_dev *pdev)
 	free_firmware();
 }
 
-#ifdef CONFIG_PM
-static int ipw_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused ipw_pci_suspend(struct device *dev_d)
 {
-	struct ipw_priv *priv = pci_get_drvdata(pdev);
+	struct ipw_priv *priv = dev_get_drvdata(dev_d);
 	struct net_device *dev = priv->net_dev;
 
 	printk(KERN_INFO "%s: Going into suspend...\n", dev->name);
@@ -11852,33 +11851,20 @@ static int ipw_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	/* Remove the PRESENT state of the device */
 	netif_device_detach(dev);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	priv->suspend_at = ktime_get_boottime_seconds();
 
 	return 0;
 }
 
-static int ipw_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused ipw_pci_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct ipw_priv *priv = pci_get_drvdata(pdev);
 	struct net_device *dev = priv->net_dev;
-	int err;
 	u32 val;
 
 	printk(KERN_INFO "%s: Coming out of suspend...\n", dev->name);
 
-	pci_set_power_state(pdev, PCI_D0);
-	err = pci_enable_device(pdev);
-	if (err) {
-		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
-		       dev->name);
-		return err;
-	}
-	pci_restore_state(pdev);
-
 	/*
 	 * Suspend/Resume resets the PCI configuration space, so we have to
 	 * re-disable the RETRY_TIMEOUT register (0x41) to keep PCI Tx retries
@@ -11900,7 +11886,6 @@ static int ipw_pci_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif
 
 static void ipw_pci_shutdown(struct pci_dev *pdev)
 {
@@ -11912,16 +11897,15 @@ static void ipw_pci_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static SIMPLE_DEV_PM_OPS(ipw_pci_pm_ops, ipw_pci_suspend, ipw_pci_resume);
+
 /* driver initialization stuff */
 static struct pci_driver ipw_driver = {
 	.name = DRV_NAME,
 	.id_table = card_ids,
 	.probe = ipw_pci_probe,
 	.remove = ipw_pci_remove,
-#ifdef CONFIG_PM
-	.suspend = ipw_pci_suspend,
-	.resume = ipw_pci_resume,
-#endif
+	.driver.pm = &ipw_pci_pm_ops,
 	.shutdown = ipw_pci_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
