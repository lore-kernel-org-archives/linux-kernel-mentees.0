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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ACAC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5430E206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uC7eUgOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5430E206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 333CB88B30;
	Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZUrlh0DBVj1; Mon, 13 Jul 2020 13:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 598B188A60;
	Mon, 13 Jul 2020 13:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 439F6C0888;
	Mon, 13 Jul 2020 13:22:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1BF8C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C170F88F86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGD25Kvp063N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6AB488FFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:49 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w6so17135112ejq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JxkhZKsVa3z0BZ63RYkimychYt6uFQAMZoAlbu2p1Uc=;
 b=uC7eUgOb2feCtchst56uIJDoHC7Zp0WbIbUpDeyGVdCSd48ogNAOs+i/m80OEKDeCs
 ADgZl3lhhpSNHIWQnegJlNV99b/4+TGh/P7sM64Y/Ecfz6rqENwBHiqMykLoTfMaRpr+
 SHEuVinXAErkPrzitCk/MmluTDwDhO+LJSKvrg1WNDYN9CwIWl8FGkSBBLIEM8fX3aFM
 D/s10PtX/fX7fack2CoJXPcHsIk7veCSbpQBCVkoJv2/L8SK2+hdR0j2/BT0FtlqFF/U
 KqkW/Um6gUJU5OT5KTc6/r6IEe4MYQeg4BlQ2Zy1Cytx/D5/oTvzdvWNHEk0hAqLZtvn
 oZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JxkhZKsVa3z0BZ63RYkimychYt6uFQAMZoAlbu2p1Uc=;
 b=MzpsjcUitsJ4Uw1SPuZmGvOHi97OSu+WGNYDlKxyFYei8LMmqFda4pO+BZ27vYTlrg
 H5d1ibeQYswQrgfFXc0kzwldBmXxQJlFzK3xlK2W5/Oi+ZqY/7FseDkog4+3U8KvDNUe
 OdgTjkakJQf1HR0wBDGfGYIRM8r/nE+JFtOo1ZR90oFwYFM6I0UTY/hkndkD7OJrqhVT
 bMDz1UlrmGnMrFCaJYTWILJ3CYDx2KzQOn2SoHsQVr1Fu5zLma/Sy5tmAbFxDnFapx1w
 w7Z9hRyB/CCIuYcW5hDfbpYmK1r+zMnA3zIB8s/dBnT0fMN1qiJ1MSMZsbeF6BHoZAAi
 JciA==
X-Gm-Message-State: AOAM532JaO1u9swnwBeI9bN46mTb2AtErxPQbIkjmgBqIL95wfl/zVge
 atjbnuFIphkhbh8QPEXMi6A=
X-Google-Smtp-Source: ABdhPJyvEFGOBAm5twEHyZqvV5SIe2iQDHFq46CgDrJch/0w7R2T3iioA0rmv9hum6shYaVHNjLYpw==
X-Received: by 2002:a17:906:fa9a:: with SMTP id
 lt26mr63653165ejb.502.1594646568296; 
 Mon, 13 Jul 2020 06:22:48 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:47 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon, 13 Jul 2020 14:22:20 +0200
