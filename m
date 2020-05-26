Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DBAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCC2207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ24zU2k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCC2207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E1FB867DF;
	Tue, 26 May 2020 08:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYQe4walcMQB; Tue, 26 May 2020 08:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAC20867CC;
	Tue, 26 May 2020 08:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B081FC0888;
	Tue, 26 May 2020 08:05:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA7AEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A4A002035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOgjUSEOKDrW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id CF3922010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:59 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id n15so884483pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUN7Z5XSVYvGRqKnsaDJyJI44CO7kk2ydcRogwW0g9A=;
 b=DZ24zU2kzBS10KM1oPqihig3W3Vzqz1C2+panFVc7mJDCLfPTOfPj2XQ1p8SPHrSbf
 p3w5XWU822itPLD5+ikGpsY0k0LBjfX7TxUAi//EqbvSTfv+wp6JGplQS8PL1DLzX0GL
 7YhJ5fmejEB0lw7B0QpejvATbBc97S9JlsEge5g6/YO/duz4OV5s/ondkAiF2YY6A0nZ
 mUXEG2Ij/+9giVkfHI2C5gdKtAx0F3mJs3tAE8eKZ8vwcXhPOaIXJd0BiiDdgUlOZbmS
 jr0Di9woJFL0xaqhNrvfWjbBMt/w4JFPrq2lKCliOAxVcxZ6ZEeeB8e7i9ettKzjEBCc
 ggwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUN7Z5XSVYvGRqKnsaDJyJI44CO7kk2ydcRogwW0g9A=;
 b=PAKPdIBuAtFZH/j1pcDKIBgE6e2eZmcNEW2cwgMhl+itfxy7UUWYHb/8WZyu0h142/
 wQODVIwlOeUTI7po++iAn24BSR/F9USK/H5Ju3oRqXZAXFFAjYz6yMp2vx6aj903XBBb
 yuGJ+KHbr0r0+5+qJtICjTZ+0+BhCjuyVpaSOTnQ2ZgNJF86IXQSxpk8+43QiKVD0Wlf
 /guL4wUvfSMf+RCWXXUkb6FUdIoyc/UTfSwk4Id4+RAGeONpsCpuWKN8WFTM+iXGFxpi
 TYTcQajJpUa8B+lgzRGhiJupdTmkUFVbhuenypvSuBI/FNiHDq3sTZfEHfYo++Quuqq7
 xK0g==
X-Gm-Message-State: AOAM531y192UINibptNG0CBmd1MvRxQCl7sxFRtzeLvbXZ9oSF465dhF
 ISq8jms3DgOE4khIc2roKBA=
X-Google-Smtp-Source: ABdhPJw+WiWEIFxfAR2QfArjGdBo9QVw2y9nKBsz4PzBM1D5S9VNTZie6OeSTo4FFpdNH2d2r0BxnA==
X-Received: by 2002:a17:90a:f098:: with SMTP id
 cn24mr25039148pjb.201.1590480299286; 
 Tue, 26 May 2020 01:04:59 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id fa19sm8614477pjb.18.2020.05.26.01.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 01:04:58 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Tue, 26 May 2020 13:33:22 +0530
Message-Id: <20200526080324.69828-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
References: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH v1 1/3] pcnet32: Convert to
	generic power management
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

compile-tested only

Remove legacy PM callbacks and use generic operations. With legacy code,
drivers were responsible for handling PCI PM operations like
"pci_save_state()". In generic code, all these handled by PCI core.

The generic "suspend()" and "resume()" are called at the same point the
legacy ones were called. Thus, it does not affect the normal functioning of
the driver.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amd/pcnet32.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index 07e8211eea51..d32f54d760e7 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2913,30 +2913,27 @@ static void pcnet32_watchdog(struct timer_list *t)
 	mod_timer(&lp->watchdog_timer, round_jiffies(PCNET32_WATCHDOG_TIMEOUT));
 }
 
-static int pcnet32_pm_suspend(struct pci_dev *pdev, pm_message_t state)
+static int pcnet32_pm_suspend(struct device *device_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(device_d);
 
 	if (netif_running(dev)) {
 		netif_device_detach(dev);
 		pcnet32_close(dev);
 	}
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+
 	return 0;
 }
 
-static int pcnet32_pm_resume(struct pci_dev *pdev)
+static int pcnet32_pm_resume(struct device *device_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct net_device *dev = dev_get_drvdata(device_d);
 
 	if (netif_running(dev)) {
 		pcnet32_open(dev);
 		netif_device_attach(dev);
 	}
+
 	return 0;
 }
 
@@ -2957,13 +2954,16 @@ static void pcnet32_remove_one(struct pci_dev *pdev)
 	}
 }
 
+static SIMPLE_DEV_PM_OPS(pcnet32_pm_ops, pcnet32_pm_suspend, pcnet32_pm_resume);
+
 static struct pci_driver pcnet32_driver = {
 	.name = DRV_NAME,
 	.probe = pcnet32_probe_pci,
 	.remove = pcnet32_remove_one,
 	.id_table = pcnet32_pci_tbl,
-	.suspend = pcnet32_pm_suspend,
-	.resume = pcnet32_pm_resume,
+	.driver = {
+		.pm = &pcnet32_pm_ops,
+	},
 };
 
 /* An additional parameter that may be passed in... */
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
