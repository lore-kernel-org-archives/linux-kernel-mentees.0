Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02D2C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A93207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCuFcZ89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A93207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3F3F8867F;
	Wed, 22 Jul 2020 08:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVdYwPrv4jIT; Wed, 22 Jul 2020 08:35:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28FD488615;
	Wed, 22 Jul 2020 08:35:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 142D2C004E;
	Wed, 22 Jul 2020 08:35:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96F32C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7C389203EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2U7w+En4FMi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id BB735203D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:14 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m22so811757pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 01:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpj8809C+sM2nooGQLQ3iMt8QMJk//10RMuL0DlWSoY=;
 b=lCuFcZ89wu3kx/HDgLnV34IcRrMlG7aDlTeDCogo1z+xJsDs6Wt3gHYAmUYLYYymwz
 LbLT/kvUpr2yAcLgIEGCL/KerGqeLpgBZR3R1d2KVCVSlW5fWfJ3k2DjDFSuq59FnBwU
 fydm/2wJOR81lNZC9ELNZ0L+wXxNlHT844vsA+G8wx1Sg8lFAL+D8ZOMt5e54apigXjb
 GMgKzTjhtwqDsraa5gfConSamFiiH3C/6E6IlPfxtSlYlo9csKJp0N7vOoo8kVFvaXQ1
 /ftjKgH/9S5av/7nSOg1+oG++dP7z0CGduYc71fE3XZAHajBt8yVJtGHOx0EEIzyokKN
 vocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpj8809C+sM2nooGQLQ3iMt8QMJk//10RMuL0DlWSoY=;
 b=Ghpt0bD8+ChBwK3DotlnyjJNjebl92fPkdIsMu8d1aSyxlt/4LYkk9Ds8KL1ztpu01
 SFxEYpX4Pp8F2gWc7wYXv4UolKhLjz6iYElQuQgUFiIqYiQqYVFYhVmwIZWxxTOEqYA/
 yDmzek1A8kHnHIij7SljxsXlum41iO6rBlYjTL25OXDFC1fk2xFHQnYlae1FZJMwC05S
 Ct8JvB910ShgXM5uOm/IdKyEYfDUJKMn0g5+GDPNKsJpzNZnRIzwXPYddIitIN/hR0yc
 6XIr4Y19KmDzzQABqh2nUcgzvGB5wQtH1DN2T8+gGwJ0NY25dQiJfy2t8iwp/gme49rv
 EZwA==
X-Gm-Message-State: AOAM532n2VteZKbY/znEkGiFe+3KPFfaYETcSBiqh4dceoNLhLbSnHuR
 vje/qAflRZHltEfW15ZzKhQ=
X-Google-Smtp-Source: ABdhPJx65JiqSe4jtWXtltTFaph81bwxLCBhoqEguFtl6wLw3r0pC4e4SP9leSx6uipZWkdMYfW2pQ==
X-Received: by 2002:a62:347:: with SMTP id 68mr26799465pfd.185.1595406914260; 
 Wed, 22 Jul 2020 01:35:14 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id g13sm5777319pje.29.2020.07.22.01.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 01:35:13 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 22 Jul 2020 14:03:34 +0530
Message-Id: <20200722083335.50068-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
References: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
 <20200722083335.50068-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 2/3] rsxx: use generic power
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
 drivers/block/rsxx/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 10f6368117d8..866153fd380a 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -1030,12 +1030,15 @@ static void rsxx_pci_remove(struct pci_dev *dev)
 	kfree(card);
 }
 
-static int rsxx_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused rsxx_pci_suspend(
+	__attribute__((unused)) struct device *dev)
 {
 	/* We don't support suspend at this time. */
 	return -ENOSYS;
 }
 
+#define rsxx_pci_resume NULL
+
 static void rsxx_pci_shutdown(struct pci_dev *dev)
 {
 	struct rsxx_cardinfo *card = pci_get_drvdata(dev);
@@ -1071,12 +1074,14 @@ static const struct pci_device_id rsxx_pci_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, rsxx_pci_ids);
 
+static SIMPLE_DEV_PM_OPS(rsxx_pci_pm_ops, rsxx_pci_suspend, rsxx_pci_resume);
+
 static struct pci_driver rsxx_pci_driver = {
 	.name		= DRIVER_NAME,
 	.id_table	= rsxx_pci_ids,
 	.probe		= rsxx_pci_probe,
 	.remove		= rsxx_pci_remove,
-	.suspend	= rsxx_pci_suspend,
+	.driver.pm	= &rsxx_pci_pm_ops,
 	.shutdown	= rsxx_pci_shutdown,
 	.err_handler    = &rsxx_err_handler,
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
