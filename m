Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE2C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 21:44:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7662074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 21:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE1MudhQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7662074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C73B872F4;
	Thu,  1 Oct 2020 21:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyKMOIg0Ujwy; Thu,  1 Oct 2020 21:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8369A872F3;
	Thu,  1 Oct 2020 21:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72C5EC016F;
	Thu,  1 Oct 2020 21:44:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96C46C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 21:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 866E5872F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pCNgTZ2ZRRr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 21:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FCA1872F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 21:44:48 +0000 (UTC)
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8169C2074B;
 Thu,  1 Oct 2020 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601588687;
 bh=IIB/IA95u/Gtiso3dxaVhQhYB//XBnPyo9g9xpzGZvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cE1MudhQUzcZsmcncF+9+Y7G/b+0et7Jyw1MxHnFicrErARYwWDhN5rcNbcX4fcZx
 Cz+pGfF7PcOD8jsceKsaPM7PvyFSmzp1XdUJaCCNJRdFsIdZ+ooYH28i9uOJRRcrHw
 AcfCwpiVnNJCcPWm1661ZO3HcCAk7ev2vWiYCJ9o=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu,  1 Oct 2020 16:44:35 -0500
Message-Id: <20201001214436.2735412-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201001214436.2735412-1-helgaas@kernel.org>
References: <20201001214436.2735412-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v6 1/2] PCI/ASPM: Rename
	encode_l12_threshold(), convert arg to ns
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

From: Bjorn Helgaas <bhelgaas@google.com>

Rename encode_l12_threshold() to pci_lat_encode() and convert its argument
from microseconds to nanoseconds so we can share it between
LTR_L1.2_THRESHOLD encoding and LTR Max Snoop/No-Snoop Latency encoding.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aspm.c | 39 ++++++++++++---------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 253c30cc1967..beb6e2e4e5d2 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -307,6 +307,17 @@ static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
 	pcie_capability_write_word(parent, PCI_EXP_LNKCTL, parent_reg);
 }
 
+static void pci_lat_encode(u64 lat, u32 *scale, u32 *val)
+{
+	/* See PCIe r5.0, sec 7.8.3.3 and sec 6.18 */
+	     if (lat < 32)	 { *scale = 0; *val = (lat >>  0) & 0x3ff; }
+	else if (lat < 1024)	 { *scale = 1; *val = (lat >>  5) & 0x3ff; }
+	else if (lat < 32768)	 { *scale = 2; *val = (lat >> 10) & 0x3ff; }
+	else if (lat < 1048576)	 { *scale = 3; *val = (lat >> 15) & 0x3ff; }
+	else if (lat < 33554432) { *scale = 4; *val = (lat >> 20) & 0x3ff; }
+	else			 { *scale = 5; *val = (lat >> 25) & 0x3ff; }
+}
+
 /* Convert L0s latency encoding to ns */
 static u32 calc_l0s_latency(u32 encoding)
 {
@@ -354,32 +365,6 @@ static u32 calc_l1ss_pwron(struct pci_dev *pdev, u32 scale, u32 val)
 	return 0;
 }
 
-static void encode_l12_threshold(u32 threshold_us, u32 *scale, u32 *value)
-{
-	u32 threshold_ns = threshold_us * 1000;
-
-	/* See PCIe r3.1, sec 7.33.3 and sec 6.18 */
-	if (threshold_ns < 32) {
-		*scale = 0;
-		*value = threshold_ns;
-	} else if (threshold_ns < 1024) {
-		*scale = 1;
-		*value = threshold_ns >> 5;
-	} else if (threshold_ns < 32768) {
-		*scale = 2;
-		*value = threshold_ns >> 10;
-	} else if (threshold_ns < 1048576) {
-		*scale = 3;
-		*value = threshold_ns >> 15;
-	} else if (threshold_ns < 33554432) {
-		*scale = 4;
-		*value = threshold_ns >> 20;
-	} else {
-		*scale = 5;
-		*value = threshold_ns >> 25;
-	}
-}
-
 struct aspm_register_info {
 	u32 support:2;
 	u32 enabled:2;
@@ -539,7 +524,7 @@ static void aspm_calc_l1ss_info(struct pcie_link_state *link,
 	 * least 4us.
 	 */
 	l1_2_threshold = 2 + 4 + t_common_mode + t_power_on;
-	encode_l12_threshold(l1_2_threshold, &scale, &value);
+	pci_lat_encode(l1_2_threshold * 1000, &scale, &value);
 	link->l1ss.ctl1 |= t_common_mode << 8 | scale << 29 | value << 16;
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
