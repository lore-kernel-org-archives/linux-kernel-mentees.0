Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79387C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:29:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2600621481
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRsd2Wno"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2600621481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C5E7C2048F;
	Thu,  1 Oct 2020 12:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRP055U5sQEM; Thu,  1 Oct 2020 12:29:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B4D2E20497;
	Thu,  1 Oct 2020 12:29:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1FB0C0889;
	Thu,  1 Oct 2020 12:29:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47972C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3449086B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-7KoB_GDcmj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:29:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D46D5869E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:29:07 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gm14so1890872pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFScM+arNxRtQeZvbbAHYBWlDLtA4fLReR+nPVgLlBM=;
 b=MRsd2WnoH84TSpfdS0xsAvvPKUvk+hWZ2jQyWrlHyJno4rRc/WvqtEJNAREGXx8lpc
 /aCIT/eymCmbHgVRPLsgUxGj6G8VePygO3I9hpnIBR++cdiovm6tHtXu+JXXLlKCL0xX
 mdPMbym0b+f4+UI7k89TE1GdFB57FAS9jxNNZ6KjQNV/tGEIItv9SeVBRVP13Jqwkunq
 kaEVvQVpvesS6iUFLdoLZzp+PWvlHcKTl8HXXadHCnqSUZFd2BgdSS0lpha9Er/EIFkk
 KGhmBW6jFGZ+srVHjpVRZBT3KuUsqIZ3x5TmeSFQrxPePp5t7lYj2SFjXJPncs34uTlD
 +Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFScM+arNxRtQeZvbbAHYBWlDLtA4fLReR+nPVgLlBM=;
 b=Ce1/55UjpJabWQ7ocLa7aAwY7e42Bpy/rJlsdv9dpQVzLn4nrunrTcnD9gESZTWFTJ
 uOLDWZH1ST3n8bfGue3wxjxC/LkpRe+NG4VCjZpOfUB08N+DTAPcoHjLGeP85FfRp+vZ
 FRMueEgAJjB3YBI77Z7LgBE/qJP/6aqf7fis3iR2xSWK4vAQXUnT6f7JLOKteq2CJI66
 e35+/I5tZF1RaIaW4yRzwEciz3uKEols/ifZ9mPbHdFRN9wOAlf6uDJcsWnc+9B9TOcE
 d4n/iImvpMjoz+T0hpaJwKyTSkEd0C+vmpLqKP8NTDICslmcmBmNJbM4iGesw148Xqfz
 ePlg==
X-Gm-Message-State: AOAM531K6mOBOzq318FlqgbGTRctoWO4UCMkBEXMCj6dCouCvAODWDr6
 m97yH+YcdMf0vnG7XoDJxxs=
X-Google-Smtp-Source: ABdhPJwQJMPHi93RFnwt6p0B1nWePCTdTn//Wk9AHwIXspt4V69jOm3D2hO/uhuP3PPE6FF1Js5Dgw==
X-Received: by 2002:a17:90a:bd0e:: with SMTP id
 y14mr6924794pjr.58.1601555347469; 
 Thu, 01 Oct 2020 05:29:07 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:29:07 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Adam Radford <aradford@gmail.com>,
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
 Jack Wang <jinpu.wang@cloud.ionos.com>
Date: Thu,  1 Oct 2020 17:54:51 +0530
Message-Id: <20201001122511.1075420-9-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 08/28] scsi: arcmsr: Drop PCI
	wakeup calls from .resume
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

The driver calls pci_enable_wake(...., false) in arcmsr_resume(), and
there is no corresponding pci_enable_wake(...., true) in arcmsr_suspend().
Either it should do enable-wake the device in .suspend() or should not
invoke pci_enable_wake() at all.

Concluding that this driver doesn't support enable-wake and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
arcmsr_resume().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 30914c8f29cc..6ed2ad10bede 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1094,7 +1094,6 @@ static int arcmsr_resume(struct pci_dev *pdev)
 		(struct AdapterControlBlock *)host->hostdata;
 
 	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
 	pci_restore_state(pdev);
 	if (pci_enable_device(pdev)) {
 		pr_warn("%s: pci_enable_device error\n", __func__);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
