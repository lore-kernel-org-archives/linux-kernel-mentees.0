Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D4DC2BA12
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 15:52:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A8B20757
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 15:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rH5FCmzf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A8B20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 57F5A267EB;
	Thu,  2 Apr 2020 15:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAjgsrNRvGsv; Thu,  2 Apr 2020 15:52:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 970FC2661B;
	Thu,  2 Apr 2020 15:52:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C82FC1AE2;
	Thu,  2 Apr 2020 15:52:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74B03C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 15:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 642CF87526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 15:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wu7kuYh8yiHv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 15:52:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 48581874E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 15:52:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id h11so1474506plr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Apr 2020 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDQwK1TXt5sWyVygN27BJPsqEZEizoEJ06ZdjMc3obs=;
 b=rH5FCmzfe6B+QtmKjBaCdfYPRFdbe2UG3anSu/9XKBOcO78EwTu5Q3KoAkp1A4N21N
 zxRFMchWx+9jfDcNq+3FRmv9JkK2AVl64iiYq1QisrweuDrI+3qF9sX7MKYUOlDhNKTm
 1k/dr2SM0CoP/E8sj2fKAEsly1E4gXzWfp4ydzYZzFJlvvf9NjMt4nDeNULejlUFEnsh
 JZjEt/GEyI1PmaO9vMd66pSZUWyoPz6ntuobG45NcSuB0eaxs70Y4It4p9gJuUsWfWDF
 q4mbRa6IgOVHBKQBpX9xtaFZSz7ZB6EnJNToidczW3QE1FKrG+Xy088zZSdoidh4BWhJ
 Wa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDQwK1TXt5sWyVygN27BJPsqEZEizoEJ06ZdjMc3obs=;
 b=tT3J7pI6peEgjkia8tSgBG9/RSIHn+KwJAZtCM75e0+jjeQKJTNdo/bJpUnfnHwsLm
 mEsIMXRr+u0UPo8Kz7vt8TxBe06YLWGDPZ6grd6mt9AItjK+AdssuQreWeqPcI92bRVv
 DnYsDfZhRXACGiKtLJ31Ypc7zPRCKeSvLWJBTgRuNrypx/SpgQpwYCbwkhVR9fnh5J5n
 HN2LGhH5Ra11NzMpQFOU0eBMBduBwUfmjBYidAqqKqgmkTtT1O/eAVk+BQ9sH47Zntth
 7oYooV2v6qCdD/SjXzJ+mBJj+zd2YrGlruiTTdMI5djysv8HQ3IHdZ4JWMJX/hNKIR8c
 XTpw==
X-Gm-Message-State: AGi0Pubk6H42dvmco2THGELeBrG5c9Ev3TAiJoBYMGRC6aORqfZUVAlL
 QaJjIV25c8TiVatjdGaDeVFhHrgXcJW0nQ==
X-Google-Smtp-Source: APiQypI3uFZr08x4KA3MmKiD9YqKQdV7UWSih4YpgxRNM2nRujlRgRxuIASbzfGrUs8KztbEX7s1Fw==
X-Received: by 2002:a17:90a:218b:: with SMTP id
 q11mr4431693pjc.163.1585842741171; 
 Thu, 02 Apr 2020 08:52:21 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.63])
 by smtp.gmail.com with ESMTPSA id y4sm4051489pfo.39.2020.04.02.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 08:52:20 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 bjorn@helgaas.com, andy@kernel.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, rjw@rjwysocki.net
Date: Thu,  2 Apr 2020 21:20:58 +0530
Message-Id: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
	dev_pm_ops
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

Convert the legacy callback .suspend() and .resume()
to the generic ones.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/gpio/gpio-ml-ioh.c | 47 +++++++++-----------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed..bb71dccac315 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -155,11 +155,10 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /*
  * Save register configuration and disable interrupts.
  */
-static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
+static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -185,7 +184,7 @@ static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
+static void __maybe_unused ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -207,7 +206,6 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 				  &chip->reg->ioh_sel_reg[i]);
 	}
 }
-#endif
 
 static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
@@ -522,10 +520,9 @@ static void ioh_gpio_remove(struct pci_dev *pdev)
 	kfree(chip);
 }
 
-#ifdef CONFIG_PM
-static int ioh_gpio_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused ioh_gpio_suspend(struct device *dev)
 {
-	s32 ret;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct ioh_gpio *chip = pci_get_drvdata(pdev);
 	unsigned long flags;
 
@@ -533,36 +530,15 @@ static int ioh_gpio_suspend(struct pci_dev *pdev, pm_message_t state)
 	ioh_gpio_save_reg_conf(chip);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 
-	ret = pci_save_state(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "pci_save_state Failed-%d\n", ret);
-		return ret;
-	}
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-	ret = pci_enable_wake(pdev, PCI_D0, 1);
-	if (ret)
-		dev_err(&pdev->dev, "pci_enable_wake Failed -%d\n", ret);
-
 	return 0;
 }
 
-static int ioh_gpio_resume(struct pci_dev *pdev)
+static int __maybe_unused ioh_gpio_resume(struct device *dev)
 {
-	s32 ret;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct ioh_gpio *chip = pci_get_drvdata(pdev);
 	unsigned long flags;
 
-	ret = pci_enable_wake(pdev, PCI_D0, 0);
-
-	pci_set_power_state(pdev, PCI_D0);
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "pci_enable_device Failed-%d ", ret);
-		return ret;
-	}
-	pci_restore_state(pdev);
-
 	spin_lock_irqsave(&chip->spinlock, flags);
 	iowrite32(0x01, &chip->reg->srst);
 	iowrite32(0x00, &chip->reg->srst);
@@ -571,10 +547,8 @@ static int ioh_gpio_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define ioh_gpio_suspend NULL
-#define ioh_gpio_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
@@ -587,8 +561,9 @@ static struct pci_driver ioh_gpio_driver = {
 	.id_table = ioh_gpio_pcidev_id,
 	.probe = ioh_gpio_probe,
 	.remove = ioh_gpio_remove,
-	.suspend = ioh_gpio_suspend,
-	.resume = ioh_gpio_resume
+	.driver = {
+		.pm = &ioh_gpio_pm_ops,
+	},
 };
 
 module_pci_driver(ioh_gpio_driver);
-- 
2.26.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
