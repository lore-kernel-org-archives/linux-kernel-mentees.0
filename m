Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19D3C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 14:03:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96BF22BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 14:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vdp2OlVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A96BF22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5FFA688158;
	Mon, 20 Jul 2020 14:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iajPwJmk2Df0; Mon, 20 Jul 2020 14:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1F1F88098;
	Mon, 20 Jul 2020 14:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C869CC0894;
	Mon, 20 Jul 2020 14:03:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE98EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 14:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E5978880F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 14:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uG-55jVtAY8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 14:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 641CF88098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 14:03:12 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so8735531plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvjcerpoGbzCqh4PiBTodpMKQRC6COJGb/XldQjhF8w=;
 b=vdp2OlVtYtgwwNvWfxMZw0hNeAtgQ8Ohk4zCvTDYnF9fvZR8A/bM5eaUWE5WClGGMB
 Z9r8SVjpQCXZ05FMcQ6rDEAKzHo4qx/Q6dCuOX9U/EJCXyOoavZEC50SJkoJjGWUyk0A
 IUQh/xCh5zY616an3Ng6ObsbhT52rw7DPnzZi2kMVhsYzbPEif0qniIB6JKEQPNrD6O+
 XbU46obyQLZ3apRH0ByW4x8oRrJ0A/8yIXONFA8Sup7PNu2VTKtVhz+wHTDZeKUFmTpB
 hrb5b56yPlcOvEoQTM5DH/dhTbx39GNThWzVoi8v9TBAc7r4CpUYCA18trSRC/tiQqIk
 vdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvjcerpoGbzCqh4PiBTodpMKQRC6COJGb/XldQjhF8w=;
 b=nVSsvI/+D4cbet4k8JczejcGVVsC1IzCTQLscMWwtqWP7K/wCg1TqsWSYC5Q3GP6A+
 O6PHOrkxA7yxRCknS58trIrF8usCMvLiyb3YxDEwpAq0f+7lLGUqs6ImeFWeNpe9iChD
 0l+mSwNT96bp1Vwr1cF9mXpYbBcTlOZhGD49j8E8aTqPHCwBi5zbTy2oZDt8XVXXgIdW
 8uoWROsUSXae4J01Om7EHaYs/zkvryv7cBID1n9+RuBEzQ+QVtWiTRspetoQI7Rchwby
 DeAv+LLkNrTZyHINVfgGVnQPmuJszd8EbkOxV4RJa/roomt3OTXEd5B9pKMmX8LJHBbB
 yWwA==
X-Gm-Message-State: AOAM533yizQWGtqj3xE1yGjCPppsbwUMMM+iGrBkmrSRz4PaRQaKb0W8
 VxZoYioF4gr4Sg1uT4+rFeY=
X-Google-Smtp-Source: ABdhPJxmJIiCYPj771LA4jyig7s/69E5m+L8g5e6jC85VSMnNWB9HAh1laUPagA6BvOlZiLnm2FXVQ==
X-Received: by 2002:a17:90a:1a13:: with SMTP id
 19mr21689484pjk.167.1595253791829; 
 Mon, 20 Jul 2020 07:03:11 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id w64sm15773459pgd.67.2020.07.20.07.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 07:03:10 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 20 Jul 2020 19:30:32 +0530
Message-Id: <20200720140031.511830-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-i2c@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] i2c: eg20t: use generic power
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_enable_wake() and pci_set_power_state() to do required operations. In
generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
"struct pci_dev*" variable and drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 73f139690e4e..c0ddc4cc2ce7 100644
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
 
@@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
 		ioread32(p + PCH_I2CESRSTA));
 
-	ret = pci_save_state(pdev);
-
-	if (ret) {
-		pch_pci_err(pdev, "pci_save_state\n");
-		return ret;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_disable(dev);
 
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
+	struct adapter_info *adap_info = dev_get_drvdata(dev);
 
-	if (pci_enable_device(pdev) < 0) {
-		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
-		return -EIO;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
+	device_wakeup_disable(dev);
 
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
@@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 
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
