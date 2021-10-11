Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538F3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1040B60EB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1040B60EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1397402C2;
	Mon, 11 Oct 2021 18:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAx8YAXDggZI; Mon, 11 Oct 2021 18:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D2BF9401E1;
	Mon, 11 Oct 2021 18:07:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A82EFC0011;
	Mon, 11 Oct 2021 18:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 704A3C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EDC8818CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kw-njS-fsUOI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:07:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF9DC818C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:07:06 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so79491pjw.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Avo3ZmMmZNUWQ5EbnH2gCv75rJX+nPxKzCshM1jhNkE=;
 b=XU0Bm06oTzc+kDweoSZWKTbZfXcxYBFjbb2qZj8hRUwUobVINapWvCas7dpwGUvfJw
 mWUNs+I0hl6vjawT8/YGO0XgeEm5/hcFVB51PzhCXf8W2CtwjsOipckWUa9jM9v1CWzy
 0dObet2/YKK6sF+5gpqKjS1jVe/JGQkj68mDql1vadeAHRW/Yb7WWWKE0fok9AjTyKGh
 Mgg/WwCADP1DEZArTnttZRNK4sjc+mANaJMit16c+wPAQCGmHTc/EMqcXDwnKKlwP3lF
 5d5lpFmUEyU3rDeePMURYjan/efqJZCUN+4IV3Y9FYQGKS/SYT8umlXOkXxEGFJdXaHP
 tziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Avo3ZmMmZNUWQ5EbnH2gCv75rJX+nPxKzCshM1jhNkE=;
 b=XRJf3KYxR1MqXEoJeHCF+UK+bMAwzZYWvGk+mnIG5B7a/rzl4VYfzuGIUF4Esozk4f
 1U58wL4oD30qUbHEJwfC96Oswd7uKtxZ8DSkKDlegjDy2BLS4UfBFWL1cLSeqMk6Nmpr
 ktHL3Iggx2XBCv4U/TVZXzqKpCQ5S126glyARmVmflGkdgurH1z+Nu1YvZuX+ROFH7ae
 0oBFgVnqrcBPlLuXgQMhiF2ldkdRr8rTCPmdU+2g7qv9lPQuzmCrx2yKviwmdbeUf7q6
 TIeE1IMbuz7uUl19cWMDGbt3LsRzpnWLyN3rmUJH4xnhSKwsXSQJCXZV/MefymY2JH7R
 aWYQ==
X-Gm-Message-State: AOAM533cQxlhQdck/esO7J3hINt/SoWJS80Tcd343WP8CGJ5adRr8eqO
 GERa79QruMvE3g7pW/7AgGQ=
X-Google-Smtp-Source: ABdhPJwblQisXQhgJ0cSa+0Jwyf/uAjHurg3rsbuIqTqyFI+rOTVSPKbf9K0BLqq7G3V4PNEt65PtA==
X-Received: by 2002:a17:902:ed0b:b0:13f:4318:491a with SMTP id
 b11-20020a170902ed0b00b0013f4318491amr4577255pld.4.1633975626234; 
 Mon, 11 Oct 2021 11:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 m28sm9020677pgl.9.2021.10.11.11.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:07:05 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 15/22] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Mon, 11 Oct 2021 23:36:38 +0530
Message-Id: <84ab7a23647e0673d99a8cf59e9c89af9b862354.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
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
