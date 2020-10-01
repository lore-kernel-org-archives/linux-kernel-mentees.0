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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF22C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AF321707
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTk0Rt4j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AF321707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DE858733D;
	Thu,  1 Oct 2020 12:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kF18kA8Fe9oQ; Thu,  1 Oct 2020 12:32:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A97B987337;
	Thu,  1 Oct 2020 12:32:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98273C0889;
	Thu,  1 Oct 2020 12:32:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2836EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 12EF286C71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxKt7W-oBVkr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE71186C69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n14so4348660pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVl3TCvbBhvJ5acgqRChRsAsShA7j8oIRrpWgA0mKfY=;
 b=OTk0Rt4jglWwZ+yz7PsVtVxG6KxnnckXVtI2Opq7bCjfEwQ5gtjDTxaVrUmOAMTg77
 lM1QfFnGoonQwGuBML+0QKpHkWM9Tx5oiHBxHrKYhliXy2Y9fSZVHDz+GwmVlfX8F9X7
 RXtqSGyQi7kVUut5IfbSV97vZEgNnXq9jjUyYL0ae9ibUv/7OqWh4ruqysGX5S6V8Syj
 yJNvRTuxy5QV4MVbzNkQiLI7byuedKaskDRu6vAS2/unGhLzsfADsp6RmVnC1tY41UV6
 gXt4UTFOFlR8N1/w0hEiM3TTz1DIGewXsc4/xurN3D1dntbsCsIlaqanAI5BHYBMLr2Q
 vXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVl3TCvbBhvJ5acgqRChRsAsShA7j8oIRrpWgA0mKfY=;
 b=Hih7vHsXesHeR9cBAgbjeR8PtVuukvjCcohwKarG/RvTh+QvyT20V1YBI+qy7Zeg9J
 aRsizqaWt5fPxOiOaQDV7C0AZI/tE4NQV7TDT4OQiORHqXZ7k89DVS+cswQT3mgvnCjE
 jnFQGI6xEpjUetkUwumcaZ/hrMw50dulBNDikOscMuSEIucC3N2acMNA5cCrbro9qZTZ
 wu/d0eAp/qPBkSq2AufriHPgD5z7MfShUO41dskKEoBamQoW7mpw/y78DyTzqDhrPVyz
 aRKrur5/uzS/5rDvlsjPgOkkvUvNCSYA5uM7S2ZNsRyzi1COe7TIvDRBRnfR7TSNzVoG
 F0DA==
X-Gm-Message-State: AOAM533HJEiLoueC9ekm2iwymzvYBgO9wrzGfOVA94drZIcNc6PQ2rif
 1OM24XmMfsk6M7wyzv8Yp1o=
X-Google-Smtp-Source: ABdhPJyp/dES1p7s+7zMWL4diu52QUTY16wzfY+9/UX0IZaM5NkaxdbwHIPAKsdOFL6UeptfOPY20A==
X-Received: by 2002:a63:1162:: with SMTP id 34mr5512456pgr.329.1601555540370; 
 Thu, 01 Oct 2020 05:32:20 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:32:19 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:55:09 +0530
Message-Id: <20201001122511.1075420-27-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 26/28] scsi: mvumi: update
	function description
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

There is no "device" parameter in mvumi_shutdown(). Instead there is
"pdev" which is not described.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/mvumi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 6c710585a628..82dd7c37c14e 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -2558,7 +2558,7 @@ static void mvumi_detach_one(struct pci_dev *pdev)
 
 /**
  * mvumi_shutdown -	Shutdown entry point
- * @device:		Generic device structure
+ * @pdev:		PCI device structure
  */
 static void mvumi_shutdown(struct pci_dev *pdev)
 {
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
