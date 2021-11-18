Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17393C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE80161AE2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE80161AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997C181774;
	Thu, 18 Nov 2021 14:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDKQzB_smilz; Thu, 18 Nov 2021 14:05:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4C92E8176A;
	Thu, 18 Nov 2021 14:05:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2687FC001E;
	Thu, 18 Nov 2021 14:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 332A5C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D0E240266
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS6B90c_hR-k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBA3A401C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u11so5332502plf.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MV39JGkKDIkXiPRnH+W6MhpRBxyv9EoW3jrMZU+eQgA=;
 b=BlIoxgRHAtlgaOA4X+KHVoZAtRRhSolSqdc/mUyB/pQLj6YVZ5NFGN3eQi6c5hQdoh
 S3ioEu71pyjzWILjnXCGEwswEB8Woji8zTq3Tu97wbK7Sh3WegwGOUl4pvGZTCC8sXYt
 paDdTGZrNN4cY2Arv6On5cUy7+4Pp3yWuIq8/F3wTeDQj1QoJSUbMPV8xmI49BhqT0LJ
 N/1eC3FVxHdhfpvq5qMQ+QeUVDPXtNozLP1tN14Rd4y5rXcmgV5oYTFTZBHrfayrGvE/
 CUZGMW+ZOcjI7WPA0JvxEsgTyP9877Kwda4jnLqi3O+gQsDZJJuyaKoOHrAOilp2N+JM
 b3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MV39JGkKDIkXiPRnH+W6MhpRBxyv9EoW3jrMZU+eQgA=;
 b=pXP5cBkOFnXplSa35CxmSxxtpcb3yqkC6jJsLep8Hov/rZW+DIcYL7qoeFf5UeaQ1q
 uXN7Zj8MY3PdTQ53SYdNFjnvQ+HIo8uu7b2OeW0794XipYiXrXq6iRFuu9PSSNAcf+PW
 m2qrIskGKQtYBOL9N5GmL30NBjc01SQx+sTJ+RJXnT3s1z2ltbKMhovPLtKOEv3hCMSc
 3gPcjoKKgK8QCYODDcCIXrwehR1lqGPPBd116enHwhJ02atlZJfGhoSOmyhetgUMbXMA
 a55e3VZo9lL0uZg0T9cYqaSsMmd+WkkpHrVvXcjLMy69PDMGishkMdpxZ8Vc1wehWmZz
 97dw==
X-Gm-Message-State: AOAM5316F2qT85kyxXtwzUxdfEgoYwhTcs3n+84o5z0NHHptCxLK+f+X
 q45/NFHteyi1NBwbS6zkyL0=
X-Google-Smtp-Source: ABdhPJztsAl12367c92Fw/hcVl1vu1Gs8QO8s7YyCtOAlPzDY8J+Wko11a7iJsaUTWNOAkmhz5U/Dw==
X-Received: by 2002:a17:902:b7c6:b0:141:9a3a:f213 with SMTP id
 v6-20020a170902b7c600b001419a3af213mr66374177plz.15.1637244302278; 
 Thu, 18 Nov 2021 06:05:02 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:05:01 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 03/25] PCI: Use PCI_SET_ERROR_RESPONSE() when device not
 found
Date: Thu, 18 Nov 2021 19:33:13 +0530
Message-Id: <29db0a6874716db80757e4e3cdd03562f13eb0cb.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
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

Use PCI_SET_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index eac0765d8bed..e1add90494ec 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -529,7 +529,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
 int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		PCI_SET_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_byte(dev->bus, dev->devfn, where, val);
@@ -539,7 +539,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
 int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		PCI_SET_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_word(dev->bus, dev->devfn, where, val);
@@ -550,7 +550,7 @@ int pci_read_config_dword(const struct pci_dev *dev, int where,
 					u32 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		PCI_SET_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_dword(dev->bus, dev->devfn, where, val);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
