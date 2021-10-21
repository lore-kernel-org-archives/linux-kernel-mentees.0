Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EFFC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69BCC60F57
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69BCC60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445BE83A5A;
	Thu, 21 Oct 2021 15:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cezwURm-b34o; Thu, 21 Oct 2021 15:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 83E2B83B00;
	Thu, 21 Oct 2021 15:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FD84C001C;
	Thu, 21 Oct 2021 15:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A9F3C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE0E40868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h54fPBeopaDT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8F79407F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso782832pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r3o5gBqF0m60j/685v1gCV+85CWmYdPsbI4M53MCV74=;
 b=i2E12Gf3MradRaA6L+Vcc5Lo6XtZ/fVf/ZWnm8oDtjsE4xTJqRT+l19jozuA+esT+h
 PJFe/cy5U/ogFT/dPLmB/2eJP5WH67mC0Sc6YJpFdLeE4wCg+AtGoUkNW5E763Ake4L1
 0mcJ4mk+yV5TKnLMWZUW0IFVz7ar2ciGv/Idb1uiTPEGS3aWtW0BH2zd2XvhO4uuGgqo
 c7t7w0ryMTIwqzsTWcp4XZqpzvVnoYlrP76HIhR4rwn5vX9hP2pa4b+gPjiRbyKUUKcL
 9NH1RMGqUzPBQky4qUSGPv/4fbzQrRqvp4yp0IaUz2uFsJ/p2EIPz94JzBz5Js1HQjDE
 u5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3o5gBqF0m60j/685v1gCV+85CWmYdPsbI4M53MCV74=;
 b=VdW0IXVWYHpj56hoSyyK612hi0yyJrW2zAePgxF39rw87Bbnaipy7QCzH/odzpsIP0
 e8ib19YvrX7FT6mpg+bsUEt1Jc0pzjULtbnpg5IzFICypilh0aLqBiR63sS7/vqey/vW
 +VGp0dm8SLVPMqhfCWNwBTkkq8m7haA9xehgfp9KYPjQWF7nltjpmFM5WrgIIOStVEq1
 3mQ28t7tUuc/KiTI1aTPu75Lh65ydt+5ts7dZGslSdFvW75fR2g6Lk6+Iye4L/RV6THG
 p4H4kBOu6gAq6n8+GQmZlimi3O4k6KAXkc+K+HICd9Z0f5nDYhcCuM4AJxHTwnqCAD6v
 x2wA==
X-Gm-Message-State: AOAM533d6kEACmSX44z68O7Odk7aPqN8tnXX39tuv9oL/XGS82uLIkw/
 Y6h8ndrYT3k9efFibIza7cI=
X-Google-Smtp-Source: ABdhPJxFk7e1vtp4qHS3c1Zxn06yJuOA57fAM3iyNvU3T73javJynq35EJA8Ilbs3c18IIVc7E5eZQ==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr7304004pjb.7.1634829060352; 
 Thu, 21 Oct 2021 08:11:00 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:10:59 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 06/25] PCI: iproc: Remove redundant error fabrication when
 device read fails
Date: Thu, 21 Oct 2021 20:37:31 +0530
Message-Id: <cbcbde500a34fe5ca3996449ec4e1d78d02f5628.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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
causes a PCI error. There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

The host controller drivers sets the error response values (~0) and
returns an error when faulty hardware read occurs. But the error
response value (~0) is already being set in PCI_OP_READ and
PCI_USER_READ_CONFIG whenever a read by host controller driver fails.

Thus, it's no longer necessary for the host controller drivers to
fabricate any error response.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-iproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 30ac5fbefbbf..e3d86416a4fb 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -659,10 +659,8 @@ static int iproc_pci_raw_config_read32(struct iproc_pcie *pcie,
 	void __iomem *addr;
 
 	addr = iproc_pcie_map_cfg_bus(pcie, 0, devfn, where & ~0x3);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	*val = readl(addr);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
