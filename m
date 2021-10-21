Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949E3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C85560F9F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C85560F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F08660628;
	Thu, 21 Oct 2021 15:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4P4DwFpKF1nT; Thu, 21 Oct 2021 15:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 472FF60F0D;
	Thu, 21 Oct 2021 15:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24850C001C;
	Thu, 21 Oct 2021 15:13:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56BD4C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451864072A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsCiaYD6cP1N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 837EF40017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:33 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso788370pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMMca6ogUWXi0ch4Y2WRyLimPI/FUHz8LX6jciCfSL0=;
 b=Ebt87PGCiA5DfC2ykF3q2FI75oUe+I22DKgpYutQWfZKv6HY11WV3QxfBdoZ2IZ/8R
 1dXQQC3ymsHSF7lHENRAW7heU7N3//R7ApODSTy2OPCTm8KgE/AdYPjd7BcjUw/JeXaQ
 G6d0gMcA5ImCvXHdrbfxenldCzozNVINxVpHzZU2dtq0JEiZYMzTAf6eS7YcNzYATO7a
 RFkZdTwYgxCgX5Yb7coZ5yE1oIPHu3K+j7/wBKwKhM9Xp01itiWZJ0+Ob03p93IpGsKR
 d44pWrjLExUCkKCJyqzDEUK0sO+89IQael7QvcRgen995yz6PiWAjLUmDvrkj/EXLhly
 Mjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMMca6ogUWXi0ch4Y2WRyLimPI/FUHz8LX6jciCfSL0=;
 b=OG8O4TLpKXc7yNk4FNEuRTcxCZB9UpN2f67z4A3NGE9yJCjpJKM+qiktriWXEGJP+8
 0J/aZSrHKXIpQ9okgZNQTqa3Lv0DkOWOZVBYkKhza6JIeqPRlh914TFK+OdZvfWpDmzE
 FrI7gixFq5uuNRQQIVq2o+U+q0MeL+U35UXZzQX2hGAP35YlaIFPrqtvV/S4jUde9/U7
 KqXbw2Kv0ls+PCCPk6DWUoYgIABBUcAMc+zS4jRYGCNyuMxaSPbVOycyymaPx5Xf+lgl
 dcynUcmJ4XX85EvxpHBrG+PNPDy31shwigf796V+TfRBY1jXl2Uj9ZcAqYiJppJA2yyb
 TK5A==
X-Gm-Message-State: AOAM53069NFGCVmMxxIjub6YJ2djeECu6Pp1TAY0cNICuYPF4sb4G24n
 2vRclFziaazAjUqVhKO/eyo=
X-Google-Smtp-Source: ABdhPJxlhCnhuhE7I8iz3HkOhUekSEuVNDqklOld2tfE6JglGG840MuyjWtZqqUSBBb9vuA4cFmhqg==
X-Received: by 2002:a17:902:b68b:b0:13a:1239:b8d9 with SMTP id
 c11-20020a170902b68b00b0013a1239b8d9mr5741580pls.25.1634829212923; 
 Thu, 21 Oct 2021 08:13:32 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:13:32 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 17/25] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Thu, 21 Oct 2021 20:37:42 +0530
Message-Id: <5be1fdfdcf4b4a453117ef4dea0f71c9555fac24.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>,
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
index a5987e52700e..bfe6b002ffec 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -538,7 +538,7 @@ static int vmd_get_phys_offsets(struct vmd_dev *vmd, bool native_hint,
 		int ret;
 
 		ret = pci_read_config_dword(dev, PCI_REG_VMLOCK, &vmlock);
-		if (ret || vmlock == ~0)
+		if (ret || RESPONSE_IS_PCI_ERROR(vmlock))
 			return -ENODEV;
 
 		if (MB2_SHADOW_EN(vmlock)) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
