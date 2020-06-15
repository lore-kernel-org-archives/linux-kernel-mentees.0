Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F1FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5396620738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcFzzO7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5396620738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38C41886F8;
	Mon, 15 Jun 2020 08:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H16AZD-VpVVI; Mon, 15 Jun 2020 08:32:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC6BC88111;
	Mon, 15 Jun 2020 08:32:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7AD7C0888;
	Mon, 15 Jun 2020 08:32:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA39C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7BB2C889AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoDcIWEUjOWx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C4BE8898B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j198so13566099wmj.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=molslPGG/aVq7Tfl0f7ZnD8L5065Z3YOyyGkcmzBtPg=;
 b=mcFzzO7Pllm4E56KkbBug35zu55xy4h9QMjx4nGIEedTIsThHAkIZxHdXpzMw25o/x
 gmU8d7ik0iCbkoGpssPVodzU2ZARBf/zwQANvWVcZAYRaA5FuNqYlqCoLRVsudaSVRP8
 y9IhiJFF/IeT6/0QgacbophbcKVLQigsSZZWBac/JmDGEhX+367nM36EVtRPwGrc08Qw
 hf/ya4oLDiXmDv9aNX24WLVi+e1eNkp+jJ/KosE87xKBSIVWF3t8LEDZTJhOwcI0SK5z
 y2koNtgG18IDcfHGZdsi+UPJT1GCUdq+3eAwkv5FANQRY7UQxx1lJzl5pr0xbYau3Z2f
 xQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=molslPGG/aVq7Tfl0f7ZnD8L5065Z3YOyyGkcmzBtPg=;
 b=rGsx7BqNpyYnKcOwQJYKx+tKboB215QGTCkZSCRXp5UKkmT/tCsc5YIlzX7zycxaPE
 FxmIS9o9hErlNTb2tQdqE2g8w1Lni5tZugmS3kwIgPNOpkfYO6jQ6pwUXQKndcz8lcE+
 lVRndQX1xpQmULPbw868kmhMqRqZMMgfpAq923XgxL/KJQoyan2t+47ch+vOkPFVGPAD
 Zo8VtEQtI4ymlfAgFGCjkIcmn1Xcb7yQoeEifc7Fo0JJTecxDLsHoXnXpVsH3iCuVnAz
 DjbwMGIlKfkip0lJ7oaAGBaeIqsTYNg4rS3R22ijlhIjbF+hWajTYpNpdvKGTrmTYCIe
 WlnQ==
X-Gm-Message-State: AOAM5337XivSpaP/I2f6WDZA2GpXi+nSpK4Ucp4ojllGWtysjSIqOuNb
 /sEcxJG1UAFfttQ3OUWuzu8=
X-Google-Smtp-Source: ABdhPJxFI+cJIQtaQrIgx1Ql/SDePLvWciNxuTw06tHHD+aaiAagUpk2mRdOa+0wrERqwjqlFRpn8w==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr12602543wmi.82.1592209960130; 
 Mon, 15 Jun 2020 01:32:40 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:39 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:22 +0200
Message-Id: <20200615073225.24061-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Don Brace <don.brace@microsemi.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 esc.storagedev@microsemi.com
Subject: [Linux-kernel-mentees] [PATCH v2 5/8] scsi: smartpqi: Convert
	PCIBIOS_* errors to generic -E* errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

pqi_set_pcie_completion_timeout() return PCIBIOS_ error codes which were
passed on down the call heirarchy from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index cd157f11eb22..bd38c8cea56e 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -7423,8 +7423,12 @@ static int pqi_ctrl_init_resume(struct pqi_ctrl_info *ctrl_info)
 static inline int pqi_set_pcie_completion_timeout(struct pci_dev *pci_dev,
 	u16 timeout)
 {
-	return pcie_capability_clear_and_set_word(pci_dev, PCI_EXP_DEVCTL2,
+	int rc;
+
+	rc = pcie_capability_clear_and_set_word(pci_dev, PCI_EXP_DEVCTL2,
 		PCI_EXP_DEVCTL2_COMP_TIMEOUT, timeout);
+
+	return pcibios_err_to_errno(rc);
 }
 
 static int pqi_pci_init(struct pqi_ctrl_info *ctrl_info)
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
