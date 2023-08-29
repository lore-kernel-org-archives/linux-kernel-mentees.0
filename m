Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F54FC6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Aug 2023 18:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B79D0414EE;
	Tue, 29 Aug 2023 18:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B79D0414EE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KTSGu0CK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4o9iymuTHni; Tue, 29 Aug 2023 18:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A1A36401A3;
	Tue, 29 Aug 2023 18:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A36401A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7768DC0039;
	Tue, 29 Aug 2023 18:00:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D68FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 18:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 671D5600B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 18:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671D5600B8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KTSGu0CK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQzFJZCFtRSD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 18:00:34 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1393060E65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 18:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1393060E65
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68a520dba33so3746749b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693332033; x=1693936833;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HHaSrUHWKq22c6/csllPkR1MWun8gSPfHwy/CrQ/MWw=;
 b=KTSGu0CKXXQ4TrpuPUKwSZMRyKjn4BtVs/Mw7NWCI3ebSlOTqkP7ThI7YKNdq3Y5yc
 5Nha28IMmRwL6hGOFh9mn53rZ+J6viPIia21cK7rEIaU7DN1N1CzM3x569gQpvSzlS+c
 ThEWCRGE/cVypmeFPPZu77y5ZUy1kUYUUj4OjKQ1/DGLbzfWmUT8akCX1VHyCVRAfwQH
 5A7zZxmAs2FZD8gPtr777aJI8e7rVHZevD9IYizrbiLBIz6Gco9yv6yS4c4bw+n3lmex
 SBYib2m6r3e+K7KEF1bBdhYQVOEP5lwjat4b8Qy+nieW16vrKH2kC72sRz3ItJqKf/y3
 p36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693332033; x=1693936833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHaSrUHWKq22c6/csllPkR1MWun8gSPfHwy/CrQ/MWw=;
 b=lu51utQFgtSZE+Sz47x7S2Md6uTzG3wuR100ZHkbbG+g/EFnEBXxUYKYce9OSU9Ton
 JFOwl2pwc6uFKUPX+w2zcL99WuDvwbUNVzP3Zu3MEktetYyI2g6D0lThXpdHlDtjL1iC
 CHXTmj4FFhD5EK+Cpqwz4AxfsjjZN7dDyCk1xRz4Z/XpTYyi20sR6s8uB/0LVWj8Hpll
 NVE4x+t9ggFcNRfF0lVHZz+Mf+JRNHy+jgCpEJKIiwbAplOv+cjzeiA3nxpdy++rWNxF
 M2hv8fO0I9a2dhaHOCzYPf+v+whxZYPJCFj05YFl82Do4NKp3HlE5ykD4bmZOqBu/zop
 s9Kw==
X-Gm-Message-State: AOJu0YyammcOQLjc+89LsYLl3zOhY7OXqe299lknVOVFyy6QLQKEmAW4
 AVmdgcemhKc3f9v0IyPWevk=
X-Google-Smtp-Source: AGHT+IET8lPq9rFGe1yJQbX1R9V7hGIScp5mNLrdAlzxu0lN3q+6e6vQtRLyrk6QhK7LWOOwuyBrww==
X-Received: by 2002:a05:6a20:7f86:b0:134:8d7f:f4d9 with SMTP id
 d6-20020a056a207f8600b001348d7ff4d9mr50257pzj.52.1693332033202; 
 Tue, 29 Aug 2023 11:00:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:100e:2f74:981c:2bef:d96d:9de7])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a62e805000000b00689f10adef9sm8782870pfi.67.2023.08.29.11.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 11:00:32 -0700 (PDT)
From: coolrrsh@gmail.com
To: fenghua.yu@intel.com, dave.jiang@intel.com, vkoul@kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] dmaengine: idxd: Remove redundant memset() for eventlog
 allocation
Date: Tue, 29 Aug 2023 23:30:27 +0530
Message-Id: <20230829180027.6357-1-coolrrsh@gmail.com>
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
v1->v2
Renamed the subject line
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
