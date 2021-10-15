Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6357CC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2287261041
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2287261041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBEFA407C5;
	Fri, 15 Oct 2021 14:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfQMOF2gSzVQ; Fri, 15 Oct 2021 14:45:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 15D3A40537;
	Fri, 15 Oct 2021 14:45:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9B0AC000F;
	Fri, 15 Oct 2021 14:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFA1FC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E5040586
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idYoUzQh7Dye
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9047C4011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:35 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id g5so6552509plg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4G4Yffk64HxtbjZzw9/E8PSnsLTvUujtQvSwE3J4gU=;
 b=flHW2Jb/AbysBVvJNNr6JwH4MLrEHqIfdfTJWIOUpBUFJwLO86Ww3lJYUN7rYZqGJh
 I/lLA1GbwqNXEqeL89Z3FnLGzNne+/JrIebWPKmh9G+HFumicXJhgPMP/FcWxH3Qo12+
 Q0ZxbrKvgId5wRbJMk7X2tyZjOWKJ1dQkwD56X7y0ajeoKXdAStXPcstCBSbsF4aWum2
 zF22ZFS6E/jaZgCPFP68wJmWfS9nwNR3Mf74lov/0SXtOEeA6Pe3kS0PlgMvknpXbjei
 UoH4eIy6X67PmTd7h87bfKgIgkE3H+Tq1rJ5p5b5NVrQLGDERDaJut6pmY8fSOHCLf0a
 bQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4G4Yffk64HxtbjZzw9/E8PSnsLTvUujtQvSwE3J4gU=;
 b=WvCQnChPixMi+zkJDQBOS0kEZmoHq2pnQzox7ISyZcCNtw64Xy8RtuGcVPCnfV53hy
 QRW1ATn0zgvRL1sE+5Sxvxo0aF8tW6d7OFwA+kJwtiUw4N0dXl/ySKOtgao0IM8X1Q/v
 30iScZ+YZZEve+yOUF0sK8a+mk/G+SijoCgMe7E+sLkmlicDGJ0y5XP3qQU+ddtyqOeI
 K58A/n6DCdmQL/hkqyuoiI1PT5A8Hh1dPvAZLYIalavSKtXhs/Cd9+uk5/0sq3+J+MER
 M3cpl/ZQw1y9qT+Yol6dkvStRmHD/70SEl4ZBm6taLwXT5dpfJ54eWbz1KE3edi1kSp1
 F/FQ==
X-Gm-Message-State: AOAM532w+3Fl/6e1UlX52AankcmeGkkgoAyb9ZHQvAVTDnXb0PT/CNaL
 XDorTKG3+HZmQV6vZa+3REc=
X-Google-Smtp-Source: ABdhPJzyBRhAH58hfG57hRWt1brI24x/g9MveoCJoOB1DDAWMEjJsf6dfeFJ3flcCuWG22yuJmFJEg==
X-Received: by 2002:a17:90b:38c6:: with SMTP id
 nn6mr13976286pjb.206.1634309134963; 
 Fri, 15 Oct 2021 07:45:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:45:34 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 15/24] PCI: rockchip: Remove redundant error fabrication
 when device read fails
Date: Fri, 15 Oct 2021 20:08:56 +0530
Message-Id: <4fe27c1af8b43e87c2eaf31fced8015b81478c8f.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 linux-kernel@vger.kernel.org,
 "open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:ARM/Rockchip SoC support"
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
 drivers/pci/controller/pcie-rockchip-host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index c52316d0bfd2..45a28880f322 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -221,10 +221,8 @@ static int rockchip_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
 {
 	struct rockchip_pcie *rockchip = bus->sysdata;
 
-	if (!rockchip_pcie_valid_device(rockchip, bus, PCI_SLOT(devfn))) {
-		*val = 0xffffffff;
+	if (!rockchip_pcie_valid_device(rockchip, bus, PCI_SLOT(devfn)))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	if (pci_is_root_bus(bus))
 		return rockchip_pcie_rd_own_conf(rockchip, where, size, val);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
