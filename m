Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972D9C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F955610E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F955610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D22840700;
	Fri, 15 Oct 2021 14:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wm_Acbug5tql; Fri, 15 Oct 2021 14:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3C66F404E0;
	Fri, 15 Oct 2021 14:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17C8DC000F;
	Fri, 15 Oct 2021 14:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4A9AC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8719E401F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifpvONVhnVb0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3011F4011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:14 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so9449770pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dd4Eeu7B1efXH+i1PkiNhhqgZoEGYaZatuZnYiVKcUU=;
 b=Iab+Z9gvwWs+TREOBYg5vi2nqF3HsLIqxvL6zx4U4+9sVWm+NpOSQcg+EPOyozxfym
 BaJbiqQualQhru5j1N4xKazIPPtIund0pZpByX3ZwPFHhWxm3WnztyLWReuy9pU0KG2d
 aPFkK68SU6mC+IzAtUgp0iQg77uvJ6UuXh3IT6IAq21yA3UZSV+6okMGK0yFTkKY8v6m
 eo/GbOyiWPOLRKhGk9YoUBoi1wWx2m7tQ9VEz8Qjmvrpij74VZwtHtYbAZBoIEsGKRkV
 8f89ybDK5ZrIFs930bOv1X0U5ayTYISUmV2L8Txv+1+tU+4roPgc3X1NEKq7ouMXo5SH
 JWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dd4Eeu7B1efXH+i1PkiNhhqgZoEGYaZatuZnYiVKcUU=;
 b=En7m9VwFC111pvG7MHxgn7m2IvJvKqQrqzT2c7D/kk8v3kCY+mGAVddVu9IpQsrxcs
 vzHVHEqht7TQFmLAmBCn+1UJS2d0pHTGhW8sajxLuI2UAsfLya2SoKCbJqZ2LiPrXaQp
 kJVZChmA67QmOb4mvdLsGF6tOFRQ7TBJlDirURUDpaJdkVp9FAu2eYgzf/OklQfTcsv3
 HzgkAnWBGEN+wxc8nbLewQ+SgANPb0fn31Fevvfy34uXPICnpwv9ahES3TunTxryvj8a
 U7Mn9UmUG/kcrKn4Kep0N3maf5DaFHrFFXYAeTI2N686vlQqD5t21ZD1YNGkphBVozWT
 QMiw==
X-Gm-Message-State: AOAM530R/funPg2Mr52gjBn/B+pHpNemoKcIgWtbKvGWgbWzSGPvvgvR
 mJndeodOo6Qr0KyP/9bY/Ng=
X-Google-Smtp-Source: ABdhPJw3WSz37viY11jS4RxqgCdqRZ1QweK4V0tpvcvNRzCqQOXYNGbb+Ukcq2I5Z+tCVDnFknytpA==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr28508164pjb.192.1634308153472; 
 Fri, 15 Oct 2021 07:29:13 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 j12sm5210806pff.127.2021.10.15.07.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:29:13 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 01/24] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Date: Fri, 15 Oct 2021 19:58:16 +0530
Message-Id: <4516b02d3c0fe3593a1a9f59bab47e99cdb65f02.1634306198.git.naveennaidu479@gmail.com>
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
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Add a PCI_ERROR_RESPONSE definition for that and use it where
appropriate to make these checks consistent and easier to find.

Also add helper definitions SET_PCI_ERROR_RESPONSE and
RESPONSE_IS_PCI_ERROR to make the code more readable.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 include/linux/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..928c589bb5c4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -154,6 +154,15 @@ enum pci_interrupt_pin {
 /* The number of legacy PCI INTx interrupts */
 #define PCI_NUM_INTX	4
 
+/*
+ * Reading from a device that doesn't respond typically returns ~0.  A
+ * successful read from a device may also return ~0, so you need additional
+ * information to reliably identify errors.
+ */
+#define PCI_ERROR_RESPONSE			(~0ULL)
+#define SET_PCI_ERROR_RESPONSE(val)	(*val = ((typeof(*val)) PCI_ERROR_RESPONSE))
+#define RESPONSE_IS_PCI_ERROR(val)	(*val == ((typeof(*val)) PCI_ERROR_RESPONSE))
+
 /*
  * pci_power_t values must match the bits in the Capabilities PME_Support
  * and Control/Status PowerState fields in the Power Management capability.
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
