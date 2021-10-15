Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96211C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5958C61041
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5958C61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C31783B41;
	Fri, 15 Oct 2021 14:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_6gergzsJYL; Fri, 15 Oct 2021 14:45:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3FA4183753;
	Fri, 15 Oct 2021 14:45:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CA75C000F;
	Fri, 15 Oct 2021 14:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD6BC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ACED6084F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b5g5HINu8l7T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6DBE60844
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:45:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id y7so8537137pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wg9CIjlvFpQ0mVyLruVXTyXRfH69nmtxShZyyO67k10=;
 b=O4C9zYJL9l7EbrlGSDp0OOYmbfrQI/mk7hKB2KetLAfTJkrzFPw/c64gcGjsOAg/gS
 XisYpdLBtUdscG4+zLFIqn84JjKco6cDb3F70hnPwsx4kPYC84CdTP6IGTuXohsBXQn6
 gM8iJy7Qdmuy3rI16l9MgKjozQXgOxJepwN9ZHaDjPSmwyX2mfK/CnxNmWqc0nYK1+Gw
 Vionef2tPDP17XYMqXM2N2ATJwtpPWgr1nGPNBkW0HT0ecGB3nObThlDWfpb/8sWHyVU
 yrFOp0FpZgJcuwXofxQ+qSkUD/OLZ1nfxhte3aeIdRCmGwHQa8I4M3Ba3Lm8PCBKisx2
 L35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wg9CIjlvFpQ0mVyLruVXTyXRfH69nmtxShZyyO67k10=;
 b=Crdc6XLPfXHLYWfQha0h91KqdSgr2W7GF0Ag5xDIgWCvt4dxdMbvMAAjyq/1jjLfpv
 g7wPIWsFq0VPlCowtOcGN2o4x6bRz+O8PHmUCJSPSB8V60ZnEz00JV4Cbov9NAfkdMDs
 tKIMnG3nS22hcXB3kfFb4zWQkoPveJOgiAxh+tYvJNHOPXSugN/c1TmmOs0yeavdOdTq
 CIOhcEokWTiyn9HWkUKIyNvTIBbjtv9DRY+Y98g+TfoaKz+0Hby+kmQCfH8bsIFJqFfM
 jz1b6Te2ibPRSEZS2DC4yWovppHiANNu7O+7aE84W09EGnnq35PtyAR3mdbaVT7KTYu7
 ceYA==
X-Gm-Message-State: AOAM5313WJEz1rpOXsNgHIsGNGE/2j11xemsbFdTGUYAKdOU3xrDolDW
 /appReXkm6jgkp5pkBD26cw=
X-Google-Smtp-Source: ABdhPJzVsujjyhtu4qdgTMOPdGHq2Omqc8DYqIdFvZ6lxYZhtdKrpABl9i6841s5RVRY23eQjwq/QA==
X-Received: by 2002:aa7:8d86:0:b0:44c:9006:1b44 with SMTP id
 i6-20020aa78d86000000b0044c90061b44mr12215663pfr.36.1634309139012; 
 Fri, 15 Oct 2021 07:45:39 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:45:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 16/24] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Fri, 15 Oct 2021 20:08:57 +0530
Message-Id: <69fed7552be7c516bc92ce1e3bbb3249dfb74860.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
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
index ce2ab62b64cf..c1575364d1ce 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1077,7 +1077,7 @@ static int pci_raw_set_power_state(struct pci_dev *dev, pci_power_t state)
 		return -EIO;
 
 	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
-	if (pmcsr == (u16) ~0) {
+	if (RESPONSE_IS_PCI_ERROR(&pmcsr)) {
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
+	while (RESPONSE_IS_PCI_ERROR(&id)) {
 		if (delay > timeout) {
 			pci_warn(dev, "not ready %dms after %s; giving up\n",
 				 delay - 1, reset_type);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d9fc02a71baa..55b94d689eca 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -206,14 +206,14 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	 * memory BAR or a ROM, bit 0 must be clear; if it's an io BAR, bit
 	 * 1 must be clear.
 	 */
-	if (sz == 0xffffffff)
+	if (RESPONSE_IS_PCI_ERROR(&sz))
 		sz = 0;
 
 	/*
 	 * I don't know how l can have all bits set.  Copied from old code.
 	 * Maybe it fixes a bug on some ancient platform.
 	 */
-	if (l == 0xffffffff)
+	if (RESPONSE_IS_PCI_ERROR(&l))
 		l = 0;
 
 	if (type == pci_bar_unknown) {
@@ -1660,7 +1660,7 @@ static int pci_cfg_space_size_ext(struct pci_dev *dev)
 
 	if (pci_read_config_dword(dev, pos, &status) != PCIBIOS_SUCCESSFUL)
 		return PCI_CFG_SPACE_SIZE;
-	if (status == 0xffffffff || pci_ext_cfg_is_aliased(dev))
+	if (RESPONSE_IS_PCI_ERROR(&status) || pci_ext_cfg_is_aliased(dev))
 		return PCI_CFG_SPACE_SIZE;
 
 	return PCI_CFG_SPACE_EXP_SIZE;
@@ -2336,8 +2336,8 @@ bool pci_bus_generic_read_dev_vendor_id(struct pci_bus *bus, int devfn, u32 *l,
 	if (pci_bus_read_config_dword(bus, devfn, PCI_VENDOR_ID, l))
 		return false;
 
-	/* Some broken boards return 0 or ~0 if a slot is empty: */
-	if (*l == 0xffffffff || *l == 0x00000000 ||
+	/* Some broken boards return 0 or ~0 (PCI_ERROR_RESPONSE) if a slot is empty: */
+	if (RESPONSE_IS_PCI_ERROR(l) || *l == 0x00000000 ||
 	    *l == 0x0000ffff || *l == 0xffff0000)
 		return false;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
