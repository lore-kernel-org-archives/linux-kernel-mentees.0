Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3B20E31B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Mar 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742369961; cv=none; b=D2dI3jFavYnwcCNjcjBrSJUxiQqjON+ZVqoE5DtWZ5A6l5OSbQaQSZYcsGvYk24CoqLCNvpW1K7FFYblLmfrbQmeEd5thCNotX7azvod06uhgOktAkJVA0q0RndkaZenUO2nqURt37f6Va0sdoOjF9A3pXLdSp4DLaVE5d2JmD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742369961; c=relaxed/simple;
	bh=59VG8MIiJcdiCaxrYyH9CrSs68v8t+zrmZvnXb1LuCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EV76KGZv+uEJcSVPTlL6ZMRLyjJwyck6PIq5uK82nOBAyj4SdfFnewxCXsYwHrCWcuso6yM8QDT9lCU+MyFaSbUD1a7JtpotXFLLJm3f/7i+ndbMRdeAdWlOYoRJEvmJdrfGBgqhD2jcF9vWUMJ1bqWJFj1pr9rlYyd6eZ0bRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAztMjPF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAztMjPF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so139357955ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Mar 2025 00:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742369958; x=1742974758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxDRI3yy3kbzuN5qeoEHV0+lf0cRz3kjqm00o+lSz2c=;
        b=QAztMjPFvyYnY3z3dW4qvGip08H2Yy5LFEujUEILs02Bx5TFiU7U7vhHSr2QlSVFvs
         0qELMIuIJS2RGJP4cEVTWHcuL3spPPnSNuiz3kN/WNRSQpKYAeZ9bvMeHEWua1zFkMai
         ZQbeJsn+mppHZh+UU+zxusCanLXFOzCV6ur3li1bu/ykIyaerCYrLWlf+G04lTjkx5La
         ceMWCGZgUOxw4H+wS7WT7Qai/8WPTaYaAafjMbKC1WHFHsbk1om0tGUsDJ0d5k5/ASQI
         nthYNDvFykGJM7RIp26kpV7K5EiEtuimKX7F/wBFtvIAOQM4bnLpMGaYDIEfpCYq+Jt6
         7dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742369958; x=1742974758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxDRI3yy3kbzuN5qeoEHV0+lf0cRz3kjqm00o+lSz2c=;
        b=gibFwcwrRuktXIXpINhprx4GTZFRWEQwuRTB88baKJKcqiqSy2IPhsGs0wRmxMbSYq
         x/yaDFZesN6CQ9csGxerEqIvvsUmGc7S9bgBy2kDqhRyTj8op6SKWdCPfloJVqE0n9ty
         SHROOgV7Aqx7IzOtfduTZI4Q3FeLLNzBKkJuumKxnJC8hAyFXT12dK9ROsJgY92LVWCV
         iXLtcxJ995d83RXyf/4hrnGQAjUbgSShuzYLY5vhHYNMn2JSAmgCzOf5ZXXR6GCBJn3H
         y2ZZjzX2yDZM02Er9KqEJPotwnDJX77bL0kEv7/Xk54OoRqEwhs3ddXfK50td6BTX52y
         TKkA==
X-Gm-Message-State: AOJu0YyBHH4uou6SvxK82Z1VeJ20kw3IMhCD5IvLwUNOH8De8VjDoTQ7
	+2NDQUNjWrO5jRRQmL/Q238Za5vZPZQz7Lt+AdtZuPssBA+v1tgMA8N9kW2bkhF0GA==
X-Gm-Gg: ASbGnctaXEEzGdOpp58Eu4cXovMg1wEn1r4MeDJZG1KFvwOtnGl1NL+b2Lhs3ALIiRp
	ZwyS2aK19aP7H4mUReKTgvcn/AjW4fZWxrPklQ6TaPDro1qGYdfDasknwnqJ/le+cbMiI1nq/gq
	xfLuDw3VZ1DL8u/LO+eIlM5BogZFcjB2WGVHxtK3hlbrrN+UZ4oAJ+cP/zzpjwLV5+lGFA81VYv
	jTeYFu9vKbuCApYBTQ9IV0lNy2i9cdn/4rRV6L8qLJnRB93N/e9AdX6c0ZPV+3wG1ObF/mr5JLg
	KOHv3tT5fdzj0jlNxYkXuy5QaXw+jU5tuffmr6b1lHH3doI5RrkYAQ==
