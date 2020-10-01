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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D27C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B83CC2087D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgY1fPrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B83CC2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 718AC86C7C;
	Thu,  1 Oct 2020 12:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jsp4_rrPnNmg; Thu,  1 Oct 2020 12:32:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 72AE686C69;
	Thu,  1 Oct 2020 12:32:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E999C0889;
	Thu,  1 Oct 2020 12:32:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79DFEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68B8F86C71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80WVXPHtTZGa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1A7AD86C69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g29so3948254pgl.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MM5wiFpgdT4mwRJ2jTZ+VkorPqMhISLnhdlnmMc63Y=;
 b=sgY1fPrx0IIEz/mOq8kxGdUETanyglSMjkCnSF4mTv/pLvw8tyO5Cwpb2sLVYF1Oz1
 9m2TR79x+fC9Q9GSgfU15LGIGsiOikZGA7o//JJgcQwToPC4Z12sE1zKJal7nFk3k8UZ
 AEOYH5VoltYZa6p0fSG+GVeja3IiLnbCo9be2TA1gkiF1wbKQ/8PJAGDtYIuDEdoPoo5
 KebSd/18DSUIzKJDl7xqS4rggtobe+tSXTD8zwB+iRhPrpAhbHVRMiUXSepvRlEoieNA
 la7rbpdYHXAZNSiDEvu6yBb+9lMdZD4LPofEZqCyseas6wHIb0EetnR3VWLfO5p4kT5S
 0SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MM5wiFpgdT4mwRJ2jTZ+VkorPqMhISLnhdlnmMc63Y=;
 b=QvYrodY0SQzKUHjcrFn3vOFLuiJqTaecsESBDD/taDEYwAlGKbHhw8oQ+rrAGNPTlH
 OMzDU+pOM1OEt2cF3rq9EZ8h1dlRTEeY8S9kPz6Ke1qHsLjOENP/8tWnJy3BL3OA59AG
 zJS/EAmna0g7+b3U3iV+Zmnv3q8/0XUVPLYqCUVlWNT8cl4eMxyozOmMJHTajzY7COQ7
 WUs+xdboiDdjTZB/Ls0N1+nHsuZe9jhXVXjGrDPtc8/sp8pVGNNi/YkGrFuf9LKF4Etv
 JBF80/odCSX4zfIoZfb8AZcTqvr5Vh34YLcF33ALIuVVRSxlujmnO1Pq5xa0FLM6PHma
 b3Ow==
X-Gm-Message-State: AOAM533bOTX5wNU3knJezr9rJrimU3MlVMxZkeffIaZok1IXtWMzOzkv
 Pdg00ak4HpGITYB7EO0XCZ8mIJY4OlAVouZt
X-Google-Smtp-Source: ABdhPJzfLjOv1Um6n+JXmHxhDleig+gqaBsH2YdlboNeT6atbMUqJdrMFxbom5GiSdgteIOYOIsH3A==
X-Received: by 2002:a62:be0a:0:b029:142:2501:35de with SMTP id
 l10-20020a62be0a0000b0290142250135demr7404486pff.62.1601555520655; 
 Thu, 01 Oct 2020 05:32:00 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:32:00 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:55:07 +0530
Message-Id: <20201001122511.1075420-25-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 24/28] scsi: mvumi: Drop PCI
	Wakeup calls from .resume
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

The driver calls pci_enable_wake(...., false) in mvumi_resume(), and
there is no corresponding pci_enable_wake(...., true) in mvumi_suspend().
Either it should do enable-wake the device in .suspend() or should not
invoke pci_enable_wake() at all.

Concluding that this driver doesn't support enable-wake and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
mvumi_resume().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/mvumi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 8906aceda4c4..6a25e6918e26 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -2594,7 +2594,6 @@ static int __maybe_unused mvumi_resume(struct pci_dev *pdev)
 	mhba = pci_get_drvdata(pdev);
 
 	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
 	pci_restore_state(pdev);
 
 	ret = pci_enable_device(pdev);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
