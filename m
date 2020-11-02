Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CD3C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B9822268
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EInGRm6c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B9822268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C8B86204D0;
	Mon,  2 Nov 2020 16:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diqjOkHq2x2n; Mon,  2 Nov 2020 16:52:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6CF412010F;
	Mon,  2 Nov 2020 16:52:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B762C088B;
	Mon,  2 Nov 2020 16:52:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8ACBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A5F19869F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9OzHT1ud8Hs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 46C7A86957
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:26 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id r10so7113184plx.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80Yi1XLQzKPeoqRYuchuEzVl/P6+59b0kyvSplkNuqw=;
 b=EInGRm6cBk43ZkBUefE+Lxc1nMZ8wuWhwjNtsLaYAjJkkpXaroUIq/Ir/9rRIReZTa
 TX9Syn6BVfq83IPRQ7ykGpcDSU2omjDUI3aFWdcpcTOE4zk4dSfSsjJxRXA/HxRfwRnq
 ItPVjw8aiAUDrYudk7Kq3o9fsSpGJ085X8SNop1TA56COWuz2G5PaKpEdELT/3brT2Re
 Z3KSEtx+XzcTXvGNXhcZFGfzpg1EJVAyhG85b4saGFxQuf05Tf97gMtSJAW5Cf0q6pit
 ImNpcFHlfvOWYNqWyTpk9PqZ2elCuC7uo5nkhF6uYvOiCQO/H1luHZ5Su0VVC1HGsZPR
 VbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80Yi1XLQzKPeoqRYuchuEzVl/P6+59b0kyvSplkNuqw=;
 b=mEsaSVDflUjOrCy2a4DtWbVy3fZXYk/Is1YoPnrJVnLzhCf8WcSY3BHpfpXPlGbuM+
 +jaWu/DOyxv9wJ1D+viEzvZ66iZ/Tgwd4ytOft7gUn+8st0PqXltGoneTwkdwgPOL7mk
 bpgBkV7LbeIinKIgNQ78pguilHOmyhpSsMPB+W6uNM/aFNOpMHSiifPgNMDyzHsdL/fg
 hm70Gy69erD6CefGurNz6OWS1m75LLSyUWk2UX5wVqBMPRoogli+H5SBYJUkUOx6oKj7
 ej3fIMxlxiEy1/WWyij+fnH/YnMsJAhc0TzztRsV6Fvcc0ibWRbUVH2JOXf+Zq51zfan
 Hb4A==
X-Gm-Message-State: AOAM532HQ/tom+ZcARKRO8CeHBH4KL/2x2SBWIpcluc8l34KjRBH2kos
 XRBMuH6w5LoMVF2PKWmhiT0=
X-Google-Smtp-Source: ABdhPJwWscqt8CM6V8MAKcDq8ZXDB9lxb+Wc/XDRC0YTbVpR2R6o45JcQIqTodOCmknuT+Pb9bX4UA==
X-Received: by 2002:a17:902:bb81:b029:d5:b437:edb4 with SMTP id
 m1-20020a170902bb81b02900d5b437edb4mr21171215pls.6.1604335945887; 
 Mon, 02 Nov 2020 08:52:25 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:52:25 -0800 (PST)
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
Date: Mon,  2 Nov 2020 22:17:11 +0530
Message-Id: <20201102164730.324035-11-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 10/29] scsi: esas2r: Drop PCI
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

The driver calls pci_enable_wake(...., false) in esas2r_resume(), and
there is no corresponding pci_enable_wake(...., true) in esas2r_suspend().
Either it should do enable-wake the device in .suspend() or should not
invoke pci_enable_wake() at all.

Concluding that this driver doesn't support enable-wake and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
esas2r_resume().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/esas2r/esas2r_init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_init.c
index 09c5c24bf391..905a6c874789 100644
--- a/drivers/scsi/esas2r/esas2r_init.c
+++ b/drivers/scsi/esas2r/esas2r_init.c
@@ -676,10 +676,6 @@ int esas2r_resume(struct pci_dev *pdev)
 		       "pci_set_power_state(PCI_D0) "
 		       "called");
 	pci_set_power_state(pdev, PCI_D0);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_enable_wake(PCI_D0, 0) "
-		       "called");
-	pci_enable_wake(pdev, PCI_D0, 0);
 	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
 		       "pci_restore_state() called");
 	pci_restore_state(pdev);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
