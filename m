Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C433C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BFD22B40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1ELpRRF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2BFD22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4A9488738;
	Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWi8uYY-uecx; Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88C08886F5;
	Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7212CC0050;
	Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD02C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 69DD886A8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jIUh6FEvjYo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AF9D2869E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id f24so10675789ejx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+B0ZiRGGkQHGfacBVvFgt+7CbN36ujRN2OQHpeuEl8Q=;
 b=q1ELpRRFFJl8UZ7DlKSBerPXQVxyKAd4T3Rh0sn2R47QsC0y9Bjo6tJovpznNhS8yR
 1ky2nz6HbkWcz/wRA3cUSi86NBcbDAf4+sQAuPbHZ8KjHOPop1D8Cs+efmggmlP6kaTE
 cejWvPxN+7BdWCABfsSrVCZ4a5ZrEbPMMx43Rj6x8ChHzQReQfKVL+7BtF+0ppl8pHIg
 OL7ouoqnTXagdt4YbGlYplW9EAo5EKk4QJ1SbxuVOJbBf7HvSjYGpb3GROvrXv/pNevl
 XjTzuyStpqPFCaHph9dgTIXXlp1veqq0qMTJH3ugoZ/2xMD+1DQd5SwmH+/K6LZVIxpl
 iQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+B0ZiRGGkQHGfacBVvFgt+7CbN36ujRN2OQHpeuEl8Q=;
 b=SCzHDBQ1sARiONxOE18EXF3M9RaHf3Ijxaj0M8FU0tGEEW9tTRdGC6rObRqTaHOmfs
 WzCNBA2hhURx4pvUfIzbBC1wwipt1Jtd1yTBBJPNYDbhQdd6JzuguH0vgApHZlP6hhZD
 GxCDiDIzUbOWqHTnH95AILEJW33lLaCyLxGxsRDVsiWxFpjBDsBh6ZzpP0fOsO9WNPec
 uIb8ALbZ0vGq360tDJGviyn782AzzRkaVd9PuuBBXfsnanxksQQkvm39Dw0h9LxJI2xL
 9S7HP9B6aupEKf7jj55awIEwHnMlkNg/BqUK18JFL2NagXPwVY1PynmeDC0pdlijf30L
 Dy/Q==
X-Gm-Message-State: AOAM533il33Y+KAYasUuhpVPRzPE8+okv8BFw0X9DgxiCnI6HZxFYB5H
 8BqAqXyYUE7Xve0OlI9AeNI=
X-Google-Smtp-Source: ABdhPJxgR17bqYSQeGy025fhxigm0MVrq5A7QiKas69UQZRDtn4IPk1fEsdjUzNRp0lVrz4itO5j9Q==
X-Received: by 2002:a17:906:3756:: with SMTP id
 e22mr3810103ejc.487.1596196944109; 
 Fri, 31 Jul 2020 05:02:24 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:23 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 31 Jul 2020 13:02:33 +0200
Message-Id: <20200731110240.98326-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 05/12] PCI: pciehp: Set "Power On"
	as the default get_power_status
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

The default case of the switch statement is redundant since
PCI_EXP_SLTCTL_PCC is only a single bit.

Set the default case in the switch-statement to set status
to "Power On"

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 53433b37e181..b89c9ee4a3b5 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -400,14 +400,12 @@ void pciehp_get_power_status(struct controller *ctrl, u8 *status)
 		 pci_pcie_cap(ctrl->pcie->port) + PCI_EXP_SLTCTL, slot_ctrl);
 
 	switch (slot_ctrl & PCI_EXP_SLTCTL_PCC) {
-	case PCI_EXP_SLTCTL_PWR_ON:
-		*status = 1;	/* On */
-		break;
 	case PCI_EXP_SLTCTL_PWR_OFF:
 		*status = 0;	/* Off */
 		break;
+	case PCI_EXP_SLTCTL_PWR_ON:
 	default:
-		*status = 0xFF;
+		*status = 1;	/* On */
 		break;
 	}
 }
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
