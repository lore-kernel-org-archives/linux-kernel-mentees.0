Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4671CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BFA20714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZllkfQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BFA20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DADB923337;
	Mon, 15 Jun 2020 08:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6n8K4dx6wq5; Mon, 15 Jun 2020 08:32:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B492920509;
	Mon, 15 Jun 2020 08:32:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C289C0888;
	Mon, 15 Jun 2020 08:32:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8A6DC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C58B4889AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0+8hg1NJjlsa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 04D6A8898B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c3so16091424wru.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M/dNY835TBbenopXfANftVUfONbLdxGaDwu4O0ya0Io=;
 b=mZllkfQGCwng8pRlqCnDf1668UeZ3bMTYHMKIP1Ey/wcpSqEZsDsvc7IQuOWTiZx7F
 6AEeHI7shVdh/ZBeG6h76mJYyVZ7gQofX0LMdP/CHdTAYElLgnEZIzWPXqn6HpvsiHep
 yKHDK91VHXk/xk0deKCtGYxo1eB+z5rnWqAswblhV6RXclciYmvA7gmjvL+IBaNdWKJD
 0UyCoDhbM29Vz3Rnu0G4+KppoCb63hhPn4SJe2yTCG7cvX5AMHEJNXZUu8L2LZIdsuK0
 srsTKxYCBTms6qEOeWBK7ogXPJPekbNkgs+YGmZYJOHYo8daqDqHq1VodYYjvgWmDIeD
 QpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M/dNY835TBbenopXfANftVUfONbLdxGaDwu4O0ya0Io=;
 b=CFCx/S4jEYQAoEvJxDMZwTKLvqK+WNSkiCUDXvLaw4IxPWqiW8s2SIwfnMuFlihmYN
 PGzfnSd7J0uhqjeCHJGtitVBNGuvndmawXNkU1tOLeBfjL3Nkkki9iE/2mLHisCeaFGO
 KtnvNAmWC9ly1auPHPrzTDkKOpA8YkeDvN4iZkF3lgtMp6GqhK8CFA/RuzQngyCPctFq
 1RwLvuVicrTM2WWG49iqOBKdSB9ZmWV+YBKouTcJt7qLAzEV6fB8EAd9Sv8lohGJgx2O
 UfUfZT+1XUKQooQEu9Lb0u8Uy8GROL14Gvwtm8Y/PL5gKqYZac34vtOt6GZmgdWc+Oh8
 EDBA==
X-Gm-Message-State: AOAM533I29iBwVRNNi1qju2IprZyzcg8A5H2D4lRtng6w8DghyL54rBj
 4Qh+sPfwX2X/0j+foQFw8xM=
X-Google-Smtp-Source: ABdhPJz4V9C1ENgGVqIPkvgCoJkdJ+A5hU166ZOZGB29u4rYCMNZZqZpD7b2MruwA13RR6eraLoO8Q==
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr28561490wrx.191.1592209950561; 
 Mon, 15 Jun 2020 01:32:30 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:29 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:21 +0200
Message-Id: <20200615073225.24061-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/8] PCI: Convert PCIBIOS_* errors
	to generic -E* errors
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

Both pcie_set_readrq() and pcie_set_readrq() return PCIBIOS_ error codes
which were passed down the call heirarchy from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 595fcf59843f..fa49e5f9e4d1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5698,6 +5698,7 @@ EXPORT_SYMBOL(pcie_get_readrq);
 int pcie_set_readrq(struct pci_dev *dev, int rq)
 {
 	u16 v;
+	int ret;
 
 	if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
 		return -EINVAL;
@@ -5716,8 +5717,10 @@ int pcie_set_readrq(struct pci_dev *dev, int rq)
 
 	v = (ffs(rq) - 8) << 12;
 
-	return pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
+	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 						  PCI_EXP_DEVCTL_READRQ, v);
+
+	return pcibios_err_to_errno(ret);
 }
 EXPORT_SYMBOL(pcie_set_readrq);
 
@@ -5748,6 +5751,7 @@ EXPORT_SYMBOL(pcie_get_mps);
 int pcie_set_mps(struct pci_dev *dev, int mps)
 {
 	u16 v;
+	int ret;
 
 	if (mps < 128 || mps > 4096 || !is_power_of_2(mps))
 		return -EINVAL;
@@ -5757,8 +5761,10 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 		return -EINVAL;
 	v <<= 5;
 
-	return pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
+	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 						  PCI_EXP_DEVCTL_PAYLOAD, v);
+
+	return pcibios_err_to_errno(ret);
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
