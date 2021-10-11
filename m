Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE21AC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 699FF60EB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 699FF60EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340396058C;
	Mon, 11 Oct 2021 17:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGEhlQPruKbp; Mon, 11 Oct 2021 17:54:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 51D4A6059C;
	Mon, 11 Oct 2021 17:54:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B4BCC000F;
	Mon, 11 Oct 2021 17:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A15F9C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 828B5402A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IF0XIBKuQAv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0863E4029E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:54:37 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id h125so5504666pfe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZImDxRTs4nwbSxsAKdaHyup0N9fnqvqZDCDk/+Vf0Y=;
 b=eT5FFReQfb1LcNkIwafOPSuleoxZmsTsEcyXNFqnLbBwjR6De+HHX2hPGC3hRgbQ16
 zE4jTh/rIAcYWSvPmFrEjULaYVLLRN8sqBUeh3K65+oqfDf7Bu4yvx+DGFUPHfgW0eOJ
 sBzf9i7HOnuxtcl0doAhD/UylSNfLnlYbRb+SeJMJeS8czBpuU+6J5kjGzdnCdeMiVUI
 mvTh4fDdQUD68Xt2zYHW61FFfUd4TolDMj/0x8MLJ+boiRdwCdHR32iwHpHBgpXUp1lx
 CRowfDvAxBA9Hj8CQ1nyvrBG4bEd5NCf7J7x6nl051mfFqZ0twgWmbSxa8CGO8w0ocgW
 QOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZImDxRTs4nwbSxsAKdaHyup0N9fnqvqZDCDk/+Vf0Y=;
 b=5h7VoK9FTy3WmRQ4FJJyXTyI0QqmjQNIDIBbJp9zaS3nG4FsyX7pnA6gjQDMVixPlV
 5WjjmRpEhb8g7qV+rbYtESr1wugFhqu7+3q93LOMwJwSw5ggY+5QqcqS2R/MtixbtY/d
 BilUoyu/ryUJRaKlQ0nYSq6ufxcM6T+5U0AHMplrOKvyFdpKHf0u08Do9PQp/74OFavo
 gG5rsJMUoGIWGueH7TJeeAZExmfLNTZ4qmKRv1ibfkdjRlkuZYP+qkFtHLLwxN2QxldR
 ToFe3mfC50C1OMP2qOhs9w9KcD5WeW60zxiPes67av+foir7kOV8J9+7KDf2Nwsk6bSa
 S82Q==
X-Gm-Message-State: AOAM533+SSiZOsHdqTt4BZywyO+5COrX6GMjXXvbGsLAc/qEZ/i4LAVy
 mtQWjBQgKsZZ+Xe5Hyo3m/M=
X-Google-Smtp-Source: ABdhPJwcO9WvA1cydLG6eyMp2ilpUV2ifEztZqKXTT4rpCG1e+IESlx7wRwodAB2FzQ9t8pAvZpn/Q==
X-Received: by 2002:a63:7504:: with SMTP id q4mr19249112pgc.103.1633974877421; 
 Mon, 11 Oct 2021 10:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 v22sm8605011pff.93.2021.10.11.10.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:54:36 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 07/22] PCI: histb: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:23:58 +0530
Message-Id: <9cc65876240166eafc256e0b3f0b9af61a125c42.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>,
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

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/dwc/pcie-histb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 86f9d16c50d7..1392732b104f 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -128,7 +128,7 @@ static int histb_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
 	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
 	if (PCI_SLOT(devfn)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
