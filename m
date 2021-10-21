Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB62C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29EF060F9F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29EF060F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD99B40733;
	Thu, 21 Oct 2021 15:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFo-cSDuRXj4; Thu, 21 Oct 2021 15:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E01A1406F1;
	Thu, 21 Oct 2021 15:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFA23C001C;
	Thu, 21 Oct 2021 15:10:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70D62C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5348F60F0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJv8pYfNLYrO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C179860628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:16 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id np13so717156pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szm9mPrVF9g7VHjr68cY48MjU0fXHj5hkhxS0Uhiec4=;
 b=kzhKz8HKnq/yurgUnRRmdMnpoO4/E0k9gxB0o6nvZkLULxDO/GXx/MQ04A4PT92FZ1
 fGMd51fYe7BJJomc6FYPAhwkSJFS+5njkw33/E4TIiIkQoZrPJ7HEzZsbiOLaz28kbju
 sYjWzeIr1owBkBsMQRiYSiissNBK0MhsxWMadZlUsbqzUctoqzURKC8Qjxvfb8+ZfmzT
 rGtm3yAMC0z7Fs3AFOyuk0RAvdNarXTjk4G4e2l+GVhhzS2x892CfRbvf8H70szLOkx2
 E3V5M98AYF9SrcgGsJOG7OAZPAy2TTdHAb7DSeiYO82oiXtqtYbl82JDl4HjQPHm7LQE
 evpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szm9mPrVF9g7VHjr68cY48MjU0fXHj5hkhxS0Uhiec4=;
 b=N4Tr6dZIA5P9X6zTuTeXr/L6l+EF7JFmWzdV8YZZCO5f4kkd1YskLomyBDjvQJn30D
 w47vKWsy+RqdLpJOYi7+zP++1cSoMmLV0bH8s4GrHetb+Uie5cZ3iDngO+vNCpM18AWc
 Hu/Yw/d08L9ac4LcvAurPqw1SeQeNkbcsURycKqP9ymmB8ujCYPYUzKeaSkXFlWepcj8
 p8zz9xNseuJACzt3BtA1rdFcr2zpWlXw91eRd0G370yjuOXfhGCF6URf3e4RO/28qosI
 9pVCKN8U3xEQqQ9vTfnUriqvPi9IoPpGF83nAfo4HMJWOcV09/+BpR5MmORrTarn4OZP
 g+fw==
X-Gm-Message-State: AOAM530JqkPkqu3Y0nEvZG1kKacUnaB7gHLenSveXbztUdeovTB75tEO
 4cPgJZ5ypVxXMnFhcFQskqo=
X-Google-Smtp-Source: ABdhPJwVrzLwzW5dNVxm5WaGcslw2IFkRx5KjyYZwwVA7XYHIn4ISCyJaDYSwbRx4bq3u4ZOxnFu2w==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr7327842pjg.202.1634829016181; 
 Thu, 21 Oct 2021 08:10:16 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:10:15 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 03/25] PCI: Use SET_PCI_ERROR_RESPONSE() when device not
 found
Date: Thu, 21 Oct 2021 20:37:28 +0530
Message-Id: <70e5763e4aa58876a7129ac3ccf600efd27162c4.1634825082.git.naveennaidu479@gmail.com>
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
causes a PCI error. There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 0f732ba2f71a..a6bcbad04d89 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -529,7 +529,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
 int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_byte(dev->bus, dev->devfn, where, val);
@@ -539,7 +539,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
 int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_word(dev->bus, dev->devfn, where, val);
@@ -550,7 +550,7 @@ int pci_read_config_dword(const struct pci_dev *dev, int where,
 					u32 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_dword(dev->bus, dev->devfn, where, val);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
