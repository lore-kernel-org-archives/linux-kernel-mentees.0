Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A73C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC67361181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC67361181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A334081B;
	Fri, 15 Oct 2021 14:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7c3Rwwe1yTc; Fri, 15 Oct 2021 14:46:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E3466407C5;
	Fri, 15 Oct 2021 14:46:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFB2FC000F;
	Fri, 15 Oct 2021 14:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6EA0C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A3F83B60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiwjmA88r72d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 193F983B57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:32 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id l6so6527216plh.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOpzKqtZkl4vpPBZR8uQl2s3BPZXOsp3vKlUaVIS/Mo=;
 b=lGnDCLP8y6cK8sv7p2OZlrGk97vBTKAG2qRs3qpGUCsOeOSA+8Eg6eKhbQ9Ur8G4AK
 QL3e95caq6ledLj+vqpKoKy9JEpKMfivJ1341LnWux3fnFzCNGsYnGJanxZqaFkVwBR6
 bX13DDXre68T7KAPeSVanJN4EiAbGsgROJ11EyNQ2/KLuwki3eHUwn5AP76wFBU5WEkM
 2VhnhGfiFSiJrau7UAG3h9p7aDnKvjDNFj3ZMcovitC/Bfx0XzA6blFPC0jZQ9w133yj
 80Ru/QQuyuIjxeebyzEja50/QqoI0u2KuJXOdJVBfI14y67dSZVOCqpcI2652vEuwLYK
 V88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOpzKqtZkl4vpPBZR8uQl2s3BPZXOsp3vKlUaVIS/Mo=;
 b=c91XnsL+NYT3Y/4TEWc4sP7sJlyfQFPsJQhArnYN0ZCTqxDsxU2INDG/yXx4OildZk
 x/Qd4HUlw9stS8z/Idzo9Thj8NdZWXFjLzLPJoC0pCBbCTygF4UCwBjuJb4UsEbAmR34
 ZG4C9o8JnODuXlG5ohOr0uY7NFqzXjyaTlRYatPfK5UWWLBGgSB4SXZ1plUQ7k9NdE2X
 SompnQkO1RoqmQjBzBcxYlfzgy6cGZT4e6xbVbEx8GVcdTz8Mr6t3F7Vk5ik93upkpB1
 CbXT/KKGmVSpMTp1l1mzKCyzAXclPDOoQQqAdWyEdQmxvYaWXIg61MTU8FVwjziMFhrt
 pfbQ==
X-Gm-Message-State: AOAM530P6kJo3NC7w+sFBNuByjUzuFm0rFNsukbBYE9qmQMrL5VJI0TL
 SsNF/tljmHyyCESOXkhjgWI=
X-Google-Smtp-Source: ABdhPJyYyqfcsJzI243JmXVG3+21XjY11IqHy3sc/D6aNXGZkvJA2D+wvBQJSu7RAMcZHo+4OnX3Ug==
X-Received: by 2002:a17:90a:5d89:: with SMTP id
 t9mr5623662pji.21.1634309191523; 
 Fri, 15 Oct 2021 07:46:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:31 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 20/24] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Fri, 15 Oct 2021 20:09:01 +0530
Message-Id: <a6bb07c191901d98a90944598d7d6939df18443b.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Sean V Kelley <sean.v.kelley@intel.com>,
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
