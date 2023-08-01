Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E713C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 15:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C57934055E;
	Tue,  1 Aug 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C57934055E
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uub44S7G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Al1IRfkctRz; Tue,  1 Aug 2023 15:59:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C433C405A8;
	Tue,  1 Aug 2023 15:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C433C405A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4D6CC0072;
	Tue,  1 Aug 2023 15:59:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2823C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC6F240129
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC6F240129
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Uub44S7G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3MkNgWFiu7l
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:59:06 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C3E340209
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3E340209
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686f25d045cso3965761b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690905545; x=1691510345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r8o0I7bFXQoXFBsz+yibAQciwoQ0SJuiPD2PCWU7Otw=;
 b=Uub44S7G5XTNBy2dGdavccZncFCbbvHkhOkp4BaauD/bbItRPLE7kciaVVN0dK3r2S
 /LL5WFJ21zlsVCeBC5aAIMLpy6KQoUSgd11wqkYQloJwtGuNelKHQjwbAkCVNXu2v5cd
 /c94tYTpFGQ3yqEL90uMQlweLNtRqd6uGltFaRuBouUO4Zyr//2C86CzodU1Lk72PlgZ
 ZjTXOQC6K0+/hOnaKa5H2pYF9JUBB/cubcywFEaqKA8nlAZwUPqPHhVg6QY6KgBQMnjo
 Z8IKnBAeo+LngrtM8JO8/MydM4epst3k/8+OYBit4zBMmN18YCYm83hszSRIrsU5wq75
 ci/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690905545; x=1691510345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8o0I7bFXQoXFBsz+yibAQciwoQ0SJuiPD2PCWU7Otw=;
 b=kQ7lurOWwpk7rwRM/qqWHk5dtnFU0bSU1j1/DWxe3A8VSe78ESn5Oz72/ZEE7EdmuZ
 oEfLyDfRLDPaltww0B+n5Hvn+SKy4ePm+Em8V3834Q3DSK6PPKNNrABYfrFUbGuS6HJR
 D9o34cV2/KvbXn6WfOzeImVzGcsDinmRJ5TuVbqM3Ivmz+EcP+MPtxWvSy8ijfWPZzWE
 O9/QCuhnTlOsOYeNToaZla3dkXdVZW4QHCPdw1GBn+sI4yAg0ejNmYXhbERpAWx2wQY/
 DKOQBgo36HY/8YSjT7mzUgJoda+rLL2+8qMYSA6EZmMvk/1hMTrtGG7cyhRsiVmq2yRA
 P/Yw==
X-Gm-Message-State: ABy/qLZkR/pP3XM7dVSNXgu0eq5GJFGFsXeqTgx+oDDEy3vvnOGqgEZW
 k3B0BmTQ779BdpWrf8N2UR8=
X-Google-Smtp-Source: APBJJlEtXowFwkc4FOkij4g4rGFxTUIlYcIn941XhpISwMvMx+UpJ6LXLW9pVb9qsntfJieSX+qvlg==
X-Received: by 2002:a05:6a21:6da1:b0:13d:697a:c31c with SMTP id
 wl33-20020a056a216da100b0013d697ac31cmr9136804pzb.27.1690905545276; 
 Tue, 01 Aug 2023 08:59:05 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.177])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056a00271900b00653fe2d527esm9520998pfv.32.2023.08.01.08.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 08:59:04 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: salah.triki@gmail.com,
	luisbg@kernel.org
Subject: [PATCH RESEND] fs/befs: fix shift-out-of-bounds in befs_check_sb
Date: Tue,  1 Aug 2023 21:28:23 +0530
Message-Id: <20230801155823.206985-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
 Manas Ghandat <ghandatmanas@gmail.com>, linux-kernel@vger.kernel.org
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

The consistency check for the block_size by using the block_shift caused
integer overflow. Thus a max limit to the block_shift was defined named
BEFS_MAX_BLOCK_SHIFT in befs.h. Also check for the block_shift was added
so that overflow does not occur.

Reported-by: syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/befs/befs.h  |  2 +-
 fs/befs/super.c | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/befs/befs.h b/fs/befs/befs.h
index 7cd47245694d..5490024adb33 100644
--- a/fs/befs/befs.h
+++ b/fs/befs/befs.h
@@ -13,7 +13,7 @@
 
 /* used in debug.c */
 #define BEFS_VERSION "0.9.3"
-
+#define BEFS_MAX_BLOCK_SHIFT 31
 
 typedef u64 befs_blocknr_t;
 /*
diff --git a/fs/befs/super.c b/fs/befs/super.c
index 7c50025c99d8..f2aeb2ed6e77 100644
--- a/fs/befs/super.c
+++ b/fs/befs/super.c
@@ -88,6 +88,17 @@ befs_check_sb(struct super_block *sb)
 		return BEFS_ERR;
 	}
 
+	/*
+	 * block_shift check added so that overflow does not
+	 * occur during the block_size check
+	 */
+
+	if (befs_sb->block_shift > BEFS_MAX_BLOCK_SHIFT) {
+		befs_error(sb, "block_size too large. "
+			   "Corruption likely.");
+		return BEFS_ERR;
+	}
+
 	/*
 	 * block_shift and block_size encode the same information
 	 * in different ways as a consistency check.
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
