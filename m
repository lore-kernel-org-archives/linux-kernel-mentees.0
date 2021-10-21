Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AFAC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:12:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887416120C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 887416120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3744086B;
	Thu, 21 Oct 2021 15:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HE22y7Vicd_1; Thu, 21 Oct 2021 15:12:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 749C7407F7;
	Thu, 21 Oct 2021 15:12:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F118C001C;
	Thu, 21 Oct 2021 15:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F469C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2EE40868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hzp6qm1Myrvg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:12:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1C17407F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:12:34 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id f11so889114pfc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6PFmrQZfsZKbN43caoyPHUp+nOh1/rI/bPUZ2uC0hc=;
 b=cx5p5aIYC4iBC/rybqZ91xTecfYjNtHqUHOdXqzsxJDyMTRFonGrj9ly3a8JLr+Jqi
 FsOHOkaeHXKHoT2r6uMySNoymLbA9n6itWBwP5xcH3wVrVj/LDyOWDcAg0P7Hgb4MjYI
 gcJqzThpvQ1cJRP3ceL6aQw11A+KcLIBeVAbK97WFFofjPVyBGwkwoIS3mprp72yPkQx
 aZZ4VLEAhL9+Vr+lJjfnIobegCV0nF+Tyd+UFuRCuw1uka8pDyEf6pMpfKvPIVrEWy97
 mBxeBj5m3sLwbBHRQfDPJzz6dqRVB7VyUdyzisc8JXQ9jQ7GWSeLqc91ci5KZCIg+5o/
 Yycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6PFmrQZfsZKbN43caoyPHUp+nOh1/rI/bPUZ2uC0hc=;
 b=WahHhdhBPHSX5EEd3XikrhYOKoquqxjncmj83VSSkaOAS+PUbibDB2gKJIh0Z8HOon
 2n9H94rI59KXlzbtEBkOVVhM0rfmGowkp0gz5+BJCRTET1LOoVJ+RMPElQy3/6enALiW
 mNW/T3qSN8DKYyGxAivGrukHp+cU+A4VE2bJq0H9+URiI9vzHMcNTF4Gwdk667DZsvdW
 iAsT0xkBsGKApQ5g4pu1vStVcQon9p2PsIQVr3OHFVJuUV3NZJym8IUjImil5kDdXadT
 YhYkRRKDsq1iyU24gT4BVmLyXJ5osZS7rCk90Tg3LXpUQqvhEu7c/n9Pbg+gBM7QA1pN
 9YnQ==
X-Gm-Message-State: AOAM533RYk4mgE6KZo498RqyqIDhERqRF5ORqCcwL7s8wXLrByI3LtXT
 9RACkCpzVKr/IC/UiaNONDQ=
X-Google-Smtp-Source: ABdhPJxOw8KnEwKd2flVyMc4Jc2QOyKNOmOKWuKX5gVjXqvy+QZPzirbEwbZ/Pwfv3SywVvO16oIQg==
X-Received: by 2002:a62:84d5:0:b0:44d:7cf:e6dc with SMTP id
 k204-20020a6284d5000000b0044d07cfe6dcmr6453657pfd.12.1634829153838; 
 Thu, 21 Oct 2021 08:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:12:33 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 12/25] PCI: mvebu: Remove redundant error fabrication when
 device read fails
Date: Thu, 21 Oct 2021 20:37:37 +0530
Message-Id: <ec9bea12f3a1647dfae871083369ed95c1bb16eb.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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
