Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326627D77D
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  5 Jun 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146206; cv=none; b=KIKMZF3MYSri2BuxeSHLy8P4TEzw8Y0rVgfoFgB1AH42K5CIZd9JPddhMlRZUCcoR5Q574L1K8gCVR29DS+o6CmIUwB0v5Nug8gW2UT4QsQrT/mpFHXzq3qodyWOcucQCdCdWn2Oy1nMFBisjW3EpX6I2uGNBfORvfE1DQ7Rvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146206; c=relaxed/simple;
	bh=fzKf2jz9QCto1iwp1YUjq3HCHQ5mp1pmfY1Mhp4cYng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9MbSSg08gJXmVzih6EY6+Y6J5ZF2znEkyqqzwLM6ItFoSVsvkNDL2ZtmKZtwUQTaZzrU/zWHk+tf5glgcH30e5ShaEnFmZcy6r1fepHvGyDvmtY4rD/QOIJG92HghTj7EzARRTv7YTt631WaT7T6Bo+W3wW8lOYrn9x3iX/kmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPACqQ/T; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPACqQ/T"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350b1b9129so8508225ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 05 Jun 2025 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146203; x=1749751003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QE1NK7D9odSVao69Jtlb/9rs54V5GYBC5kloyXSAMRk=;
        b=VPACqQ/TqfpCevpMCH4iCkBBfjB28+bweL5AEHbWWfwor6/U2/fv+67S5VEiNBRtdk
         KZd/mfzTMEosdghm0AsT89u47i+T+Zv2rx6Nxs+gHcL7nMXphnhIjSZcUHUzrEmDrj7I
         4JSJsa6BJC+LSCXb9nht1gRt/ez6EhcxSNTfVU/gVZlT/mRbP8EtL0bFzadgtM2GX2Cf
         QQ+NyyNvgm+lSwWzbQGrUej+Tpys8NO7P4UxUsMcEsHSqw4tcr4eSz680uaiTR7eWY3s
         q3fqJwsxx4Wyos+dCF4RWvuOeGHO2JlVkqikYiLSDx443y2+lmhperjUTLFOTE8QeK7M
         NrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146203; x=1749751003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE1NK7D9odSVao69Jtlb/9rs54V5GYBC5kloyXSAMRk=;
        b=d6lh42sX0u6qBjIBMdNdw8wXPi2v8EZ3q0+Uh+Lx2Ktjx7u6WA14OxRqHKcirk8fcb
         F6T8BaJOVl07T/XKuSC5bvtq69gfJJ3UCRAb4wjb53tNh1siwpfJwtDTjUgzvpboCwsF
         MHztQE6Kt1pS4OH7HH0IWzmJbjW7KQMansX7fyUf8p9AD31RtdcDZvon/QG5Wn9w/cFs
         wTQXJyNfK23SElJjfrUBaRXewDtrkijxArXxmwa2jXzxhrVg/Q6gzXTuBxa5bi+/ax8K
         ztTOvdyB2EKHe3E3x+DoxWGeWaYvj7IOyl5Aq56vc5O2RJ35/V6LjEgwKllA1xe/TLe3
         WWvQ==
X-Gm-Message-State: AOJu0YyaprBEZwJe870OvbZRKGmFJYFp/CPK/B8w5SBwERaMGo2/tnsH
	jyuwlyhAhBOkZl4mP6dlzdQ4F5yDJ6XZw1lHWBqGoiDrF9d1V1YKi9Sv
X-Gm-Gg: ASbGnctfk6qxQaKH9HamcsxFfwzzS0qy4NhCzmZb2PczP2RdDdjKLpS6ZwbkgxNZ1xB
	/MFEECkZHI5H1T+JGaeC6r7BZvhgUOuMKJrm52Y7NwVYQAK5N8tVph0Aj2n9z3Opj1VdTIN4X3O
	Q4NrvqLTFRu+r1ZqpVJ4GOZFmIjq1NvDGar1kzEEDsxF4B0lMH4W/zA35cXv0Ta8ov8IH4tf9Wv
	gZKjPEJdT++du7WFAlvzCbxakPbpuQx48cRYgHv1EF3ps2fda5qquMeR0Pdy+W4APTpTrJptBqs
	JCmRRULk99R7YY0V5yLHtCfySO6TfWRUxyxuKO/ewSE7AFRdmuGMaI46HZFk0KpnoFbD137hDDk
	=
X-Google-Smtp-Source: AGHT+IH7FuT0t4KYKzqRCX2QhSJh8CO4QqItoh8NieA7++j/STlROTlp6WkRws8oWHvWzTtPWPcDMQ==
X-Received: by 2002:a17:902:f686:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23601d21231mr4163485ad.23.1749146202802;
        Thu, 05 Jun 2025 10:56:42 -0700 (PDT)