X-Google-Smtp-Source: AGHT+IH7w54kbrZ4KACEo/HNZuJdpE+uY4oEwrMSF7BbiB75U+3UDroYU+kXdh1GJBNXlIS0Aq57SQ==
X-Received: by 2002:aa7:8885:0:b0:736:4fe0:2661 with SMTP id d2e1a72fcca58-7376d645d8cmr3026676b3a.11.1742369958356;
        Wed, 19 Mar 2025 00:39:18 -0700 (PDT)
Received: from archlinux.nitk.ac.in ([2400:4f20:11:c00::103:25cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115295e5sm10923556b3a.23.2025.03.19.00.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 00:39:17 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH REPOST] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage() function
Date: Wed, 19 Mar 2025 13:09:12 +0530
Message-ID: <20250319073912.6849-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 fs/jfs/jfs_xtree.c | 86 ++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5ee618d17e77..4fea5e90e29b 100644
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
 
@@ -114,6 +94,44 @@ static int xtSplitPage(tid_t tid, struct inode *ip, struct xtsplit * split,
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
+ *	p       - pointer to an xtpage_t pointer mapping the page's data.
+ *
+ * returns:
+ *	0 on success, or -EIO if the page is corrupt or an error occurs.
+ */
+
+static inline int xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
+			unsigned int size, xtpage_t **p)
+{
+	int rc;
+
+	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, *p, rc, i_xtroot);
+
+	if (!rc) {
+		if ((le16_to_cpu((*p)->header.nextindex) < XTENTRYSTART) ||
+			(le16_to_cpu((*p)->header.nextindex) >
+				le16_to_cpu((*p)->header.maxentry)) ||
+			(le16_to_cpu((*p)->header.maxentry) >
+				((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
+			jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
+			BT_PUTPAGE(*mp);
+			*mp = NULL;
+			rc = -EIO;
+		}
+	}
+	return rc;
+}
+
 /*
  *	xtLookup()
  *
@@ -252,7 +270,7 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 	 */
 	for (bn = 0;;) {
 		/* get/pin the page to search */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 
@@ -807,7 +825,7 @@ xtSplitUp(tid_t tid,
 		 * insert router entry in parent for new right child page <rp>
 		 */
 		/* get/pin the parent page <sp> */
-		XT_GETPAGE(ip, parent->bn, smp, PSIZE, sp, rc);
+		rc = xt_getpage(ip, parent->bn, &smp, PSIZE, &sp);
 		if (rc) {
 			XT_PUTPAGE(rcmp);
 			return rc;
@@ -1062,7 +1080,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * update previous pointer of old next/right page of <sp>
 	 */
 	if (nextbn != 0) {
-		XT_GETPAGE(ip, nextbn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, nextbn, &mp, PSIZE, &p);
 		if (rc) {
 			XT_PUTPAGE(rmp);
 			goto clean_up;
@@ -1417,7 +1435,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 		/*
@@ -1433,7 +1451,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 			if (rc)
 				return rc;
 
@@ -1711,7 +1729,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 		/*
@@ -1727,7 +1745,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 			if (rc)
 				return rc;
 
@@ -1788,7 +1806,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 		XT_PUTPAGE(mp);
 
 		/* get new right page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 
@@ -1864,7 +1882,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 
@@ -1881,7 +1899,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 			if (rc)
 				return rc;
 
@@ -2268,7 +2286,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	 * first access of each page:
 	 */
       getPage:
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 	if (rc)
 		return rc;
 
@@ -2506,7 +2524,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 	if (rc)
 		return rc;
 
@@ -2791,7 +2809,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 		 * first access of each page:
 		 */
       getPage:
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 		if (rc)
 			return rc;
 
@@ -2836,7 +2854,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
 	if (rc)
 		return rc;
 
-- 
2.48.1

