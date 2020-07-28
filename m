Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392F4C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 10:25:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0817120775
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 10:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wmz69gtA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0817120775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8ED3822FF0;
	Tue, 28 Jul 2020 10:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mNxEv2-7hJK; Tue, 28 Jul 2020 10:25:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B819F22879;
	Tue, 28 Jul 2020 10:25:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A81EFC0050;
	Tue, 28 Jul 2020 10:25:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82802C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6188A22FF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LI-r2RcS1MVz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:25:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 6EDE622879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:25:50 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k71so11277568pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAK7NZIIkVIKxbhw+1qDbbbtZdz+xeC5teBUBWJVzQI=;
 b=Wmz69gtAJ/8KHH9ECmxzv3ZOuWv5DZ0Uz6a5vygrxjfsooBYBQfIJDbjnVvs58z7bn
 3PCWAZA17+61JdwYRbakstPRLIOXhKGtTycCBBdfUtWPPbd5QWrjNelnWXZ5CLVzuFcc
 Jw/1pMHBhfLoENQNdnlcXF9lglMgB4VIx83hbl+eQ4Dbsv1npCm1cOosvz9MapH7/FQj
 rG2t/KgZzxQniLMXFlSc/HsGECD8YBRo8YWtLVBiKcDv/Kz/h47GzWF9MPZsQ4nVDNbQ
 USkL5/AZSjI9+c3xQti2wt6zqvSlKmoR7FRmjuEmRAcw5ZkEs73Kif5YKV/03h98WShB
 AmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAK7NZIIkVIKxbhw+1qDbbbtZdz+xeC5teBUBWJVzQI=;
 b=gqYptIOef/p0EdkJJQd9/jwnoqj0tP3sbLTulno5ZlqzwwxBHwKQjO2l+f1XdRBlej
 UGv/Zrci9SAm3up9rnVonNYv0h2+KCzkzCbZwPhk1/iL5AkseJOJ6HnV1Hnwpsi/xLtB
 W96ipkgBuTEvaBfpmHvrHPSd03IT49BG4dGA+wNVjgfvBgSkDqhp7S7sB2rxV8goNPKy
 uVtFWubJjK+1UnPSl4Yr1y5nq7+tOrKQ+RKkVIg5cBWdql03wwldWFehpclxHHFt4aEp
 ebKv3dGmTA6o3g8ADz/6GuDmmmU/Koi36ydM2AJrT7HYhfmarFeysjyjAoP9GNoO0eYq
 A05w==
X-Gm-Message-State: AOAM533STNIR9fqy8ix/vdlilrrNYYmEFTly/1YmeiIHDGZI07YTsrXl
 D4g1eZDW0B8gVENORg9z4Y0=
X-Google-Smtp-Source: ABdhPJyJFtv0gmRygzPhKe0KCjZFn8qDgVt/D1013y/toOihztfTXZVKr2fL1XiKuK26eTyPzA5ApQ==
X-Received: by 2002:a17:90a:8985:: with SMTP id
 v5mr3698662pjn.181.1595931949843; 
 Tue, 28 Jul 2020 03:25:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id q73sm2709295pjc.11.2020.07.28.03.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:25:49 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Tue, 28 Jul 2020 15:54:18 +0530
Message-Id: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] [media] bttv: use generic power
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
 drivers/media/pci/bt8xx/bttv-driver.c | 56 ++++++++-------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9144f795fb93..cb8d955d1d5d 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -4263,15 +4263,14 @@ static void bttv_remove(struct pci_dev *pci_dev)
 	return;
 }
 
-#ifdef CONFIG_PM
-static int bttv_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused bttv_suspend(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
 	struct bttv_buffer_set idle;
 	unsigned long flags;
 
-	dprintk("%d: suspend %d\n", btv->c.nr, state.event);
+	dprintk("%d: suspend\n", btv->c.nr);
 
 	/* stop dma + irqs */
 	spin_lock_irqsave(&btv->s_lock,flags);
@@ -4291,42 +4290,19 @@ static int bttv_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	btv->state.gpio_enable = btread(BT848_GPIO_OUT_EN);
 	btv->state.gpio_data   = gpio_read();
 
-	/* save pci state */
-	pci_save_state(pci_dev);
-	if (0 != pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state))) {
-		pci_disable_device(pci_dev);
-		btv->state.disabled = 1;
-	}
+	btv->state.disabled = 1;
 	return 0;
 }
 
-static int bttv_resume(struct pci_dev *pci_dev)
+static int __maybe_unused bttv_resume(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
 	unsigned long flags;
-	int err;
 
 	dprintk("%d: resume\n", btv->c.nr);
 
-	/* restore pci state */
-	if (btv->state.disabled) {
-		err=pci_enable_device(pci_dev);
-		if (err) {
-			pr_warn("%d: Can't enable device\n", btv->c.nr);
-			return err;
-		}
-		btv->state.disabled = 0;
-	}
-	err=pci_set_power_state(pci_dev, PCI_D0);
-	if (err) {
-		pci_disable_device(pci_dev);
-		pr_warn("%d: Can't enable device\n", btv->c.nr);
-		btv->state.disabled = 1;
-		return err;
-	}
-
-	pci_restore_state(pci_dev);
+	btv->state.disabled = 0;
 
 	/* restore bt878 state */
 	bttv_reinit_bt848(btv);
@@ -4344,7 +4320,6 @@ static int bttv_resume(struct pci_dev *pci_dev)
 	spin_unlock_irqrestore(&btv->s_lock,flags);
 	return 0;
 }
-#endif
 
 static const struct pci_device_id bttv_pci_tbl[] = {
 	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT848), 0},
@@ -4357,15 +4332,16 @@ static const struct pci_device_id bttv_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, bttv_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(bttv_pm_ops,
+			 bttv_suspend,
+			 bttv_resume);
+
 static struct pci_driver bttv_pci_driver = {
-	.name     = "bttv",
-	.id_table = bttv_pci_tbl,
-	.probe    = bttv_probe,
-	.remove   = bttv_remove,
-#ifdef CONFIG_PM
-	.suspend  = bttv_suspend,
-	.resume   = bttv_resume,
-#endif
+	.name      = "bttv",
+	.id_table  = bttv_pci_tbl,
+	.probe     = bttv_probe,
+	.remove    = bttv_remove,
+	.driver.pm = &bttv_pm_ops,
 };
 
 static int __init bttv_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
