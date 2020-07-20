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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E86C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 11:19:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AE62073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 11:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vGwRVlJY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AE62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 430E787E09;
	Mon, 20 Jul 2020 11:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2j6D2vyfc8NM; Mon, 20 Jul 2020 11:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A89F887DDE;
	Mon, 20 Jul 2020 11:19:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91B9FC089F;
	Mon, 20 Jul 2020 11:19:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56537C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C5B185DD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwGoc-rfRDMF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C687585DD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:19:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t6so10158037pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQcPpyKkBRFTuRsPf+ykezWbH+/TBAg6hCF+bTAYfaw=;
 b=vGwRVlJYh/AkVuaVINdy2mII6b60uD6MxHKaz7apKM6SE9oYrrZfXXA1+wMSO8rJ9Y
 +MTP0iLrtxuaBOsgT+HR2IhaTh1AENAP3HXWyBCnrU8n3XybFx+maS3OAdOfnuVRZ/PQ
 3CVK0VdnK9kjh5ALFY9FrjJ9TfNmqy8xmIR2gNuo7tzJzMeFxN6xhXXDxEOrvM7YFCWr
 TS1DdViCkdydRL+LNznFhhE5waojifM4ArckLLcAZTQma8x1tU6dAQyuJbuxzWObEIre
 Jlfez5qNUyD1re8ixlxbm7onNk4mYNEVI2ZPHtK+Q9SidLTdx2NcZpTdLAi6Q8OugPZC
 W4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQcPpyKkBRFTuRsPf+ykezWbH+/TBAg6hCF+bTAYfaw=;
 b=d+YlhC+DJpuAos5wA/7yVX/eFED5mNIWM5pEJqShUoQLW0pn1cs8wp+z+rwZ1ymOgk
 VpROqapwbwJq3MI+8xL8XJFf3laOXTuPKqLU+IlDhvoY1yRx6kJYebeyHdTLZjM0K0IZ
 fps6ng04lqZCkmlz7EyuMUNwr8Qkk7Q8BPYmPXdh1F0zdDfbfGD7WIm/kKix/pWLH7g6
 WcD3RTxDO1/t7D6x+afPsPIdpWbPa7lxk4zHCP8DJY5XomUfnp3zMOSuZEGsg+JLnkOA
 sW3wo7SqXTdMeSg5lNBv81p7pJG1fo8t/pRVzxc4apKNELxV5C2xQrezcmxG5oDSstrx
 qn/A==
X-Gm-Message-State: AOAM5321ePUpYFAi5qy6h8vR6xjyZhp9lCnI97GmRALzTNRrK653SycD
 1088F3Q5tY0+VxZTXx2MI0M=
X-Google-Smtp-Source: ABdhPJzXMEzFnor2PkcqpQ5qGc99WVqg/PKRsVfkIsJUnsbfgaUljhA3N4EOJlKHIhH3SeYxQI315Q==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr18278554pfr.64.1595243965196; 
 Mon, 20 Jul 2020 04:19:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id o4sm11998630pjo.16.2020.07.20.04.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 04:19:24 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Jul 2020 16:46:26 +0530
Message-Id: <20200720111625.306681-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-mmc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] memstick: jmb38x_ms: use generic
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
pci_save/restore_state(), pci_enable/disable_device(),
pci_set_power_state() and pci_set_master() to do required operations. In
generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
"struct pci_dev*" variable and drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/memstick/host/jmb38x_ms.c | 38 +++++++++----------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index 0a9c5ddf2f59..2aa9592917d9 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -793,11 +793,10 @@ static int jmb38x_ms_pmos(struct pci_dev *pdev, int flag)
         return 0;
 }
 
-#ifdef CONFIG_PM
-
-static int jmb38x_ms_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused jmb38x_ms_suspend(struct device *dev)
 {
-	struct jmb38x_ms *jm = pci_get_drvdata(dev);
+	struct jmb38x_ms *jm = dev_get_drvdata(dev);
+
 	int cnt;
 
 	for (cnt = 0; cnt < jm->host_cnt; ++cnt) {
@@ -806,26 +805,17 @@ static int jmb38x_ms_suspend(struct pci_dev *dev, pm_message_t state)
 		memstick_suspend_host(jm->hosts[cnt]);
 	}
 
-	pci_save_state(dev);
-	pci_enable_wake(dev, pci_choose_state(dev, state), 0);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
+	device_wakeup_disable(dev);
+
 	return 0;
 }
 
-static int jmb38x_ms_resume(struct pci_dev *dev)
+static int __maybe_unused jmb38x_ms_resume(struct device *dev)
 {
-	struct jmb38x_ms *jm = pci_get_drvdata(dev);
+	struct jmb38x_ms *jm = dev_get_drvdata(dev);
 	int rc;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	rc = pci_enable_device(dev);
-	if (rc)
-		return rc;
-	pci_set_master(dev);
-
-	jmb38x_ms_pmos(dev, 1);
+	jmb38x_ms_pmos(to_pci_dev(dev), 1);
 
 	for (rc = 0; rc < jm->host_cnt; ++rc) {
 		if (!jm->hosts[rc])
@@ -837,13 +827,6 @@ static int jmb38x_ms_resume(struct pci_dev *dev)
 	return 0;
 }
 
-#else
-
-#define jmb38x_ms_suspend NULL
-#define jmb38x_ms_resume NULL
-
-#endif /* CONFIG_PM */
-
 static int jmb38x_ms_count_slots(struct pci_dev *pdev)
 {
 	int cnt, rc = 0;
@@ -1030,13 +1013,14 @@ static struct pci_device_id jmb38x_ms_id_tbl [] = {
 	{ }
 };
 
+static SIMPLE_DEV_PM_OPS(jmb38x_ms_pm_ops, jmb38x_ms_suspend, jmb38x_ms_resume);
+
 static struct pci_driver jmb38x_ms_driver = {
 	.name = DRIVER_NAME,
 	.id_table = jmb38x_ms_id_tbl,
 	.probe = jmb38x_ms_probe,
 	.remove = jmb38x_ms_remove,
-	.suspend = jmb38x_ms_suspend,
-	.resume = jmb38x_ms_resume
+	.driver.pm = &jmb38x_ms_pm_ops,
 };
 
 module_pci_driver(jmb38x_ms_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
