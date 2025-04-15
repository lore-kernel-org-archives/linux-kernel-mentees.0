Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84C22157E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740532; cv=none; b=gDPNylndltclyGcQE5c8bEAtNkyGPKjK60XImXQ5Kc0m0SeyUgO8lcFQKQnX2VP2KRWpdVxtywaYBQkEawMhQxDsoVAxz1NyVWT6jF3kBCFanZdNdTy6GOdMlK8PNgWPBCsn4r0rnvDBXE9pgD1hKx4fM9IAXhwHMHypUk61UrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740532; c=relaxed/simple;
	bh=o6+Eil4uX9ctgJoAE45DqBGTx/za3XLcV45WCQQqpCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bm9hLt82r7wMkHrhAKEkGWvhWJm+ksV628QoX3AZIjdE271qzjft8kPUv3Cc8bldFgw1GFDwu906NRo+v2HCxcN/NUQCnvg59qPWhP2NJoHFoy9znEW3sb5BvoZH+nWj7RkIPoGhwYJGfujYR5yv+OZSxJKQuKFXBnfQqK1K2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBPDcWOh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBPDcWOh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so4227098b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744740530; x=1745345330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=XBPDcWOhzxWPdN12jrBY9wevTuWAzK0v4/iLOwPcCm7wsJkr0GMtRjSfAmYz1oylks
         XuN2WvLPyOWFto6xUWd7xRFeLwJvM4IY6bx4hStsWiWc/yC6sVI2+yWy7xZLmN+spzvT
         SX4RpFqMxKnHVCMOBguIvc4F7xq97/Qq414Ozg6Xpbl1Yyek67G1tYbzuHh9mbJZcK/M
         qrCZ36ZtVnO/PRfPLbLmxjm7M7cLzuCzpcK/olzqIWlfeBEuSVEGx4SN+8yiQEP8vncS
         lxtlaodY4iEK25gX7B5bzWAZEdgvhyoZa1ZFXOYord3UckDzKQuyd8OkPqZysVdxpjN+
         GIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744740530; x=1745345330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=BCVsqFt/gp1we48eFAxO5MFBE8Ja1yIYXYQMc76opXT8H2pZ1PVsssT/T8lbl12vOO
         qWB3QSGXK3/tREdqXhzXXQ+edjLJcBqd6qxKRN0BDouL7NkFJaAFtEIia4aGnHBPz0lZ
         e7GTJC8cHIR+ejqglx1WmKEx9bh1yU7Dxn4bXhjVObuC7bHq2IWe3pwnY5SsL+ml15Z/
         PqxNgcaDwBU4b8dWbZqjQNlJq864Ll9H/2m9Fh0uzRii5Mia+j3Sea6z7doWzbWHbfvj
         +KJaAGq+iPGQCAY+43zOlcK5QYrZr/MXPK0hPwFvITd24q2FuFPDV90UR7m2vyMqw9CC
         KFdw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Go6wA4sjuefv7ovpGPGIQVqqSJ61vvYFI32WZGHHjwunwy+zeo2+oOL02EYmPg1CzcKzbsZoQC/tGlD9Eco/zYz11g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1/YJwkP+nVTfJ3QPl75r2jVt/A64cI7xBx8k/PrujnHb79dCR
	x2oMYPPZ0rjm43AWyBCGn9YUPDe+6mMWrf/fgrgOjEzhlgpUB/u0
X-Gm-Gg: ASbGnctKCEA4aQJZxN/nHRRChFDGQYnGp5lZVGf/zrkJ7/Duz/pE0CfqeHRt27hsfq7
	a5HM0wembaeaGYJ19RKvb/rN+o/NqtpNYZjk/m9UOp3/7FTgz6+XaITg6iZnbh++XbmWl1g7TxA
	Xdyc7eLOVu6bdT3kz9FUEdz/EEWgNabMA/zUD07OdM7e2Qy8FOdrahgKXZ2uST7EKq55g6DwSPh
	n8PqsIncBVIAfsKzOs01wNNcJtOakupBKLy9IDNsNTTN/2903yc/9/alAQiaaSaH/Rna2zYTBRz
	AQO720tl9pobiDap0u7zg5dx8IJKtcpVgZxQU+0+