Received: from localhost.localdomain ([205.254.163.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd0e9sm122228185ad.74.2025.06.05.10.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:56:42 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage()
Date: Thu,  5 Jun 2025 23:26:34 +0530
Message-ID: <20250605175634.16362-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy XT_GETPAGE macro with an inline function that returns a
xtpage_t pointer and update all instances of XT_GETPAGE in jfs_xtree.c

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/jfs/jfs_xtree.c | 87 ++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5ee618d17e77..5b8b7819cf29 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -49,26 +49,6 @@
 
 #define XT_PAGE(IP, MP) BT_PAGE(IP, MP, xtpage_t, i_xtroot)
 
-/* get page buffer for specified block address */
-/* ToDo: Replace this ugly macro with a function */
-#define XT_GETPAGE(IP, BN, MP, SIZE, P, RC)				\
-do {									\
-	BT_GETPAGE(IP, BN, MP, xtpage_t, SIZE, P, RC, i_xtroot);	\
-	if (!(RC)) {							\
-		if ((le16_to_cpu((P)->header.nextindex) < XTENTRYSTART) || \
-		    (le16_to_cpu((P)->header.nextindex) >		\
-		     le16_to_cpu((P)->header.maxentry)) ||		\
-		    (le16_to_cpu((P)->header.maxentry) >		\
-		     (((BN) == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) { \
-			jfs_error((IP)->i_sb,				\
-				  "XT_GETPAGE: xtree page corrupt\n");	\
-			BT_PUTPAGE(MP);					\
-			MP = NULL;					\
-			RC = -EIO;					\
-		}							\
-	}								\
-} while (0)
-
 /* for consistency */
 #define XT_PUTPAGE(MP) BT_PUTPAGE(MP)
 
@@ -114,6 +94,45 @@ static int xtSplitPage(tid_t tid, struct inode *ip, struct xtsplit * split,
 static int xtSplitRoot(tid_t tid, struct inode *ip,
 		       struct xtsplit * split, struct metapage ** rmpp);
 
+/*
+ *	xt_getpage()
+ *
+ * function:	get the page buffer for a specified block address.
+ *
+ * parameters:
+ *	ip      - pointer to the inode
+ *	bn      - block number (s64) of the xtree page to be retrieved;
+ *	mp      - pointer to a metapage pointer where the page buffer is returned;
+ *	size    - size parameter to pass to BT_GETPAGE;
+ *      rc      - pointer to an integer to store the return code;
+ *
+ * returns:
+ *      A pointer to the xtree page (xtpage_t) on success. If an error occurs,
+ *      sets rc to -EIO, releases the page buffer, sets mp to NULL and returns NULL.
+ */
+
+static inline xtpage_t *xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
+				unsigned int size, int *rc)
+{
+	xtpage_t *p;
+
+	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, p, *rc, i_xtroot);
+
+	if (!(*rc)) {
+		if ((le16_to_cpu(p->header.nextindex) < XTENTRYSTART) ||
+			(le16_to_cpu(p->header.nextindex) >
+				le16_to_cpu(p->header.maxentry)) ||
+			(le16_to_cpu(p->header.maxentry) >
+				((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
+			jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
+			BT_PUTPAGE(*mp);
+			*mp = NULL;
+			*rc = -EIO;
+		}
+	}
+	return p;
+}
+
 /*
  *	xtLookup()
  *
@@ -252,7 +271,7 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 	 */
 	for (bn = 0;;) {
 		/* get/pin the page to search */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -807,7 +826,7 @@ xtSplitUp(tid_t tid,
 		 * insert router entry in parent for new right child page <rp>
 		 */
 		/* get/pin the parent page <sp> */
-		XT_GETPAGE(ip, parent->bn, smp, PSIZE, sp, rc);
+		sp = xt_getpage(ip, parent->bn, &smp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rcmp);
 			return rc;
@@ -1062,7 +1081,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * update previous pointer of old next/right page of <sp>
 	 */
 	if (nextbn != 0) {
-		XT_GETPAGE(ip, nextbn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, nextbn, &mp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rmp);
 			goto clean_up;
@@ -1417,7 +1436,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1433,7 +1452,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1711,7 +1730,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1727,7 +1746,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1788,7 +1807,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 		XT_PUTPAGE(mp);
 
 		/* get new right page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1864,7 +1883,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1881,7 +1900,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -2268,7 +2287,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	 * first access of each page:
 	 */
       getPage:
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2506,7 +2525,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2791,7 +2810,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 		 * first access of each page:
 		 */
       getPage:
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -2836,7 +2855,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
-- 
2.49.0

