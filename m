Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F238C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:10:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC4260EB4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFC4260EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1CEC401E1;
	Mon, 11 Oct 2021 18:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhquw6639cns; Mon, 11 Oct 2021 18:10:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B101240120;
	Mon, 11 Oct 2021 18:10:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA0AC0011;
	Mon, 11 Oct 2021 18:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86942C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76D6580DD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UP6KoYs11Fd9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D002780C47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:10:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id y1so11820012plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOpzKqtZkl4vpPBZR8uQl2s3BPZXOsp3vKlUaVIS/Mo=;
 b=NCpPkW2tW+1A9ejqPsw/E89AdQ1IG22gXH4d0M9se1jCFdsfpIKYs4e087pVmidl/e
 q8qXvAKlGq9XLghs8p7T9gx0F4y0R4IX350PxIBQ7mkLYCyILrSZ460YkVB36SdBHikK
 rw3NuJ9e5U1bRxNP0zCAQawqJ7QisUHe8RacVwL6iHNGGS7S7+Ecra7/vN+xVk3XU0gt
 dwP8+iyekUEdEAprLEoIHsnCrxeWBakt7ZC1+zNNyHYBfqOizT3BOii/pEbLivYDE0PA
 etsTVYzI2VFTdzajkhJOd8NRKWRFxzTiyNhBL5CODQz4JBTbgElhcn8JeIQuYbARVDBX
 6L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOpzKqtZkl4vpPBZR8uQl2s3BPZXOsp3vKlUaVIS/Mo=;
 b=QZ2z4D5NmuT/kps0/4FCfM8yI0oRaAVtQh3GkG1Wtl3n0AIL6tRPVPqz4nr9dt+bkD
 WH015TYYWXub6Htl0wO/TLn/Rp9XfhNdFLd47YxHFMGfH3S1J1Q309a11JibAzE0wAC3
 LKKfqXQTUDV3tr+Pv4RdTUrCVHl9lB5q2xvNbvS1PhFLCldZvKYGOvUJZ22wVZ2yMIja
 xS+SCasEWlAFpuYzAbq/z3PQNSisefA+R0TDsJyWk6bsxFYd8nFt5WmxEQjMBuNKjf8B
 1sSUgFOke+IF5S8ev6eIjut6xRXiyE73fh/0aKPuoUsvH00jNf29DcRvSWJwHft6bqSi
 wIUw==
X-Gm-Message-State: AOAM533G4WEyTWl4Ob5/LiCGuyXPBIjXy8YXKP8UyPjlC+EgzKbJPDsr
 x1tFGpdKTe3lUbzGKZy7N9M=
X-Google-Smtp-Source: ABdhPJyTTIVV9W/Db1QkVLCqIJwuHX9GWdlAoaPYXja1BJeanTcWGwAAwOoIrYet7aTT3B6sBS+BxQ==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr552278pjb.208.1633975830306; 
 Mon, 11 Oct 2021 11:10:30 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 j16sm8471216pfr.42.2021.10.11.11.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:10:29 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 18/22] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from
 hardware
Date: Mon, 11 Oct 2021 23:40:14 +0530
Message-Id: <53e9d01d1683ccae66b07a5b7904e2aa124c5aa3.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Sean V Kelley <sean.v.kelley@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/pme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
index 1d0dd77fed3a..24588d0b581f 100644
--- a/drivers/pci/pcie/pme.c
+++ b/drivers/pci/pcie/pme.c
@@ -224,7 +224,7 @@ static void pcie_pme_work_fn(struct work_struct *work)
 			break;
 
 		pcie_capability_read_dword(port, PCI_EXP_RTSTA, &rtsta);
-		if (rtsta == (u32) ~0)
+		if (RESPONSE_IS_PCI_ERROR(&rtsta))
 			break;
 
 		if (rtsta & PCI_EXP_RTSTA_PME) {
@@ -274,7 +274,7 @@ static irqreturn_t pcie_pme_irq(int irq, void *context)
 	spin_lock_irqsave(&data->lock, flags);
 	pcie_capability_read_dword(port, PCI_EXP_RTSTA, &rtsta);
 
-	if (rtsta == (u32) ~0 || !(rtsta & PCI_EXP_RTSTA_PME)) {
+	if (RESPONSE_IS_PCI_ERROR(&rtsta) || !(rtsta & PCI_EXP_RTSTA_PME)) {
 		spin_unlock_irqrestore(&data->lock, flags);
 		return IRQ_NONE;
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
