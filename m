Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BCBA34
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Apr 2025 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745767860; cv=none; b=h1U4fj4SLiZuDL9BI1LaKNmiMHwtz/B8KvFd7cUDIzhvoy3RddKTfxYclGT/mMat4ysYK+6C85iFLDV1Gc0cf4DF+V4n+aP4efpcOBTZ9JNPaAomEFLbJDteZKdNGe3PG89G8rn93uAxfDA534rgirmMC/jAxvYu/vb0yMHG4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745767860; c=relaxed/simple;
	bh=edPLn501f0ij89POdqKIVj6Bny2sztnFljJiPHHgJ2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XY+szBotRd05K3LLkJogolr7hqb6d4G2S20T3yz0QZtQNx41lBu0KHtmnHzOBLDgxtfwKfzk65hkvZzhC7Gs2wByLdn89DLOva2QAKzwx2ICwk0ymDyxV1BDg+pWll3osV3juSl8WPQtTmKl3sWhOb2T8id+aPxYu8CRgALLkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/mc3MxI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/mc3MxI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f4c06e9fso33672905ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Apr 2025 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745767858; x=1746372658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu0Qpy32cRnk6C00xSOjQCLbKsFc+72PU0/zEKOJ4OM=;
        b=b/mc3MxI1GRHUVVIGjbXxaGlVYPRJ2Cap4i8BG0IB3JAQSkTbRIHkRf4y+koWcdT97
         mai/AuGBB9GV/5/nMCE40F+HtmTOHfJhwjQ6NH5x6wWBmR94oJijCyq9964buvwD39Yb
         oaOf0hrWYmx+Q9xMg6nXBtUGLuCkQwwzvG8w9lqVj7dqhJRCRFKQ9QYQEy6XEpOdWxLu
         V16I0ucQThB/co3CvVwbrtAlkfAtS5pwDfOKgKxpqO7Pmr1Le5q0Lh19kVYaipGNs1f1
         k+U4vc2mBQejQ6+CM7HH/kD1vFh5pNcD1RDqghfTS1MIO0RnrIjlLIPVD7EeE4oM9abP
         06OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767858; x=1746372658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu0Qpy32cRnk6C00xSOjQCLbKsFc+72PU0/zEKOJ4OM=;
        b=Rdao5tXdS5he90rwvFhTpGCnDEv4xRVJKfV8By63Q9Q1zjNdHBwe5w+YuMg4YNRNzu
         ufyUNy4RQ82MFkSAGOjq/4RuPABI+5rvCBVGMUFF8G4q50/JVAE5DxbEGUA4aBSQKnH0
         ju7WNYx6ADSwtYgNJcAZ7Fwu422wd1C8zrhFc/vHJAhbxFBl8xTfCdzIN3Av26U4lPvV
         kNX2dEb3IqkQOf8MnOyaQt3dz8oouNGbc8KTbx/CXrlqMn/NAGVbRxt0ABxUPFjik2uX
         r2Bxl2PU3SC4p7P7XpxtYt7lgB8kuXDxGzfAj7ypMHjU/R2RznqqFLoOl2c73bx+zEtg
         2dnA==
X-Forwarded-Encrypted: i=1; AJvYcCUppheWf3Z8qmJBTFYKbEj2NMEgToGTRpjfXPnOOIWGBl+yhyemiItB/NyX0bEz+gVPoVA0g+At4k3YXEXEeuO/JMBxtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsaUvMYC20V8yd0AHVzZSUJ5xXoh3xu4RbB+enraZlXlJeoo9F
	e2cRI1J3mXTJdWPfYkfDaS60jdfzcgcX91ylzmxU2Jf0CGe2rS8f
X-Gm-Gg: ASbGncsATp6ewLS3ngKbbh3/vQtudL/CAKat4tmt+zblvjImQH/A/sFuYM2H6jBln7Q
	Coqo9h0i+DH5XFIPgSRRCXUtYKJfSV/qfOg40bzm6mSh0NNpYT606gofVr36y0NF9OwKujeg3gM
	1LL1kqSTnPo0pvaDuBuw+T5ig4BmJnumTv+8qyfiD1ALCLuL2V4mcCrHhUNgzzVBTb7M/8TEK6Z
	uwoC5tAg9EUoOylzaRmGhlBtbPKak9UOPD2mwWB1U6bZHO105db074UxvF6yVStGaRRcYfSuRcV
	DTpbgZrxZjjWsVE08qsonu9i9lDhsNUAiSVhZfeI
