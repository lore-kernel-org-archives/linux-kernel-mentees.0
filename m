Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5900C8BEE
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Apr 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745768753; cv=none; b=rNFAyXJ+jRLBc6Hd1N3egG0u/DAC6I1hHahs0FcJmCmiipTcDku9MHZloJiSQzbbHaf6N5Y6obkXdBDs6y+NPkzyXeLTIKuLhJLxAhJ2xQdy3BWrpShCNK2DvyOMUbaD06ZX2+TRqeNI49VwFsw6Jg8bV/0qJULp56XMdJvGxHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745768753; c=relaxed/simple;
	bh=LufHX8cplyfE6bc3Dn2Ou09jkpw5XXBf57Zw6V2jIiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=osmuKoicNj9aFCvd0Ha7QIby9u/tR7FY5mozcEbAjOGu+R2LXPGp9M3DXPHfY4KfMsZcXnt42y8Kkd+E1T2hSnca4bS28pK8PyyxU3TAF7J7/ovxuQi8XrMUqLtT+/WPcuVa6d+qMyPWcOt65Cjv5h/QeVxWky2QATuyh11RUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwjSOPlp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwjSOPlp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso2623970a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Apr 2025 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745768751; x=1746373551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7H3CGfdKeQmA85O5UdRYRS4BFpY8FBaukpxGzuJa2pw=;
        b=NwjSOPlpYHrA/hChGGHG0EeCc54CzB/KfcBhQ4DQT/amSpQj6Vm1hGKu9DObdRIxt3
         OQyRjVZZwyaqAIugTfpC/vcWnB6uu4yuwgIemgVJHZPTpEfx9bdgJHS8zRTX3HHSG0B9
         AHwFOSIcZ0aQbqFKw3yCHQazscWn4IfPAMoqOAIwZk/LQTe9CS2UCtHiMXQDcaMgq9Ex
         s2Nk1wAWGPeVb85Uem8Mkv3ZupbV0BfIPpFSqWN6E3/AYImPBU+DOJjyltLUjTxFdrRm
         WtLLy6ZycSiVgRX6hy2OsMmZguKAilxsLa9mOYNz0iuYD6317ty3xn1BBh2k5j3sCAWF
         0Z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745768751; x=1746373551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H3CGfdKeQmA85O5UdRYRS4BFpY8FBaukpxGzuJa2pw=;
        b=LBdYdx6M13tiwTMpK0E9szCQZMTZY7p0tcDjmJtuxMPpqRPof0mLuUcuz3Hrkq3ZYb
         AkYb50e8PvEAIJhPb3U41TB3XPQW1LuwIjIWZHeyVywXuUOD86iiM8iwWm0tA3RBsWdm
         XTU4h7lHa5W12zVuKBxoahyrKFJGuMo4/TA3tClrYNwRWDa84yWzp1NbcwYfhHFxsFg/
         q9c7PKwR4bDu8NC0hVMyAVamHfYxA2lvSswTkzp2npOdUxPvsZlRwa1jjTBmwirCn+r5
         DPXnk3u/uwbE+duEDjZMkC/Jcik6MGSDPcl7TP92OpzFeTdaWWNo+v0S+CB0xfJzqPYF
         FuFA==
X-Forwarded-Encrypted: i=1; AJvYcCWUcbiFsINfl7j5u87uOu91WGrGQffFdEta5xxTHsDM0w1YDJoNCwQjYJ0A/aKlKMOEP2m0IqjwFb8Io6ehVNWjk6Zpkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcJ3IdnGXrzaDWcosWpLA+FBe/lkFuvmeD3UdanjOEnTp4CcUL
	sPLwTDS6uXnI48Nmj1eLD8WP48sbw6XsoVCxrptFCLTjL3DY+e48
X-Gm-Gg: ASbGnctopgRr0f0+VUAIsE1PjQiVPcMoIJar4SGompK9xQehuHzM4LtFDtTUO+EfToL
	H0b+1bZIRxdO/E63HYVtKdZsWipDC2VgbboGrHE2uLujvF9gydgFZbc9Tf0+BsFTJXIelCZcP4n
	TXhDrqXDI8qUdkoiMmDHwN67FrdOecUlVJXe5zXmISEmpfBKZ3393YiZwvexuywA/vvDmB6Bmvi
	9aeVpezvrDXLNC8fZW5V72JPxT0aGOP5v89yNQxmOGZUevsA7Hcrn1d6VZKqbnF3TszoY/y0RKj
	U3Fo/BI23epMFM07G/ROHpxV5t98akUOsjt7Z+oU
X-Google-Smtp-Source: AGHT+IHq2GiUl5vh/UvTDKS1xTbiflFzANxoGSTrV8i3Ib/1ucPJH61yRREAPJwoNXjzQr/QYwNVuA==
X-Received: by 2002:a17:90b:520f:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-309f8d9b077mr14393324a91.14.1745768751500;
        Sun, 27 Apr 2025 08:45:51 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061acdsm7150108a91.16.2025.04.27.08.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:45:51 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>,
	syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH 5.15.y] jfs: define xtree root and page independently
Date: Sun, 27 Apr 2025 21:15:39 +0530
Message-Id: <20250427154539.96678-1-duttaditya18@gmail.com>
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
Reported-by: syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
I am sending this as per the suggestion by Greg to submit backports for
all the relevant stable trees:
https://lore.kernel.org/stable/2025042210-stylized-nearest-ea59@gregkh/
This patch has been applied in >= 6.12
and has been backported to 6.6: 2ff51719ec615e1b373c1811443efe93594c41a9
I have already sent a mail for 6.1:
https://lore.kernel.org/stable/20250427153045.90396-1-duttaditya18@gmail.com/

syzbot checked the patch against 5.15.y and confirmed that the
reproducer did not trigger any issues. check here:
https://lore.kernel.org/lkml/67fea0bf.050a0220.186b78.0006.GAE@google.com/

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
index c72e97f06579..0e7d2662f202 100644
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
index 6c8680d3907a..3a547e0b934f 100644
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
@@ -1710,7 +1710,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
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

