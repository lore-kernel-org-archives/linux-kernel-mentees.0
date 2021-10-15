Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180F3C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06FC60EE5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C06FC60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3EA40801;
	Fri, 15 Oct 2021 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-P9S3J2OhVP; Fri, 15 Oct 2021 14:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B1CC5407C5;
	Fri, 15 Oct 2021 14:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97E2EC000F;
	Fri, 15 Oct 2021 14:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D759FC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA79A607B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIOSpjnB3QHV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:47:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67E5960794
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:47:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id t184so7698768pfd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xcssxkZTlEueyseAvWLLQTd3E+oYkVw7Pd99PMykLI=;
 b=Iy+AonqojkrW8rKIV3iaCTVCXCGDTy7haLOxTS468QgbAhuk81NQIp7kYWZHskLo6s
 v8sCPrmS67ugEEigbj1fwjQdlU8RKGwOO/eUToxWh16fJjtH/QhnDiUGh0FhHudjtVx/
 coEpyt11LgRWe1SNGFFBvYZWHHPjeQjG5hOnqzu3Cr4OetheCAwq0JtAuDiWWAVj94tI
 uOjJnJyPXMyHjlxrzw/eNa6/zMYBiDOQ1GZaF0cBSSMAyJhDdFjnXvawtpTM/tYzX3Lh
 beQ3GoX5EjQwIB64IWMv93LWrndytwEQtQwba9QMabTYbWyrF0rHqfuGQlg1WEpBo22L
 X6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xcssxkZTlEueyseAvWLLQTd3E+oYkVw7Pd99PMykLI=;
 b=LdILZgH+HMdkhB8U+53AmDswoMvEOFztG7tDI9c78a/ZoSn45eEiigxXnpbItyrB9n
 Zsemu87DygvjxAw7OxxGRSSwepnE+lH5iPwLI3lXAQ/Vv/1/JFQALRdb4JcX74Qlssvg
 oA6Bf2owBVBmUPnuEzDCnNT2zecWXjK0ZCzn1vqmI19D8k2FE7nzEYzEOXpP78nc2DT1
 WselRXWPCANjLssOET3T0Hv0S0+Okr8NC5IkthHJfGShUKCuNaJG4jUbCGtCod0tHZ2J
 TCqZHYALWVJu5ADJU2oyEf1S5ghz68DlY78lcdKe/e8xXVrl/aSUi7kn2IQmoiGZFSyq
 5Czg==
X-Gm-Message-State: AOAM5311mLMzm4/BloHOd/to1YqUoUGtILxnkygC/iHyR8G2y47+sCa1
 97cki+mSVynolO4JIMXXUpQ=
X-Google-Smtp-Source: ABdhPJwi/McjAR5PneaBPmW4CRufrgJrhsRVQ8oeQWMqZvCjg+NqlGDu+MFUmairIcko2zay8NCKPw==
X-Received: by 2002:a63:e516:: with SMTP id r22mr9610343pgh.197.1634309224790; 
 Fri, 15 Oct 2021 07:47:04 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:47:04 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 24/24] PCI: xgene: Use PCI_ERROR_RESPONSE to specify
 hardware error
Date: Fri, 15 Oct 2021 20:09:05 +0530
Message-Id: <d5791e3697e6b78f0283c39dd58ba247a429d3c7.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Toan Le <toan@os.amperecomputing.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCI DRIVER FOR APPLIEDMICRO XGENE"
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

Include PCI_ERROR_RESPONSE along with 0xffffffff in the comment to
specify a hardware error. This makes finding where MMIO read error
occurs easier.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pci-xgene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index e64536047b65..4b10794e1ba1 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -176,10 +176,10 @@ static int xgene_pcie_config_read32(struct pci_bus *bus, unsigned int devfn,
 	 * Retry Status (CRS) logic: when CRS Software Visibility is
 	 * enabled and we read the Vendor and Device ID of a non-existent
 	 * device, the controller fabricates return data of 0xFFFF0001
-	 * ("device exists but is not ready") instead of 0xFFFFFFFF
-	 * ("device does not exist").  This causes the PCI core to retry
-	 * the read until it times out.  Avoid this by not claiming to
-	 * support CRS SV.
+	 * ("device exists but is not ready") instead of
+	 * 0xFFFFFFFF (PCI_ERROR_RESPONSE) ("device does not exist"). This causes
+	 * the PCI core to retry the read until it times out.
+	 * Avoid this by not claiming to support CRS SV.
 	 */
 	if (pci_is_root_bus(bus) && (port->version == XGENE_PCIE_IP_VER_1) &&
 	    ((where & ~0x3) == XGENE_V1_PCI_EXP_CAP + PCI_EXP_RTCTL))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
