Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A734DC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7632220771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n80txyCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7632220771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5928623143;
	Mon, 13 Jul 2020 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 208ETeWYN3Vq; Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C1D962474E;
	Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B04E4C08A0;
	Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14473C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F079788AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbcdAVyD5TV2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 265C688C0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e22so13658590edq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8wbmK+ya6vHJSgI+MTiDhQKWZMMzmthLgMh2OY4MZvM=;
 b=n80txyCowMGw0agwpHO34CYMBjnaTUgBZm0NF31BEIRCoPc1JqzuQF5NChyyvnmjJv
 EUpvNZnOiq6UM7e6uY2eMEmBZq65ptv7RYBcTij58bTpkCJzq0njvYzGReCEwrmNV5RI
 5gtzm53oXNXlrL6ExBGPj0YysnmlxyLW4c9ytpXGynG/qwDZkUmE2y1FObO5mcUV0L/0
 wXMj7CkivYgSB0vhRcKAC9l7aIrh8DGiSAPr8YYTB/t+l2Pe9+0FjBbrXbqkKWATAoxQ
 Kl2j3veZd4XTP+PnTPMw3T8UA5mOfMyZf+oQlFVmZaEyzIH8DysrASAyAUCQ0M2aVWw3
 3lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8wbmK+ya6vHJSgI+MTiDhQKWZMMzmthLgMh2OY4MZvM=;
 b=a0aQRFLFRglpocKaFhztBssm50qXip1z/mWQpJ0fhYCvF+/NYdscOgk7BZvUdu6cU6
 A4ExmRgIq0xev3NOF9wGXGhWUPOB3/o1QMMjvzKWsLzTwftmN8sYWl/R8lX5yLL+cN5R
 vByk++BRrkq/v3KzPBQBpWXfydxBDb+/58MWEfFoWS+B7KDQkS5FhWT1rvxTB4zrDkq/
 H8FOc6g+Dpd0MjGRxTyFgwGD2CLxKRBt0jBnUx41dy0j9QTBm9xNgrxHxa78ySQxNrfF
 8O5NqRAxbXptxTU2F49feLV6oaW7R20A21EOCPVS8zdPZFkwIUzEFvBi9xUgLbmp72gS
 YPQQ==
X-Gm-Message-State: AOAM533jyC++vUSinM4g5X79hdGZBx8cVmzzaBLNNkieEjs2SimHdn9O
 Y3fRAvT5pWzRfShw/anZl+A=
X-Google-Smtp-Source: ABdhPJy+Hs7Ue1IFdlNyMdXk8xV3FtdPl2STdVdjCaLLSaMCCO1/ac6jRmx114IfgaO4SRqNDdJKtg==
X-Received: by 2002:a05:6402:1ca6:: with SMTP id
 cz6mr70531295edb.171.1594646598609; 
 Mon, 13 Jul 2020 06:23:18 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:18 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2020 14:22:43 +0200
Message-Id: <20200713122247.10985-32-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 31/35] m68k: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 arch/m68k/coldfire/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index 84eab0f5e00a..ecd11a19487a 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -64,7 +64,7 @@ static int mcf_pci_readconfig(struct pci_bus *bus, unsigned int devfn,
 
 	if (bus->number == 0) {
 		if (mcf_host_slot2sid[PCI_SLOT(devfn)] == 0)
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 	}
 
 	addr = mcf_mk_pcicar(bus->number, devfn, where);
@@ -86,7 +86,7 @@ static int mcf_pci_readconfig(struct pci_bus *bus, unsigned int devfn,
 
 	__raw_writel(0, PCICAR);
 	__raw_readl(PCICAR);
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int mcf_pci_writeconfig(struct pci_bus *bus, unsigned int devfn,
@@ -96,7 +96,7 @@ static int mcf_pci_writeconfig(struct pci_bus *bus, unsigned int devfn,
 
 	if (bus->number == 0) {
 		if (mcf_host_slot2sid[PCI_SLOT(devfn)] == 0)
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 	}
 
 	addr = mcf_mk_pcicar(bus->number, devfn, where);
@@ -118,7 +118,7 @@ static int mcf_pci_writeconfig(struct pci_bus *bus, unsigned int devfn,
 
 	__raw_writel(0, PCICAR);
 	__raw_readl(PCICAR);
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static struct pci_ops mcf_pci_ops = {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
