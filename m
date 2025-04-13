Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BF1A314E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Apr 2025 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578160; cv=none; b=IMEk446Q7b7JoJl2L+gikUyeG9fqfOPj/YfGRciQ3L4vUyxtoWdeISCeusEezxC96JPcFfUzp9zZez35yObdQBaGKQZh90dTW4MansyyZ3CtalZpXhbSy5cAo191bRNIi/Wbj1tWtwLrCmd59uVmEc+oJLyCgeAbB6DtQVgfu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578160; c=relaxed/simple;
	bh=Pk92mL5k+XXRZ0OWMKLRIOmc3frVVp2jR/b+e//O1MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3nX9oog+vi1+BeW7uj49kjCcG8lTVVKCPWneTwRxu8f7gN/fo4LNUGkVBnbaCkJN/2Ds+ynjuOeeGJZOKx+9JJUxne4zx69A9G5gjGDlUe5JdjyZ0XZBPK6wr29CeytbIrZl80VpdqC2UkSOAwfpuYPDqPqxp5Ah37jcZVuzh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXpjhSQp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXpjhSQp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227d6b530d8so33754105ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Apr 2025 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744578158; x=1745182958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oExSuRgSkOYG1U5jJabPZvKPbMxgJkOF/aB8GjfoPCg=;
        b=LXpjhSQpOE/KRJ34S/uy3ut2dt1rohqf7X5R2kqP25QgZGqXRSRawfDiK5hktOqqv6
         Hw/ts69q51upFFoKphvF7SyfV0fITSQ1vpsOVktFq0ruOmm0k7TQmhquz2qrkrMwWoWO
         hEnqRlaLqxNtwOUJqibYUson2HT4MUvmWhFhBt9LmrC8ql3bd5SmAYmtKpcC9KrTbH/w
         H8+U4QkQovsygWHw67yEOPpgp1UbAT+gDATXKvj+tMXrt9kbb3vE14PiZDT3RKLx/GXQ
         QCww4ZinIPCpuB6eoix72C7oEAixutXNfvtgu00JdH1oslFNe/wLYii1u2vx3wozVmEO
         RvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744578158; x=1745182958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oExSuRgSkOYG1U5jJabPZvKPbMxgJkOF/aB8GjfoPCg=;
        b=Q+SOY5aVNWYQPpvSORyEbj28OeyfmJyZqu2eQ8sVSY7JcT+IjP4XsLd1OngWNDOcoK
         mfaN/0X+oTfB3qBBtMRxpBv+tGjU8Mn350NxbnLvOGCKYM3HL213rbLKqssAVwTYDBCV
         ormFhJ5xd70v2DIh5Xo4Mbhsq7X4myPEilzyIU7LaYHRmETxGl6pqAcyrlAs8+ubMF0D
         15pBDNZbbXZmjPj1PGYjoyyRTl80zlJ0fe6XzgCr6+0/CU0olozykNcCfwj6iCYdrK/F
         q0iz0UU//bXn5hUpeGWNxry6Z9ZK0GmCeYyCEcYYl3MFq/hhWLm7h2g4GTXWmhXe/Axf
         1b8w==
X-Gm-Message-State: AOJu0YygrnQDOEOckkug8DK0cdMQcco6GdZWpjRAoHTvkASYN3ROBnnZ
	LbmouFSs2XUrIfiYOXtJUhc0PGAqb1URuQ7k3jQEmgLrpSwVjhLL
X-Gm-Gg: ASbGncs9uKLtPu47uqAs6W3KDOTfyo9JIXday+PoT9mD2XlzoyNqBoXaYQNIfmQmHNb
	oQTsqn4ms/MzlxccsOC2RadBab0RmZ8bkQY6aF/isiXInRmIzlj2Fj1oPGSI8+s/bfeBDtYkVoi
	+41Du8tqY+FQ2fOASpmT06LIc2e2u5Ay1pRI3sWaFyGibfWvYtzqpKguZ6qgJSjIacUC51LO++y
	msb14AZoEU8bsLuIlQ3xu5yDvlqbaY6BJf6cbp/XolGFYESblzTnyPZN/6aWlpcNIgJNv+/UUl9
	0iG4XeviD4kbLt9IMfpI9tPCSaZeQlyLvjfnXT5uAvNltX16aQ==
