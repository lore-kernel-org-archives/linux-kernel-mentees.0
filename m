Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5D4C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD92520704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBLuGtTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD92520704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93D34861AA;
	Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okTAZuUMpO9d; Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36EEF861AF;
	Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25FE8C07FF;
	Fri, 17 Jul 2020 06:38:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0827C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD09E861AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzYSuL-4E1IE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:38:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D012861AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:38:15 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k5so5025370plk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 23:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uomQmJlWIjhkvxxLfQSyf1nH+prda88V/9IK/Q2lWjA=;
 b=JBLuGtTdxjZN44nn8hqq9uObIgSW8ePzEtt2BchSVq5K89r2ocBNQQ4lyftpFa6Znh
 z2EaOxTXhHRJWw74+Y2GDLelylLXzQ4aV8m1UAiwMg55kmJWWVA0/LIlCuh5IlgtEJJR
 +DdsHSUMq7IWHGQMnKz1CuE4wR/zMyJuPkHtLd59qwt/ANkVLF3XYyz4x+pt3OnuwY8y
 HROdBToaH6y7y459VaBuusuqp4J6i6bvH0+XFbW2cA0HuS5cX0SeNosRUH6MBAVQZ6HL
 PSMU3OdnvVR2vJg4wC9uOI2qBN9WSO+rxpORmmwFWJNZRVfHr3wA6T/y3D5ninKaWReF
 4z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uomQmJlWIjhkvxxLfQSyf1nH+prda88V/9IK/Q2lWjA=;
 b=SSkS9NaGFtV/M0Do/RdfofBD9JgNDFAz/A0CQw9yszQzRazRY030Rf8AWAH30JoQiP
 PuULpxOODm5WZdXTrEGsyhNXofxRi/ASJAmw3z2krI95FuxtY7EurQRqjClnIPmaz8RQ
 n6PDN9+A5uSOcWsScQeIQ3IN4DuAPcmisOkZcl/9qYbWcxRjalonZVs//ISde2HgK02w
 lsGQSyziPxMUbrT+v8U+Cbil9jcFPnNmxTLhY6b/YJVLqoDOt53Z3ux7l23ta2p7HBBE
 RG41wqaW/1wKP1WkFqwTtsDpdQxI7hJVxXh0r0NOrYt0tW1Cu/6Iux9Y3t3gbliS1wk0
 ckQA==
X-Gm-Message-State: AOAM531A77m5v1kfW3GI3iKXhR8W4EEV9ZvFAbL+MPFGaWkn2WT11GxN
 hYQBo665Cw1S19MbfS7lhqY=
X-Google-Smtp-Source: ABdhPJykm4YgWd/rhDqDF2Ed98NUBkQNZb1lyQEz5xlLAVPJsuK5akLSYw/a3TjF41bmlHVzvXkXmQ==
X-Received: by 2002:a17:902:6901:: with SMTP id
 j1mr6316230plk.203.1594967894876; 
 Thu, 16 Jul 2020 23:38:14 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y22sm1683392pjp.41.2020.07.16.23.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 23:38:14 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Adam Radford <aradford@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 John Garry <john.garry@huawei.com>, Don Brace <don.brace@microsemi.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 17 Jul 2020 12:04:34 +0530
Message-Id: <20200717063438.175022-12-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v1 11/15] scsi: hpsa: use generic
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

Change function parameter in both .suspend() and .resume() to
"struct device*" type. The function body remains unchanged as it was empty.
Also, bind callbacks with "static const struct dev_pm_ops" variable.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/hpsa.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
index 81d0414e2117..70bdd6fe91ee 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -9070,25 +9070,27 @@ static void hpsa_remove_one(struct pci_dev *pdev)
 	hpda_free_ctlr_info(h);				/* init_one 1 */
 }
 
-static int hpsa_suspend(__attribute__((unused)) struct pci_dev *pdev,
-	__attribute__((unused)) pm_message_t state)
+static int __maybe_unused hpsa_suspend(
+	__attribute__((unused)) struct device *dev)
 {
 	return -ENOSYS;
 }
 
-static int hpsa_resume(__attribute__((unused)) struct pci_dev *pdev)
+static int __maybe_unused hpsa_resume
+	(__attribute__((unused)) struct device *dev)
 {
 	return -ENOSYS;
 }
 
+static SIMPLE_DEV_PM_OPS(hpsa_pm_ops, hpsa_suspend, hpsa_resume);
+
 static struct pci_driver hpsa_pci_driver = {
 	.name = HPSA,
 	.probe = hpsa_init_one,
 	.remove = hpsa_remove_one,
 	.id_table = hpsa_pci_device_id,	/* id_table */
 	.shutdown = hpsa_shutdown,
-	.suspend = hpsa_suspend,
-	.resume = hpsa_resume,
+	.driver.pm = &hpsa_pm_ops,
 };
 
 /* Fill in bucket_map[], given nsgs (the max number of
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
