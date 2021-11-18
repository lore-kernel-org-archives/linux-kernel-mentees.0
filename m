Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15908C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D156161107
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D156161107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7104400E1;
	Thu, 18 Nov 2021 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwNy54cX5-uN; Thu, 18 Nov 2021 14:07:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC7F40140;
	Thu, 18 Nov 2021 14:07:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BCA9C001E;
	Thu, 18 Nov 2021 14:07:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 813B1C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A73400E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Xvwdz6Fww1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:07:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0A5340180
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:07:54 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id r132so5408082pgr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MC+uMtAqzrUGxiPuMGV2uquDaVscrAuApobHOB73Khc=;
 b=iujRsX4QPoiun7MHP0bUBZW28PjBf6o6gfGjY/YCm/Lpia8P/wzPGdCWhiyGfZG09g
 Gjrmitr/DvKW1Se/u30W1xBctEtQ460BlEKz4w4a4RRLsG/Z9uYu8quQ3S8YNaXabwUL
 c0ODX2zYAPzZEc+6s3kYCQfPner0LQoYLnPLwcCCQxCnx5DSiPpfmdj91JA28o2Bh+zR
 Xxth8mCjdAdYY8DkskQ2AL8PFVJqPwsIgFNlvyqn9V5Q7seZuDDq1aaOMfpUVkRLcLVb
 p2wov/u8f1vPaBr2+y9SQZFEwiXZ5iREzuqbl0+ygDk3ftzRQ2vbE6NVCZ+zPwJOU+sx
 PG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MC+uMtAqzrUGxiPuMGV2uquDaVscrAuApobHOB73Khc=;
 b=RTmoWHHpsLN4qOcsaWFo3bm+TDLtk962SmmSPUfOUZqOyU7PhBps8/vBY7iCFLgCEb
 nRomBhoyx8mtI/jgdpofY+xM3XP9FCxo+hEF20aVwrvxAFosl0wf7ARE0O5rQemcDpVq
 rNlgVBIQJB6rpsfgtY14VBfonzJTL/nWIJ7JyPxq8xU+YSkkuK8VVJU3Ym08QgiepQHS
 +lynI/0iiV8dLpBCjrbnSQKBcAXWbOFdp1oo3jTeX8ri+ndtqKpne2OHhX3Fss/flojl
 q16GTC93ZtQETw3TriZnPcUfxqisVlNIhfHdUh+Lt+KKRUPpl1XhXrJxBSZvbEuHo4ia
 GNXA==
X-Gm-Message-State: AOAM533LTSa5aCzV8Cq74AWzOdlns1hBoZlPURWY8WvBpCcdBCJq+JMr
 g0IVOEkZ+5sJPtEQiyQvLxQ=
X-Google-Smtp-Source: ABdhPJyuYGF3D5BwP9dBQadEZLcKBgGb+caRhXPH1nLvYia+cdRfnIzBQGuarTkOzB+UKMsDzzIvlg==
X-Received: by 2002:a63:725e:: with SMTP id c30mr11339989pgn.240.1637244474011; 
 Thu, 18 Nov 2021 06:07:54 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:07:53 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 14/25] PCI: rcar: Remove redundant error fabrication when
 device read fails
Date: Thu, 18 Nov 2021 19:33:24 +0530
Message-Id: <83540eb3ae76a0d28bbe03d69d685a6d549b456b.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org,
 "open list:PCI DRIVER FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-rcar-host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index e12c2d8be05a..6bd5619fbbf4 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -159,10 +159,8 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
 
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, val);
-	if (ret != PCIBIOS_SUCCESSFUL) {
-		*val = 0xffffffff;
+	if (ret != PCIBIOS_SUCCESSFUL)
 		return ret;
-	}
 
 	if (size == 1)
 		*val = (*val >> (BITS_PER_BYTE * (where & 3))) & 0xff;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
