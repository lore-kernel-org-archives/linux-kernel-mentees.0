Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C7EC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536FE60EFD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 536FE60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3958281777;
	Thu, 18 Nov 2021 14:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDw9m3gUpEdx; Thu, 18 Nov 2021 14:06:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA6F81774;
	Thu, 18 Nov 2021 14:06:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CC35C001E;
	Thu, 18 Nov 2021 14:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 285E0C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15892401C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2w_bXtIRYeJO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A0D840195
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:00 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b13so5355611plg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJKYZ0DmEpP1c+Cyc4zstBHahVie6foEwa+j6qM9UhA=;
 b=jR4j+uWajdUBW8ioVx4f5AGVPE7plrg5Zo34hJRLJitbZCha37QIAEH8v3C2MoJa7L
 q5wQ/GZsXlkwhuooU5p0AbAlaFsADi6OUHnZsNN0WnvMrj6hC6uvKz8BX1vW1VuX64VR
 VTrlRCt4jn5QRUohdQMSMtX1OifQ1IZnPX7w+5MyfhrI1JMAd4mjkd2C8nmmPK0L7UPF
 f2YNQcjanKRL62xIjI+ejIjkPwS1WNldYOfy1AQukRqjRNKSndUpwb9Mb/9Ot4hEXnJH
 Pp6a8QIVJs25PViapKLN86m1IC+q/kZSX+IZfMehrG1tO9WDiiLbBnlnELHSAgcCwOYU
 TKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJKYZ0DmEpP1c+Cyc4zstBHahVie6foEwa+j6qM9UhA=;
 b=mlg2GOFBOeYQi1kWWRiSKPRLJkSGZy95MLK9rHJtsqwkoCk/tBvHaCA9kuDmGlRIX8
 hzTSOvzJPgLJ8RzYQWpmM8Lkff2Z2yrNoveodGUfX4IwcMMlxLJLy4eB7+kKhbhVMO1K
 vd2Ajb3uz5BamYURmgq2YDIgVdhUX3tWXcUnQ4lzH2kl2spdTEmm5iIgdLVFJ8TITSDi
 uwuMVnLsjL/HB3G9EO9C+o8STqgs6vORABiNh3yDGdmRX46wgQUdXIqp9wG5FWvPp9yX
 +/Xvaf18IUOgheXa9llObAHx1vTeD0ONuwYVud9mz/l2n/TOWIAax+vukZjeyG2B/n7l
 wueg==
X-Gm-Message-State: AOAM531L7F8lcXHkMQDOMHfF3wndCK7SH7j6frb3K0w8hKNWXtGZqfnS
 V2DhUiAEMt2/Hw79uSN4fRjqTIiWYMl8dCGs
X-Google-Smtp-Source: ABdhPJzzq68/X527KYUYiq6BXWx7Pi6UkM26Xbb7lDccllJj01D67EBk5gsrY3Egw/rUWXJ/CLdhdA==
X-Received: by 2002:a17:90a:1f45:: with SMTP id
 y5mr11000237pjy.138.1637244359702; 
 Thu, 18 Nov 2021 06:05:59 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:05:59 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 08/25] PCI: exynos: Remove redundant error fabrication when
 device read fails
Date: Thu, 18 Nov 2021 19:33:18 +0530
Message-Id: <765c2f27d85fcee4eb137023dc0a8f864eee9e36.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCI DRIVER FOR SAMSUNG EXYNOS"
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
 drivers/pci/controller/dwc/pci-exynos.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index c24dab383654..f9526d6de160 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -216,10 +216,8 @@ static int exynos_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	if (PCI_SLOT(devfn)) {
-		*val = ~0;
+	if (PCI_SLOT(devfn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	*val = dw_pcie_read_dbi(pci, where, size);
 	return PCIBIOS_SUCCESSFUL;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