X-Google-Smtp-Source: AGHT+IF/luC5UtYBRarSDCbcokkCcqL7a2s0ZFLUQ46tDzaJbDGCcs7odrn6licAeJwBb5hbCoCwdg==
X-Received: by 2002:a05:6a00:b90:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-73c1f931237mr625108b3a.8.1744740529892;
        Tue, 15 Apr 2025 11:08:49 -0700 (PDT)
Received: from pop-os.. ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335285sm9103299b3a.170.2025.04.15.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:08:49 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: duttaditya18@gmail.com
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>
Subject: [PATCH 5.15.y] jfs: define xtree root and page independently
Date: Tue, 15 Apr 2025 23:38:39 +0530
Message-Id: <20250415180839.397326-1-duttaditya18@gmail.com>
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
Closes: https://syzkaller.appspot.com/bug?extid=ccb458b6679845ee0bae
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
Tested using C reproducer here: https://syzkaller.appspot.com/x/repro.c?x=113bb250e80000
(given in the dashboard link above
UBSAN is not triggered when this commit is there.
It is triggered when it is not.

 fs/jfs/jfs_dinode.h |  2 +-
 fs/jfs/jfs_imap.c   |  6 +++---
 fs/jfs/jfs_incore.h |  2 +-
 fs/jfs/jfs_txnmgr.c |  4 ++--
 fs/jfs/jfs_xtree.c  |  4 ++--
 fs/jfs/jfs_xtree.h  | 37 +++++++++++++++++++++++--------------
 6 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/fs/jfs/jfs_dinode.h b/fs/jfs/jfs_dinode.h
index 5fa9fd594115..e630810a48c6 100644
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
index 937ca07b58b1..5a360cd54098 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -671,7 +671,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * This is the special xtree inside the directory for storing
 		 * the directory table
 		 */
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		jfs_ip->xtlid = 0;
@@ -685,7 +685,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * copy xtree root from inode to dinode:
 		 */
 		p = &jfs_ip->i_xtroot;
-		xp = (xtpage_t *) &dp->di_dirtable;
+		xp = (xtroot_t *) &dp->di_dirtable;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
 			memcpy(&xp->xad[lv->offset], &p->xad[lv->offset],
@@ -714,7 +714,7 @@ int diWrite(tid_t tid, struct inode *ip)
 	 *	regular file: 16 byte (XAD slot) granularity
 	 */
 	if (type & tlckXTREE) {
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		/*
diff --git a/fs/jfs/jfs_incore.h b/fs/jfs/jfs_incore.h
index a466ec41cfbb..852f4c1f2946 100644
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
index dca8edd2378c..7d19324f5a83 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -778,7 +778,7 @@ struct tlock *txLock(tid_t tid, struct inode *ip, struct metapage * mp,
 			if (mp->xflag & COMMIT_PAGE)
 				p = (xtpage_t *) mp->data;
 			else
-				p = &jfs_ip->i_xtroot;
+				p = (xtpage_t *) &jfs_ip->i_xtroot;
 			xtlck->lwm.offset =
 			    le16_to_cpu(p->header.nextindex);
 		}
@@ -1708,7 +1708,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
 	if (tlck->type & tlckBTROOT) {
 		lrd->log.redopage.type |= cpu_to_le16(LOG_BTROOT);
-		p = &JFS_IP(ip)->i_xtroot;
+		p = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 		if (S_ISDIR(ip->i_mode))
 			lrd->log.redopage.type |=
 			    cpu_to_le16(LOG_DIR_XTREE);
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 3148e9b35f3b..34db519933b4 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -1224,7 +1224,7 @@ xtSplitRoot(tid_t tid,
 	struct xtlock *xtlck;
 	int rc;
 
-	sp = &JFS_IP(ip)->i_xtroot;
+	sp = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 
 	INCREMENT(xtStat.split);
 
@@ -3059,7 +3059,7 @@ static int xtRelink(tid_t tid, struct inode *ip, xtpage_t * p)
  */
 void xtInitRoot(tid_t tid, struct inode *ip)
 {
-	xtpage_t *p;
+	xtroot_t *p;
 
 	/*
 	 * acquire a transaction lock on the root
diff --git a/fs/jfs/jfs_xtree.h b/fs/jfs/jfs_xtree.h
index 5f51be8596b3..dc9b5f8d6385 100644
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

