Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72322D7A3
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740592; cv=none; b=sYCrqq0H7oU5wCCeVGeVRBZuyH7tyaUWRKHmCTs//8Ds5wRt6/vxHz7n/UA6/ZloTZYA1W4FP8eyupCozo8pmsLKgStFiKVyCiSemau/ekQIusva24pftr5zzS9fnw1KyqLG8xG3263wLG3F9D5V/qYt++obxgqu0vqBbDNaFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740592; c=relaxed/simple;
	bh=o6+Eil4uX9ctgJoAE45DqBGTx/za3XLcV45WCQQqpCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLNvhX3FmXKT6geB1ExNwzLqxnq0JmBnLBCN54TKuI5wQT1raCSFHjnVezQSQkNllGV6qarGF7xmKiSybjt73hNZHM92xf8A3KYeCltYolqy9m2Y79EYkK/yJuU/Z5P4gPUX+VOo32OZ7TNPTliorlPMMJn6YJNAzTlSjcGx5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg4k1XgR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg4k1XgR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22548a28d0cso85272865ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744740589; x=1745345389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=Dg4k1XgRIW1rkwiYFtj8tZYZ0qvVWAd8PKShxsFP7hfbY6PmZDFEhRzd5imTrjIuw1
         L5Lf23ketu4u6QLlrXNqBX0kIeqKeuKDWuipAoMgNVFl4pT0BUq2V1r/273TMoHSewJL
         Z6+o912aLvIeMEwH/4Xx/7v4cBI9qjiUO4nJFHifh671Qoo9mbL2IHE6eA7OooHMfc7F
         fFIAFZbCXqUiL9MELNjwnRzTffGf/XkfAtrmxgb0sp/YPJZsdDXTPrlSEjcYRMp+jY5o
         XQQTgFuqwX1jSyB7XJGVwFGMLnDctyG6Uwt0fFoDCkgeM1e7TDGF0IUctZcwVDvh3nL2
         CaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744740589; x=1745345389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=Ejl5HlEINLbnkdLw2YtC+i8Fd/0EnQXd4xPgCxBTfFjUwTtUckZh2Im/SzpyyFbt7t
         q+RvvcRyGcTV0YJLdvOegxsbzDdN1GN1XL/5F0OI1THo1ev51AEQ2BrUrccFgHEI13NP
         DYILX/YjlJ82kaoZGsY8BiICiC92tseTDRzwJndC8dyw0RjYc8mRcVwZ1Sazg7N5zZpO
         E9Ej2ioBv/YzhoayvxogH0FOfCAvdLAX2hEd7VlJzVvQ00aANIbM+UwIr+21jcSvXcTI
         Uu9yZQRbU1PMGNAziv9VG/grmqPwDUeXG15SMpqFrgqgkgU2bn/0ZFWeVP99reCOd7qt
         P7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXgGcPLPJWaS985jEMlobQPbbSiNBjQi8RAgMK8hDr/8zLvCbgJxXuvnBq3LxDJ6OnuACfbyKwdiHhmoXt5wxBcr4Mv2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypk08iiVltzbL8chsTOc+FKtvgzVpTY5XKct431f2MhsRknPSj
	Nm9U6ZKH5pCDCVdiyPDdofDxAXNcH0kmnJRECWYg8ye5hIKYtQVIoYLvJKBPzug=
X-Gm-Gg: ASbGncubg+LCnBkT7qgvmy8sGMLPmMH1aKMskGkJ4PNuiTtnYOkOKPrvEy7CKnzRntb
	3rxRVIFLHKT16m1dvi4OW7z2LU/yi87bS51vn6XEDnXd//UIfF544G0t4BPWS88DMZGwqNtMXVG
	DJ7kEJpHM7GWGhSDQ8zaB+CVXfVJmnWZlBtkiMJuZAaUL5mg5qgItMa/0KNpy748noSEL4fsg59
	xVoNLhWrNyjLK8c0clwuZc8QyDf2A2qMwM0IaXltVY/gY0AbpSyY+OQ3ZEWRXMzqRjihv8UWL+o
	uaHEfpicBMLLP5sQHKj3DPL/7XX3+qP8sA/3/wGV
X-Google-Smtp-Source: AGHT+IGiRMMl8214vmhYKtUPPVdgzosHGYwcFCwg1bkiGePvWyjnabZQ2NgIzRK4WcmyyBNxgGSYXw==
X-Received: by 2002:a17:903:3c4f:b0:224:a96:e39 with SMTP id d9443c01a7336-22c318a932bmr1761615ad.9.1744740588905;
        Tue, 15 Apr 2025 11:09:48 -0700 (PDT)
Received: from pop-os.. ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62859sm120475695ad.40.2025.04.15.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:09:48 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH 5.15.y] jfs: define xtree root and page independently
Date: Tue, 15 Apr 2025 23:39:39 +0530
Message-Id: <20250415180939.397586-1-duttaditya18@gmail.com>
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

