Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF1C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 13:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090D48133B;
	Sun, 13 Aug 2023 13:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090D48133B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ofNTcR3b
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yaoKnr5uIQ0U; Sun, 13 Aug 2023 13:22:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EA4BD8132D;
	Sun, 13 Aug 2023 13:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4BD8132D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A41AAC0071;
	Sun, 13 Aug 2023 13:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35B00C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 13:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12D360B6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 13:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12D360B6F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ofNTcR3b
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7O6b6dOu6DS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 13:22:10 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49A1B60B60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 13:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A1B60B60
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686f0d66652so3375189b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691932930; x=1692537730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rlAU7V+DE92fJK3cHH1A9FDJdGr7RffOpPtSmRFtDOA=;
 b=ofNTcR3bb3mvxTKI8DCM7SH4HItpLkos7Td4MnrUAyjxsmAwli7lDq7uTy5s95Zh4p
 SvBAxVDbRQQuEWdWPKs65HJRzcXXWPrB9321MW38gvU7y1D4t9MGk6ZFBmPy/6+gP+EW
 rRbb+kxp5m+w++H8F5grAM/Fyyj2AJu0uZGywyjDtmEO9fH5nGc2+sZPHunbU/CKPkxO
 dUAzObiaAhozGgnBOQZ26H5hmx/lTQukBA5Jx1Hx7inNJtTAQORwrmy5mhqIeq4/khjX
 31P7A3d8uDPVuCouEtWvW0Y/tIaWfLeNUk/vSM6yrl7k9TUfhCX++ZAan3tS+dwEcWhL
 +Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691932930; x=1692537730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlAU7V+DE92fJK3cHH1A9FDJdGr7RffOpPtSmRFtDOA=;
 b=W8jO2rOa2D2Ue0Sw9Tg9uuYGcvuku90aMnehEtQQroSC950wG6dDUfZZlj+8hhUhcC
 bvaueuV34LAeU2REAKEsdtoc+CTZqqmuCcjwg3YK/yrmvlYh3ONqKhncU85+e74aDUhp
 d2gwH6TK2wKDp+yGVicdXOzEnR5KOiL88EqRUB1iLRhouf1zFSYZJ8YpyyQgh3+SUxdz
 wG1cN63FJyE0uzSHaz96KJBXROdof6RpDt1k0Kvv54cSi14fkkcF9mIbh7jqO5Uqamxd
 yOIbl+7eGHNzzjhwXF809gXmxthxf10APMSsdjNKsh/a36mYaanvL4h5OSXoF7oLjwAc
 QBKg==
X-Gm-Message-State: AOJu0YxxyQaVxJplUrhMLQybFOiU0i0qojR6B1t4hubrfmOKoUcOt2b4
 +yAk3U0wtEK+ectQTzTFxQc=
X-Google-Smtp-Source: AGHT+IHdYotXitNOi15TdfxNA3enRhYX4Vvgdv/GuDs9z6Ks2Qh1fh2iimVWPqCSEnJmIf8liIZ/aw==
X-Received: by 2002:a05:6a00:ad3:b0:687:20d6:fade with SMTP id
 c19-20020a056a000ad300b0068720d6fademr10219995pfl.20.1691932929613; 
 Sun, 13 Aug 2023 06:22:09 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1022:f538:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78008000000b00682868714fdsm6419824pfi.95.2023.08.13.06.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 06:22:09 -0700 (PDT)
From: coolrrsh@gmail.com
To: fenghua.yu@intel.com, dave.jiang@intel.com, vkoul@kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma: device: Remove redundant code
Date: Sun, 13 Aug 2023 18:52:03 +0530
Message-Id: <20230813132203.139580-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

dma_alloc_coherent function already zeroes the array 'addr'.
So, memset function call is not needed. 

This fixes warning such as:
drivers/dma/idxd/device.c:783:8-26:
WARNING: dma_alloc_coherent used in addr already zeroes out memory,
so memset is not needed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/dma/idxd/device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 5abbcc61c528..7c74bc60f582 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -786,8 +786,6 @@ static int idxd_device_evl_setup(struct idxd_device *idxd)
 		goto err_alloc;
 	}
 
-	memset(addr, 0, size);
-
 	spin_lock(&evl->lock);
 	evl->log = addr;
 	evl->dma = dma_addr;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
