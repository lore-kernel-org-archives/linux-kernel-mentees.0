Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A13A8CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747012; cv=none; b=AVvwjrTwjQXiIN6c2TX+/IaaibdngNXCPQ3ojnhiaevk5o5kZCh/h5OAjfKA2DHUeu2G5qz7Mhtd6g5arIW8/w6iwQwkwS/Ljh4mWOt8saL7M9BRgEga0KIP3Hm2AKedZIss5cR/P/c7J88KOo8m1BCSrpzrZLWTUknC32Qva14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747012; c=relaxed/simple;
	bh=CH3Q4mZC1NmlZIsFwg6vDRv9m2p5wKSARo25MCdeeZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XpGxbp4Ew7V8KLb9VyLhqZX2UHhDR0OejCYWgDHN4x4rSGR530IsBC1yFp0i0mBx0U8TWP9XSuN3wYEJE2DOkluH6Dtv4HCwYZQA41mjSdRQ+rKLfF03EEPRPEIO4GlEHIrHgpvWOxn/iS/WtNkDaaiFN6+QrraBJgDUHpnp+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqGhtPNg; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqGhtPNg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0920F408C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 18:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeoVp9vEQ1hP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 18:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C4C5400B5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4C5400B5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XqGhtPNg
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C4C5400B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 18:36:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso11708695e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 11:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723747007; x=1724351807; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt76OlTMgOTV1PjOkL70MRE2Kp+dw68kf6to76VKlEc=;
        b=XqGhtPNgRQmfAGHw7iV5+btYlt1epRZjkAbjkjitaYuUac6QyR8+x86/P5P7463Hvz
         SZGgtwGOIDk+GhdGcrokXqL5dHUPmrCV/lPZAeXO4fDxhfMep2HT3TpPc0llJ5RWbuTY
         pb4G+JkM+hPDONCkRxxanNwq2TtKFelrKaSqGanxwR8KUcNu+GNFTYs4b8KdXgojAm+e
         H4A09Nv4mCRdow7c+ZRk4G/UVwChAP+1wl6Q/z/efeV/DWAGRBI1NCWvNQtSTK9NsiAG
         gzosguCqKPtvB/ALPLd03e68I+Dmchz4+cYa3Yd8ptHrioIqdsOLTBHg0mcem5Dnf67U
         3VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723747007; x=1724351807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt76OlTMgOTV1PjOkL70MRE2Kp+dw68kf6to76VKlEc=;
        b=BzhT1agxayASaPgv+iW105J2f5ENJGXYhXnC6IRWA+wSYQs4w6jxrPWtq8g7jX+2z4
         1yooRR5hck0YgnozQDaD03OkHRtg080kTFmyKmS+ZxJJCtWBF2/FEqhO6tK9Lj4ruE58
         Q67ChZoNqtscs3VvtNLKxlZAJJoqVsXLiP6JOZL0W2kh3uW/xZdL+4Z2wwoKI9OJ0g+2
         qtt2DqmfZ8MjXOH9dCCXLtpGPlX1sQr4NNX6hs8EvqAm13uw8r0Ou0HXG+pIV4fl+rHL
         hf1f3hmOqLoeXIbMeUJgjNRkFDYNWbpg09Po94piYVGeo3S0d2wJLMPs8q0efZ5ZsMhc
         ajnQ==
X-Gm-Message-State: AOJu0YzCw3gYQpjr1BoWfXIuWGGGTHXW88bdTNdhuQCtFXDkSQgAP/yT
	62g+bmyuC9QiCoQarvv+wdBAmWBRpQX2c/rncWUtEQAIxEU1kdlD
X-Google-Smtp-Source: AGHT+IH9UZSAnhCsMx9MvtdFjJC2LyfA9DQa3xzW6lHppJmeOQJX0mqL4ZkOF/cyhNCCsNgC4raxBw==
X-Received: by 2002:a05:600c:4aa9:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-429ed7d648cmr2248045e9.29.1723747006711;
        Thu, 15 Aug 2024 11:36:46 -0700 (PDT)
Received: from laptop.. (117.red-83-52-251.dynamicip.rima-tde.net. [83.52.251.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19839sm57949905e9.6.2024.08.15.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:36:46 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: stable@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Manas Ghandat <ghandatmanas@gmail.com>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH 6.2.y] jfs: define xtree root and page independently
Date: Thu, 15 Aug 2024 20:36:41 +0200
Message-Id: <20240815183641.7875-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dave Kleikamp <dave.kleikamp@oracle.com>

[ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]

In order to make array bounds checking sane, provide a separate
definition of the in-inode xtree root and the external xtree page.

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
(cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
---
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
index 390cbfce391f..85918c0d852b 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -669,7 +669,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * This is the special xtree inside the directory for storing
 		 * the directory table
 		 */
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		jfs_ip->xtlid = 0;
@@ -683,7 +683,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * copy xtree root from inode to dinode:
 		 */
 		p = &jfs_ip->i_xtroot;
-		xp = (xtpage_t *) &dp->di_dirtable;
+		xp = (xtroot_t *) &dp->di_dirtable;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
 			memcpy(&xp->xad[lv->offset], &p->xad[lv->offset],
@@ -712,7 +712,7 @@ int diWrite(tid_t tid, struct inode *ip)
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
index ffd4feece078..997cc1b9e628 100644
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
@@ -1671,7 +1671,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
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
index ad7592191d76..0f6cf5a1ce75 100644
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

base-commit: 46df6964c1a9eb72027710f626cb1c6bfb5d58c9
-- 
2.39.2

