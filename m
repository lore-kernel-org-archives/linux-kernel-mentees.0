Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2D0C433F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3DA2072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLYogsEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3DA2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F407F2002A;
	Mon, 13 Jul 2020 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJpF6TK77RYE; Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 386B72288E;
	Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24604C08A8;
	Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D33D6C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C24AF88FFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxio46Nk9JWV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0C7288F86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:46 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id f12so17130317eja.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9eSzPhspiWvGf9aT6n+u7h1JAatvbzNtxDm7qgPwQa4=;
 b=hLYogsErj4MxDifEjs2yaWms0NpgUVako6c8lR/I2R4HV9RllrJIdGqkMDp5APeeDE
 oWeJOdnNhg7Ug/j0KkKHuaUJSEqiFCugiXFDKBKD08Rf4UCqkHYGXXTk09tPPdekReMl
 f/Z3N9TMpWpw2xAQtgdR8/N+9F0vAhXDYUe0EU/xGTl4W5zeIioGJduOy6lClM+Y6oFA
 xnjejrZ8kSmDHyZVOhAaPrgokXgExqfS+EI7cvM+Df1dhlImeqOdm4/lVR+HRcx5xHku
 Igf8N+NUygg5XttWH+kIcV9FL4bX+s92wGGITkFUVhBz34HIbR1LCVyWtNYcj0CfHCge
 ox9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9eSzPhspiWvGf9aT6n+u7h1JAatvbzNtxDm7qgPwQa4=;
 b=ES3bJGFIU/jxhYHJ1vTcXEdKv6HuXEIxsPMKwZrCCF7Knq29qyeeML92/2LJbS//EA
 Qp45JaB4MA0iH2yxOuhMd7tBauTK6/4zJHAibe/l1M20QoJCqfpNaaG1Qkd3hw/T9j9M
 XtJBxpksrsmnGZcoxjqzhlniJGS2y6U6orFchzaZUOsON/L5TPhbxSw+SpQcgoQlvhLx
 JEtrUWljUL+mWXiWsWG6qhbhtEt4ah9uhIhgV8W9hzQCh/BCejGUVM9dfRbQcdB8pZ3o
 XjnNof6v171IfMl5MqYmYZjn8UYs9uk3D7sQM0pok6703QNDQSFvxgw0cCWqOTdpTrFu
 tuig==
X-Gm-Message-State: AOAM532aFv83x++hMoeWhamJkRd87Ni0Ej1L4aHCk6clbMxC3aNuJft0
 i0WxX0LqCpGHS6XEHNwRTqU=
X-Google-Smtp-Source: ABdhPJyNhtJJphGqXF4QW+aGFKHkMsFvQ0ZrswEHN2+kh5oK7be5K3ZFffA96ErJ6GVjCF52Di2gmA==
X-Received: by 2002:a17:906:d143:: with SMTP id
 br3mr71266443ejb.268.1594646565435; 
 Mon, 13 Jul 2020 06:22:45 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:44 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Toan Le <toan@os.amperecomputing.com>, Jingoo Han <jingoohan1@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yue Wang <yue.wang@Amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 13 Jul 2020 14:22:18 +0200
Message-Id: <20200713122247.10985-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [RFC PATCH 06/35] PCI: Tidy Success/Failure
	checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 05/35

 drivers/pci/controller/dwc/pci-meson.c            | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 drivers/pci/controller/pci-xgene.c                | 3 +--
 drivers/pci/controller/pcie-altera.c              | 4 ++--
 drivers/pci/controller/pcie-iproc.c               | 2 +-
 drivers/pci/controller/pcie-rcar-host.c           | 4 ++--
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 58142f03d300..8203d5f95d28 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -390,7 +390,7 @@ static int meson_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
 	int ret;
 
 	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 7c97c54f787c..2dd3965365f6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -459,7 +459,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}
 
 	ret = dw_pcie_rd_own_conf(pp, PCI_HEADER_TYPE, 1, &hdr_type);
-	if (ret != 0) {
+	if (ret) {
 		dev_err(pci->dev, "Failed reading PCI_HEADER_TYPE cfg space reg (ret: 0x%x)\n",
 			ret);
 		ret = pcibios_err_to_errno(ret);
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index bf74f0a8b451..8d55cfc4ff8a 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -167,8 +167,7 @@ static int xgene_pcie_config_read32(struct pci_bus *bus, unsigned int devfn,
 {
 	struct xgene_pcie_port *port = pcie_bus_to_port(bus);
 
-	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val) !=
-	    0)
+	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 96f5bda32b58..9f7b12ad0c04 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -367,7 +367,7 @@ static int tlp_cfg_dword_write(struct altera_pcie *pcie, u8 bus, u32 devfn,
 						    value, false);
 
 	ret = pcie->pcie_data->ops->tlp_read_pkt(pcie, NULL);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	/*
@@ -453,7 +453,7 @@ static int _altera_pcie_cfg_read(struct altera_pcie *pcie, u8 busno,
 
 	ret = tlp_cfg_dword_read(pcie, busno, devfn,
 				 (where & ~DWORD_MASK), byte_en, &data);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	switch (size) {
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index dac9352c0cb2..d34c9457fbe4 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -584,7 +584,7 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 	/* root complex access */
 	if (busno == 0) {
 		ret = pci_generic_config_read32(bus, devfn, where, size, val);
-		if (ret == 0)
+		if (!ret)
 			iproc_pcie_fix_cap(pcie, where, val);
 
 		return ret;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 363a8630de28..2bb250c6f767 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -157,7 +157,7 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
 
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, val);
-	if (ret != 0) {
+	if (ret) {
 		*val = 0xffffffff;
 		return ret;
 	}
@@ -184,7 +184,7 @@ static int rcar_pcie_write_conf(struct pci_bus *bus, unsigned int devfn,
 
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, &data);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	dev_dbg(&bus->dev, "pcie-config-write: bus=%3d devfn=0x%04x where=0x%04x size=%d val=0x%08x\n",
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
