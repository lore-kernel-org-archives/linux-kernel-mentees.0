Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F504C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBFF6115C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBBFF6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9300683639;
	Mon,  4 Oct 2021 18:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ws3splx9noBP; Mon,  4 Oct 2021 18:01:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CCFD8835C9;
	Mon,  4 Oct 2021 18:01:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABBF5C0011;
	Mon,  4 Oct 2021 18:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2161EC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1045E404D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ML1oe1l40G9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E31454044B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:19 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id kk10so2856112pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7sq5HEJs5lGnG+J8tujUids2AjtGM7weFegW7/rlp0=;
 b=DCLTSaQ07PyQGYWXH1+2Xsfdvw5DGV/I8XtRyOJbPaLb7kUI5hE9bZs5tBKfKfnEZv
 yJWA9rYnr0brHhmOMVeV+trr2fiBrUYwjSZbYSZwDmP9r/JS76OU6s/3AdycKZWfYTFw
 CIclJY0tQH0UeDsZcm6RtmrZGNXAT160EC6VgsC9hOtIq0iSkaWcZ0KkM1D96wVVTdxM
 U+yKA9jvbDs9v12WOHtt4EpvmMzklJn+8vLlgMBPU0VuViSjzLx2CwTYViJ73cL/+5xP
 vGqSeNgUdhH7az1nnmJYLp6QV6XxCG8nLT0xkZmBoClJDUKZ/T4ZfTcgZV5MYU4BQyQC
 CewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7sq5HEJs5lGnG+J8tujUids2AjtGM7weFegW7/rlp0=;
 b=vjxNd+rA+pSTCpQ44tDgcUxhOMkjF09Payjn13OX9LT9OnhPuBu1zD3AvbdvIanjb2
 rnAIvyixRgO6H/hWcF3Cs7P6q+86VRdNuVrtZNDtZ2CclpQnAPt7bZKGFzsBncdxFqsg
 X2UnRo8r4k0iGYK6FLHSVKGJJMXd5+aASqpXC9BpbIZk8mKnFSZ+fwHPtrggik6JaJ0Y
 coOry2+LFDL7LiDyvg9qG98DhWpsFQ6rUAZf6eK4sj4zfacpkAks0MbhIDvZFZ30rfUB
 uzihmX/sXHMFmKteRYbyaCm+47FHuqpteFBP/KawVtwmQaIkUueyrp4GbE3j2jE9ZJfN
 nFig==
X-Gm-Message-State: AOAM53239xWeXTsoM115IZLyj/I+y01eU51nqEdk9v2U2hl2yXfHTOZ7
 81148FnhYbVHLDf96hZ1QvY=
X-Google-Smtp-Source: ABdhPJxqQ1dbB0F5R2hGORk15/5zZpFg9rCi0DkVZQ7y0tE2wiTwWP4DlAOal+8YQvciNlfn7Vn2pw==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id
 s3-20020a170902a503b029012b2429385emr966754plq.64.1633370478701; 
 Mon, 04 Oct 2021 11:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:01:18 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com, tsbogend@alpha.franken.de, ruscur@russell.cc,
 oohall@gmail.com
Subject: [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in
 set_device_error_reporting()
Date: Mon,  4 Oct 2021 23:29:27 +0530
Message-Id: <b583172ece1fb1dab3d75c6007ec8c443323158d.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633369560.git.naveennaidu479@gmail.com>
References: <cover.1633369560.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The (PCIe r5.0, sec 7.6.4.3, Table 7-101) and  (PCIe r5.0, sec 7.8.4.6,
Table 7-104) states that the default values for the Uncorrectable Error
Mask and Correctable Error Mask should be 0b. But the current code does
not set the default value of these registers when the PCIe bus loads the
AER service driver.

Enable reporting of all correctable and uncorrectable errors during
aer_probe()

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/aer.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9784fdcf3006..88c4ca6098fb 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1212,6 +1212,7 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
 {
 	bool enable = *((bool *)data);
 	int type = pci_pcie_type(dev);
+	int aer = dev->aer_cap;
 
 	if ((type == PCI_EXP_TYPE_ROOT_PORT) ||
 	    (type == PCI_EXP_TYPE_RC_EC) ||
@@ -1223,8 +1224,18 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
 			pci_disable_pcie_error_reporting(dev);
 	}
 
-	if (enable)
+	if (enable) {
+
+		/* Enable reporting of all uncorrectable errors */
+		/* Uncorrectable Error Mask - turned on bits disable errors */
+		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, 0);
+
+		/* Enable reporting of all correctable errors */
+		/* Correctable Error Mask - turned on bits disable errors */
+		pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, 0);
+
 		pcie_set_ecrc_checking(dev);
+	}
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
