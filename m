Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BE2C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5872076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1fsyewn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B5872076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5385C887BC;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJlmumGh-C5H; Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36173887D3;
	Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32252C088E;
	Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E41C7C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DE3FA203CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEx6xFAeoVnE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E263203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id c16so13635273ejx.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Hm0xl1/zOdRxUCQdh+5jYfhueeXY+Q37DPWRkan6/c=;
 b=Z1fsyewnXQPs1lEotbQp/siATWa4jPRJDiJOVvbugGAkrgk71MteS23QotXjqzoO6o
 Djbxi2UnNQBeRQetCyJcsmj7XEkbkjEUsrBRRb6SSdxo55cJ1ZZw3oOBTdeEG+T9gawB
 kqNWywFCaiN15ibTWf1BBqrYlc4eZxFrmTcx+hCY6rhOR32GwDODZtJzWI8oqbxgWDev
 ReSpEHfAs2jsheSPy+jkWL96hPBZOWdpyEMcDEoPotp6vo8kMCyYZuAgCYRUcmJsRwj8
 4++uigvxKo2XWAIiON6LohksmU20urMe65RhsLkFj4Tv65j0t+uef+LixeYj3ogSaNCl
 FujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Hm0xl1/zOdRxUCQdh+5jYfhueeXY+Q37DPWRkan6/c=;
 b=hCCiBvcGpmkzNxi1slAb5g2u4jLgZjNnIA4FrgUvmYfFQliREFbbLkOtgDoq+z2FsD
 +y1U11xTwLUT7N0a91SKJ3ZNMkWyFRv2C7P2p63GSRjQiyuxMRYzkWQvWtdWyLtklxNr
 6A14TKBBXqdV/9xpUVt0a7goizNxdNoK/poKK3jzxUe+6gx+W9ZAUlYW+14PXO4jUaVP
 ++gWxO4rA0fZBBlFRQrcMQhHWCLfiNr5Lil+qr5R2c2xUOG2c8r9Hria+ULfsi05tB20
 vPBOn+fY1NlZWQr84lD6YSB6TUfjaXx82gy34PootKKXvHZqFkQs0bFgwLvfL9gqNFQ1
 0Mwg==
X-Gm-Message-State: AOAM5336tvxw9L9BozrbYKA4LKF0dFTPrj0qdokcVMfipFrEoWgRLDCC
 mK8Jxlbe9N+/rpZCaNi1yQE=
X-Google-Smtp-Source: ABdhPJyuINeMO/fLzFyuKElJkCfpuhowBNnZHWiajwgeM00jZQZtTv2sANzv6LrgYELawrptxq0bLw==
X-Received: by 2002:a17:906:7743:: with SMTP id
 o3mr8213034ejn.224.1596284667784; 
 Sat, 01 Aug 2020 05:24:27 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:27 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Sat,  1 Aug 2020 13:24:32 +0200
Message-Id: <20200801112446.149549-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
MIME-Version: 1.0
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 03/17] bcma: Drop uses of
	pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/bcma/host_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bcma/host_pci.c b/drivers/bcma/host_pci.c
index 69c10a7b7c61..912d5311a444 100644
--- a/drivers/bcma/host_pci.c
+++ b/drivers/bcma/host_pci.c
@@ -372,9 +372,11 @@ int bcma_host_pci_irq_ctl(struct bcma_bus *bus, struct bcma_device *core,
 
 	pdev = bus->host_pci;
 
-	err = pci_read_config_dword(pdev, BCMA_PCI_IRQMASK, &tmp);
-	if (err)
+	pci_read_config_dword(pdev, BCMA_PCI_IRQMASK, &tmp);
+	if (tmp == (u32)~0) {
+		err = -ENODEV;
 		goto out;
+	}
 
 	coremask = BIT(core->core_index) << 8;
 	if (enable)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
