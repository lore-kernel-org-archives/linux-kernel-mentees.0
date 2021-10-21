Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BBFC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DC660F9F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22DC660F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3C72406F1;
	Thu, 21 Oct 2021 15:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m23di8FYV7xI; Thu, 21 Oct 2021 15:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D927340017;
	Thu, 21 Oct 2021 15:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B67BAC001C;
	Thu, 21 Oct 2021 15:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24A67C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072EE60F0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhDzc9NDsyhA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DC7460628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:07 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so768088pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWK0fPhiFvF9dyvSZCI83CRyKYd+k4snQIY5xhFTQVg=;
 b=WVXnrDKpBkRsnqHYlJch8EoBuAARA9XFKQRF8x5Gv2wL29rXOafMDIpA+eBkyyok3P
 pB8vJ5wNh6f9MspxxjVwvnd1HTtHhrWk3mlEPGBSPWVyBOM06eJ7OAJF1+tkAjZU+lS+
 +SpXqolra9sbekn0GqO3G6PGYsC5+AVtxGw6qsmph82e+9QLdwCpN31nrKOu8/EpDF9V
 G1H0T7a1bRArKt8zlqOAOW5k3o/V4qAI38QvnJcrqacJ/KgiSv3YLYFh8wnp4VqVcwQW
 VBeFQAxA01rwlWu9wcQF9JGj2qMvx3opSdu7VoceIRt1vj0WzqSoEATbWK95nm+xWxpX
 9ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWK0fPhiFvF9dyvSZCI83CRyKYd+k4snQIY5xhFTQVg=;
 b=TgcvZfL1Jiu5uZ2T19JAh3V6oL7OerG+i7gJbtiEGN4y106vMNuOk9Bl9AkzrlH9ga
 mb19LdkvVke9Q0YWMC01xakm3iKIfwhhXwfRa7CkZ8cJGwv/ThQ4AEjyrChWbiu/OVKj
 l6C7bzN8sNIcw9b3khsAN1AsoZjsmGqxGPqYnWIFREWbUWYW/PRhwCfkASFe8mLSA21b
 Xc8AvkCZESxEpby96MAD5oi74ChB9BN8tW4ULXAhlSK4Wb6bF6iQ+P1AszD59CExYupA
 rJsTIb3lY1TnGOwdh/lErdoYmvUCc/L9D6TXqZfcLdGrtl+VUOjwkx0i5mPga295jW9X
 p3uA==
X-Gm-Message-State: AOAM5337RJnORCSLZZhv5c8P2/1F7oyncEJhCoDbr0EHIAUeLpXvOC47
 eBsWBo9HX7tm3R+1yJWalF4=
X-Google-Smtp-Source: ABdhPJyGJ4astve2/4iTWtMqGX88sDxmNxOV3i/wr3/3IzZRoR/OJj+5bCEstpuFYEt72kulysyHng==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr7318159pjb.7.1634829186527; 
 Thu, 21 Oct 2021 08:13:06 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:13:06 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 14/25] PCI: rcar: Remove redundant error fabrication when
 device read fails
Date: Thu, 21 Oct 2021 20:37:39 +0530
Message-Id: <29e534503de9502e4a30a1cb970f72c20243cc7e.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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
index 8f3131844e77..1324cb984ed5 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -161,10 +161,8 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
 
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
