Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038E9CD4F5B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Sep 2023 12:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6481183E59;
	Fri, 22 Sep 2023 12:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6481183E59
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KmwKt5cT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwH7uEqKMuf8; Fri, 22 Sep 2023 12:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3C7CE81DE0;
	Fri, 22 Sep 2023 12:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C7CE81DE0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E92CC0071;
	Fri, 22 Sep 2023 12:04:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FBE0C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 12:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5488E417AE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 12:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5488E417AE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KmwKt5cT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEWnb5j5Ml3N
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 12:03:59 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B6494176D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 12:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6494176D
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-690bc3f82a7so1906142b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695384239; x=1695989039;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mc7XJnmS11CqbPLUjM8JwVx1WO2hj/AOe6VqltwSQAE=;
 b=KmwKt5cTI8h1s5NzlEUqxCvHh4qTD1FFOWshj5T8K2MbViP6smxvRgQ8yun5Ta6L+C
 BRgbzu4HaRH8VDtTyySSbGlMm8Z8N3OG+LgrecjaNXZ+bhmV1RXqoSgxq88KDW9eXb3W
 7qjgkkOR9zu22twHCL/k0UPkTPSsulaUEIEIPxo9dpgHr97FWvnNORXtqNI7vbrcPuuW
 qif8/Pg3mhgOaw1oQ7/eCmMGayjU+TVDevu3ejGPsKS5X/4QuqhLCxrAd5kOCwbXv1oD
 qwB/4NS0qeFXxwQo1ZNt0e6OcRxJBKZAy0sX8706oDIy9rlSMxmK7jRbGwM2VqeSkI+w
 VtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695384239; x=1695989039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mc7XJnmS11CqbPLUjM8JwVx1WO2hj/AOe6VqltwSQAE=;
 b=wdqxvGFhaRFl6OeJZa2URcIWXdU6JZN5ite9+i9zkl5tXc7N2+jplWADch64fh+ZSx
 YnQ9lfuVnko5ZAx1cBXYyTBjlnta+lDSvvfEHqX3VHNL3e6In/rs04+am+HJNTyNE4UB
 MxEM+mMM+6rURhU9TLbsJZQ0rT+KURX9TRHq5ZPtAx/7wAW/kmInIEUaTDyAF5DuDhAf
 dQn4IcxR4By9YJzLOYIvsO58z1aNzX/uN9HWTmk10sypr/vdow80cXSFo47nSrU2tQ1P
 LzQ+ueQVoapvuBEoKeS4dCDFkl1IKdy0v1UsSmt+7C66iJQweWgdl13s8E3hG6v0y4sy
 xvKg==
X-Gm-Message-State: AOJu0Yxdjp9pd5QgLblCGPSQmjDvIUjgKy8XGZB31Y0crXIMfrCFcCET
 M0wOwYa5bHGX1B7ucnxYA3M=
X-Google-Smtp-Source: AGHT+IGlTQWmfBmuHR/BYvJUK5cUqZbXxjfnyQ8/HUHaO1sGhUhAe3+W2yPuELQd5nbQr6DptDUNfw==
X-Received: by 2002:a05:6a20:5486:b0:14d:7130:7bb3 with SMTP id
 i6-20020a056a20548600b0014d71307bb3mr10430003pzk.13.1695384238425; 
 Fri, 22 Sep 2023 05:03:58 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.174])
 by smtp.gmail.com with ESMTPSA id
 131-20020a630289000000b00528db73ed70sm3042486pgc.3.2023.09.22.05.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 05:03:57 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH v2] jfs: fix array-index-out-of-bounds in dbFindLeaf
Date: Fri, 22 Sep 2023 17:33:41 +0530
Message-Id: <20230922120341.10805-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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

Currently while searching for dmtree_t for sufficient free blocks there
is an array out of bounds while getting element in tp->dm_stree. To add
the required check for out of bound we first need to determine the type
of dmtree. Thus added an extra parameter to dbFindLeaf so that the type
of tree can be determined and the required check can be applied.

Reported-by: syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=aea1ad91e854d0a83e04
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
V1 -> V2: Updated dbFindLeaf function.

 fs/jfs/jfs_dmap.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a14a0f18a4c4..cee5164c4879 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -87,7 +87,7 @@ static int dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno,
 static int dbExtend(struct inode *ip, s64 blkno, s64 nblocks, s64 addnblocks);
 static int dbFindBits(u32 word, int l2nb);
 static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno);
-static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx);
+static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, int type);
 static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 		      int nblocks);
 static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
@@ -1709,7 +1709,7 @@ static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno)
 		 * dbFindLeaf() returns the index of the leaf at which
 		 * free space was found.
 		 */
-		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx);
+		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx, 0);
 
 		/* release the buffer.
 		 */
@@ -1956,7 +1956,7 @@ dbAllocDmapLev(struct bmap * bmp,
 	 * free space.  if sufficient free space is found, dbFindLeaf()
 	 * returns the index of the leaf at which free space was found.
 	 */
-	if (dbFindLeaf((dmtree_t *) & dp->tree, l2nb, &leafidx))
+	if (dbFindLeaf((dmtree_t *) &dp->tree, l2nb, &leafidx, 1))
 		return -ENOSPC;
 
 	if (leafidx < 0)
@@ -2920,14 +2920,18 @@ static void dbAdjTree(dmtree_t * tp, int leafno, int newval)
  *	leafidx	- return pointer to be set to the index of the leaf
  *		  describing at least l2nb free blocks if sufficient
  *		  free blocks are found.
+ *	type	- type of dmtree
  *
  * RETURN VALUES:
  *	0	- success
  *	-ENOSPC	- insufficient free blocks.
  */
-static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
+static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, int type)
 {
 	int ti, n = 0, k, x = 0;
+	int max_size;
+
+	max_size = type ? TREESIZE : CTLTREESIZE;
 
 	/* first check the root of the tree to see if there is
 	 * sufficient free space.
@@ -2948,6 +2952,8 @@ static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
 			/* sufficient free space found.  move to the next
 			 * level (or quit if this is the last level).
 			 */
+			if (x + n > max_size)
+				return -ENOSPC;
 			if (l2nb <= tp->dmt_stree[x + n])
 				break;
 		}
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
