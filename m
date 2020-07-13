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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADC3C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA7220773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA2Advwg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA7220773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D89C891BC;
	Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wj0RCnDsGMLt; Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AEA38915B;
	Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37C1AC0888;
	Mon, 13 Jul 2020 13:23:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6578C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A1EB188C73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMi-7E6zZ0fo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 976C388B48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:17 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id l12so17130886ejn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=srnOr+oWrll92VFUDRSxv+y9DkOgl2yMHs+bARSxTtw=;
 b=hA2Advwg9sPYlSG9PVyUZ2WxXF2yoKE51xpWubaLGvH0fSblpcRpOX7e6gGzjKV04x
 PMFVOsT0MkAAWHx/FNBm7u+ko/ASFkGJxc26fYHAg1vB6uPjWj33Ye1n4cHZrpXXbaRx
 nhZM8JRv3BAsf3daoqySITIQioWtOixUOHScO7N/T+1fau8RNPEchPtffv6+cIY97p0A
 eAJh12CTy0jakb/slMUfM+jjHRINUVVY3p9U6FLZ1gVHvv7eFB+K1zWa5We3M/VrwWjy
 YYy9yms4BEUIE0AFFnl6IE4d3AA4Egtge7EmhM4QLUcjfFMwcjEwHeibMNPRKjAO2aqm
 rosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=srnOr+oWrll92VFUDRSxv+y9DkOgl2yMHs+bARSxTtw=;
 b=GjpHy46CKiIQmFa33xH89Wq/uSqXCBe+4s0fmDhwjVH6dtJa0Fe+wGHin3nJM9wAus
 YOwFLCQqtbXkGnaNi82Rfn5eMqPDhCZ1z1Ck9UswDAZpU3r8tyQaIXBM9DCh3Qn7T+4a
 O9iNrVpU5J2f0B42tjIK2b7ZtsT/DWM4TWQzJ8IqrD36vNsaAnkORDJIx5LAtANzzK9k
 viIV2h0SMMAZlMSL1LS5RxltMgI/YADtDPnc+3TLtdRPKq9OQl13SFOksSZIt1xCTItk
 1aSAWD3ibX1TPe0RDT3IW6aTQrJgjypgqhOcInX5TWV+LCNKIQKKkNT5iOPXaKTFb/fJ
 RsAQ==
X-Gm-Message-State: AOAM530ymrKjzThrrBuCWlFvrQEvCm2kJ3F+fzJQb3ZhA83dx4UQ9YkZ
 IyrXzrKvnq+6lu8n3cd/MF8=
X-Google-Smtp-Source: ABdhPJzvG9XEXrWjvWtZEu7yzcF9rZLh2zOC+Ra/3eYp8pyZIsCiFH715AqPn92Kt0ycrF58CyNztg==
X-Received: by 2002:a17:906:743:: with SMTP id
 z3mr9388063ejb.216.1594646596068; 
 Mon, 13 Jul 2020 06:23:16 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:15 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Mon, 13 Jul 2020 14:22:41 +0200
Message-Id: <20200713122247.10985-30-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 29/35] mips: Tidy Success/Failure
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
This patch depends on PATCH 28/35

 arch/mips/pci/ops-bcm63xx.c  | 2 +-
 arch/mips/pci/pci-ar2315.c   | 5 ++---
 arch/mips/txx9/generic/pci.c | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/pci/ops-bcm63xx.c b/arch/mips/pci/ops-bcm63xx.c
index 3e88e4869f37..f2810af4fa24 100644
--- a/arch/mips/pci/ops-bcm63xx.c
+++ b/arch/mips/pci/ops-bcm63xx.c
@@ -295,7 +295,7 @@ static int fake_cb_bridge_write(int where, int size, u32 val)
 	int ret;
 
 	ret = fake_cb_bridge_read((where & ~0x3), 4, &data);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	data = preprocess_write(data, val, where, size);
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index 2268b63d20e8..c2b9e62fbc18 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -259,8 +259,7 @@ static int ar2315_pci_cfg_access(struct ar2315_pci_ctrl *apc, unsigned devfn,
 	ar2315_pci_reg_mask(apc, AR2315_PCI_MISC_CONFIG, AR2315_PCIMISC_CFG_SEL,
 			    0);
 
-	return isr & AR2315_PCI_INT_ABORT ? PCIBIOS_DEVICE_NOT_FOUND :
-					    0;
+	return isr & AR2315_PCI_INT_ABORT ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static inline int ar2315_pci_local_cfg_rd(struct ar2315_pci_ctrl *apc,
@@ -311,7 +310,7 @@ static int ar2315_pci_host_setup(struct ar2315_pci_ctrl *apc)
 	u32 id;
 
 	res = ar2315_pci_local_cfg_rd(apc, devfn, PCI_VENDOR_ID, &id);
-	if (res != 0 || id != AR2315_PCI_HOST_DEVID)
+	if (res || id != AR2315_PCI_HOST_DEVID)
 		return -ENODEV;
 
 	/* Program MBARs */
diff --git a/arch/mips/txx9/generic/pci.c b/arch/mips/txx9/generic/pci.c
index bdff45b6b57d..9da38f8fa036 100644
--- a/arch/mips/txx9/generic/pci.c
+++ b/arch/mips/txx9/generic/pci.c
@@ -61,8 +61,7 @@ int __init txx9_pci66_check(struct pci_controller *hose, int top_bus,
 		if (PCI_FUNC(pci_devfn))
 			continue;
 		if (early_read_config_word(hose, top_bus, current_bus,
-					   pci_devfn, PCI_VENDOR_ID, &vid) !=
-		    0)
+					   pci_devfn, PCI_VENDOR_ID, &vid))
 			continue;
 		if (vid == 0xffff)
 			continue;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
