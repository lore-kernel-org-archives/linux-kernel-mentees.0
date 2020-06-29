Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC62C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:30:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CBA23359
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj9LflCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CBA23359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA3C488808;
	Mon, 29 Jun 2020 08:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZlsJ8vr5PpR; Mon, 29 Jun 2020 08:30:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C74A88802;
	Mon, 29 Jun 2020 08:30:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C177C0865;
	Mon, 29 Jun 2020 08:30:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B118C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D393B8881E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id be2uxOJ7+5y5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:30:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A770588801
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:30:08 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t6so7984301pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vn4Ze0UHW0gH8hUyyrUyOwtMgWZD0FLbsTJZBjBZlPg=;
 b=Xj9LflCa6VYlGnt52Oz9oTfxstS0hCfiCJRh3uW2yvWsPSwqKXyPSRW1nuEcpWPyNL
 FkBk+bHHpd79vy+tX/vJYN00b/jYiKPrFg4Ulvz8BPnrO/iN4beZiXVoUFlQiIl0perU
 shErqJOLmy42xDUqXxSzXQyvOzQ2Gg9UjT55O8d6E2HzZJs+eSFO3tM6JB5nqxiJEbPD
 BYcCCAVsV+mJKAzBp+sryiXPHPW26HG1dCtJNWmPUnDgDQKHg6mAggBQGg+vnUjG3XBg
 bSftecGHNVMKKZPLsh2WV9syRkMiwio0H/IvdOESzEKBaIDd8W4R6DVXxFCCaKRqqc6p
 QBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vn4Ze0UHW0gH8hUyyrUyOwtMgWZD0FLbsTJZBjBZlPg=;
 b=Kgu4bu0fmmFEzq/UYVuPLs+DnDjCLIEzndX5jeb5GCANvWAA0IeIk68XsfeAH7pS3e
 KDwFcnXUrzqjQ0fI3j8F2KDHD9Q3kV66nf4Z5gyyMh5svEYmb7GaV/EJyLinilhht7ty
 1MJfBpXCUphtuNP/zhBSYx48nXU/1mBGPHRr2NP4DWMOEeNdjybYFnE9NPeMtNIygjpY
 rNpmPzfmZ+3oYaOlhiXRS5y00OulVdWzw5cwg7UvFrDC8pgnVr3uM2Ss1wtDkqZGsy5s
 y5TvziSj+dYUm43EdjG3O9xCkn3aq2kFmSvLq5DT2ICr4fQYCk13WIw+00ATVLrVIdKG
 tPNA==
X-Gm-Message-State: AOAM530gV8m8N9rIIrBE4K8XaSCHJGhbXogkIv+8RseCbURGLcKhWRvU
 xJHqAiM0QHvel1V4TlbPlYU=
X-Google-Smtp-Source: ABdhPJyJRgqqMjOOssnX0R5YVEwJg/CfAQowXuEo7uiGSKuBQsWEr2DXB6YAuuB5IyOGGNgwnqi/8A==
X-Received: by 2002:a63:6486:: with SMTP id y128mr8964219pgb.82.1593419408269; 
 Mon, 29 Jun 2020 01:30:08 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id 202sm9133790pfw.84.2020.06.29.01.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:30:07 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 13:58:18 +0530
Message-Id: <20200629082819.216405-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629082819.216405-1-vaibhavgupta40@gmail.com>
References: <20200629082819.216405-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 3/4] rts5208/rtsx.c: use generic
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(), etc.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

The driver was also using pci_enable_wake(...,..., 0) to disable wake. Use
device_wakeup_disable() instead.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index be0053c795b7..6ca90694db8b 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -258,12 +258,12 @@ static int rtsx_acquire_irq(struct rtsx_dev *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /*
  * power management
  */
-static int rtsx_suspend(struct pci_dev *pci, pm_message_t state)
+static int __maybe_unused rtsx_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci = to_pci_dev(dev_d);
 	struct rtsx_dev *dev = pci_get_drvdata(pci);
 	struct rtsx_chip *chip;
 
@@ -285,10 +285,7 @@ static int rtsx_suspend(struct pci_dev *pci, pm_message_t state)
 	if (chip->msi_en)
 		pci_disable_msi(pci);
 
-	pci_save_state(pci);
-	pci_enable_wake(pci, pci_choose_state(pci, state), 1);
-	pci_disable_device(pci);
-	pci_set_power_state(pci, pci_choose_state(pci, state));
+	device_wakeup_enable(dev_d);
 
 	/* unlock the device pointers */
 	mutex_unlock(&dev->dev_mutex);
@@ -296,8 +293,9 @@ static int rtsx_suspend(struct pci_dev *pci, pm_message_t state)
 	return 0;
 }
 
-static int rtsx_resume(struct pci_dev *pci)
+static int __maybe_unused rtsx_resume(struct device *dev_d)
 {
+	struct pci_dev *pci = to_pci_dev(dev_d);
 	struct rtsx_dev *dev = pci_get_drvdata(pci);
 	struct rtsx_chip *chip;
 
@@ -309,16 +307,6 @@ static int rtsx_resume(struct pci_dev *pci)
 	/* lock the device pointers */
 	mutex_lock(&dev->dev_mutex);
 
-	pci_set_power_state(pci, PCI_D0);
-	pci_restore_state(pci);
-	if (pci_enable_device(pci) < 0) {
-		dev_err(&dev->pci->dev,
-			"%s: pci_enable_device failed, disabling device\n",
-			CR_DRIVER_NAME);
-		/* unlock the device pointers */
-		mutex_unlock(&dev->dev_mutex);
-		return -EIO;
-	}
 	pci_set_master(pci);
 
 	if (chip->msi_en) {
@@ -340,7 +328,6 @@ static int rtsx_resume(struct pci_dev *pci)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static void rtsx_shutdown(struct pci_dev *pci)
 {
@@ -999,16 +986,15 @@ static const struct pci_device_id rtsx_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, rtsx_ids);
 
+static SIMPLE_DEV_PM_OPS(rtsx_pm_ops, rtsx_suspend, rtsx_resume);
+
 /* pci_driver definition */
 static struct pci_driver rtsx_driver = {
 	.name = CR_DRIVER_NAME,
 	.id_table = rtsx_ids,
 	.probe = rtsx_probe,
 	.remove = rtsx_remove,
-#ifdef CONFIG_PM
-	.suspend = rtsx_suspend,
-	.resume = rtsx_resume,
-#endif
+	.driver.pm = &rtsx_pm_ops,
 	.shutdown = rtsx_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
