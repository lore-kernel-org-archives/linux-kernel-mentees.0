Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A3BC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B46661041
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B46661041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D870B4059F;
	Fri, 15 Oct 2021 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8zP0phORlLo; Fri, 15 Oct 2021 14:45:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7714011B;
	Fri, 15 Oct 2021 14:45:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 859E4C000F;
	Fri, 15 Oct 2021 14:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ED33C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ABCF4059F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xG93whQfvsv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB0214011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:09 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id kk10so7364310pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6PFmrQZfsZKbN43caoyPHUp+nOh1/rI/bPUZ2uC0hc=;
 b=nGikGQ9yK7YQbbTiDAZTKAQWSsgNQckh4RY8XQhGoaHkcigKBYQY2KHF0qvQic/nLu
 HfVplvAxNgmCVh7h2rARubH+bh3ouSbu9d5OxLS0JXDzPEoEc/IVvBaRDS9cVuRMi8O/
 ZHXXxMQ81BZpguTrosbAkvo/7HdvmNco2zoCXMSBHRImbrj/B+/P0Xd3xa5bxW+8Tuhc
 dpjlahkygD3lnVFrzemLItYDD9cWMY5OSbTo9ySaULEcDvkUXAyYLkdU1KWIP1Y8qJeO
 ytsG1qXrrCK/WmotzKXOHUMtVGbcHnWebuTQWggz99VPx8/Qx7fuLdjSggU/4SjRL7nR
 2hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6PFmrQZfsZKbN43caoyPHUp+nOh1/rI/bPUZ2uC0hc=;
 b=bsK1d2ceymPqgmlZKMrIR9YkdtZ2LQrtLiwevZcfStXvzWjBsbl8L/NKiOv21RgUh+
 fI44PRHo5R4YvLNd8fh2xeM5hpThjaYdfJFEflSxuT7ZGXbRG22tCv+Wky2JcdmRf/7V
 jlXo0GHZuqFyHACpcNCW2R3A65XQBSXW/W/cf2V7/2RPiONOMDWtuhcfD4XsGj+DpPOI
 oAHDH/usXsugid+JzVbh5eZ7Srw+fbeNImoSp+TRNXVpHO1P0acfbjzo779jj4QIXISk
 aooMhuInx+hHbRcKfaJGNDtf5oXbEoHd4ITJv0o509oghap6SZVsVGNTqTTfRGXRHLFE
 oN/w==
X-Gm-Message-State: AOAM533bQoiiSctAr45Gp9hFufDt2H5mcXawlMkU3ivoSaSqw5ePE2qy
 PoH1SwPjtXRZ2AWohUTMVSU=
X-Google-Smtp-Source: ABdhPJzHSLLbZkANpEOmJJt9ZjgNl/FuqEkna0HiGHGREYtwtMfcmNXWKWFJV4RAIPngKcmcRn/n6g==
X-Received: by 2002:a17:90a:e552:: with SMTP id
 ei18mr28228052pjb.239.1634309109171; 
 Fri, 15 Oct 2021 07:45:09 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:45:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 12/24] PCI: mvebu: Remove redundant error fabrication when
 device read fails
Date: Fri, 15 Oct 2021 20:08:53 +0530
Message-Id: <3d1ade234a33d6140497b396ca6d02eba06ba235.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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
 drivers/pci/controller/pci-mvebu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index ed13e81cd691..70a96af8cd2f 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -653,20 +653,16 @@ static int mvebu_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
 	int ret;
 
 	port = mvebu_pcie_find_port(pcie, bus, devfn);
-	if (!port) {
-		*val = 0xffffffff;
+	if (!port)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	/* Access the emulated PCI-to-PCI bridge */
 	if (bus->number == 0)
 		return pci_bridge_emul_conf_read(&port->bridge, where,
 						 size, val);
 
-	if (!mvebu_pcie_link_up(port)) {
-		*val = 0xffffffff;
+	if (!mvebu_pcie_link_up(port))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	/* Access the real PCIe interface */
 	ret = mvebu_pcie_hw_rd_conf(port, bus, devfn,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
