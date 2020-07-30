Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30476C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 07:04:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB962074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 07:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOQQzFOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB962074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE67286BEF;
	Thu, 30 Jul 2020 07:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YldHK1txdef9; Thu, 30 Jul 2020 07:04:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A94386BE5;
	Thu, 30 Jul 2020 07:04:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D8CEC004F;
	Thu, 30 Jul 2020 07:04:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76FC6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6E0EC86BEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-IQIQNnz0Yg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:04:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E571086BE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:04:27 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u10so3767802plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXvBexhmXWwdwGXIqWzN36mFt5YrbAZ23OVzzeYCCbA=;
 b=aOQQzFOuBQkutQhTqQ79Iwu1RXheX6ZuqcsJnCS6vrOmPX6PvVXjrXQjbMDwoq72ne
 4SfmjEmptCIN4Oqw5zySWPOZKQn5URCC7rKBT+ACNAFoJvU/MaM2x9htHBXq+paDpgmh
 i72IfYp2rUw103zaUOo9bQDrtRQP1MN4yb+vs3frRlGbAt7LYnyQ3p0a/bO1UOinYXv2
 9KB0kY5im8yWPevyvfN2Yf6xpJ6RJJgplZOIsSo0wPJBa7Ck0dEmAmMY8JqK88iSiwgQ
 GeLDzGdwok/4shoHl5jjwS/EiE0PjutDl3KX9MsoAHHR7f+qN+3yp8t6Hd92eV0DC3Ws
 pkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXvBexhmXWwdwGXIqWzN36mFt5YrbAZ23OVzzeYCCbA=;
 b=RXHE4ZROjAX/Pl5Y+AeKp+VtYBoDhKGvSm/6VpzW1slb9hrVY5oZGQZ+vJzmk27X01
 KOME3jHNlOTGXmdMAmLZj8O7SjYerghWNOXiQCPpYSjRzIMVykHLiTDW3mIwGVQwVp2I
 VimZ12ycsUaoIZtMFJhdLdG/odKyozp6AYpMZxBamndGhaRKP8c4hc8ct/Jzrmnl5BYf
 Xz/56BGXd1dkHJVJDWKXIa2cNIfBeDtqocxGwDFDgCSQgTEpd3in2rj6QOOgi0hVJ5TY
 Ceek3Kx3gFaZBTbxolMI3L/c5BIqe6X+oHFmZAyUSHpf3PfIT79aI3tDOzeEQ7GSiqJB
 /dQw==
X-Gm-Message-State: AOAM533I+1ElMe9QtrWDw5oMLmoql1RTbsKfSbKKnR34fKNyY8Wpecjq
 vutWjaGlSMRvhYyrMn4azVs=
X-Google-Smtp-Source: ABdhPJxPsl1UWzGA/JG6VYkYQ955TOzxmbZLj5555QtTnN9rXz+bnwHX2xxFKfHIZyqcNLl2R39P8Q==
X-Received: by 2002:a17:90a:ef17:: with SMTP id
 k23mr1635169pjz.45.1596092667438; 
 Thu, 30 Jul 2020 00:04:27 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id s89sm4327476pjj.28.2020.07.30.00.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 00:04:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Don Brace <don.brace@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Jul 2020 12:32:33 +0530
Message-Id: <20200730070233.221488-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] scsi: smartpqi: use generic power
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
 drivers/scsi/smartpqi/smartpqi_init.c | 42 ++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index cd157f11eb22..dc8567236a23 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -8059,11 +8059,11 @@ static void pqi_process_module_params(void)
 	pqi_process_lockup_action_param();
 }
 
-static __maybe_unused int pqi_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static __maybe_unused int pqi_suspend_late(struct device *dev, pm_message_t state)
 {
 	struct pqi_ctrl_info *ctrl_info;
 
-	ctrl_info = pci_get_drvdata(pci_dev);
+	ctrl_info = dev_get_drvdata(dev);
 
 	pqi_disable_events(ctrl_info);
 	pqi_cancel_update_time_worker(ctrl_info);
@@ -8081,20 +8081,33 @@ static __maybe_unused int pqi_suspend(struct pci_dev *pci_dev, pm_message_t stat
 	if (state.event == PM_EVENT_FREEZE)
 		return 0;
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
-
 	ctrl_info->controller_online = false;
 	ctrl_info->pqi_mode_enabled = false;
 
 	return 0;
 }
 
-static __maybe_unused int pqi_resume(struct pci_dev *pci_dev)
+static __maybe_unused int pqi_suspend(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static __maybe_unused int pqi_hibernate(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static __maybe_unused int pqi_freeze(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_FREEZE);
+}
+
+static __maybe_unused int pqi_resume(struct device *dev)
 {
 	int rc;
 	struct pqi_ctrl_info *ctrl_info;
 
+	struct pci_dev *pci_dev = to_pci_dev(dev);
 	ctrl_info = pci_get_drvdata(pci_dev);
 
 	if (pci_dev->current_state != PCI_D0) {
@@ -8115,9 +8128,6 @@ static __maybe_unused int pqi_resume(struct pci_dev *pci_dev)
 		return 0;
 	}
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	return pqi_ctrl_init_resume(ctrl_info);
 }
 
@@ -8480,16 +8490,22 @@ static const struct pci_device_id pqi_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, pqi_pci_id_table);
 
+static const struct dev_pm_ops pqi_pm_ops = {
+	.suspend = pqi_suspend,
+	.resume = pqi_resume,
+	.freeze = pqi_freeze,
+	.thaw = pqi_resume,
+	.poweroff = pqi_hibernate,
+	.restore = pqi_resume,
+};
+
 static struct pci_driver pqi_pci_driver = {
 	.name = DRIVER_NAME_SHORT,
 	.id_table = pqi_pci_id_table,
 	.probe = pqi_pci_probe,
 	.remove = pqi_pci_remove,
 	.shutdown = pqi_shutdown,
-#if defined(CONFIG_PM)
-	.suspend = pqi_suspend,
-	.resume = pqi_resume,
-#endif
+	.driver.pm = &pqi_pm_ops
 };
 
 static int __init pqi_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
