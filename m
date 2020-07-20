Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A29C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 12:07:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4431A2176B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 12:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzUCvGsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4431A2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0066287E3D;
	Mon, 20 Jul 2020 12:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-+2TvYmDc6T; Mon, 20 Jul 2020 12:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79F9587E3B;
	Mon, 20 Jul 2020 12:07:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60712C0894;
	Mon, 20 Jul 2020 12:07:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E842C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1A2A220017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QNvSXqk0MVJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 783F01FEED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:07:35 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id b92so9996866pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWZKrOwq0rwjH5TwZ+UuKWlHddegJY7Nfmtdu4+t0zs=;
 b=XzUCvGslWr8de/Lj8121/tEpnZIfr0ColO1QujuDd9enBJsHTsaoQhN+0ZH/29Wtpf
 u4b9lZRjGc02DRjbZ6I5Zg+w/FOn+3Uk87EPegYpYGXH1Ss8wKvggR5hXVSkK9USTHxc
 RWcpG5sfF2gHaZ0tNIQjvJ9jxtnBUJjQfjM9g0UyzaZPQbtBId1QEb1/jI4CO6FI4l1F
 F3ufHVkPlhFeR1YJBosKSgagBgsy+9wxBZSwQ3+JEVwAmn1nTqlN+TR+W2khuxL+hcCu
 cdwd+U2jp+1p4lHdYacGNIYSunMdY5dalww2HdoEhX8fPlavAXTeoubhsKHOHO90DM6A
 SVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWZKrOwq0rwjH5TwZ+UuKWlHddegJY7Nfmtdu4+t0zs=;
 b=rd1DXlAbs86wg3TkCinU7pH8n8wKC+SIKTfiomyoYhY/h6i0nYUm80yzwlMNoW2VcA
 8we04H9icUi1LIf+27oJpTpQRGKKOp4geyQVKfN2VYUFPyrGMmNvG2uRumlJcC/QYA/l
 x7t5oiw5C1dKRh+HI4CHEERvH5et4smUjfsxFWlfQyav0jeBMtIdDKV3mWFS7Z0JDeVc
 GnHBk6a0g3B7jDIBzvjD5tEB8dqUaov2QKh0m55ScldUjW/J98fTsVWkTHQ1ay75VTcZ
 TRIiHjI7Je6jdxmmpEmwpyJrG6WanOcTd85bkTYvrBAS7KoJSVwZS7TN3GkeW+a11FZz
 QHDA==
X-Gm-Message-State: AOAM531oA1vtw4Fy/JHqOzdSqpXkLkCeJqhZwoEUEDbzZgLQ7kEt2nLJ
 hZWzvmeICZhWB17kjx+TiTk=
X-Google-Smtp-Source: ABdhPJxlzUQmni1k1ndNykvfDgcQIktn9Uean9Z/i0ROVcwVzRJcUpiMgWJzkxVJaBf28RxXfI2F1g==
X-Received: by 2002:a17:90a:e017:: with SMTP id
 u23mr15893404pjy.137.1595246854880; 
 Mon, 20 Jul 2020 05:07:34 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id 141sm16777668pfw.72.2020.07.20.05.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 05:07:34 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Date: Mon, 20 Jul 2020 17:34:15 +0530
Message-Id: <20200720120414.399961-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] serial: pch_uart: use generic
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable_device() and pci_set_power_state()
to do required operations. In generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use dev_get_drvdata() to get drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/tty/serial/pch_uart.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 40fa7a27722d..67aca8cb9cd4 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -1857,41 +1857,24 @@ static void pch_uart_pci_remove(struct pci_dev *pdev)
 	kfree(priv);
 	return;
 }
-#ifdef CONFIG_PM
-static int pch_uart_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+
+static int __maybe_unused pch_uart_pci_suspend(struct device *dev)
 {
-	struct eg20t_port *priv = pci_get_drvdata(pdev);
+	struct eg20t_port *priv = dev_get_drvdata(dev);
 
 	uart_suspend_port(&pch_uart_driver, &priv->port);
 
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int pch_uart_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_uart_pci_resume(struct device *dev)
 {
-	struct eg20t_port *priv = pci_get_drvdata(pdev);
-	int ret;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev,
-		"%s-pci_enable_device failed(ret=%d) ", __func__, ret);
-		return ret;
-	}
+	struct eg20t_port *priv = dev_get_drvdata(dev);
 
 	uart_resume_port(&pch_uart_driver, &priv->port);
 
 	return 0;
 }
-#else
-#define pch_uart_pci_suspend NULL
-#define pch_uart_pci_resume NULL
-#endif
 
 static const struct pci_device_id pch_uart_pci_id[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x8811),
@@ -1945,13 +1928,16 @@ static int pch_uart_pci_probe(struct pci_dev *pdev,
 	return ret;
 }
 
+static SIMPLE_DEV_PM_OPS(pch_uart_pci_pm_ops,
+			 pch_uart_pci_suspend,
+			 pch_uart_pci_resume);
+
 static struct pci_driver pch_uart_pci_driver = {
 	.name = "pch_uart",
 	.id_table = pch_uart_pci_id,
 	.probe = pch_uart_pci_probe,
 	.remove = pch_uart_pci_remove,
-	.suspend = pch_uart_pci_suspend,
-	.resume = pch_uart_pci_resume,
+	.driver.pm = &pch_uart_pci_pm_ops,
 };
 
 static int __init pch_uart_module_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
