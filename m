Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBC1C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3272A611C7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3272A611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDD483B00;
	Thu, 21 Oct 2021 15:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7LVEXW32xqL; Thu, 21 Oct 2021 15:10:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 23E9883A66;
	Thu, 21 Oct 2021 15:10:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03658C001C;
	Thu, 21 Oct 2021 15:10:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73496C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62BE160F0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Dx84ZWvGRp4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF86160F0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:22 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id om14so713120pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBZl56cwXIMS5MrYNm3KnDDaTcN98ZdLkMKDc078ljY=;
 b=HdkoSvfcTUXobi9Chvh9ved3HASn3xYwiDKYDXWN4rdB7A+yhWpPRtnoUM4EhsGWnI
 RyMbK4qETKb+a9y3fsQ4FTniSkNxvQUJMgkVUsTzlcsew7Fo8MCnGi00jDpbApEI3UyX
 Zu4yr3qeC01mj4DlX3sK38LUlIy0jakLtEB+vYwx5i1O6kPJSTYohXR9kobvKdBWI8rJ
 UTL2AhCcunsJ78c21ku9rLh81UciA1R+N1nnHnJsZ6cQcIarQy8m0iPBx8ztP55G4Kv7
 TwPKY8qwmWy3Tldytyg5Zq94nKgpgK/qRdr/w6yzCSWpkFM2iOEIRQ6P0W4wlT13zVd+
 UKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBZl56cwXIMS5MrYNm3KnDDaTcN98ZdLkMKDc078ljY=;
 b=ZB2VuzxAfNXppBAsoRC2gyAzv3F/TXw0q+KMcQHuDly8JTBoJQFFJmXxZHH+rPq1Ya
 0F7TAXpWyjGOXMHdni3x95h+Len694S5lZoh0qAJ/dJajxm+nokxu1EUSP5SX2NexiqX
 87BKtRdRytu6BD9SjKAXpWqWrKN4lyTP7Gl4xb2ux3ZEETsjm2d1NdpDgfFEpOGFTm7L
 R/5d2AIItY22fTe7tfkr1lvd8wxkWAnnE/F/yIFZvSJAzyCERbf0g9fKm/Ge1o8+rU8D
 Nx3unAjjC8PfWtRDCrpSPmSGkltqZi70qAQjxCOsaVdL7k6mDRAtskYDCr+aFDO4S+L9
 4nCg==
X-Gm-Message-State: AOAM531TG93VnITVizNugP9Dc8oqxa0ndLi3MBO14paquD1JlwXSNz0u
 09T82nP50f9HFDHZB5HhorU=
X-Google-Smtp-Source: ABdhPJzFJV86fZ2NHUP1FR2UDK+UElhuVdbXO1ta6lVEh1vuhS2K9/0lYIzgoDVOhedSsVR8HXOyOw==
X-Received: by 2002:a17:90b:4d88:: with SMTP id
 oj8mr5119693pjb.175.1634829022270; 
 Thu, 21 Oct 2021 08:10:22 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:10:21 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 04/25] PCI: Remove redundant error fabrication when device
 read fails
Date: Thu, 21 Oct 2021 20:37:29 +0530
Message-Id: <b30f9ca658703da793345dc6803ffc77f7504e1f.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index a6bcbad04d89..2705a4412e69 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -83,10 +83,8 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
 	void __iomem *addr;
 
 	addr = bus->ops->map_bus(bus, devfn, where);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	if (size == 1)
 		*val = readb(addr);
@@ -125,10 +123,8 @@ int pci_generic_config_read32(struct pci_bus *bus, unsigned int devfn,
 	void __iomem *addr;
 
 	addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
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
