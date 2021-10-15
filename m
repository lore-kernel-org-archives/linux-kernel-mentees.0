Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12125C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF68611C1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF68611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888C2405A4;
	Fri, 15 Oct 2021 14:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsMiKQChu8xD; Fri, 15 Oct 2021 14:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 810434011B;
	Fri, 15 Oct 2021 14:46:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D106C001B;
	Fri, 15 Oct 2021 14:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1F2AC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A07A0401BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xnvk4O5_4RC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 039124011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:00 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t11so6525440plq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZJX9CbLMezPavdAEsrkOsiHPTmHr09QIspE6IFIFVc=;
 b=iXTG7MgruvfoISzQMeRGbBt2ad6/7BSmR4i1c1wy+VVD8k+y+QFQjDpVRGodJJARaB
 rDa5mBuKvLkuaNAjwKzsRKp/jZ9BQCX3vfmu9UO49PwTu4nE3j4cv9boiPNIZnNf4FM5
 JcLFF7SwagmeuTdanyYGIqRaR5J9yFyDF8fwB7mDdZ+lR8jk08ccNse8poo8n/XK5kvH
 Sa7wc7IhrlhwJhRdzMn6SvMGIAwfg27LrzHpI49DK2knMHVg0AMavrixa5bAsmrGNK4+
 4DVqk+mlk721j7YqlN/+l94CASLZG3nsHLorK+dwEOjBIMBiQjsge9pJxrpovAzXUhdM
 Az/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZJX9CbLMezPavdAEsrkOsiHPTmHr09QIspE6IFIFVc=;
 b=EvwYLP5MtxgcqpmNDfF7qD9gu0dt2kof4QQCRZ/rbCP2JsExgkiJaMVCE8xRXtCbh7
 MciowyQcnZVRPhGr2djj9ryZ1CX3XlRustHHmVJ5OT1Nwg+m2MG0SVNZllzS7FLgk4aT
 DmUShi6lCSCX7+tl0jLX7dc6F2fK1mQLZqsrfirYKjFZTRkObtHTkkIgJVMgqYRG/pQ8
 5WLUzQSXs3wocBbFt4zDXW1GoBIF67jLQ1+x+lOhwtfQPkuuNZLe/Iv14jOFePc32JBn
 PuuPNfSbU9MqQNb6H286ycBqY1eVXCPKtSLFeuV3nYjlXbH+bvjLZjmO03CnRtyzLHgL
 NUFA==
X-Gm-Message-State: AOAM530I75LN3t54TB/rsW1OmL+GzI85XQxcERL0/4A7zH8YW7ROyaqE
 2JTQgww9FL1CJei0XhH7+QQ=
X-Google-Smtp-Source: ABdhPJzd2mU9TMFIg5GGMN/W6stxEp3fblwUqADMrcyM6e2uYsbW/4c/MWtkdNzq2Zv0qomNn3Tv0A==
X-Received: by 2002:a17:902:6544:b0:13e:dd16:bd5b with SMTP id
 d4-20020a170902654400b0013edd16bd5bmr11591581pln.61.1634309160465; 
 Fri, 15 Oct 2021 07:46:00 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:00 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Fri, 15 Oct 2021 20:08:58 +0530
Message-Id: <0da4dfe7642bf89d954c7062a40566bf28d94da1.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org,
 Nirmal Patel <nirmal.patel@linux.intel.com>
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

Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/vmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index a5987e52700e..db81bc4cfe8c 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -538,7 +538,7 @@ static int vmd_get_phys_offsets(struct vmd_dev *vmd, bool native_hint,
 		int ret;
 
 		ret = pci_read_config_dword(dev, PCI_REG_VMLOCK, &vmlock);
-		if (ret || vmlock == ~0)
+		if (ret || RESPONSE_IS_PCI_ERROR(&vmlock))
 			return -ENODEV;
 
 		if (MB2_SHADOW_EN(vmlock)) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
