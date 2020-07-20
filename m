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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AD5C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:19:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BC62068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+SAuNve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BC62068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47B2D857CE;
	Mon, 20 Jul 2020 10:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLKRJZaYlhFS; Mon, 20 Jul 2020 10:19:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4BBF2857B0;
	Mon, 20 Jul 2020 10:19:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B633C0894;
	Mon, 20 Jul 2020 10:19:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4F1CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 92935857CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZ3uChmRAR4p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9720F857B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:19:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x8so8479160plm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uw12KCEbxaEVUpmwEUZh3Vc73Xt/78y5dWsYQGsjwSE=;
 b=C+SAuNve5q8758x7nw/tUYMoy5ksYjPm44RXGbm6g26eTpJbBBDY6jyj0v7oM8qv3t
 4aanmG/iRxS7/FWeYyl7arrpzdZ+7LE1Pk0tB1uWiDW96CDcD0fq+DCyAh8TVGSXYEeY
 /IH9pi/ikS94dz/XVZSC9uHYrlY9pM9VwNiiGr5RFWJpGBjvn6X847/zQCA1N06wUQ2O
 vmgy5yV4OEAbu6XnRyzA4wSs1VZu8LoVoqDmurAH+3rmC8H2LtYN3PIy6qCGqCD3A+1Y
 xPIBmqux55cPg2OecP9uogUbS7AEnq57fwe3LSZgJKMG0LCcK+c2uAo7Adb78SnYsmKw
 wALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uw12KCEbxaEVUpmwEUZh3Vc73Xt/78y5dWsYQGsjwSE=;
 b=Q13U7N/w0QVC99vrcHOyZCi6P3TRUDYT8kFz4BvXYnF2R8rRE6XeBFJ791Wq43KaRt
 /L4GT4s93O7EV2iMa4k2CcJNpd3PCfy7EySHLpx7Pv4235RUb5RQ5xk7lj02rQ8alHn+
 i08I5uaqeJSKT0/cwCTnNqr/QzNUso1mXIMvEF/X/Lj119q3xZ43mhwUQYzarcUf5UGd
 +dqbVAMG8rLsFW31K/2G1E3pQNWw1msaXpY+5FcBuFKtvyOb1TnYA8mMa3+QIRkryB3e
 Q4RhmoK/1IHThKWqs9qMo5sujYRkdLm0izwHaQ6xfvM31HDpj0sgu+K+uvF4ti1fKPb1
 8jxw==
X-Gm-Message-State: AOAM5329As42Wa3H1sfELRt41qzvJHMd+rSgRPqm2fA14LuiCbT8i5cW
 VF/vtilu2RREMMSNG2Z0Di0=
X-Google-Smtp-Source: ABdhPJwdPDo+9RE6DH2W2saAHqLQGFzMJDpz3VokXzCWGyfZMpznD5dilZTagO7S95m0jr7ggRmx5w==
X-Received: by 2002:a17:902:7241:: with SMTP id
 c1mr18153906pll.79.1595240377108; 
 Mon, 20 Jul 2020 03:19:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id 22sm16019433pfh.157.2020.07.20.03.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 03:19:36 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2020 15:47:23 +0530
Message-Id: <20200720101722.145211-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] cardreader/rtsx_pcr.c: use
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(), etc.

With generic PM, all essentials will be handled by the  PCI core. Driver
needs to do only device-specific operations.

The driver was also using pci_enable_wake(...,..., 0) to disable wake. Use
device_wakeup_disable() instead.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 33 ++++++++++--------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index 0d5928bc1b6d..24474419bfc4 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1111,8 +1111,7 @@ static void rtsx_pci_idle_work(struct work_struct *work)
 	mutex_unlock(&pcr->pcr_mutex);
 }
 
