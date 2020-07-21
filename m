Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D1C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:34:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC822073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtvX1XL/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC822073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80C4286EB5;
	Tue, 21 Jul 2020 12:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIa0Q9xkbwFv; Tue, 21 Jul 2020 12:34:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC6FE86EB1;
	Tue, 21 Jul 2020 12:34:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB072C089F;
	Tue, 21 Jul 2020 12:34:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA7F9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A05EE88663
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvv2zOaLpnp0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D31198868D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:34:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m22so11858258pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9vT+ryoFOyN/388ib3S7OpMgYYcknWATF+35KGtV21o=;
 b=ZtvX1XL/SkA8UNSdRcB3f0x+Rls0qmqEKuSTAfTAy5km/1rJn3jjjplyp5pUSVUkR+
 8Vi0IxKYShw0yQR/rnoS7FL5trXX9MxIZiIr1a83hjR7DL40dmNeb4F2NijKQ5pf/UeG
 9ZnzT8V8AX7AZsZbPGmYPOu8ry0rMCtFSPp5azhoxkB2jHbs38lZMWUwM9EODYLRuaA9
 fQzSaAvqopVELjN46xwgw1B5hhhfriyXZ07D40VhUoZFs/JzPgvhBqG30f4Cxovo041h
 HjGl5nsGIBhOCf1ThBGR7lQatupjm4zxsH0tUdbC4x6qP/Sf5t5rPiKGtoWTC/ZUb8Qt
 Uumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9vT+ryoFOyN/388ib3S7OpMgYYcknWATF+35KGtV21o=;
 b=pTAnGRGph4liGZmC/hhIkf0UOdc8UmrlOl6mmwfR0zaHXInsnNxEsn4bjzbjqvHsH8
 peG2W2IsIqITWA8BY4fwaOO45avpIHDk8EL02JQWW691w1e3q4j6CVmrPI73mkwE1o8u
 I76rvvtA1+WhC4neZ5uw6A8OaIOKMxzBn4elr/oLbcY2IR/SaiPH9ERL6i09HKfsqQEg
 Q/QDQAU396/pAnEmRybTEwpAKs4o5Bd79nPk1QLdy/t7jgjwXpgsW5EYdM23TnU5Ix5E
 LdwGAE3BbClEBj6P9OMazCH6JBWvmD2zxfYyw0MX9VAuzYYGeUPuemOkUrM1lOuNAItT
 hGdw==
X-Gm-Message-State: AOAM531jFpGDFAVfmbb7ZJQv9flG4WJzag49Crwx3uTEpN8h/Vz7Vl6L
 02t8XT3t3XUdJKf0BN6IZhQ=
X-Google-Smtp-Source: ABdhPJxcl0WN5ZhDqD4cKYQdyXsYpozM13cNwLYDulzs8b0p8enF59LgE5wfjKSNcwiZlpQ9Bjd8jQ==
X-Received: by 2002:a63:f806:: with SMTP id n6mr22169429pgh.346.1595334859251; 
 Tue, 21 Jul 2020 05:34:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id h9sm20293586pfk.155.2020.07.21.05.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:34:18 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 21 Jul 2020 18:01:47 +0530
Message-Id: <20200721123146.81710-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-crypto@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] crypto: ccp: sp-pci: use generic
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions as through
the generic framework, PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/crypto/ccp/ccp-dev.c     |  8 +++-----
 drivers/crypto/ccp/sp-dev.c      |  6 ++----
 drivers/crypto/ccp/sp-dev.h      |  6 +++---
 drivers/crypto/ccp/sp-pci.c      | 17 ++++++-----------
 drivers/crypto/ccp/sp-platform.c |  2 +-
 5 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-dev.c b/drivers/crypto/ccp/ccp-dev.c
index 19ac509ed76e..8ae26d3cffff 100644
--- a/drivers/crypto/ccp/ccp-dev.c
+++ b/drivers/crypto/ccp/ccp-dev.c
@@ -531,8 +531,7 @@ int ccp_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return len;
 }
 
-#ifdef CONFIG_PM
-bool ccp_queues_suspended(struct ccp_device *ccp)
+bool __maybe_unused ccp_queues_suspended(struct ccp_device *ccp)
 {
 	unsigned int suspended = 0;
 	unsigned long flags;
@@ -549,7 +548,7 @@ bool ccp_queues_suspended(struct ccp_device *ccp)
 	return ccp->cmd_q_count == suspended;
 }
 
-int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
+int __maybe_unused ccp_dev_suspend(struct sp_device *sp)
 {
 	struct ccp_device *ccp = sp->ccp_data;
 	unsigned long flags;
@@ -577,7 +576,7 @@ int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
 	return 0;
 }
 
-int ccp_dev_resume(struct sp_device *sp)
+int __maybe_unused ccp_dev_resume(struct sp_device *sp)
 {
 	struct ccp_device *ccp = sp->ccp_data;
 	unsigned long flags;
@@ -601,7 +600,6 @@ int ccp_dev_resume(struct sp_device *sp)
 
 	return 0;
 }