X-Google-Smtp-Source: AGHT+IF0dOs0iCfPOxj+3D4d4UqDWm2ILpwsXwoRsCyX1J6rpUpFZJN7mY8/7lWBtAy7NnquaO0L6Q==
X-Received: by 2002:a17:903:8d0:b0:21f:136a:a374 with SMTP id d9443c01a7336-22bea4fcf7bmr146617735ad.43.1744578157486;
        Sun, 13 Apr 2025 14:02:37 -0700 (PDT)
Received: from archlinux.nitk.ac.in ([2400:4f20:11:c00::106:b642])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm86630895ad.118.2025.04.13.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 14:02:37 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage() function
Date: Mon, 14 Apr 2025 02:32:18 +0530
Message-ID: <20250413210218.111472-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy XT_GETPAGE macro with an inline function and update all
instances of XT_GETPAGE in jfs_xtree.c file to use the new function.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/jfs/jfs_xtree.c | 55 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 4fea5e90e29b..5b8b7819cf29 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -104,32 +104,33 @@ static int xtSplitRoot(tid_t tid, struct inode *ip,
  *	bn      - block number (s64) of the xtree page to be retrieved;
  *	mp      - pointer to a metapage pointer where the page buffer is returned;
  *	size    - size parameter to pass to BT_GETPAGE;
- *	p       - pointer to an xtpage_t pointer mapping the page's data.
+ *      rc      - pointer to an integer to store the return code;
  *
  * returns:
- *	0 on success, or -EIO if the page is corrupt or an error occurs.
+ *      A pointer to the xtree page (xtpage_t) on success. If an error occurs,
+ *      sets rc to -EIO, releases the page buffer, sets mp to NULL and returns NULL.
  */
 
-static inline int xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
-			unsigned int size, xtpage_t **p)
+static inline xtpage_t* xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
+				unsigned int size, int *rc)
 {
-	int rc;
+	xtpage_t *p;
 
-	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, *p, rc, i_xtroot);
+	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, p, *rc, i_xtroot);
 
-	if (!rc) {
-		if ((le16_to_cpu((*p)->header.nextindex) < XTENTRYSTART) ||
-			(le16_to_cpu((*p)->header.nextindex) >
-				le16_to_cpu((*p)->header.maxentry)) ||
-			(le16_to_cpu((*p)->header.maxentry) >
+	if (!(*rc)) {
+		if ((le16_to_cpu(p->header.nextindex) < XTENTRYSTART) ||
+			(le16_to_cpu(p->header.nextindex) >
+				le16_to_cpu(p->header.maxentry)) ||
+			(le16_to_cpu(p->header.maxentry) >
 				((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
 			jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
 			BT_PUTPAGE(*mp);
 			*mp = NULL;
-			rc = -EIO;
+			*rc = -EIO;
 		}
 	}
-	return rc;
+	return p;
 }
 
 /*
@@ -270,7 +271,7 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 	 */
 	for (bn = 0;;) {
 		/* get/pin the page to search */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -825,7 +826,7 @@ xtSplitUp(tid_t tid,
 		 * insert router entry in parent for new right child page <rp>
 		 */
 		/* get/pin the parent page <sp> */
-		rc = xt_getpage(ip, parent->bn, &smp, PSIZE, &sp);
+		sp = xt_getpage(ip, parent->bn, &smp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rcmp);
 			return rc;
@@ -1080,7 +1081,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * update previous pointer of old next/right page of <sp>
 	 */
 	if (nextbn != 0) {
-		rc = xt_getpage(ip, nextbn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, nextbn, &mp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rmp);
 			goto clean_up;
@@ -1435,7 +1436,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1451,7 +1452,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1729,7 +1730,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1745,7 +1746,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1806,7 +1807,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 		XT_PUTPAGE(mp);
 
 		/* get new right page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1882,7 +1883,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1899,7 +1900,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -2286,7 +2287,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	 * first access of each page:
 	 */
       getPage:
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2524,7 +2525,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2809,7 +2810,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 		 * first access of each page:
 		 */
       getPage:
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -2854,7 +2855,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
-- 
2.49.0

