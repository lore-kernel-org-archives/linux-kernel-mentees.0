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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11DAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917462076A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmX+599K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917462076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5D4BD88A09;
	Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1GKCSQclNEj; Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08BE4889D4;
	Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E393FC0888;
	Mon, 15 Jun 2020 08:32:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75FA0C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 631F588835
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNAPYFxatDFm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 94174884AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b82so5192777wmb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XDfq5bojR6b05CC1Lwj10IkyAFKBu8BIbutGTPyHRj0=;
 b=GmX+599KgK3+4CQD4ut6Unl0dQe37gJnaQMa7HXIKFLnkM36mjZce93Qnal55lQXme
 DPXNferZ2/2tadOcdmNTCDJ2fFb4JhxDbYnUVRlKL8lwVO9L5c+u+5XKNcLMEK6tfIt0
 QkCoHNi2Owqh2Z1Eob2bkqXIlxe1ufktC98YZwFTXudBA47isWtl0Umv8NBacCLFgSHp
 h8YK5ujbYfa1WKMnCT6t/nA3KdDJ/IpwmYI7Hh4ey8SWAv890eL1ce7gENW5nY6Ca9Aq
 bk3N+kQixJyXij2ldZTm51qFtu5ZtspA8ZS3OfDfwFsBNfO4puqm94RtgR+RhP996L+4
 ehhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XDfq5bojR6b05CC1Lwj10IkyAFKBu8BIbutGTPyHRj0=;
 b=rw9IdbiLNYA+bjzvtXvy/8wVb7uto6ki+iyACE6gx24MLcCbY+/OItknb2+HkQAcJ2
 EFEr3guF3vaeVvYfqm/s6UTHAN0yRXEBuyQfbdvZNjchzjEtI+mrulqE3pGqSRtbmqU+
 B1AsV7VKxcUp6/2pO+joMBZxuKtg7XX+3YWuGkr6GsZ3wCS6wwAj7h4f/HsPkno8NYiR
 xcrwRrsfU92aRAwzFzXnhoIFiLRnFj3hlE+cW2e16ye6kfnaNTjlYsfNFmpuYZZ/+/qA
 Mr3FboJ9ZKsMXMdTJsA8txzFjrQ6UkEoJLC9tzYb5wJV/CBSjW/XH3rx7RCnnSc8f4CC
 GBjw==
X-Gm-Message-State: AOAM533o+/m3D0FKFiQx1PA5OSVP2xSG/aBj45bW0NIz/dHrRGDIYU4/
 c3swNRqInhDYJDQ9/AK5yvqZgg1Bvsm/Hw==
X-Google-Smtp-Source: ABdhPJzbGIfVEFGGh/6f5AcJQG40GJvG1GbBmlTLY3eBcSJ95HGy+b4zQLrPxNrp05rwJL+y2MMAeg==
X-Received: by 2002:a1c:dc44:: with SMTP id t65mr12783227wmg.128.1592209962974; 
 Mon, 15 Jun 2020 01:32:42 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:42 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:24 +0200
Message-Id: <20200615073225.24061-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Russell Currey <ruscur@russell.cc>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 7/8] PCI/AER: Convert PCIBIOS_*
	errors to generic -E* errors
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

pci_disable_pcie_error_reporting() returns PCIBIOS_ error code which were
passed down the call heirarchy from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/aer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 95d480a52078..53e2ecb64c72 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -365,11 +365,15 @@ EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
 int pci_disable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int rc;
+
 	if (pcie_aer_get_firmware_first(dev))
 		return -EIO;
 
-	return pcie_capability_clear_word(dev, PCI_EXP_DEVCTL,
+	rc = pcie_capability_clear_word(dev, PCI_EXP_DEVCTL,
 					  PCI_EXP_AER_FLAGS);
+
+	return pcibios_err_to_errno(rc);
 }
 EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
