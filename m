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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B82FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4EF420738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/ldJLhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4EF420738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B358724368;
	Mon, 15 Jun 2020 08:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwtvx97D44hh; Mon, 15 Jun 2020 08:32:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 67802234AC;
	Mon, 15 Jun 2020 08:32:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4904CC0888;
	Mon, 15 Jun 2020 08:32:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52776C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 322AB23B81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODmc4zowpomg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id B439020509
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so13725611wmj.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5N7OiTkpW2bbIsUq9FnRk9cirBO+6YwRec/YN067b5E=;
 b=W/ldJLhCdUJj5d05mtV4pK65pjgE+/YRWMSLx9Ubvv++oDnBBIL5FwSU4I1vbGgwuG
 S19kPYUbfK+bbLud6LxLvZOc0qwk3cInUEb4d9luu0OT5Yo1sinR3yBNWJ03r3oP/IgL
 e+KCcuHvL8OqUgoioVPrwkT/CMV3p9DkA+8Nd12c7OI/ntMDv0QsL8hPJnyLTTYfR0Cr
 ZrTtT/JhkbNzcrB4rt+M5vguZV0YJ6NManuAQmbeZHMQXLPFltrw8ilsv/t46Go6sg+Q
 3mUSGrAahLu1bsuV4x8nlY8jsYO7zJtvYxSvk7PXWVqVbgKDgpUb74sxtkeaIxDqkQLH
 pLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5N7OiTkpW2bbIsUq9FnRk9cirBO+6YwRec/YN067b5E=;
 b=aNFB7oyf0DfTVtEjEVsv9PArEIN440u30TSxyvWzSeZcsCZ2EqQDpYodpTdpqQjTBC
 AoPjeGRbrLP6R+bxxoDiyCNEpeXds7jock9z+zZqcXMLRuD5waZ4Pb21dbb7gFigxUFP
 eAAwFT5UKz5Zker5kNOZyRzWzeccNXskS4IASiFs06gb5l09lELqudvemIIpKDxIp6sj
 XC4S72dmkuD8JYExrlQQmRvJpArHrVvqz2sC/TEoqKi3lSEE1VGSo6MTY3SXUQpiLNbo
 i5VYZExCW6YSxXF+AdLx643+OrUWrohR5D3NBCFqPE9BjiJl/AC20wlqucvzq3Wrql9q
 ZyaA==
X-Gm-Message-State: AOAM533LQXkfeftlfjztUCnjx5C5A+6uLmdmq6h3Cfrer2V7rlUr25ah
 CKG9tM/o+nYzgXlurHxxgj8=
X-Google-Smtp-Source: ABdhPJyDOmxsWcHptOCXrlz2DfdRs3ToWlKFmU7sWKf2RWgc6Jg6hrJsDIU8bNUTt2KgGgbCPx8bcA==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr12117201wmk.16.1592209964155; 
 Mon, 15 Jun 2020 01:32:44 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:43 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:25 +0200
Message-Id: <20200615073225.24061-9-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 8/8] PCI: Align return values of
	PCIe capability and PCI accessors
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

The PCIe capability accessors can return 0, -EINVAL, or any PCIBIOS_ error
code. PCIBIOS_ error codes have positive values. The PCI accessor on the
other hand can only return 0 or any PCIBIOS_ error code. This
inconsistency among these accessor makes it harder for callers to check 
for errors.

Return PCIBIOS_BAD_REGISTER_NUMBER instead of -EINVAL in all PCIe
capability accessors.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/access.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 79c4a2ef269a..cbb3804903a0 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -409,7 +409,7 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
 
 	*val = 0;
 	if (pos & 1)
-		return -EINVAL;
+		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
@@ -444,7 +444,7 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 
 	*val = 0;
 	if (pos & 3)
-		return -EINVAL;
+		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
@@ -469,7 +469,7 @@ EXPORT_SYMBOL(pcie_capability_read_dword);
 int pcie_capability_write_word(struct pci_dev *dev, int pos, u16 val)
 {
 	if (pos & 1)
-		return -EINVAL;
+		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (!pcie_capability_reg_implemented(dev, pos))
 		return 0;
@@ -481,7 +481,7 @@ EXPORT_SYMBOL(pcie_capability_write_word);
 int pcie_capability_write_dword(struct pci_dev *dev, int pos, u32 val)
 {
 	if (pos & 3)
-		return -EINVAL;
+		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (!pcie_capability_reg_implemented(dev, pos))
 		return 0;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
