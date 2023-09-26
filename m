Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EFDE7D242
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Sep 2023 07:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E6461443;
	Tue, 26 Sep 2023 07:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E6461443
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=idmHzOAr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrSxQdeDzwvt; Tue, 26 Sep 2023 07:13:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B9FA61282;
	Tue, 26 Sep 2023 07:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B9FA61282
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 357B8C0071;
	Tue, 26 Sep 2023 07:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A46AC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 07:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 085E26143B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 07:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 085E26143B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofmeY5xiFTtE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 07:13:22 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D656761282
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 07:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D656761282
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-692a885f129so4811078b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695712402; x=1696317202;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87h+GCoyZ7JZR2wvMjstdo1iWnzZgP8yLm+iAVVZmYo=;
 b=idmHzOArnrpWBQ0T9o5+O90Q6VqBWGefoneR2lHfoxrYOehcGtw6uYhS0ZiGscm304
 KatTPs98dhgoAYdmePdrDw4+XY3gv8lEs5/kz1pehCXq3L9yGDjWFsewYw1Mg37dOkZt
 zH9aJ5JdADK/0l23auZsvJIm4TI4Wzg2aCeR+Ld+1O77JA1eAvHAGx/D3d53Rz2SN7b5
 FZBq1w9/4L7s3xrAqoC6FKMe7LW2p/ROvkDxEIH3EC0WY9MTjrHhT3fcqfH0aCpmJGhh
 11Z+jrgTHLOJbnWL6hAE6nHTQPLeJ/SkRX3DW8TtjwL8E5j++wkIgIB8a2SUlbBEyViE
 p3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695712402; x=1696317202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87h+GCoyZ7JZR2wvMjstdo1iWnzZgP8yLm+iAVVZmYo=;
 b=Xsr6TKrZ+9wY4N3u4D+1aUfu4TGjvxcqGmrgoPXgLSuKjPzFUjoQJyPOyCEvNDqlE1
 MX5jrhP/6tLspiLDGeDy0m1CD6T+HxHZ2MOoz0kV43jRy8VKMeVG8HwILxnFYafuIfmz
 hQZimT03nPn6/Inxbyu+3AgT13YlfsHofH/pCVYMnpCvM1TbuvCIsNNeq3bUBi8riudZ
 g4m3P3e/o5RXEbr1fNJTinVhynQiWklpp0xMiFfVoCr3JvleHBHYeWlS+stOE3/ghGhp
 1ZvUkHfAVqGxy4kVre9Ajz6KhkWYcMSoLMoS4CnUhAifYazPPzeBZmYFEoM1f2GEH9db
 0qUg==
X-Gm-Message-State: AOJu0Yyds0Kdb9y4MkO0rCo1UC+yRoAFaVHcG/Q4STW90FvcZT/78MUo
 jhY41Ok4xp5I8b9qcwbL72M=
X-Google-Smtp-Source: AGHT+IFhvxFIiuQd2QO1RrEAsFmMm/JK3ySEofVvDMnYzpK0MvEckVCTgtX6J87sbWMTaneW/v/2sg==
X-Received: by 2002:a05:6a00:24cf:b0:68f:e810:e86f with SMTP id
 d15-20020a056a0024cf00b0068fe810e86fmr7799333pfv.28.1695712402114; 
 Tue, 26 Sep 2023 00:13:22 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.178])
 by smtp.gmail.com with ESMTPSA id
 t12-20020aa7938c000000b00686236718d8sm9177662pfe.41.2023.09.26.00.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 00:13:21 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: shaggy@kernel.org
Subject: [PATCH] jfs: fix array-index-out-of-bounds in diAlloc
Date: Tue, 26 Sep 2023 12:43:12 +0530
Message-Id: <20230926071312.14086-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org
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

Currently there is not check against the agno of the iag while
allocating new inodes to avoid fragmentation problem. Added the check
which is required.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_imap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 799d3837e7c2..ace8a1506380 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -1355,6 +1355,8 @@ int diAlloc(struct inode *pip, bool dir, struct inode *ip)
 
 	/* get the ag number of this iag */
 	agno = BLKTOAG(JFS_IP(pip)->agstart, JFS_SBI(pip->i_sb));
+	if (agno < 0)
+		return -EIO;
 
 	if (atomic_read(&JFS_SBI(pip->i_sb)->bmap->db_active[agno])) {
 		/*
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
