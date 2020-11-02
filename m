Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224FEC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:51:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D41D22277
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJYWDgNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D41D22277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24E2086A6F;
	Mon,  2 Nov 2020 16:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djVsf4scbS1U; Mon,  2 Nov 2020 16:51:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C471B86957;
	Mon,  2 Nov 2020 16:51:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3337C088B;
	Mon,  2 Nov 2020 16:51:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 388ACC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 33B2E87149
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhU5ypmxS+Te
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D31A587103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u2so1157655pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cErhV76ENt4TSg24Fp7Ht7DEbiQDvH5TWJw2QAVKIhM=;
 b=nJYWDgNOZZtlxDlK5ueJ/5vxhAzGVJPLWbe9fkSlizduzmFLoZH0zqf9t3kk2HuA8U
 lE6tc3WYq/hvTZ0O/dieS6Q0bsdb+ZwDKBi/WGF+MNjDOGgMOOwl9I9+wvij52X2KOd+
 A0IfARUHoB8llo6o4QJGAa3UBP3gx5Ug2qQLazIjl9u7OejBgmdVtGzum+CTl/qIPohd
 vzbAFqVqxo9zbrtVnZ6LWqiAOk0nN93L8q48Eg1TSmA+c6G2URYTrBZxj+k7FnkjHTkB
 VKsFmh+7Foh3Owu1wa0QQ9xbX8EmHldsQpndxjyfW4Ou2OWc3Uwh/ljhBDnfv/MiEC+i
 DGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cErhV76ENt4TSg24Fp7Ht7DEbiQDvH5TWJw2QAVKIhM=;
 b=aa7PnRZzXyMI5sN8iRFhqHkBR8e+QEkjGZccKQcF4Ai42QPnMLPUcMkCLVNd0KEBlD
 PAg+PSnf/TNRiBdzUoZJRj4z9k82pZs8kByLLKKc1vLK+pfwuIRVLxEuCFNuJMEVsRqq
 vBsDfFpsliU8Ld+4bpS25a+pSDQcOWfVFXzJdf2750/u8P2JUfYAP+ONPdzOT7vpKLlW
 TvIvXNV3UohizTqSio4S6ON4hv05h8UinibPdZ0spymk/jxK+b2sNmR2UEukx4mrhCBV
 i0Q3GaC9j9n2/wfk5ZUdKQWLjMTYTxpeHdad7LTVWmpw1WyKzhbZjdGtev4Ci4grlj8X
 tp7g==
X-Gm-Message-State: AOAM530U35MIA5Ebu6t8FcKRcaA/WDlz+fdDoDLKzlifKt3U6Im+BfZE
 kOkruGUrlS6N5Kq2aJbs1iM=
X-Google-Smtp-Source: ABdhPJwp05t7yRIHJ8huQ7eLUfoMgxcmBsNLB9C02JBi8y2dAFVcKApcplQEaIPahN07b26OqEY6+Q==
X-Received: by 2002:a17:902:bb81:b029:d5:b437:edb4 with SMTP id
 m1-20020a170902bb81b02900d5b437edb4mr21167595pls.6.1604335861454; 
 Mon, 02 Nov 2020 08:51:01 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:51:00 -0800 (PST)
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
 Xiang Chen <chenxiang66@hisilicon.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Balsundar P <balsundar.p@microchip.com>
Date: Mon,  2 Nov 2020 22:17:05 +0530
Message-Id: <20201102164730.324035-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 04/29] scsi: aacraid: Drop
	pci_enable_wake() from .resume
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

The driver calls pci_enable_wake(...., false) in aac_resume(), and there is
no corresponding pci_enable_wake(...., true) in aac_suspend(). Either it
should do enable-wake the device in .suspend() or should not invoke
pci_enable_wake() at all.

Concluding that this is a bug and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
aac_resume().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/aacraid/linit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
index 8f3772480582..8c4dcb5ab329 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -1938,7 +1938,6 @@ static int aac_resume(struct pci_dev *pdev)
 	int r;
 
 	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
 	pci_restore_state(pdev);
 	r = pci_enable_device(pdev);
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
