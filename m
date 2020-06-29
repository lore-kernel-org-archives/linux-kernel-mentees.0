Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D91AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E40255CB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0fJ45Lc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E40255CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3614B88735;
	Mon, 29 Jun 2020 17:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuM+PSNEt6Q8; Mon, 29 Jun 2020 17:36:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A34D086354;
	Mon, 29 Jun 2020 17:36:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DFDAC07FF;
	Mon, 29 Jun 2020 17:36:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 806C3C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 703E18746E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bK54KhUPqdXS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1084487446
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 67so4123230pfg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fKzFmJ6swEgieVUVWwiawhKzRLACyYFxC8XDxv8xYs=;
 b=R0fJ45LcAzqMEfB6noKVYodLWFah632V2+qcF0G9d0sHUN7n7MwsjReJlbHyOxFAgQ
 Pyqf1TrIb5+jNNbE7Gu2zh7Pev/OIpQYVhr0G06pAc4EvZ3QZti8JaDPPh9JprJ6lqM7
 tqLA5emrcXMH/+DvgiCyb8A/ClsuRUzKMnIbaTWBxp5GGslGGiGr9HKCHUy1PbvqS24j
 60bvSOJ0Nj3W6JRhbdP6caRjgWiAIuXtyAUuqOPa4jCa9O05I1sFDK5lLIaDCRcZodQs
 B0eEZH4anwaspISF1wAL0KJ23fKcs6Ri+fuakGDCBPHZtFTJikMOeCKnC+N8ARzFsldc
 kSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fKzFmJ6swEgieVUVWwiawhKzRLACyYFxC8XDxv8xYs=;
 b=W1YkoRKXKvkRKdxcUNMYx8DlMs/TD3GU7KB0mQxB3VvjgOAOcIkMGTURRXPJyYqLTo
 vpjgL+SRZHWF1fUwWEDFk7lGu5AYxKBOpuZcsMSkZgxMZlPuHEsYERiKvlj0gNRAWdG+
 F7vcsmdCGcB/fdLjJSfWHKIXxsbCvXlVtTJdQVV8wp2jJy738TRf44uGeallbQasiAF1
 MRZKUKbW6D5wDNeVQi4vEz6QWe4MztoI76UY3ykOiRNGlJnmfbu70hDEXgMJCop61VFy
 Uq1TcbYM0Yws9E2zEuf17mvtDUg0y5eWpSEuUgVRMO2KcDc0npDed3QEo18/GWsCdgob
 FelQ==
X-Gm-Message-State: AOAM532HHiCrkwjr7m+/6RTFJsPOKiUrcHNJyeQdO8inxrT/lhzQHmja
 BghIuJsjjYl91NagQPw9YUs=
X-Google-Smtp-Source: ABdhPJzX3W9pUE3rQzyWQqNZmLpVSpw6IGMNuc9exvw210citymSwYDDB32iKOYKjCaB5XfOf1cKHw==
X-Received: by 2002:a63:4915:: with SMTP id w21mr5651899pga.134.1593452196587; 
 Mon, 29 Jun 2020 10:36:36 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id k23sm331461pgb.92.2020.06.29.10.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:36:36 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 23:04:59 +0530
Message-Id: <20200629173459.262075-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629173459.262075-1-vaibhavgupta40@gmail.com>
References: <20200629173459.262075-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/4] vt6655/device_main.c: use
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

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

The driver was also using pci_enable_wake(...,..., 0) to disable wake. Use
device_wakeup_disable() instead.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 41cbec4134b0..76de1fd568eb 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1766,48 +1766,37 @@ vt6655_probe(struct pci_dev *pcid, const struct pci_device_id *ent)
 
 /*------------------------------------------------------------------*/
 
-#ifdef CONFIG_PM
-static int vt6655_suspend(struct pci_dev *pcid, pm_message_t state)
+static int __maybe_unused vt6655_suspend(struct device *dev_d)
 {
-	struct vnt_private *priv = pci_get_drvdata(pcid);
+	struct vnt_private *priv = dev_get_drvdata(dev_d);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pci_save_state(pcid);
-
 	MACbShutdown(priv);
 
-	pci_disable_device(pcid);
-
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	pci_set_power_state(pcid, pci_choose_state(pcid, state));
-
 	return 0;
 }
 
-static int vt6655_resume(struct pci_dev *pcid)
+static int __maybe_unused vt6655_resume(struct device *dev_d)
 {
-	pci_set_power_state(pcid, PCI_D0);
-	pci_enable_wake(pcid, PCI_D0, 0);
-	pci_restore_state(pcid);
+	device_wakeup_disable(dev_d);
 
 	return 0;
 }
-#endif
 
 MODULE_DEVICE_TABLE(pci, vt6655_pci_id_table);
 
+static SIMPLE_DEV_PM_OPS(vt6655_pm_ops, vt6655_suspend, vt6655_resume);
+
 static struct pci_driver device_driver = {
 	.name = DEVICE_NAME,
 	.id_table = vt6655_pci_id_table,
 	.probe = vt6655_probe,
 	.remove = vt6655_remove,
-#ifdef CONFIG_PM
-	.suspend = vt6655_suspend,
-	.resume = vt6655_resume,
-#endif
+	.driver.pm = &vt6655_pm_ops,
 };
 
 module_pci_driver(device_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
