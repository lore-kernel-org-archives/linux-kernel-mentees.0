Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F95C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0FB207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtQYdBra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0FB207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D51787DC0;
	Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RLd_M9ct58U; Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EEE487DB0;
	Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A113C0888;
	Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1879C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D10A887DB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5e6VwfMO7OK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 60F0F87DB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:44 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a9so3183805pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Jul 2020 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4o+ZvPMksH/mCK/c/HDn/RkcQN7O7pX0UDd4MLfNlo=;
 b=AtQYdBra+JVvn7sj0HuVvPfyV1r50bN0iVzn7jdSs2k+//yzu6cTSzWBMz8S1hW31d
 bOKth8SXUtKb7zsPAxXQ+ON/CROJ0PfiTI2wxUkgefQcR3dI9E1lowVXGbGhNS3SHBb8
 p2Il4tpZmjvqUQU2Vpn3mI1k3QecOwv6y9Q0dX9IJCO4dClSRVNqfsPzA6T0CrqJJGN8
 9PPnc9lnfT77XLRLLEp39G2LnAt/V417LsYwto6Dr3NYKay0aSL/2yX9cBTifRBVDfqr
 Bb5fIJy39QsBGnAR+r2lLk6PXv9+/kv8mKlUvbTn6TmgfgFTscUHOeXFcRADOBiTk4ey
 dXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4o+ZvPMksH/mCK/c/HDn/RkcQN7O7pX0UDd4MLfNlo=;
 b=gFKaOwuPrrkjHBd2rIOHT9hlMAfInfaMKQVouFeT/2YV5wmR4plFfRi6XCrrEGEZwL
 sPWSHDLpfJNDcVk0t1pj4qwsDFo+0+Q76S1R5WApoT9kMOZh/MAU4JD5+Y5BX6UFb51N
 FPv9UiVof2wZHM3a0ui3w99rrvOQxAP5OyPA3fivk6XMeD74COdR2OsMS3WeAnny6ZRQ
 gtfMGXWDADEyxlfLZFG1hu5YIV9JMcg5oSGrg9fFVxxtabURnPwEfJxBw10KBP2+kP1a
 Ctzv5X18zeOiKgALrb56y8ODhjJU8Ljbdow1Y/VywWlSLpf4hPt3X5DAguLwsg0NSpE6
 lPdQ==
X-Gm-Message-State: AOAM531zb3E8ZmpT/xzJaztMp99ONqneasZpxBt0eEuXLz1AKZBtkZ0f
 jJLqTQvBz8HgOmxWahPISHk=
X-Google-Smtp-Source: ABdhPJwcLuW1N9f00/vsxYLUKzRnYyskZOoTPkdh2DaBblE/O9vUa5fbHi6nQfPhfqUr2oI7fnv7Lw==
X-Received: by 2002:a17:90a:20ad:: with SMTP id
 f42mr25987368pjg.96.1593764203990; 
 Fri, 03 Jul 2020 01:16:43 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id y198sm8437085pfg.116.2020.07.03.01.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:16:43 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Fri,  3 Jul 2020 13:44:28 +0530
Message-Id: <20200703081428.1011527-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703081428.1011527-1-vaibhavgupta40@gmail.com>
References: <20200703081428.1011527-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 4/4] ide: delkin_cb: use generic
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
 drivers/ide/delkin_cb.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/ide/delkin_cb.c b/drivers/ide/delkin_cb.c
index 300daabaa575..a8a1af6aa1c1 100644
--- a/drivers/ide/delkin_cb.c
+++ b/drivers/ide/delkin_cb.c
@@ -123,28 +123,13 @@ delkin_cb_remove (struct pci_dev *dev)
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
 
-	pci_set_power_state(dev, PCI_D0);
-
-	rc = pci_enable_device(dev);
-	if (rc)
-		return rc;
-
-	pci_restore_state(dev);
 	pci_set_master(dev);
 
 	if (host->init_chipset)
@@ -152,10 +137,6 @@ static int delkin_cb_resume(struct pci_dev *dev)
 
 	return 0;
 }
-#else
-#define delkin_cb_suspend NULL
-#define delkin_cb_resume NULL
-#endif
 
 static struct pci_device_id delkin_cb_pci_tbl[] = {
 	{ 0x1145, 0xf021, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -164,13 +145,14 @@ static struct pci_device_id delkin_cb_pci_tbl[] = {
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