-#endif
 
 int ccp_dev_init(struct sp_device *sp)
 {
diff --git a/drivers/crypto/ccp/sp-dev.c b/drivers/crypto/ccp/sp-dev.c
index ce42675d3274..6284a15e5047 100644
--- a/drivers/crypto/ccp/sp-dev.c
+++ b/drivers/crypto/ccp/sp-dev.c
@@ -211,13 +211,12 @@ void sp_destroy(struct sp_device *sp)
 	sp_del_device(sp);
 }
 
-#ifdef CONFIG_PM
-int sp_suspend(struct sp_device *sp, pm_message_t state)
+int sp_suspend(struct sp_device *sp)
 {
 	int ret;
 
 	if (sp->dev_vdata->ccp_vdata) {
-		ret = ccp_dev_suspend(sp, state);
+		ret = ccp_dev_suspend(sp);
 		if (ret)
 			return ret;
 	}
@@ -237,7 +236,6 @@ int sp_resume(struct sp_device *sp)
 
 	return 0;
 }
-#endif
 
 struct sp_device *sp_get_psp_master_device(void)
 {
diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
index f913f1494af9..0218d0670eee 100644
--- a/drivers/crypto/ccp/sp-dev.h
+++ b/drivers/crypto/ccp/sp-dev.h
@@ -119,7 +119,7 @@ int sp_init(struct sp_device *sp);
 void sp_destroy(struct sp_device *sp);
 struct sp_device *sp_get_master(void);
 
-int sp_suspend(struct sp_device *sp, pm_message_t state);
+int sp_suspend(struct sp_device *sp);
 int sp_resume(struct sp_device *sp);
 int sp_request_ccp_irq(struct sp_device *sp, irq_handler_t handler,
 		       const char *name, void *data);
@@ -134,7 +134,7 @@ struct sp_device *sp_get_psp_master_device(void);
 int ccp_dev_init(struct sp_device *sp);
 void ccp_dev_destroy(struct sp_device *sp);
 
-int ccp_dev_suspend(struct sp_device *sp, pm_message_t state);
+int ccp_dev_suspend(struct sp_device *sp);
 int ccp_dev_resume(struct sp_device *sp);
 
 #else	/* !CONFIG_CRYPTO_DEV_SP_CCP */
@@ -145,7 +145,7 @@ static inline int ccp_dev_init(struct sp_device *sp)
 }
 static inline void ccp_dev_destroy(struct sp_device *sp) { }
 
-static inline int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
+static inline int ccp_dev_suspend(struct sp_device *sp)
 {
 	return 0;
 }
diff --git a/drivers/crypto/ccp/sp-pci.c b/drivers/crypto/ccp/sp-pci.c
index cb6cb47053f4..f471dbaef1fb 100644
--- a/drivers/crypto/ccp/sp-pci.c
+++ b/drivers/crypto/ccp/sp-pci.c
@@ -252,23 +252,19 @@ static void sp_pci_remove(struct pci_dev *pdev)
 	sp_free_irqs(sp);
 }
 
-#ifdef CONFIG_PM
-static int sp_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused sp_pci_suspend(struct device *dev)
 {
-	struct device *dev = &pdev->dev;
 	struct sp_device *sp = dev_get_drvdata(dev);
 
-	return sp_suspend(sp, state);
+	return sp_suspend(sp);
 }
 
-static int sp_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused sp_pci_resume(struct device *dev)
 {
-	struct device *dev = &pdev->dev;
 	struct sp_device *sp = dev_get_drvdata(dev);
 
 	return sp_resume(sp);
 }
-#endif
 
 #ifdef CONFIG_CRYPTO_DEV_SP_PSP
 static const struct sev_vdata sevv1 = {
@@ -365,15 +361,14 @@ static const struct pci_device_id sp_pci_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, sp_pci_table);
 
+static SIMPLE_DEV_PM_OPS(sp_pci_pm_ops, sp_pci_suspend, sp_pci_resume);
+
 static struct pci_driver sp_pci_driver = {
 	.name = "ccp",
 	.id_table = sp_pci_table,
 	.probe = sp_pci_probe,
 	.remove = sp_pci_remove,
-#ifdef CONFIG_PM
-	.suspend = sp_pci_suspend,
-	.resume = sp_pci_resume,
-#endif
+	.driver.pm = &sp_pci_pm_ops,
 };
 
 int sp_pci_init(void)
diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index 831aac1393a2..9dba52fbee99 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -207,7 +207,7 @@ static int sp_platform_suspend(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct sp_device *sp = dev_get_drvdata(dev);
 
-	return sp_suspend(sp, state);
+	return sp_suspend(sp);
 }
 
 static int sp_platform_resume(struct platform_device *pdev)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
