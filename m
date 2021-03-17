Return-Path: <SRS0=IeUe=IP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7238C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04BA64E90
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04BA64E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73BA943061;
	Wed, 17 Mar 2021 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2qnhEvQPb4k; Wed, 17 Mar 2021 20:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BCB241507;
	Wed, 17 Mar 2021 20:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C694C000B;
	Wed, 17 Mar 2021 20:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC5D1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBAB6F98B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9agrUk31dwO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 340CE60699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:52:55 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y200so1968561pfb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AKYuNNautpL9GsX/k1t8k+V+WDGi+hWf1VRFyREZzWA=;
 b=fUA+sXj1+G1P5qNMQ3kV1By1YcbAhSpxmiKaAIT23Y1EzpBNXfRcRBmgdK17ce3hub
 0keIoX//U2oSDv731hzNmxXSUCF82cav2yP2CKAdC2kNZUIRnStPyLaZU84yARuYvxNb
 bJn+0Cn3o4OMuHE7fMdvQL3q1o5I+AT0651yDaEsO+g/Y0mm/NZrRD5PoRYVYf6CBmCy
 YQ0A7+Jb2NACN97GCRD8jy744trAaVTwv5VuelkHknxUzvpRTBo4PYjJ8iLATc1u1t90
 CrMD4Mcjg5nS/JL9eO0AMwOSMyNllGprQPsULRWUYN1RTPc6uP+LKFam7LhJOGap1LJ4
 RO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AKYuNNautpL9GsX/k1t8k+V+WDGi+hWf1VRFyREZzWA=;
 b=h8TzE1wLugNGwqVJPR9wO5X0c0AyhPmmQKxOdn219gemCdAxpAULtp/xx8Wcm91BNM
 RCvkYbWXJwgCwfgKieTfKD5o/z88aa8fzPb8M2xS52LnBQNv3ssDhY7c1D84To5Db3pr
 sitqI2xibjBKLaMg8og+6+NbK9Lr3Tt+WHYMI5VqwVUsknShQgKYh8T1UILnX1rc2DdQ
 SXmDSk0WFIrvd0h5e4Dxrir9kLYP02VjeHOoUy+7qZzkLoZ7JcG4uE5zDCTr0hK9Jj9o
 9yzJt/+BPNmuGt4x9cNg3eSPJzAOrlTSWqLHti23TH5bOvsy/4Y7fnVaVdV7qxJHhdW0
 3sDg==
X-Gm-Message-State: AOAM531ZTByHxZ9puxpVv6kyB0ltK6s5SLgijfhmoONCkPOkaGiPfHfg
 7RhR7uhq8ravOUlPa5zcp+8=
X-Google-Smtp-Source: ABdhPJy8/iAz5N4nZP350sq8I/6aYbGirU4K/scVbtxPllJU5LobeunkJS+SKR9TRE0ZhRvTrrMjIA==
X-Received: by 2002:aa7:9841:0:b029:1f8:f326:a3b3 with SMTP id
 n1-20020aa798410000b02901f8f326a3b3mr785222pfq.7.1616014374477; 
 Wed, 17 Mar 2021 13:52:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:85d1:b0af:d6ff:42d8])
 by smtp.googlemail.com with ESMTPSA id d24sm30137pjw.37.2021.03.17.13.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 13:52:54 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] block: fix comment syntax in file headers
Date: Thu, 18 Mar 2021 02:22:45 +0530
Message-Id: <20210317205245.24857-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: axboe@kernel.dk, yashsri421@gmail.com, linux-ntfs-dev@lists.sourceforge.net,
 ldm@flatcap.org, linux-block@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are files in block/partitions/ which follow this syntax in their file
headers, i.e. start with '/**' like comments, which causes unexpected
warnings from kernel-doc.

E.g., running scripts/kernel-doc -none on block/partitions/ldm.h
causes this warning:
"warning: expecting prototype for ldm(). Prototype was for _FS_PT_LDM_H_() instead"

Provide a simple fix by replacing such occurrences with general comment
format, i.e., "/*", to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210312

 block/partitions/ldm.c | 2 +-
 block/partitions/ldm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index d333786b5c7e..14b124cdacfc 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * ldm - Support for Windows Logical Disk Manager (Dynamic Disks)
  *
  * Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
diff --git a/block/partitions/ldm.h b/block/partitions/ldm.h
index d8d6beaa72c4..ffdecf1c6bb3 100644
--- a/block/partitions/ldm.h
+++ b/block/partitions/ldm.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * ldm - Part of the Linux-NTFS project.
  *
  * Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
