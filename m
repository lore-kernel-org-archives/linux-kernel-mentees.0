Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06039C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C298360F46
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C298360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A215340725;
	Thu, 21 Oct 2021 15:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhLAKykN8GF2; Thu, 21 Oct 2021 15:15:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 90EDB40017;
	Thu, 21 Oct 2021 15:15:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF08C001C;
	Thu, 21 Oct 2021 15:15:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BAA1C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D3D560F01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIwLShk8TXLd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C6B560EE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:15:21 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id om14so722940pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD7r2JlbysI9wliPfrkuC0MHY1rENRMFz+j1vzlStHM=;
 b=oDFCNSD9eXmglDMVHyAk5MQTQay51LCLoU0OKnLVLIJ7VZjwfRS43u720yBteKnac1
 p/lwD3xlqwhz6jgJCIyEpcwG0woAnh4SPlq3ehA2Dp6roi1MizNQvP9UmKO5XmzgzXHh
 Yo8hCUXDbYf/vLOy2UTggbqD86Qs6k+rvdXbbW3GQfeNrWG8QOThYpWh1j/EefuDhdpi
 GYRjhfePIpEwov/eAxotQJb+gVbAmx0u3U/6QuWyGHc0mWmlXKvy0suP20VFDVbzyuvO
 8JtlUB+qUtIMOvvnBRXJARMpbYmbSTgNllBbT2hj5UdRBE7T3jLTou7IG+zlJdFAJ+xS
 Kx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CD7r2JlbysI9wliPfrkuC0MHY1rENRMFz+j1vzlStHM=;
 b=QuG0KJCmbMTGqmw7tyBfBH/XWMLG6u7RZ0O46AqHmizy+DaRc2G5CLYnGcEXT2UOcB
 lL5RE11UGGdWcF63Fq6DtDSnU+umLdgGxUnTH8kWWTG5BqvaTwiKfDrEmwGZfO/g6Icf
 dVGRzl6WrKShRDpJk52uLR7WVkmdBV+0Kw0pB0dBGQRIgVgEWaoZhgm2mDktiCL8gKPG
 gzJKHATQLC7XTrxRfyNEMmOpEHGyd4t8c/M8rUlBnj/B+G+RXC45vKs+/UxRWjlKNXSX
 vJhQ+qzt5J/8qThI8wxm7htXekWq5+kdGMT9M9ip1pQLCSoOywJu1OFCC90YHBpHR5z0
 0dAw==
X-Gm-Message-State: AOAM5326Pt55B5+686kOeNCuwDl6hgEi+y2lhUV4iLJInnlITGDioev2
 P7i6KBQC8/4A2KXjrnP3nuY=
X-Google-Smtp-Source: ABdhPJxDplYpiJvMYFKBibWwNfI1+QoLMtVL4HB+4mcg+FH8MsrUv331eHciak5L7Kjd2dDJhW/DZw==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr7333076pjb.7.1634829320924; 
 Thu, 21 Oct 2021 08:15:20 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:15:20 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 25/25] PCI: xgene: Use PCI_ERROR_RESPONSE to specify
 hardware error
Date: Thu, 21 Oct 2021 20:37:50 +0530
Message-Id: <4a5e5a4625a3259e20e70f73ce9c294b695cfdde.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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
specify a hardware error. This makes MMIO read errors easier to find.

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
