Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66269CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Oct 2023 12:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B5D404B9;
	Tue, 17 Oct 2023 12:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B5D404B9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYMjCyCf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWksjmydPSHs; Tue, 17 Oct 2023 12:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF1640004;
	Tue, 17 Oct 2023 12:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF1640004
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D375EC0071;
	Tue, 17 Oct 2023 12:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49BA1C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 12:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD7282027
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD7282027
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VYMjCyCf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2hc3UK2twz7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 12:20:30 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2C881341
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 12:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2C881341
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1c9d3a21f7aso44854895ad.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697545230; x=1698150030;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rr3aW7LK1XAhrtCj3229DIhxXbjMtybVhITPYZZVzq0=;
 b=VYMjCyCfq3KfPCDUkCkx2L0pIlZmFNl2swrfP7P9wAguZe0hIe1VfLzkRyiGZ7NOya
 Hw1QFKB6Wuce8jXzFnTwglY2wczlRvgRxuFPzIsx1whOOLUo/ELaWW03nYciYYFH/bQ9
 u155sPhqiznbEVziY0GOvaE39NlMO8ksD3uHrWkbcQWkGQAQ+bXZi7glteZRy2li6Pwi
 X6WCoTqgOM9dpncjYvGxR/tegjuY2ItypHse5/0yHK41z7EGC4qwXScOhn8IYm6vv+JI
 idu3V1uS6SBTo0Zs80qN0yWOENPKliwFjbrPJrW+eo0UFLzvrz1Ftj+nqMs1xR1NRkow
 n5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545230; x=1698150030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rr3aW7LK1XAhrtCj3229DIhxXbjMtybVhITPYZZVzq0=;
 b=Bt15hVVjG6HySpkUGGQQGq0bIR834uCvFA6gX6OdcVvA2LWXori/qLspmv1v8oEIuy
 iU7cqMBMDHl/XtEiZC+VxKb6j+Rb+/Ht8P5MrDdhoocVwu4J350ga455Cj+Ab0af0MHL
 ralsnjBkLLNvLtPcacvr2Ana7/6yu/es4FFtm83luE1VLrEodqkNjL+qfk4LgfBm7M6D
 hfyx7TcthsAoGgtcpCUmgMPcoUJTfliz3PqHH1oAyCC/ZKDkSdv/+jNAj5y4PE+SfAql
 YgbDm1nwT95ume1vld800xSQ2UPF4BhuACyUrHGnOo7CYLvZ+sJhBSEQIZjM4tvRn0U0
 tvlg==
X-Gm-Message-State: AOJu0YyomTmKIqM9IwtW2T79ch6E6+Rp+NX/LtcIC/SuOFjczKLZPgV/
 KzOWZXFLHjWl3WiN8cpQElE=
X-Google-Smtp-Source: AGHT+IFJzi8P08ZvJ6HuW6FFT+GWNbpO2WFeyN5U6zh3XLZArnSJZAZwBC+SNpOiOW3G0+1tqmqiCw==
X-Received: by 2002:a17:903:32d0:b0:1ca:1be4:bda4 with SMTP id
 i16-20020a17090332d000b001ca1be4bda4mr2196950plr.4.1697545229477; 
 Tue, 17 Oct 2023 05:20:29 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.174])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902eecc00b001bbab888ba0sm1383541plb.138.2023.10.17.05.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 05:20:29 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH] jfs: fix array-index-out-of-bounds in dbAdjTree
Date: Tue, 17 Oct 2023 17:33:56 +0530
Message-Id: <20231017120356.55322-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: syzbot+39ba34a099ac2e9bd3cb@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org,
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

Currently there is a bound check missing in the dbAdjTree while
accessing the dmt_stree. To add the required check added the bool is_ctl
which is required to determine the size as suggest in the following
commit.
https://lore.kernel.org/linux-kernel-mentees/f9475918-2186-49b8-b801-6f0f9e75f4fa@oracle.com/

Reported-by: syzbot+39ba34a099ac2e9bd3cb@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=39ba34a099ac2e9bd3cb
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_dmap.c | 57 ++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 88afd108c2dd..57fba21994c3 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -63,10 +63,10 @@
  */
 static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 			int nblocks);
-static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval);
-static int dbBackSplit(dmtree_t * tp, int leafno);
-static int dbJoin(dmtree_t * tp, int leafno, int newval);
-static void dbAdjTree(dmtree_t * tp, int leafno, int newval);
+static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval, bool is_ctl);
+static int dbBackSplit(dmtree_t * tp, int leafno, bool is_ctl);
+static int dbJoin(dmtree_t * tp, int leafno, int newval, bool is_ctl);
+static void dbAdjTree(dmtree_t * tp, int leafno, int newval, bool is_ctl);
 static int dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc,
 		    int level);
 static int dbAllocAny(struct bmap * bmp, s64 nblocks, int l2nb, s64 * results);
@@ -2096,7 +2096,7 @@ static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
 		 * system.
 		 */
 		if (dp->tree.stree[word] == NOFREE)
-			dbBackSplit((dmtree_t *) & dp->tree, word);
+			dbBackSplit((dmtree_t *) & dp->tree, word, false);
 
 		dbAllocBits(bmp, dp, blkno, nblocks);
 	}
