Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67E7E8FDD1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Oct 2023 07:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ECC60F41;
	Wed,  4 Oct 2023 07:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21ECC60F41
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=myJ+s/rR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jlqt8AMCGakm; Wed,  4 Oct 2023 07:40:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 01B5A60C34;
	Wed,  4 Oct 2023 07:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B5A60C34
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD436C0071;
	Wed,  4 Oct 2023 07:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A9E6C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 07:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3234541F42
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 07:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3234541F42
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=myJ+s/rR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYb5gOyPdlra
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 07:40:53 +0000 (UTC)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1567541EF1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 07:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1567541EF1
Received: by mail-pj1-x1041.google.com with SMTP id
 98e67ed59e1d1-27762a19386so1191443a91.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Oct 2023 00:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696405252; x=1697010052;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5fUH5S4uz1EWWFstq5oEXMZSXkqH1sqcQ+Nf7tmZbwI=;
 b=myJ+s/rRB8rLmRKqcL+xzPboie3Y3IjDfdsB9DvIaIxx7T8dK/PMxtOis2/lOAy38l
 ceCHVs9Udqdl8xce8ihKEGKa8QBkIZG2SvhKhk9WavgaJW5jFpK3SjnbI8CnqQxAG7It
 s0Q7DpNnYSU51M/cc/Wj7LXIUY/lcG2xti0075uBeb/cMQ7y6+bmjA7rPdq6APy8Ni70
 lbz4iJ55YGlyriOSleg9tEakfRMu6Er3F9NccrHbV/4Mzjw55yOkhUTtuobYAGdm/MjB
 z5KpJQU5bMKRkvYOJFDT0QoXXUNtS30bJ7Y3kprZz8hhdVVKsjei3zh2+Bwvwlwdco0f
 qrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696405252; x=1697010052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fUH5S4uz1EWWFstq5oEXMZSXkqH1sqcQ+Nf7tmZbwI=;
 b=pC1ruZtUYlv9dB9Urp8s3hmTvxvm251wnCEk4Mfev4LbxwzL3PWLTRZAtQdD7gJSp8
 4SaFZTT+iNSuts//ShejpKDpC4XoLqia5ddlFW6aIJTY3FgLzMwx9U5xF/axKFHCs7Ow
 Sv70si6WfkrlZIZuGmpwamjYZb7K4iklbCwd39ZbZlDgbbCnqGiXmUsMwGJrAXcKmSe8
 bNy+KfatVdgKzhLPGFPPaWWeZphFOPl87wqtfrrCBodr9xzc2jwceX3HY06t6G9RB6/d
 AvmcY74svTRSYkadnOY0suTdGSPtKgErf39OUNA/yM/T+nsHMFTC3+GPDoY+mo24V3k3
 g7tQ==
X-Gm-Message-State: AOJu0YxDda7Bp1xlJMGnH500cpkxu2lqmK5BhFWBA9QUzzj75Sn24Xyc
 O+sS6KLDqpywQLfjnBmcOzw=
X-Google-Smtp-Source: AGHT+IHZ6NRVZIFRqS3Cq1TdvSNu0HELw/5i7B3boICHTTeSqupmrGFgyK8BXOHgZtJ89wiytpIPNQ==
X-Received: by 2002:a17:90a:3f16:b0:279:1367:b9a3 with SMTP id
 l22-20020a17090a3f1600b002791367b9a3mr1447237pjc.4.1696405252410; 
 Wed, 04 Oct 2023 00:40:52 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.173])
 by smtp.gmail.com with ESMTPSA id
 20-20020a17090a199400b0026b12768e46sm894332pji.42.2023.10.04.00.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 00:40:51 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH v2] jfs: fix array-index-out-of-bounds in diAlloc
Date: Wed,  4 Oct 2023 13:10:40 +0530
Message-Id: <20231004074040.12233-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+79d792676d8ac050949f@syzkaller.appspotmail.com
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

Reported-by: syzbot+79d792676d8ac050949f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=79d792676d8ac050949f
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
V1 -> V2 : Added check for higher bound of agno
 fs/jfs/jfs_imap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 799d3837e7c2..c0cf74e7392b 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -1319,7 +1319,7 @@ diInitInode(struct inode *ip, int iagno, int ino, int extno, struct iag * iagp)
 int diAlloc(struct inode *pip, bool dir, struct inode *ip)
 {
 	int rc, ino, iagno, addext, extno, bitno, sword;
-	int nwords, rem, i, agno;
+	int nwords, rem, i, agno, dn_numag;
 	u32 mask, inosmap, extsmap;
 	struct inode *ipimap;
 	struct metapage *mp;
@@ -1355,6 +1355,9 @@ int diAlloc(struct inode *pip, bool dir, struct inode *ip)
 
 	/* get the ag number of this iag */
 	agno = BLKTOAG(JFS_IP(pip)->agstart, JFS_SBI(pip->i_sb));
+	dn_numag = JFS_SBI(pip->i_sb)->bmap->db_numag;
+	if (agno < 0 || agno > dn_numag)
+		return -EIO;
 
 	if (atomic_read(&JFS_SBI(pip->i_sb)->bmap->db_active[agno])) {
 		/*
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
