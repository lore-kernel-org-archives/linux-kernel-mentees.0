Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222AAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F472078B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+q/ChJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F472078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DEC0C89540;
	Wed,  1 Jul 2020 16:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-kPSJ2Edm2S; Wed,  1 Jul 2020 16:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C62A8944C;
	Wed,  1 Jul 2020 16:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78949C0865;
	Wed,  1 Jul 2020 16:52:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B198C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 379E68ABDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCpaUB1M2i67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B848D8ABC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d194so8625624pga.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuyL93xGAaaNSghhFPwjm3/FQ7kS7DpgB2p+k7g93Fg=;
 b=U+q/ChJ32SvosX5d+vZSvkbJyN6RbExhvMW0WqpXuca3Dk8sqCyku+OZTzx+xDBP0l
 MxXRpkUNg9iKpt6NFlNI2vq8gipOICMkOFe6Yw5PcOvlg7FoPkg0I1OgB8lp1Gdi9KxB
 PbALlHFmRw4q4H9IVleJSSwR7AfVgNlCw794ru1r7JGI8A9pErfQQmxeOfoBlEsSnL8I
 jxrjHieyS39m7ISSuSPfy2WKmSvEeGeueEn8LpjKCpavxy+7XWtFI007+Ht7Ei/Im6+d
 Q2rxrMZIV3N1AhcGBKL1b50zSglv0D16XzpDLA4H5g8HMWe+gdZdfC0BGuX23i3A0jNz
 JO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuyL93xGAaaNSghhFPwjm3/FQ7kS7DpgB2p+k7g93Fg=;
 b=ll7i8nGRJKqQEyIGmDBYxghU7p/c8OHtRtPwtJRNi4TTGQstJAnuT9rC1NYa5bys3p
 VnIljAtxocJrwGB0eyc0bpvjw17JkgYZ786zoqwTwTAI1/zVis0bw0Et/HmvQ+JFLF8C
 2B2pjNJdA2SZH+/UHagSIzB5GsAAiY/JCKv+IFJxmL9SKbMU9z/7l7fmF2AE8SCwTQ+4
 6pGzaVvdlqbSdiL/j/HfTPEzT7c5zlCF0aYPplVftDQyLK4MY/K1tOHOwpyPNshJycrr
 os5iiXeFGBzfRum11sDv5gPuiwdP8TzUFSlu2uTVNZivuXAYvrR3Ri99N2jd6VkMSZ8O
 ZPaQ==
X-Gm-Message-State: AOAM530L3zDuAbCSvQym82Lna5cZr+KSP+e/auZc9yCBzMzz4oEckrDD
 vW2i3hkjjxPzCCdJPszlwQw=
X-Google-Smtp-Source: ABdhPJwZl9Z3ZTfI1i0GTTtXri0t+gvmcmZPYD+1kOUbDpxoXB0QVkNrlSNKTaOLgB2m/e6Agc+E7Q==
X-Received: by 2002:a63:495c:: with SMTP id y28mr21000872pgk.30.1593622372580; 
 Wed, 01 Jul 2020 09:52:52 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id g140sm6297437pfb.48.2020.07.01.09.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:52:52 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 22:20:49 +0530
Message-Id: <20200701165057.667799-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 03/11] starfire: use generic power
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

Thus, there is no need to call the PCI helper functions like
pci_save/restore_sate() and pci_set_power_state().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/adaptec/starfire.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/adaptec/starfire.c b/drivers/net/ethernet/adaptec/starfire.c
index a64191fc2af9..ba0055bb1614 100644
--- a/drivers/net/ethernet/adaptec/starfire.c
+++ b/drivers/net/ethernet/adaptec/starfire.c
@@ -1984,28 +1984,21 @@ static int netdev_close(struct net_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int starfire_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused starfire_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	if (netif_running(dev)) {
 		netif_device_detach(dev);
 		netdev_close(dev);
 	}
 
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev,state));
-
 	return 0;
 }
 
-static int starfire_resume(struct pci_dev *pdev)
+static int __maybe_unused starfire_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	if (netif_running(dev)) {
 		netdev_open(dev);
@@ -2014,8 +2007,6 @@ static int starfire_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
-
 
 static void starfire_remove_one(struct pci_dev *pdev)
 {
@@ -2040,15 +2031,13 @@ static void starfire_remove_one(struct pci_dev *pdev)
 	free_netdev(dev);			/* Will also free np!! */
 }
 
+static SIMPLE_DEV_PM_OPS(starfire_pm_ops, starfire_suspend, starfire_resume);
 
 static struct pci_driver starfire_driver = {
 	.name		= DRV_NAME,
 	.probe		= starfire_init_one,
 	.remove		= starfire_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= starfire_suspend,
-	.resume		= starfire_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &starfire_pm_ops,
 	.id_table	= starfire_pci_tbl,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
