Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477B4C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:02:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0428A60C4A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0428A60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13E86089A;
	Mon, 11 Oct 2021 18:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hdg29B9WkWg; Mon, 11 Oct 2021 18:02:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E4588605B0;
	Mon, 11 Oct 2021 18:02:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4C13C000F;
	Mon, 11 Oct 2021 18:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90075C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D72240383
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2KAOf8Z9zHO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E522540378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:02:34 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t11so11815492plq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKejBUXkQbFhZRkUnaq6l+1PH6Sz7FGa86StL/2yA7g=;
 b=N5/LXxrSPtzTlFWoWqamkfy3kBLnmyFDVScezpSJYyRD5QcCvn200Fka9H6+0+VOf3
 tTt0MhVGZvd3lwaRHStu6TWmWzOPb/cJ0DKkEUpXKibbZYnzKQy+6ysbfPK8eFtCLACm
 vtuV2H5LbuSFYwwM38d11WDwE/jgeMM4amuYYBpGDm8YNv5uG1UIfA+soSCXntepKaLN
 XZBB7jDW683ieY6/vdNS3TIcUiHnwB2Uw+r5zET7NijjiLOn0i47biNT1i1RtWrnes/j
 yVg9u7JK8BJY7Y8PGKtz4x8g2XLeMrV/X08n5CHDCCfCVFiHRBJTmxO5PxMuYw+17lPu
 JeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKejBUXkQbFhZRkUnaq6l+1PH6Sz7FGa86StL/2yA7g=;
 b=ASFNkzo0aoOQQoRcyA8jBK6kgTlCr1UQNiIwv9Ob067PkYfCE3TB84mvVkfNtwQ2Fn
 HUc28rwKvtki8WAKF4NS07qUSzee5LDejmTTpykUMlBhXs9neMwCuJ5DlfeCB+TTeV/O
 yVtK8yeNCYOIQ0Hze1x46TScS1LnMJnjStPTwq+kVqWwN0l1w9QQsAIyqXdCuzXol1FX
 CvMb/a9mLUprounz6Im6k7yZnMqaq7lZ2aReAB+0+i6/oJCSi1iHr6p49mb97pb48a5Z
 vtD9PCXzddYc4lVwjuquYTD3tta2OdqZw4boN0Y3C9ZHb/oHmL9C7yliv4PnnPg7y2M7
 2b7A==
X-Gm-Message-State: AOAM530ecquf054t7Q36YBE508zs3Uy0LsE//IkD+K6OU1h5P2BLQ1YM
 yzBykAKxlQLQVarIswPEht4=
X-Google-Smtp-Source: ABdhPJz3lTB1pRJC7LeANbY1RFJS7aAmpd27So5fwNvaM/OYQkGoVvaRsE4e7b1VyseJvPswRSBjDw==
X-Received: by 2002:a17:90b:390b:: with SMTP id
 ob11mr471890pjb.145.1633975354253; 
 Mon, 11 Oct 2021 11:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 t9sm120679pjm.36.2021.10.11.11.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:02:33 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 12/22] PCI: rcar: Use SET_PCI_ERROR_RESPONSE() when device not
 found
Date: Mon, 11 Oct 2021 23:32:06 +0530
Message-Id: <f7227e04a56e83c0a68db96b35194dddd7386a90.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-rcar-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 8f3131844e77..80dbc6f717d6 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -162,7 +162,7 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, val);
 	if (ret != PCIBIOS_SUCCESSFUL) {
-		*val = 0xffffffff;
+		SET_PCI_ERROR_RESPONSE(val);
 		return ret;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
