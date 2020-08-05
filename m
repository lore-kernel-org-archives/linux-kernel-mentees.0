Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698D3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:39:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F86206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BikImbzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F86206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C959C22797;
	Wed,  5 Aug 2020 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbjggtSOdY4x; Wed,  5 Aug 2020 19:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E111820028;
	Wed,  5 Aug 2020 19:39:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF956C0051;
	Wed,  5 Aug 2020 19:39:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6261BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 512AA88363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fE99h5Rm1nxb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AB0E088362
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s26so23414486pfm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBMgOJj+hD0qde6PizICeeruU0EhS183W5s3SUBAwf4=;
 b=BikImbzKWtXH4hWkL6UbutgkjuCU5o+a4HGlxXS/Eln4FqKtJYUgtDLL6YIHyGSCP8
 CBxLixsGpoTPYMz8Cf0XrtLRu6+Rti11TQrJqZgpiaDsCXwpj9MbpPYhYVAgiB8/QkVf
 DgP19nZF+fOvIDznv++8Xl99J8bYUKHo7N3maZr2NZCnhAlYkpBEiIHaVBCaTr/ZGEQa
 /PRc6prnGBWZ5Z9yJ2ZWDsbUTzud+kzUWqtFPXn5UCcE9iIKmaAOZDPlsP9hiT0UlwWO
 yue8KChKcJa0oHV2iHf01F95VU1hdKwjiPl+mM19h4Pfh/IsJRjEbP4Rcq5XJjIgQYBl
 La/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBMgOJj+hD0qde6PizICeeruU0EhS183W5s3SUBAwf4=;
 b=eeEN+MFZijuRazNd//lqCEALjTJLu+Sc2Su1he35QwSaoJHTWtKuWgwa2N2Xl0JOvn
 DXqL9+zdmNTaiSMqofPPmCau4DYSXnckgLve3c+GTppd0PGZL5/gRvW3L4Wd74jGhPFF
 TBw9v4z0/c88mCCBJ8gnaS6cSif0Vx4fRBSR3W3WTzDxsWR7Irv5S3XinodyerMrTAL0
 hSXv+/rdWfSSHCfQq4F4uH6kJCuxwE7B0wZh25IvgIBBKHcBtFHSudc2SXFlVQ4aY7nE
 U+uv1XdvcuAnkmhcUrMeEIU1eXpOaoYZZP97605CJNkiLEWWaRClBriThU6/1qKEMUD9
 tNvA==
X-Gm-Message-State: AOAM532HKdayi0NfZR8jm1ylTBobTLKsTjT/UDEkg4hWf1oWbRtpGBFz
 6gaSDS+ATgcpCgMzKB+wGcE=
X-Google-Smtp-Source: ABdhPJwFtNAeKIW4wjHsuCKjx78tIa6bbsqpyKdJl7Wd91LaOdgUTgAq66b+bFaz44muXZNU/9fsXg==
X-Received: by 2002:a63:5b55:: with SMTP id l21mr4506542pgm.348.1596656338172; 
 Wed, 05 Aug 2020 12:38:58 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f20sm4901764pfk.36.2020.08.05.12.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 12:38:57 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Date: Thu,  6 Aug 2020 01:06:16 +0530
Message-Id: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805193616.384313-1-vaibhavgupta40@gmail.com>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-i2c@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] i2c: eg20t: use generic power
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index eb41de22d461..843b31a0f752 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
 	kfree(adap_info);
 }
 
-#ifdef CONFIG_PM
-static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_i2c_suspend(struct device *dev)
 {
-	int ret;
 	int i;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct adapter_info *adap_info = pci_get_drvdata(pdev);
 	void __iomem *p = adap_info->pch_data[0].pch_base_address;
 
@@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
 		ioread32(p + PCH_I2CESRSTA));
 
-	ret = pci_save_state(pdev);
-
-	if (ret) {
-		pch_pci_err(pdev, "pci_save_state\n");
-		return ret;
-	}
-
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int pch_i2c_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_i2c_resume(struct device *dev)
 {
 	int i;
-	struct adapter_info *adap_info = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	if (pci_enable_device(pdev) < 0) {
-		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
-		return -EIO;
-	}
+	struct adapter_info *adap_info = dev_get_drvdata(dev);
 
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
@@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define pch_i2c_suspend NULL
-#define pch_i2c_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
 
 static struct pci_driver pch_pcidriver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pch_pcidev_id,
 	.probe = pch_i2c_probe,
 	.remove = pch_i2c_remove,
-	.suspend = pch_i2c_suspend,
-	.resume = pch_i2c_resume
+	.driver.pm = &pch_i2c_pm_ops,
 };
 
 module_pci_driver(pch_pcidriver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
