Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C064C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6EB61027
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA6EB61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C30F82EAD;
	Fri, 15 Oct 2021 14:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmEEVLnw451Q; Fri, 15 Oct 2021 14:41:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BB91D82DDE;
	Fri, 15 Oct 2021 14:41:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5D7AC000F;
	Fri, 15 Oct 2021 14:41:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78752C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A7B5401BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9PTxBcxNtR3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:41:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BB174011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:41:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so7465481pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bPWEij9k//B/evooKOYyCZIPd/p9FY3S9h0pgeJmYgg=;
 b=Km2uZRbeyHWl3vxa8aRDCInxBvpIiEO3AmVBHztRFk5ZgfFd9olaTl+rbmu/oydeHZ
 IHppOUEVjxxJAKHEUkTeol51wrxuZ/+gk1GvVDXnURGpLXtpzKXmvLKoe/ud9GKDAyJY
 yMG2uH8n6nvR39i1GvU3pAGyGjYQiRj/kql9GxDZmH+99/bzsytsRFc6JMjh4Hvdnqtn
 I0SjfHPWfnqyMn8ZmPaXDRb1FQmpMIcxcVZj3Pk8ucWVMt6H1NPJS+b/AI2g8ySsYJVb
 f4UYJnd895UJZ/T138mEoKyMJvpDePiztdDGdkWqs4bAT4w1sQVf26mBkq6kWxVDd88M
 J30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPWEij9k//B/evooKOYyCZIPd/p9FY3S9h0pgeJmYgg=;
 b=4nMf5X04SiCsGFcU0GtREkzNJtVN+O8OJvKsNMdsqGl0r4rAEHOMuTnMt8fmCii+QM
 TNQSDxlg8lHvFJqTk8mwNJM+eo9fB+iSebVR/EuR0Oi23zO9ruwmQl+EFwcXMiNr2Gh3
 caQXyHNl0ZAYGrrRzP2eofasi7AOftKK4vd4LiPBwDJaiW0xxv6BGhaVFtu83b4Z+CkI
 tzoEBq6qQ7Z3Jy68M51YoShSs4RJXK+Hq8F7p85fgmt2ykVLZyKPg51+cHIkuSoIAkqo
 pFul5hGCRAmxSgSN3I1nBu0hmnM0Zj/zcHxF/CxOwvDe9rALVAEEe7rb3l94Jr1jBQ3g
 Bm9g==
X-Gm-Message-State: AOAM531fXFoJvd7T+tE+0mWtQhbFPlo2bMVwT1EBMSwKT6X3ZVNkorHI
 Ms7yfElLDCTaXFRa/xiAA7y3Ne5XxbG7V2S0
X-Google-Smtp-Source: ABdhPJyTJ3ugONhH6RB4ceOPoJUQ+a63FyARtrIhRgXhx4d18rG8SOm2ceSMB0F2tFyOUKh6jodFzg==
X-Received: by 2002:a17:902:7c10:b0:13e:e11e:8d1c with SMTP id
 x16-20020a1709027c1000b0013ee11e8d1cmr11418268pll.55.1634308862978; 
 Fri, 15 Oct 2021 07:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:41:02 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 04/24] PCI: Remove redundant error fabrication when device
 read fails
Date: Fri, 15 Oct 2021 20:08:45 +0530
Message-Id: <0114a4a44ceacfbd6a7859d8613ca5942f5b35d7.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
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
 drivers/pci/access.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 03712866c818..37258af87b0e 100644
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
