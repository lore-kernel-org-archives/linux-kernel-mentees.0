Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDA2C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:40:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D219B2075D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWthblwx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D219B2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3B91886AA;
	Mon, 13 Jul 2020 17:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J+7TpwU7YHaz; Mon, 13 Jul 2020 17:40:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 240A9888A4;
	Mon, 13 Jul 2020 17:40:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12B26C0888;
	Mon, 13 Jul 2020 17:40:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8BE9C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D426525CFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzZm8CpuoMDJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:39:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id EE08125521
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:39:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k5so5803844plk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o79HY/YJ97Muwh9uDvJ9rHuVKiZwBdetcBhADyrjYKw=;
 b=pWthblwx4XS1nTxr4C2EivA/n5vv+TetehgxG5VGGx9WqnFEWfMCBfc0TnNl8a6oTs
 L3u03MGf06on2PbEQEZWSOI0dG94IDHDfXJRjGW9GeBTbpgUdaGRHtvVGfonR50uo074
 +x1A7PJp/jcmMqede3M99hONPcWyW0Wx9qATi6QChEEWYMqIuUhH1j8zgDgnu1kcE8oj
 Nwy3nqR6yzT7vxGUz4koXImCaaHxMyBU5aZo70/4Saz8IHhuVGMZjIdO2kJPklUc78Or
 EjOcY2VUetIeMyOywIeIKuyWWHsYHfK2Q7mH58ZxVIDSJGD61ZeRWT8LpUV6Hc0W5XOw
 U9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o79HY/YJ97Muwh9uDvJ9rHuVKiZwBdetcBhADyrjYKw=;
 b=rPTgXnPMHDrlWVxEddGVBys+6SvMWqQPVfDrHF1MgPwgJoTt754473gwlKq85QvdH2
 zvL3qnwS6pqygr4SSXW83FOcSAcnz6irZTxXBOuCkqdxF+at8z7R6u8IHvVxEtkV/Bph
 /ZccYN3ToXFMT3tAyY1quzlCKxRq8hUoB/7ZVp3NgaAIGroFAK/I6BiFkh5TALNfRjgv
 HoyE9KuRXHhaNQABGOC2ZqUp39Il7wTNCDA/kSYxkhrZiGTyfOQ3fZ8ZBXzqSpBkZ59C
 vnAmzCGecc6ZEQPa0qXBm5SWPyn/Gp9LNeYjDkDVFAs/+n/lZ8cX5+si1SYP0zySkvql
 j19g==
X-Gm-Message-State: AOAM533/VHwwM441rHorkWrXgn53sHf4gIF77xUPXEDS4Xen/VxqPeeq
 Tanm3t4xKJpRpTrS3+2jfcg=
X-Google-Smtp-Source: ABdhPJwFpk4uhnBWldMu3apGnerq6DPfo3aCG0/+xTt75ei2oqKCcpBQCcfgWekDts+hfCPSNpLScQ==
X-Received: by 2002:a17:902:7008:: with SMTP id y8mr605240plk.85.1594661997540; 
 Mon, 13 Jul 2020 10:39:57 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id w9sm186540pja.39.2020.07.13.10.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:39:57 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Mon, 13 Jul 2020 23:06:13 +0530
Message-Id: <20200713173613.2095-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713173613.2095-1-vaibhavgupta40@gmail.com>
References: <20200713173613.2095-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] ide: delkin_cb: use generic
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. All required operations are
done by PCI core.

After converting it into generic model, suspend() became an empty function.
Hence, it is defined as NULL.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/ide/delkin_cb.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/ide/delkin_cb.c b/drivers/ide/delkin_cb.c
index 300daabaa575..a711b64dbd1c 100644
--- a/drivers/ide/delkin_cb.c
+++ b/drivers/ide/delkin_cb.c
@@ -123,39 +123,18 @@ delkin_cb_remove (struct pci_dev *dev)
 	pci_disable_device(dev);
 }
 
-#ifdef CONFIG_PM
-static int delkin_cb_suspend(struct pci_dev *dev, pm_message_t state)
-{
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
-	return 0;
-}
+#define delkin_cb_suspend NULL
 
-static int delkin_cb_resume(struct pci_dev *dev)
+static int __maybe_unused delkin_cb_resume(struct device *dev_d)
 {
+	struct pci_dev *dev = to_pci_dev(dev_d);
 	struct ide_host *host = pci_get_drvdata(dev);
-	int rc;
-
-	pci_set_power_state(dev, PCI_D0);
-
-	rc = pci_enable_device(dev);
-	if (rc)
-		return rc;
-
-	pci_restore_state(dev);
-	pci_set_master(dev);
 
 	if (host->init_chipset)
 		host->init_chipset(dev);
 
 	return 0;
 }
-#else
-#define delkin_cb_suspend NULL
-#define delkin_cb_resume NULL
-#endif
 
 static struct pci_device_id delkin_cb_pci_tbl[] = {
 	{ 0x1145, 0xf021, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -164,13 +143,14 @@ static struct pci_device_id delkin_cb_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, delkin_cb_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(delkin_cb_pm_ops, delkin_cb_suspend, delkin_cb_resume);
+
 static struct pci_driver delkin_cb_pci_driver = {
 	.name		= "Delkin-ASKA-Workbit Cardbus IDE",
 	.id_table	= delkin_cb_pci_tbl,
 	.probe		= delkin_cb_probe,
 	.remove		= delkin_cb_remove,
-	.suspend	= delkin_cb_suspend,
-	.resume		= delkin_cb_resume,
+	.driver.pm	= &delkin_cb_pm_ops,
 };
 
 module_pci_driver(delkin_cb_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