@@ -2182,7 +2182,7 @@ static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 			 * the binary system of the leaves if need be.
 			 */
 			dbSplit(tp, word, BUDMIN,
-				dbMaxBud((u8 *) & dp->wmap[word]));
+				dbMaxBud((u8 *) & dp->wmap[word]),false);
 
 			word += 1;
 		} else {
@@ -2222,7 +2222,7 @@ static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 				 * system of the leaves to reflect the current
 				 * allocation (size).
 				 */
-				dbSplit(tp, word, size, NOFREE);
+				dbSplit(tp, word, size, NOFREE, false);
 
 				/* get the number of dmap words handled */
 				nw = BUDSIZE(size, BUDMIN);
@@ -2329,7 +2329,7 @@ static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 			/* update the leaf for this dmap word.
 			 */
 			rc = dbJoin(tp, word,
-				    dbMaxBud((u8 *) & dp->wmap[word]));
+				    dbMaxBud((u8 *) & dp->wmap[word]),false);
 			if (rc)
 				return rc;
 
@@ -2362,7 +2362,7 @@ static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
 
 				/* update the leaf.
 				 */
-				rc = dbJoin(tp, word, size);
+				rc = dbJoin(tp, word, size, false);
 				if (rc)
 					return rc;
 
@@ -2514,16 +2514,16 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
 		 * that it is at the front of a binary buddy system.
 		 */
 		if (oldval == NOFREE) {
-			rc = dbBackSplit((dmtree_t *) dcp, leafno);
+			rc = dbBackSplit((dmtree_t *) dcp, leafno, true);
 			if (rc) {
 				release_metapage(mp);
 				return rc;
 			}
 			oldval = dcp->stree[ti];
 		}
-		dbSplit((dmtree_t *) dcp, leafno, dcp->budmin, newval);
+		dbSplit((dmtree_t *) dcp, leafno, dcp->budmin, newval, true);
 	} else {
-		rc = dbJoin((dmtree_t *) dcp, leafno, newval);
+		rc = dbJoin((dmtree_t *) dcp, leafno, newval, true);
 		if (rc) {
 			release_metapage(mp);
 			return rc;
@@ -2554,7 +2554,7 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
 				 */
 				if (alloc) {
 					dbJoin((dmtree_t *) dcp, leafno,
-					       oldval);
+					       oldval, true);
 				} else {
 					/* the dbJoin() above might have
 					 * caused a larger binary buddy system
@@ -2564,9 +2564,9 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
 					 */
 					if (dcp->stree[ti] == NOFREE)
 						dbBackSplit((dmtree_t *)
-							    dcp, leafno);
+							    dcp, leafno, true);
 					dbSplit((dmtree_t *) dcp, leafno,
-						dcp->budmin, oldval);
+						dcp->budmin, oldval, true);
 				}
 
 				/* release the buffer and return the error.
@@ -2614,7 +2614,7 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
  *
  * serialization: IREAD_LOCK(ipbmap) or IWRITE_LOCK(ipbmap) held on entry/exit;
  */
-static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
+static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval, bool is_ctl)
 {
 	int budsz;
 	int cursz;
@@ -2636,7 +2636,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
 		while (cursz >= splitsz) {
 			/* update the buddy's leaf with its new value.
 			 */
-			dbAdjTree(tp, leafno ^ budsz, cursz);
+			dbAdjTree(tp, leafno ^ budsz, cursz, is_ctl);
 
 			/* on to the next size and buddy.
 			 */
@@ -2648,7 +2648,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
 	/* adjust the dmap tree to reflect the specified leaf's new
 	 * value.
 	 */
-	dbAdjTree(tp, leafno, newval);
+	dbAdjTree(tp, leafno, newval, is_ctl);
 }
 
 
@@ -2679,7 +2679,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
  *
  * serialization: IREAD_LOCK(ipbmap) or IWRITE_LOCK(ipbmap) held on entry/exit;
  */
-static int dbBackSplit(dmtree_t * tp, int leafno)
+static int dbBackSplit(dmtree_t * tp, int leafno, bool is_ctl)
 {
 	int budsz, bud, w, bsz, size;
 	int cursz;
@@ -2730,7 +2730,7 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
 				 * system in two.
 				 */
 				cursz = leaf[bud] - 1;
-				dbSplit(tp, bud, cursz, cursz);
+				dbSplit(tp, bud, cursz, cursz, is_ctl);
 				break;
 			}
 		}
@@ -2758,7 +2758,7 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
  *
  * RETURN VALUES: none
  */
-static int dbJoin(dmtree_t * tp, int leafno, int newval)
+static int dbJoin(dmtree_t * tp, int leafno, int newval, bool is_ctl)
 {
 	int budsz, buddy;
 	s8 *leaf;
@@ -2813,12 +2813,12 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
 			if (leafno < buddy) {
 				/* leafno is the left buddy.
 				 */
-				dbAdjTree(tp, buddy, NOFREE);
+				dbAdjTree(tp, buddy, NOFREE, is_ctl);
 			} else {
 				/* buddy is the left buddy and becomes
 				 * leafno.
 				 */
-				dbAdjTree(tp, leafno, NOFREE);
+				dbAdjTree(tp, leafno, NOFREE, is_ctl);
 				leafno = buddy;
 			}
 
@@ -2831,7 +2831,7 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
 
 	/* update the leaf value.
 	 */
-	dbAdjTree(tp, leafno, newval);
+	dbAdjTree(tp, leafno, newval, is_ctl);
 
 	return 0;
 }
@@ -2852,15 +2852,20 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
  *
  * RETURN VALUES: none
  */
-static void dbAdjTree(dmtree_t * tp, int leafno, int newval)
+static void dbAdjTree(dmtree_t * tp, int leafno, int newval, bool is_ctl)
 {
 	int lp, pp, k;
-	int max;
+	int max, size;
+
+	size = is_ctl ? CTLTREESIZE : TREESIZE;
 
 	/* pick up the index of the leaf for this leafno.
 	 */
 	lp = leafno + le32_to_cpu(tp->dmt_leafidx);
 
+	if (lp > size || lp < 0)
+		return;
+
 	/* is the current value the same as the old value ?  if so,
 	 * there is nothing to do.
 	 */
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
