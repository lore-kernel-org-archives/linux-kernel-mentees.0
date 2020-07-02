Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F011BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21EF20772
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjd7ViS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C21EF20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A19398A67E;
	Thu,  2 Jul 2020 10:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5swWP-pKaF0g; Thu,  2 Jul 2020 10:55:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E97E689F67;
	Thu,  2 Jul 2020 10:55:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3492C0890;
	Thu,  2 Jul 2020 10:55:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7FADC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B410B88EAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxDvRiAtEVsz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4924988EA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:23 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id gc9so5791951pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mG3Gr9JnbGvredrz4X7c4VX5RS6QFdJXmMVG61A0nk4=;
 b=Kjd7ViS0eLyzMOE0iq6o8MHYcgUsIh2OfMZ+Iq9vu7Hr06kAaHWDMR+R2ch+kg2Ec2
 yWUuKDiJr2IagoMcMG7UpU/uANUf54hW9+B32kXPWPeaOVPM5x8SDvkxHXQRpfy3zG3I
 UpzTpIZ25phMceJ+PiNR6u64bX8agFO+Ezypi9riGxz5XQXlG39HWMCLSVtbIpBMMhbs
 EcT1MRdO90Ye8KrceWqE/Gn90Tf+wVtoRihRKyzBJ2Bo6TsD0WEmVmfq053SKf2ajsJ1
 j+NCMdpmqoPYyq7uBTbnggpZ2gso71kS3i5ZBuisd553mOPbHWs2c/iK12O7kZ3t1721
 c44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mG3Gr9JnbGvredrz4X7c4VX5RS6QFdJXmMVG61A0nk4=;
 b=Us4v7unIanlIsc9mUg72TQtjMfCuscM4FhazatYJ88hRWSbXhjRlyF71gMGIGmDZHM
 oppdAix2Q86WzJFRJVhDYz3EtQJC73pz7dn0e1UHaIP4RwhapWrjTlRttPTo+kEFD/c9
 sujtme1eknPwlacWfMO15uALjL5C9aRsn5p1VGQlotplXFuBBRot9CUOI4id+lNjHoNA
 XzAio7JQtFXz/Sl9th2hS0PtsmsHmN/rS3x+3JGBJU46Kwgl3FwrgYhwjsXQ1kIs3bp9
 Rmqg6QAxJLboR79FwuwZttE2clqqX0tMpXFpXXopAJ2ab40pZt1iOuqOytmLJ67+CvQo
 PgWA==
X-Gm-Message-State: AOAM530vWH+RTdG/iGjL7K0E9S+otbZKIUQjsKPqxbn+LGPw+8/+KCrp
 KSa2cttupf+0Ot0jPhhBR3cJGAnj7sAD6g==
X-Google-Smtp-Source: ABdhPJxAdKbk2Slr8krJZngWpET39lkBpC7eTCVqsa4rAT0jliM7i1u6rLkgRScRRu34oAa/h7lSFw==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr26647870plk.105.1593687322799; 
 Thu, 02 Jul 2020 03:55:22 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z13sm8702393pfq.220.2020.07.02.03.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:55:22 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Thu,  2 Jul 2020 16:23:51 +0530
Message-Id: <20200702105351.363880-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702105351.363880-1-vaibhavgupta40@gmail.com>
References: <20200702105351.363880-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/2] smsc9420: use generic power
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/smsc/smsc9420.c | 39 +++++++---------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 7312e522c022..d07f509cb4c7 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -1422,11 +1422,9 @@ static int smsc9420_open(struct net_device *dev)
 	return result;
 }
 
-#ifdef CONFIG_PM
-
-static int smsc9420_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused smsc9420_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct smsc9420_pdata *pd = netdev_priv(dev);
 	u32 int_cfg;
 	ulong flags;
@@ -1451,33 +1449,19 @@ static int smsc9420_suspend(struct pci_dev *pdev, pm_message_t state)
 		netif_device_detach(dev);
 	}
 
-	pci_save_state(pdev);
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_disable(dev_d);
 
 	return 0;
 }
 
-static int smsc9420_resume(struct pci_dev *pdev)
+static int __maybe_unused smsc9420_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	struct smsc9420_pdata *pd = netdev_priv(dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	int err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
+	pci_set_master(to_pci_dev(dev_d));
 
-	pci_set_master(pdev);
-
-	err = pci_enable_wake(pdev, PCI_D0, 0);
-	if (err)
-		netif_warn(pd, ifup, pd->dev, "pci_enable_wake failed: %d\n",
-			   err);
+	device_wakeup_disable(dev_d);
 
 	if (netif_running(dev)) {
 		/* FIXME: gross. It looks like ancient PM relic.*/
@@ -1487,8 +1471,6 @@ static int smsc9420_resume(struct pci_dev *pdev)
 	return err;
 }
 
-#endif /* CONFIG_PM */
-
 static const struct net_device_ops smsc9420_netdev_ops = {
 	.ndo_open		= smsc9420_open,
 	.ndo_stop		= smsc9420_stop,
@@ -1658,15 +1640,14 @@ static void smsc9420_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static SIMPLE_DEV_PM_OPS(smsc9420_pm_ops, smsc9420_suspend, smsc9420_resume);
+
 static struct pci_driver smsc9420_driver = {
 	.name = DRV_NAME,
 	.id_table = smsc9420_id_table,
 	.probe = smsc9420_probe,
 	.remove = smsc9420_remove,
-#ifdef CONFIG_PM
-	.suspend = smsc9420_suspend,
-	.resume = smsc9420_resume,
-#endif /* CONFIG_PM */
+	.driver.pm = &smsc9420_pm_ops,
 };
 
 static int __init smsc9420_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
