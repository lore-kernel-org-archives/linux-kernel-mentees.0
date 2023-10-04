Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B02E8FDCA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Oct 2023 05:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F46813F0;
	Wed,  4 Oct 2023 05:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45F46813F0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i35CgHIV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jG8lzOxlDD2e; Wed,  4 Oct 2023 05:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F12E7813F1;
	Wed,  4 Oct 2023 05:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12E7813F1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D40D8C0039;
	Wed,  4 Oct 2023 05:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7131C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 05:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF2041ED9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 05:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF2041ED9
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i35CgHIV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBDufig1PMLq
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 05:47:25 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49D4341ED7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 05:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D4341ED7
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1c1e3a4a06fso12792505ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Oct 2023 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696398444; x=1697003244;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zsxyl+cgvB20az6pAOhEj6zcICahCJD5e9PCu7NYewo=;
 b=i35CgHIVyHj8R/95uT8FpaSpCgv7uTwjbsELZyV0XL2Imp2dlmiKpPnCiKHs1DfX+G
 ZpSZEgBUVaN0gj9Y24bjpA3VXSS+Y/EY2bIw59T0bwPfBlC+4S99hqg6TTDWODwKq+Al
 2ECFv1DWHX0/ZEF1vZZsRmg182wWEQsHDGu0wuUi9eRiiKnMAYGq74rB8lKvw08Dr1OH
 auVE/6T3Za8T1yhDf6KurRnR/08lJz3h8C510+RORvDGaHJcEzECJr6Tsw5GGjBJabSZ
 ec/9skSSA3pG1MruACy7Tku6791Wik6KwMFc0fJ4gPgGUFURc/FaK+zXMaD2u7RBkBLr
 Laxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696398444; x=1697003244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zsxyl+cgvB20az6pAOhEj6zcICahCJD5e9PCu7NYewo=;
 b=NGAuEOidjamIH8agZ0DzA0zfhMP+I2P3Z22QTgsDs/Z2dAvk0Q8/Q/C0TZTsJD0R1s
 luVTE92BreItsCiVNjGdSwaxBE7cS8e97rhv5bzlvL3seoM69Nxg9BEbnwGCUdVoBiCf
 RfWzht+RZpK1Fozn5Cwz70UV6KleJKlNN2P7jWCj0qyyWapSnzosP1eQ5BrFFVdb2V/p
 twzT5C3YJAJZI1HOBThnqksUpzSme9OeRrN5zVOjGzYGDevXzUa8U9RtUzHcf/R2M9mg
 MO7fWzQMb1112c8jXXDIwkEinNehFKGUV8kiCbYPWRWTi9+0dbPAdOPrWmg4XqA2NKJH
 dypw==
X-Gm-Message-State: AOJu0YxVR58HbLuHJKlxp7AsF8tahHz5pqdPV/Z/eziPeboXq7RvKsxf
 3Ne6g4DatbTsHhurI0rh+S8=
X-Google-Smtp-Source: AGHT+IG3mhIIeNTaduBdTCLgjgOUoe7QYgJDvI3JPdeOSEYfO5qXALn6EjHaFi7WvEOaDwydjEaYjA==
X-Received: by 2002:a17:903:32cf:b0:1c7:56b9:eae with SMTP id
 i15-20020a17090332cf00b001c756b90eaemr1547394plr.32.1696398444432; 
 Tue, 03 Oct 2023 22:47:24 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.173])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170902ab9500b001c5fc11c085sm2631846plr.264.2023.10.03.22.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 22:47:24 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com
Subject: [PATCH v3] jfs: fix array-index-out-of-bounds in dbFindLeaf
Date: Wed,  4 Oct 2023 11:17:18 +0530
Message-Id: <20231004054718.7976-1-ghandatmanas@gmail.com>
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
V2 -> V3: Changed the argument name from type to is_ctl
V1 -> V2: Updated dbFindLeaf function.

 fs/jfs/jfs_dmap.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a14a0f18a4c4..d2a4fced8976 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -87,7 +87,7 @@ static int dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno,
 static int dbExtend(struct inode *ip, s64 blkno, s64 nblocks, s64 addnblocks);
 static int dbFindBits(u32 word, int l2nb);
 static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno);
-static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx);
+static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl);
 static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 		      int nblocks);
 static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
@@ -1709,7 +1709,7 @@ static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno)
 		 * dbFindLeaf() returns the index of the leaf at which
 		 * free space was found.
 		 */
-		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx);
+		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx, true);
 
 		/* release the buffer.
 		 */
@@ -1956,7 +1956,7 @@ dbAllocDmapLev(struct bmap * bmp,
 	 * free space.  if sufficient free space is found, dbFindLeaf()
 	 * returns the index of the leaf at which free space was found.
 	 */
-	if (dbFindLeaf((dmtree_t *) & dp->tree, l2nb, &leafidx))
+	if (dbFindLeaf((dmtree_t *) &dp->tree, l2nb, &leafidx, false))
 		return -ENOSPC;
 
 	if (leafidx < 0)
@@ -2920,14 +2920,18 @@ static void dbAdjTree(dmtree_t * tp, int leafno, int newval)
  *	leafidx	- return pointer to be set to the index of the leaf
  *		  describing at least l2nb free blocks if sufficient
  *		  free blocks are found.
+ *	is_ctl	- determines if the tree is of type ctl
  *
  * RETURN VALUES:
  *	0	- success
  *	-ENOSPC	- insufficient free blocks.
  */
-static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
+static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl)
 {
 	int ti, n = 0, k, x = 0;
+	int max_size;
+
+	max_size = is_ctl ? CTLTREESIZE : TREESIZE;
 
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
