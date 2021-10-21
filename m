Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A17C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A236610A2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A236610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B2E60F01;
	Thu, 21 Oct 2021 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiURf07c63PU; Thu, 21 Oct 2021 15:14:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A352360628;
	Thu, 21 Oct 2021 15:14:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EAB9C001C;
	Thu, 21 Oct 2021 15:14:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA20C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10A660EE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsSKXDq1SHuE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 647CC60628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:08 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e10so624795plh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ueS5g3AKfHONQw39HmC4BG+JBhrOhxPXeZpNcIeTYs=;
 b=KywtvjBqhXdKM5saP8ozIqwgJ1NpLQLuxi/61QKyCXpnntRLwkq8K5y5JhWK9uoW6Z
 0jSWeu/SyIc02VfO8a6JoLBiYzlSPjWZ20SYexAhgBC/z07hAtVPJ7QgWkRncMdPGA31
 G+G4yvY8iittk/SzgGlbZwEKZfPj6GG+TH+ImdA82fnqP3CCUoiH7FO1xDdFjZdC3ZsJ
 /7d0DrNHCe9LDuYC1oGxvkMnosURXlrc7hTQEyDnk3SHVGRxWMLavT1EvQXPT21trhij
 Gel3YJCPzYH0Ffqi85lDLXSVjBnyeAPT4N8wWWz+kwPkAn/HDytKYVsugxca9gdebLex
 x3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ueS5g3AKfHONQw39HmC4BG+JBhrOhxPXeZpNcIeTYs=;
 b=7QIFsMmR/SsGD5AXWGwooCc2lEHwSdlrhIyGhx+ksrI6GUrKyCTfz8loP2r+JAD+JZ
 YCTw7DNKbdg6Tr2vt5YW4xH/vX13hPZPQk0h+YkbAlRjNVyjAZRE7uEFCvZkwk++Krrk
 20NScMCKYlJ/slsp0uGv8fiPorjUs4ukgn6czpTy+9OyqLRBpZdcsWBjY7t/EybC0ffl
 gEm6pWuLg8l288Tkj4kxaQ8t926Cqnhv0eHWxunst0t8WdnM1gCCO8PsTubkLvG8nT/G
 7BavC9PQvuX5rnVqMl0+tfltlrJWh+daoSGYA3fIrvUc0NBouS5mxWlfEE4hduw6iUIe
 wMqg==
X-Gm-Message-State: AOAM532XdSXzLX+NpyPHUBOfrEotWOPfD3ZHe+3Bny2e73ecYcGgtUDg
 iKrOcsbJgDJ2BbPEWSDKeO0=
X-Google-Smtp-Source: ABdhPJy/rYBKMVB2biY8nPCP0z+l7gmEi9mx9wbhq8VWJmK58SGug5h7FWR8XUw6e5oMZab3QioSpg==
X-Received: by 2002:a17:902:b615:b0:13f:fc88:6479 with SMTP id
 b21-20020a170902b61500b0013ffc886479mr3621816pls.53.1634829247879; 
 Thu, 21 Oct 2021 08:14:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:14:07 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 19/25] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Thu, 21 Oct 2021 20:37:44 +0530
Message-Id: <6e19df51a431da05dbd5577f11dd31d0c2801911.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: "open list:PCI ENHANCED ERROR HANDLING EEH FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Russell Currey <ruscur@russell.cc>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..4a051a096075 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -79,7 +79,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 	u16 status;
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
-	if ((status != 0xffff) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
+	if ((!RESPONSE_IS_PCI_ERROR(status)) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
 		return false;
 
 	if (test_bit(PCI_DPC_RECOVERING, &pdev->priv_flags))
@@ -312,7 +312,7 @@ static irqreturn_t dpc_irq(int irq, void *context)
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
-	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || status == (u16)(~0))
+	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || RESPONSE_IS_PCI_ERROR(status))
 		return IRQ_NONE;
 
 	pci_write_config_word(pdev, cap + PCI_EXP_DPC_STATUS,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
