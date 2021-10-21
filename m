Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4E1C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385E460F46
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 385E460F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181B683B61;
	Thu, 21 Oct 2021 15:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Fyv9AJmTIqH; Thu, 21 Oct 2021 15:13:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2195683AFB;
	Thu, 21 Oct 2021 15:13:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3746C001C;
	Thu, 21 Oct 2021 15:13:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B689C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C1A40725
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tult8LgJHu03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ADB240017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:17 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q5so591589pgr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LKQ8LDQCLH6CNvMc2EuzCtN+mwerjwkO6CrMvPuNtM=;
 b=oCM89KnePSBKcy6kffqfID2nl/IafVElh379aYNbnhSVPjR/XU8OAJmQGIsU1XiOsM
 Pc8vcBL8x0zsObp9BqaJut35pC5eqUIZTdw/ZkMv0oULb4PgYl/twh3esle884EXCvpj
 zXe7Jir243mgAfmy0RbhQpuCzePGsE25KGsTYlnNxmGImKUyywSdQB6gEZZUEPQQGEVf
 xAAJUIeSZGwEikgZR09/wVbUNzJuoSKof+ogQhnqaJ+Dq65ndV5jxg2/SAB9tneEVKLf
 ZG5zjxKNZplXTQRWdr68P2CR2s4APH6S9zX2Aaqc2zOyqd+EXXDnWUdPgaQjg49Qx8SB
 Pp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LKQ8LDQCLH6CNvMc2EuzCtN+mwerjwkO6CrMvPuNtM=;
 b=SfS3Z21uhJ4cUHkzcy4y4Ts6hnnaJx5GHQCg3s6Bm3yiSXnuk45DqCsnGMa7jThz/m
 3S1dVEdq2Lhhj6uC1+QTOBhyM+h32Nbp5gGz4wcyS7AJYHf4V4v4ckAWRzXdqdP2NhoB
 +1e8vcnHod6hPcO32N7j+DX87D4ww3gzcbO28fflLpYV+O0ZiITkR3/KPdGtnPrOzrgF
 WJgTYw3WD0A/gQp+47HIc4wojjnzO7ZH1+AzVl1qIQRMz0zLVKdkF6Q3rFhlvnG0FgV6
 4nSsuei54uvGZiB0Qr+ad+EyWSxFG6o7ksYatFUz2bdu3fMfCrGl61Ylhjs2B8x2rA8q
 wvCA==
X-Gm-Message-State: AOAM532FXbOJ4jbhMkKPNkC4xPUcmrX0e5NmTWAUx/+J6xTwSdEQKvkH
 ZaS/jfr5AtxNs/bJdMCu9iA=
X-Google-Smtp-Source: ABdhPJxznvgzZqfYWIDGri2iQZkrb65SSVK3bkT6SK4TKqrHIaofGr/C5IMiuCQcc4kOLZls5+zaAQ==
X-Received: by 2002:a62:2c82:0:b0:44d:71c3:8a3 with SMTP id
 s124-20020a622c82000000b0044d71c308a3mr6267013pfs.84.1634829196915; 
 Thu, 21 Oct 2021 08:13:16 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:13:16 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 16/25] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Thu, 21 Oct 2021 20:37:41 +0530
Message-Id: <50db352f97df56d37f3af99c8999d6136436aaba.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
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

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This unifies PCI error response checking and make error checks
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.c   | 10 +++++-----
 drivers/pci/probe.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce2ab62b64cf..4eaf29f004bd 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1077,7 +1077,7 @@ static int pci_raw_set_power_state(struct pci_dev *dev, pci_power_t state)
 		return -EIO;
 
 	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
-	if (pmcsr == (u16) ~0) {
+	if (RESPONSE_IS_PCI_ERROR(pmcsr)) {
 		pci_err(dev, "can't change power state from %s to %s (config space inaccessible)\n",
 			pci_power_name(dev->current_state),
 			pci_power_name(state));
@@ -1239,16 +1239,16 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
 	 * After reset, the device should not silently discard config
 	 * requests, but it may still indicate that it needs more time by
 	 * responding to them with CRS completions.  The Root Port will
-	 * generally synthesize ~0 data to complete the read (except when
-	 * CRS SV is enabled and the read was for the Vendor ID; in that
-	 * case it synthesizes 0x0001 data).
+	 * generally synthesize ~0 (PCI_ERROR_RESPONSE) data to complete
+	 * the read (except when CRS SV is enabled and the read was for the
+	 * Vendor ID; in that case it synthesizes 0x0001 data).
 	 *
 	 * Wait for the device to return a non-CRS completion.  Read the
 	 * Command register instead of Vendor ID so we don't have to
 	 * contend with the CRS SV value.
 	 */
 	pci_read_config_dword(dev, PCI_COMMAND, &id);
-	while (id == ~0) {
+	while (RESPONSE_IS_PCI_ERROR(id)) {
 		if (delay > timeout) {
 			pci_warn(dev, "not ready %dms after %s; giving up\n",
 				 delay - 1, reset_type);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d9fc02a71baa..8bf4034ddbd4 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -206,14 +206,14 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	 * memory BAR or a ROM, bit 0 must be clear; if it's an io BAR, bit
 	 * 1 must be clear.
 	 */
-	if (sz == 0xffffffff)
+	if (RESPONSE_IS_PCI_ERROR(sz))
 		sz = 0;
 
 	/*
 	 * I don't know how l can have all bits set.  Copied from old code.
 	 * Maybe it fixes a bug on some ancient platform.
 	 */
-	if (l == 0xffffffff)
+	if (RESPONSE_IS_PCI_ERROR(l))
 		l = 0;
 
 	if (type == pci_bar_unknown) {
@@ -1660,7 +1660,7 @@ static int pci_cfg_space_size_ext(struct pci_dev *dev)
 
 	if (pci_read_config_dword(dev, pos, &status) != PCIBIOS_SUCCESSFUL)
 		return PCI_CFG_SPACE_SIZE;
-	if (status == 0xffffffff || pci_ext_cfg_is_aliased(dev))
+	if (RESPONSE_IS_PCI_ERROR(status) || pci_ext_cfg_is_aliased(dev))
 		return PCI_CFG_SPACE_SIZE;
 
 	return PCI_CFG_SPACE_EXP_SIZE;
@@ -2336,8 +2336,8 @@ bool pci_bus_generic_read_dev_vendor_id(struct pci_bus *bus, int devfn, u32 *l,
 	if (pci_bus_read_config_dword(bus, devfn, PCI_VENDOR_ID, l))
 		return false;
 
-	/* Some broken boards return 0 or ~0 if a slot is empty: */
-	if (*l == 0xffffffff || *l == 0x00000000 ||
+	/* Some broken boards return 0 or ~0 (PCI_ERROR_RESPONSE) if a slot is empty: */
+	if (RESPONSE_IS_PCI_ERROR(*l) || *l == 0x00000000 ||
 	    *l == 0x0000ffff || *l == 0xffff0000)
 		return false;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
