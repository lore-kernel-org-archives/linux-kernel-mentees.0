Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E2CC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B97061052
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B97061052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A0E400C8;
	Thu, 21 Oct 2021 15:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nf2yDLDaftJg; Thu, 21 Oct 2021 15:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5F098401BD;
	Thu, 21 Oct 2021 15:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F3C3C001C;
	Thu, 21 Oct 2021 15:15:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1212C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A097A83AEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VPfW4R9ORfl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 333038100C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:09 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id m21so577284pgu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnLnMx9TiMvb2DdIMVT7WpH5F3wdHvIfMbTto6KwZSg=;
 b=Pz90wycD5upk/N58ukfuJBvjKYqKsAyX4N450DRmxX4zYZVm0RPibszRSrLn5sdpI9
 FKZ+aPYSXF/Or6ZgkVzut9V3jpVIXKsuc/v3DQFo55OOxou9RnWIX3+FDU31DvOeZgKY
 +/2F5azh1KpxVUTG5N9u9SpciwITX0Jsknvx/RPRbr74yQvxjl2WfIJ9fBN0HE4nSee7
 P5CXaEc+60zwqa1WGjVapTn3Si4vLCdcvmI/EfEGrUXwTl7bQuj2hQpMOKlV9O1TWpIN
 Ge3lkIG02jxKfxrY3FzNMJYMUb0SA+miwzfSn1dbx2nfplo046yERVVHhtXn/9PDdXje
 yiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnLnMx9TiMvb2DdIMVT7WpH5F3wdHvIfMbTto6KwZSg=;
 b=2JI4djziPj3hzqV+t4VJfTqdlJ7JrVPt41v01WJdVfhh7+VHvD14CaZaghypXH0ctT
 sF3MqRyLb+tYrDJWlFfsTil2REMUkFEbASnXF4yD8JdqEYM5HoRQdHa+xDecKCmuehuE
 C/gXMHx1PHcqy4mtU4KzJJpSgr7FN23SETpnmXVQvfcVsUgiGWj4bN4tZMeLnR9grXFa
 vcPfkz6b2J91jMyHx1PSIYAmN5l+KGJpkTaH98vpTOojliyYT7Ufu6TfOtr4m5m556dU
 jsgknEcIOy9sMFoGeCoogp8BwVPZ6NZU70uZNm3yWsBgbmXTSxY0uQiJniaDZCBR7ioE
 Exqg==
X-Gm-Message-State: AOAM530HH3Q2ULueM6c1VBlOIck6QbEVKv2LwQ01DRnBvd6SyPeIwATr
 HHvr/nVYZAyuH1B6PAtxNj8=
X-Google-Smtp-Source: ABdhPJxhnoG9TmriCOt6ZGRxqyZUvT6HOxT0Utz32C1JLwzEnJCfreF0x30Y/PMIEkJMKLIaaf9lXA==
X-Received: by 2002:a05:6a00:852:b0:46c:d325:e95b with SMTP id
 q18-20020a056a00085200b0046cd325e95bmr4500656pfk.78.1634829308613; 
 Thu, 21 Oct 2021 08:15:08 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:15:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 23/25] PCI: keystone: Use PCI_ERROR_RESPONSE to specify
 hardware error
Date: Thu, 21 Oct 2021 20:37:48 +0530
Message-Id: <e4a15164ab72c57a8d1b8bf6afd5a357fe70981f.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier <maz@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jingoo Han <jingoohan1@gmail.com>,
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

Include PCI_ERROR_RESPONSE along with 0xffffffff in the comment to
specify a hardware error. This makes MMIO read errors easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 865258d8c53c..25b11610b500 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -748,8 +748,8 @@ static int ks_pcie_config_legacy_irq(struct keystone_pcie *ks_pcie)
 #ifdef CONFIG_ARM
 /*
  * When a PCI device does not exist during config cycles, keystone host gets a
- * bus error instead of returning 0xffffffff. This handler always returns 0
- * for this kind of faults.
+ * bus error instead of returning 0xffffffff (PCI_ERROR_RESPONSE).
+ * This handler always returns 0 for this kind of faults.
  */
 static int ks_pcie_fault(unsigned long addr, unsigned int fsr,
 			 struct pt_regs *regs)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