-#ifdef CONFIG_PM
-static void rtsx_pci_power_off(struct rtsx_pcr *pcr, u8 pm_state)
+static void __maybe_unused rtsx_pci_power_off(struct rtsx_pcr *pcr, u8 pm_state)
 {
 	if (pcr->ops->turn_off_led)
 		pcr->ops->turn_off_led(pcr);
@@ -1126,7 +1125,6 @@ static void rtsx_pci_power_off(struct rtsx_pcr *pcr, u8 pm_state)
 	if (pcr->ops->force_power_down)
 		pcr->ops->force_power_down(pcr, pm_state);
 }
-#endif
 
 void rtsx_pci_enable_ocp(struct rtsx_pcr *pcr)
 {
@@ -1604,10 +1602,9 @@ static void rtsx_pci_remove(struct pci_dev *pcidev)
 		pci_name(pcidev), (int)pcidev->vendor, (int)pcidev->device);
 }
 
-#ifdef CONFIG_PM
-
-static int rtsx_pci_suspend(struct pci_dev *pcidev, pm_message_t state)
+static int __maybe_unused rtsx_pci_suspend(struct device *dev_d)
 {
+	struct pci_dev *pcidev = to_pci_dev(dev_d);
 	struct pcr_handle *handle;
 	struct rtsx_pcr *pcr;
 
@@ -1623,17 +1620,15 @@ static int rtsx_pci_suspend(struct pci_dev *pcidev, pm_message_t state)
 
 	rtsx_pci_power_off(pcr, HOST_ENTER_S3);
 
-	pci_save_state(pcidev);
-	pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
-	pci_disable_device(pcidev);
-	pci_set_power_state(pcidev, pci_choose_state(pcidev, state));
+	device_wakeup_disable(dev_d);
 
 	mutex_unlock(&pcr->pcr_mutex);
 	return 0;
 }
 
-static int rtsx_pci_resume(struct pci_dev *pcidev)
+static int __maybe_unused rtsx_pci_resume(struct device *dev_d)
 {
+	struct pci_dev *pcidev = to_pci_dev(dev_d);
 	struct pcr_handle *handle;
 	struct rtsx_pcr *pcr;
 	int ret = 0;
@@ -1645,13 +1640,6 @@ static int rtsx_pci_resume(struct pci_dev *pcidev)
 
 	mutex_lock(&pcr->pcr_mutex);
 
-	pci_set_power_state(pcidev, PCI_D0);
-	pci_restore_state(pcidev);
-	ret = pci_enable_device(pcidev);
-	if (ret)
-		goto out;
-	pci_set_master(pcidev);
-
 	ret = rtsx_pci_write_register(pcr, HOST_SLEEP_STATE, 0x03, 0x00);
 	if (ret)
 		goto out;
@@ -1667,6 +1655,8 @@ static int rtsx_pci_resume(struct pci_dev *pcidev)
 	return ret;
 }
 
+#ifdef CONFIG_PM
+
 static void rtsx_pci_shutdown(struct pci_dev *pcidev)
 {
 	struct pcr_handle *handle;
@@ -1686,19 +1676,18 @@ static void rtsx_pci_shutdown(struct pci_dev *pcidev)
 
 #else /* CONFIG_PM */
 
-#define rtsx_pci_suspend NULL
-#define rtsx_pci_resume NULL
 #define rtsx_pci_shutdown NULL
 
 #endif /* CONFIG_PM */
 
+static SIMPLE_DEV_PM_OPS(rtsx_pci_pm_ops, rtsx_pci_suspend, rtsx_pci_resume);
+
 static struct pci_driver rtsx_pci_driver = {
 	.name = DRV_NAME_RTSX_PCI,
 	.id_table = rtsx_pci_ids,
 	.probe = rtsx_pci_probe,
 	.remove = rtsx_pci_remove,
-	.suspend = rtsx_pci_suspend,
-	.resume = rtsx_pci_resume,
+	.driver.pm = &rtsx_pci_pm_ops,
 	.shutdown = rtsx_pci_shutdown,
 };
 module_pci_driver(rtsx_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
