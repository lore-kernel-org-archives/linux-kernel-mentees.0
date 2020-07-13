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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B33C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957E22067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmmxQ/aE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957E22067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8783388DAD;
	Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL7AOA55c1Ot; Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2494588E0D;
	Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 144B0C088E;
	Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CAD8C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C18587B00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ph13OD41CG7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CA99868E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:16 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z17so14273728edr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iiHt01yExxr+UGjzI6XflZ+uDY4MKkRXHZbIPXDUuRY=;
 b=HmmxQ/aEsuwnYmu7uvp6iPKhOMZAIHMXP42//F908Nkqa4MLYdR6vM0f8CaAYqWowF
 cmLlcXg6JpO6pxfq/D/zt1YR+ZwGTV4syUfrH+YTz6B1Fs4vVUcsGP19zyzOASXLQlmZ
 qTKgzZNYZoquze0LtCBNYu9CdDrzkE2u3ekNQis8W69z1bxrl9hJzhzv1GepBQWS873d
 gw2++hMdnjYAB3HOhDaTO0eEJ/h40zjf9peBORLPHgXxyloTyKyiPqbw9YGSUU9NprrK
 bMu4dxYW7BLe+/eTe3hwCtah6QY+qHfien1FLHGr9zVADP/vvGBpx56b4RcfHUG+cyQ5
 6/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iiHt01yExxr+UGjzI6XflZ+uDY4MKkRXHZbIPXDUuRY=;
 b=PwOv4RTFPy6efeFH4McNCjaKW8z7a3gPyxH5KLa5iJ2V2g1WXvXqfZAEWTv9yJYFAY
 gaSHvNUNCkMEZocwEq0NRXfPCJ+R750xXp/PCuuF88Rknihi7GSXKJAXI3aE4FzKfGd5
 hCt0MVdAV6i8V1wpw/xt3yobVMBDxiw42E33AoSJ3+WyHwqs6K/BBWN5r3oEml852SrO
 L/AqrdpDMrCcn0x/3118bLm8GiYnFitxYIkgOVxp4Loay7P32kj/hmgaksFP7xJQ/q7W
 m8Qhz5Xn8VsgBKNfmwIhTmJBHblFBCmmRLEx4ilarPOnCWoPFtwgVHepdsksnzpnqUZ4
 pzqA==
X-Gm-Message-State: AOAM533/DYk4kP7wNZKgyVdKLk+xsVuUut10v1mNxRrUkd5bgIESZk0D
 ruAR6bS34SvlJvkKfsFYHT0=
X-Google-Smtp-Source: ABdhPJz2hbS/YAxk7ynpXEBxv0L7UVNCdcghPyy01UrXKtCfUacUfQIn8EVUfGf1smzuZiWEtLdarg==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr348700edb.228.1594659314697; 
 Mon, 13 Jul 2020 09:55:14 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id w3sm11838938edq.65.2020.07.13.09.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:55:14 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: skhan@linuxfoundation.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Mon, 13 Jul 2020 19:55:28 +0200
Message-Id: <20200713175529.29715-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713175529.29715-1-refactormyself@gmail.com>
References: <20200713175529.29715-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 8/14 v3] PCI/ACPI: Check the return
	value of pcie_capability_read_*()
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

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0.
However, with Patch 14/14, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x). 

This bug can be avoided if the return value of pcie_capability_read_word
is checked to confirm success.

Check the return value of pcie_capability_read_word() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pci-acpi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 7224b1e5f2a8..39eb816bc3b8 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -248,12 +248,13 @@ static bool pcie_root_rcb_set(struct pci_dev *dev)
 {
 	struct pci_dev *rp = pcie_find_root_port(dev);
 	u16 lnkctl;
+	int ret;
 
 	if (!rp)
 		return false;
 
-	pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
-	if (lnkctl & PCI_EXP_LNKCTL_RCB)
+	ret = pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
+	if (!ret && (lnkctl & PCI_EXP_LNKCTL_RCB))
 		return true;
 
 	return false;
@@ -792,12 +793,13 @@ bool pciehp_is_native(struct pci_dev *bridge)
 {
 	const struct pci_host_bridge *host;
 	u32 slot_cap;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_HOTPLUG_PCI_PCIE))
 		return false;
 
-	pcie_capability_read_dword(bridge, PCI_EXP_SLTCAP, &slot_cap);
-	if (!(slot_cap & PCI_EXP_SLTCAP_HPC))
+	ret = pcie_capability_read_dword(bridge, PCI_EXP_SLTCAP, &slot_cap);
+	if (ret || !(slot_cap & PCI_EXP_SLTCAP_HPC))
 		return false;
 
 	if (pcie_ports_native)
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
