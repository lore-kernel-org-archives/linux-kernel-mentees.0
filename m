Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDAFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53FE206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB8z185M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A53FE206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 94182227FA;
	Mon,  6 Jul 2020 08:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWEQQ63vQwiF; Mon,  6 Jul 2020 08:59:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D31FC22728;
	Mon,  6 Jul 2020 08:59:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1045C0893;
	Mon,  6 Jul 2020 08:59:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0883C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C02CC87D97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KE6fkX2Itv9d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44DAC87622
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:38 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id b92so16732218pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=It/KCincJ1QGaOO3UJT7U/GTe3VbLriw3afVTbDT6II=;
 b=CB8z185MxQ6CkLhK0kdmZB3E7Cyhh8QOuACpiO1OpxmyJ0wkeqL67RoQwYbGemDlMu
 M7AIRJ+gb5Q05PLdon3i/wfbgW2rRuHO+OTu5WGmPKh0qyC5tb0SpOtTMBdb7RLyaqWx
 zCKTelnHV5b00qyds1fhiBpcuohnKWgNqNUSOgUL8aeYQXaPLgv/gOzJHA9dtdbrSxhu
 W4iUUhWvbDvgt3dMRE923QYawVRiUzd4O7dBYyX/RF59TisTSLpxmVgdQ/SLMZOFF9JQ
 GEcs+yYDc/W555OuwkWYm+zyiZL1al7hgUk3L8g+heBOJO4AGY2palhari4fyx/7qf3d
 fqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=It/KCincJ1QGaOO3UJT7U/GTe3VbLriw3afVTbDT6II=;
 b=nAifsDz9sMzfV6orW1/Hz5z7aoSIFQxAbWmE1YvoRI2Fbhvsp7keA7tT79+XHYrKUJ
 xfHL34WZIFxqZcysvewoa5XAfWg0EYqFcutsKzHn6DAtp0tgwBJGkd23PmuKyH+nkPK3
 ZljkEWgKZz8tpkvfqV/ekZVu7wchm0oIcyUAk6yJAp/9hAq8k8iYSdfeNKXvmqSL22L6
 tZn+1lmwpfhk3Re9VTULwOgb9+ULOTBmT27yH1bizxNtGqxR49/Mz7tUpig0pl7v0sJP
 VhkEbOv4hHjA/ytCAHDo6Ye90FFR3NNE2HTMsjfOjDDxAlNyyTBn2i5RnF2xKh6lY6HZ
 Xwdg==
X-Gm-Message-State: AOAM530STtSy/Kh2l/2ShJ+J1I07FTg0Lly5vL5WeE/kRHJHK1RKfbLE
 yq8QjTZjFZ61ad/gSeSyyBo=
X-Google-Smtp-Source: ABdhPJzdwMBcEoHGFBN8BFYtVx9Mvr6X3ml8KNAOxTdBCKB+cQEsfLXBpCgjAIzQ1rj34+kighSeTA==
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr46644646pju.80.1594025977830; 
 Mon, 06 Jul 2020 01:59:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id a19sm10068149pfn.136.2020.07.06.01.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:59:37 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon,  6 Jul 2020 14:27:46 +0530
Message-Id: <20200706085746.221992-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706085746.221992-1-vaibhavgupta40@gmail.com>
References: <20200706085746.221992-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/3] sun/cassini: use generic
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

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/sun/cassini.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/cassini.c
index debd3c3fa6fb..5b11124450d6 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -5172,10 +5172,9 @@ static void cas_remove_one(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int cas_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused cas_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct cas *cp = netdev_priv(dev);
 	unsigned long flags;
 
@@ -5204,9 +5203,9 @@ static int cas_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int cas_resume(struct pci_dev *pdev)
+static int cas_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct cas *cp = netdev_priv(dev);
 
 	netdev_info(dev, "resuming\n");
@@ -5227,17 +5226,15 @@ static int cas_resume(struct pci_dev *pdev)
 	mutex_unlock(&cp->pm_mutex);
 	return 0;
 }
-#endif /* CONFIG_PM */
+
+static SIMPLE_DEV_PM_OPS(cas_pm_ops, cas_suspend, cas_resume);
 
 static struct pci_driver cas_driver = {
 	.name		= DRV_MODULE_NAME,
 	.id_table	= cas_pci_tbl,
 	.probe		= cas_init_one,
 	.remove		= cas_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= cas_suspend,
-	.resume		= cas_resume
-#endif
+	.driver.pm	= &cas_pm_ops,
 };
 
 static int __init cas_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