X-Google-Smtp-Source: AGHT+IE/AIPDBZfGFz35irHOS6OjtJ7DIKKb7ayqgzlXDAwBQDxaFEfBWXiyKUieJQy7r8AAx0p9Cw==
X-Received: by 2002:a17:903:985:b0:221:751f:cfbe with SMTP id d9443c01a7336-22dbf95a2b7mr150173215ad.19.1745767858142;
        Sun, 27 Apr 2025 08:30:58 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db99d3sm65549225ad.53.2025.04.27.08.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:30:57 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>,
	syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com,
	syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com,
	syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com,
	syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH 6.1.y] jfs: define xtree root and page independently
Date: Sun, 27 Apr 2025 21:00:45 +0530
Message-Id: <20250427153045.90396-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Kleikamp <dave.kleikamp@oracle.com>

[ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]

In order to make array bounds checking sane, provide a separate
definition of the in-inode xtree root and the external xtree page.

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
(cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
Closes: https://syzkaller.appspot.com/bug?extid=7cb897779f3c479d0615
Closes: https://syzkaller.appspot.com/bug?extid=6b1d79dad6cc6b3eef41
Closes: https://syzkaller.appspot.com/bug?extid=67f714a53ce18d5b542e
Closes: https://syzkaller.appspot.com/bug?extid=e829cfdd0de521302df4
Reported-by: syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com
Reported-by: syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
Reported-by: syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com
Reported-by: syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
I am sending this as per the suggestion by Greg to submit backports for
all the relevant stable trees:
https://lore.kernel.org/stable/2025042210-stylized-nearest-ea59@gregkh/
I will send one more mail for 5.15.
This patch has been applied in >= 6.12
and has been backported to 6.6: 2ff51719ec615e1b373c1811443efe93594c41a9

syzbot checked the patch against 6.1.y and confirmed that the
reproducer did not trigger any issues. check here:
https://lore.kernel.org/all/680e4455.050a0220.3b8549.0082.GAE@google.com/

I also tested the patch manually using the C reproducer:
https://syzkaller.appspot.com/text?tag=ReproC&x=15b291ef680000
(given in the syzkaller dashboard link)

 fs/jfs/jfs_dinode.h |  2 +-
 fs/jfs/jfs_imap.c   |  6 +++---
 fs/jfs/jfs_incore.h |  2 +-
 fs/jfs/jfs_txnmgr.c |  4 ++--
 fs/jfs/jfs_xtree.c  |  4 ++--
 fs/jfs/jfs_xtree.h  | 37 +++++++++++++++++++++++--------------
 6 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/fs/jfs/jfs_dinode.h b/fs/jfs/jfs_dinode.h
index 6b231d0d0071..603aae17a693 100644
--- a/fs/jfs/jfs_dinode.h
+++ b/fs/jfs/jfs_dinode.h
@@ -96,7 +96,7 @@ struct dinode {
 #define di_gengen	u._file._u1._imap._gengen
 
 			union {
-				xtpage_t _xtroot;
+				xtroot_t _xtroot;
 				struct {
 					u8 unused[16];	/* 16: */
 					dxd_t _dxd;	/* 16: */
diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 155f66812934..9adb29e7862c 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -673,7 +673,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * This is the special xtree inside the directory for storing
 		 * the directory table
 		 */
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		jfs_ip->xtlid = 0;
@@ -687,7 +687,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * copy xtree root from inode to dinode:
 		 */
 		p = &jfs_ip->i_xtroot;
-		xp = (xtpage_t *) &dp->di_dirtable;
+		xp = (xtroot_t *) &dp->di_dirtable;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
 			memcpy(&xp->xad[lv->offset], &p->xad[lv->offset],
@@ -716,7 +716,7 @@ int diWrite(tid_t tid, struct inode *ip)
 	 *	regular file: 16 byte (XAD slot) granularity
 	 */
 	if (type & tlckXTREE) {
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		/*
diff --git a/fs/jfs/jfs_incore.h b/fs/jfs/jfs_incore.h
index 721def69e732..dd4264aa9bed 100644
--- a/fs/jfs/jfs_incore.h
+++ b/fs/jfs/jfs_incore.h
@@ -66,7 +66,7 @@ struct jfs_inode_info {
 	lid_t	xtlid;		/* lid of xtree lock on directory */
 	union {
 		struct {
-			xtpage_t _xtroot;	/* 288: xtree root */
+			xtroot_t _xtroot;	/* 288: xtree root */
 			struct inomap *_imap;	/* 4: inode map header	*/
 		} file;
 		struct {
diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index ce4b4760fcb1..dccc8b3f1045 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -783,7 +783,7 @@ struct tlock *txLock(tid_t tid, struct inode *ip, struct metapage * mp,
 			if (mp->xflag & COMMIT_PAGE)
 				p = (xtpage_t *) mp->data;
 			else
-				p = &jfs_ip->i_xtroot;
+				p = (xtpage_t *) &jfs_ip->i_xtroot;
 			xtlck->lwm.offset =
 			    le16_to_cpu(p->header.nextindex);
 		}
@@ -1676,7 +1676,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
 	if (tlck->type & tlckBTROOT) {
 		lrd->log.redopage.type |= cpu_to_le16(LOG_BTROOT);
-		p = &JFS_IP(ip)->i_xtroot;
+		p = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 		if (S_ISDIR(ip->i_mode))
 			lrd->log.redopage.type |=
 			    cpu_to_le16(LOG_DIR_XTREE);
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 2d304cee884c..5ee618d17e77 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -1213,7 +1213,7 @@ xtSplitRoot(tid_t tid,
 	struct xtlock *xtlck;
 	int rc;
 
-	sp = &JFS_IP(ip)->i_xtroot;
+	sp = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 
 	INCREMENT(xtStat.split);
 
@@ -2098,7 +2098,7 @@ int xtAppend(tid_t tid,		/* transaction id */
  */
 void xtInitRoot(tid_t tid, struct inode *ip)
 {
-	xtpage_t *p;
+	xtroot_t *p;
 
 	/*
 	 * acquire a transaction lock on the root
diff --git a/fs/jfs/jfs_xtree.h b/fs/jfs/jfs_xtree.h
index 142caafc73b1..15da4e16d8b2 100644
--- a/fs/jfs/jfs_xtree.h
+++ b/fs/jfs/jfs_xtree.h
@@ -65,24 +65,33 @@ struct xadlist {
 #define XTPAGEMAXSLOT	256
 #define XTENTRYSTART	2
 
-/*
- *	xtree page:
- */
-typedef union {
-	struct xtheader {
-		__le64 next;	/* 8: */
-		__le64 prev;	/* 8: */
+struct xtheader {
+	__le64 next;	/* 8: */
+	__le64 prev;	/* 8: */
 
-		u8 flag;	/* 1: */
-		u8 rsrvd1;	/* 1: */
-		__le16 nextindex;	/* 2: next index = number of entries */
-		__le16 maxentry;	/* 2: max number of entries */
-		__le16 rsrvd2;	/* 2: */
+	u8 flag;	/* 1: */
+	u8 rsrvd1;	/* 1: */
+	__le16 nextindex;	/* 2: next index = number of entries */
+	__le16 maxentry;	/* 2: max number of entries */
+	__le16 rsrvd2;	/* 2: */
 
-		pxd_t self;	/* 8: self */
-	} header;		/* (32) */
+	pxd_t self;	/* 8: self */
+};
 
+/*
+ *	xtree root (in inode):
+ */
+typedef union {
+	struct xtheader header;
 	xad_t xad[XTROOTMAXSLOT];	/* 16 * maxentry: xad array */
+} xtroot_t;
+
+/*
+ *	xtree page:
+ */
+typedef union {
+	struct xtheader header;
+	xad_t xad[XTPAGEMAXSLOT];	/* 16 * maxentry: xad array */
 } xtpage_t;
 
 /*
-- 
2.34.1