Message-Id: <20200713122247.10985-9-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 08/35] PCI: Tidy Success/Failure
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
This patch depends on PATCH 07/35

 drivers/pci/pci-bridge-emul.c      | 2 +-
 drivers/pci/pci.c                  | 8 ++++----
 drivers/pci/pcie/bw_notification.c | 4 ++--
 drivers/pci/probe.c                | 4 ++--
 drivers/pci/quirks.c               | 4 ++--
 drivers/pci/syscall.c              | 8 ++++----
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pci-bridge-emul.c b/drivers/pci/pci-bridge-emul.c
index 9695c453e197..c270c18d5cf5 100644
--- a/drivers/pci/pci-bridge-emul.c
+++ b/drivers/pci/pci-bridge-emul.c
@@ -400,7 +400,7 @@ int pci_bridge_emul_conf_write(struct pci_bridge_emul *bridge, int where,
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	ret = pci_bridge_emul_conf_read(bridge, reg, 4, &old);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	if (bridge->has_pcie && reg >= PCI_CAP_PCIE_START) {
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a74547861d5e..4b2a348576cb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -185,7 +185,7 @@ int pci_status_get_and_clear_errors(struct pci_dev *pdev)
 	int ret;
 
 	ret = pci_read_config_word(pdev, PCI_STATUS, &status);
-	if (ret != 0)
+	if (ret)
 		return -EIO;
 
 	status &= PCI_STATUS_ERROR_BITS;
@@ -534,7 +534,7 @@ int pci_find_next_ext_capability(struct pci_dev *dev, int start, int cap)
 	if (start)
 		pos = start;
 
-	if (pci_read_config_dword(dev, pos, &header) != 0)
+	if (pci_read_config_dword(dev, pos, &header))
 		return 0;
 
 	/*
@@ -552,7 +552,7 @@ int pci_find_next_ext_capability(struct pci_dev *dev, int start, int cap)
 		if (pos < PCI_CFG_SPACE_SIZE)
 			break;
 
-		if (pci_read_config_dword(dev, pos, &header) != 0)
+		if (pci_read_config_dword(dev, pos, &header))
 			break;
 	}
 
@@ -628,7 +628,7 @@ static int __pci_find_next_ht_cap(struct pci_dev *dev, int pos, int ht_cap)
 				      PCI_CAP_ID_HT, &ttl);
 	while (pos) {
 		rc = pci_read_config_byte(dev, pos + 3, &cap);
-		if (rc != 0)
+		if (rc)
 			return 0;
 
 		if ((cap & mask) == ht_cap)
diff --git a/drivers/pci/pcie/bw_notification.c b/drivers/pci/pcie/bw_notification.c
index c7201d886026..f62c19ffedfc 100644
--- a/drivers/pci/pcie/bw_notification.c
+++ b/drivers/pci/pcie/bw_notification.c
@@ -23,7 +23,7 @@ static bool pcie_link_bandwidth_notification_supported(struct pci_dev *dev)
 	u32 lnk_cap;
 
 	ret = pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnk_cap);
-	return (ret == 0) && (lnk_cap & PCI_EXP_LNKCAP_LBNC);
+	return (!ret) && (lnk_cap & PCI_EXP_LNKCAP_LBNC);
 }
 
 static void pcie_enable_link_bandwidth_notification(struct pci_dev *dev)
@@ -56,7 +56,7 @@ static irqreturn_t pcie_bw_notification_irq(int irq, void *context)
 	ret = pcie_capability_read_word(port, PCI_EXP_LNKSTA, &link_status);
 	events = link_status & PCI_EXP_LNKSTA_LBMS;
 
-	if (ret != 0 || !events)
+	if (ret || !events)
 		return IRQ_NONE;
 
 	pcie_capability_write_word(port, PCI_EXP_LNKSTA, events);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ab7e19882b30..60ecebbc7dcf 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1582,7 +1582,7 @@ static bool pci_ext_cfg_is_aliased(struct pci_dev *dev)
 
 	for (pos = PCI_CFG_SPACE_SIZE;
 	     pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE) {
-		if (pci_read_config_dword(dev, pos, &tmp) != 0
+		if (pci_read_config_dword(dev, pos, &tmp)
 		    || header != tmp)
 			return false;
 	}
@@ -1609,7 +1609,7 @@ static int pci_cfg_space_size_ext(struct pci_dev *dev)
 	u32 status;
 	int pos = PCI_CFG_SPACE_SIZE;
 
-	if (pci_read_config_dword(dev, pos, &status) != 0)
+	if (pci_read_config_dword(dev, pos, &status))
 		return PCI_CFG_SPACE_SIZE;
 	if (status == 0xffffffff || pci_ext_cfg_is_aliased(dev))
 		return PCI_CFG_SPACE_SIZE;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index e60ef8abd698..8b69d6ebb619 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5116,8 +5116,8 @@ static void quirk_intel_qat_vf_cap(struct pci_dev *pdev)
 		pdev->pcie_mpss = reg16 & PCI_EXP_DEVCAP_PAYLOAD;
 
 		pdev->cfg_size = PCI_CFG_SPACE_EXP_SIZE;
-		if (pci_read_config_dword(pdev, PCI_CFG_SPACE_SIZE, &status) !=
-		    0 || (status == 0xffffffff))
+		if (pci_read_config_dword(pdev, PCI_CFG_SPACE_SIZE, &status)
+		     || (status == 0xffffffff))
 			pdev->cfg_size = PCI_CFG_SPACE_SIZE;
 
 		if (pci_find_saved_cap(pdev, PCI_CAP_ID_EXP))
diff --git a/drivers/pci/syscall.c b/drivers/pci/syscall.c
index 7d45b58beacd..a208700000ea 100644
--- a/drivers/pci/syscall.c
+++ b/drivers/pci/syscall.c
@@ -46,7 +46,7 @@ SYSCALL_DEFINE5(pciconfig_read, unsigned long, bus, unsigned long, dfn,
 	}
 
 	err = -EIO;
-	if (cfg_ret != 0)
+	if (cfg_ret)
 		goto error;
 
 	switch (len) {
@@ -105,7 +105,7 @@ SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
 		if (err)
 			break;
 		err = pci_user_write_config_byte(dev, off, byte);
-		if (err != 0)
+		if (err)
 			err = -EIO;
 		break;
 
@@ -114,7 +114,7 @@ SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
 		if (err)
 			break;
 		err = pci_user_write_config_word(dev, off, word);
-		if (err != 0)
+		if (err)
 			err = -EIO;
 		break;
 
@@ -123,7 +123,7 @@ SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
 		if (err)
 			break;
 		err = pci_user_write_config_dword(dev, off, dword);
-		if (err != 0)
+		if (err)
 			err = -EIO;
 		break;
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
