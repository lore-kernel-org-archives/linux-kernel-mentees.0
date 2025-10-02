Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B402571A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446665; cv=none; b=XLVF5LUr8faknK/aEngGd7s1PXxMbwwSXZ2UtymmHoYWr8w4vS7mPjcKBhjDEPbskH1v6H2Rt3GS6VinSDfEa+oJ58gaql+fSTUg0zwC7eHeLvKKqVPP/PfzOWL/SABBR5aPqv77zHUYZgtzxFUR71aCB4FaBgiV1hL/JYxPIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446665; c=relaxed/simple;
	bh=05QBzRd86DhaBHC/HzFaLKts1U4K0ZRH0JC89nOeuak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2EgfNtx2xu2nSEDG7jLz/KgY8llnGjtj/43okrzYL3X3iF4eTdBO7YcCCqymkpo1gq/DWZerz+eevKdN4Iop1hxMx6sr5zTbDucfEPP1JKfwmrl0q4DgFlQXnd1BnmlFdrK96B9t+P6C48EQWLz4NbFbewvUGnGmNIkgO3hKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMbbrFMn; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMbbrFMn"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699C260B9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ8wIeQa_XYf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 23:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EC4D60BA1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC4D60BA1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMbbrFMn
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EC4D60BA1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:11:02 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b550a522a49so1373513a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 02 Oct 2025 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446662; x=1760051462; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFC69a6NBsLOPw5S/NgD9GIK97Ncfay1Ur+maFKsDH0=;
        b=OMbbrFMnvgnRh1EGivo9FxQkkgjOUb2zyVGJI4fYVnDN16TuPAqSJ48UboX1BRAytq
         lukgzHcX1/dH6tQqZ6keIYA8HzE4POId2yheAqEv9i/1NGvqyfOPTotjsVUpO8JZS8iR
         kUN1lWQukapv0yc+kTS9zNhbXYhf1aktB7NcSFrW6qiQVtHOWtaNzTAhAUxipdKq09ma
         1BlI+nf1NSyU0BvXqL2d+eSdub1+rlV47YW11rBvR0i6yl7Q5vywfN8vHHs3QPGbYnyA
         b0wEd7uT9NQEOM0/rEpp99470v0KojSZgp9xsX9W/fB6THcO5Dk6DKBN3UyvvlXO6C6q
         gcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446662; x=1760051462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFC69a6NBsLOPw5S/NgD9GIK97Ncfay1Ur+maFKsDH0=;
        b=lQTtcit+6XZJT08jyfq1PFRpVIbpDsUurrxzUaDpWC7phGk6aJcjzxIJi1sBriP51n
         VTAJA9BS2DAy2caDwDDPa6cOYeFbBgi030+0RcTdTJRJ4uVL92ZhIKNq+TH65w/cRo0F
         EClor8x2gi/TiHbqcrpQJTfJdQFV34niFzgVrWWIRZjgITzhaYPwHQh2wXeq3kM+nCWb
         aNUOdJDEKplyRSwFE4rKCafeDjqkPucLoMB51UiL0xjZ6UQdGBzUB3JyZvofvCpJPXyz
         DQf+CAnBy2WFw/MZo9aFyMLL8sUCNzKHXpLmYLv1si4+OOn54hIuZtjoLILd9q/U+flc
         H5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXedXg2guAZ2YykMOSVgO40ZT+V3taUUoOoGfQRGHpxHrAN+9EGYBFR5R2E3hUF0cfqNUOmgV67yFO+U5FSE2xd5UXGkw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy+0/tHigdXPO5lK74k93RQS2QL6Vhj83Jk59WLtDz3piSCVyLQ
	BGFgfcUPam5Byy9iDhF9mZDJ8np33c7R8uxfjVYXXbnzH85LOUdoZ7ss
X-Gm-Gg: ASbGncs4afuihquvFUvEc3GapGuaudWRzlr6erDnO7sHuu+SzBAbLbQNqCnHjrtDXQ4
	wMVtdzjWjagnIC7LBQMx3GK9t+LhiKQvJT/6ZMwjLiNVAkrvSS80a5GZmunZpEycxS68cVfN0U2
	EBhE/uUN9HwGUAEffLTJcFuO7F9iru/3382XLMX3/IAaOb8Yhceob8ClBJtyV2WCGMu8pvSoZTO
	LTCqA0sf51+7YCO9iXC9uAj3gay8UIpQn8JK0CyNov31x6gBi8UcYaXmIXU7X8ukEtSQjq/Gqun
	UaWcs9u9bvSis7HbSgpxMfYOCZBua6Bib3CeoxvXOIy5DBIuVzyfh5GZCtOBzrQFn8Hcm7FAHyJ
	plmrKvFA2pMFkA1Niaea/YuemgdU9XEkHTcjZKSH9fRS8rVCafLHL
X-Google-Smtp-Source: AGHT+IGUOdKa1AKW2FKiv+nG8uiNpD1FAXt7j4+A8CLzObKcsOtjM7P0Sez7FihNRKz72nbVUzDMxQ==
X-Received: by 2002:a17:902:dad0:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-28e9a58b550mr11718715ad.16.1759446661851;
        Thu, 02 Oct 2025 16:11:01 -0700 (PDT)
Received: from fedora ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d111905sm31334655ad.24.2025.10.02.16.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 16:11:01 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: kent.overstreet@linux.dev
Cc: linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+7f176adb30b21606c5fc@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] bcachefs: fix use-after-free in bch2_dirent_to_text()
Date: Fri,  3 Oct 2025 04:40:33 +0530
Message-ID: <20251002231033.23810-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bounds checking before calculating pointer offsets in dirent name
accessor functions to prevent out-of-bounds memory access when
processing corrupted filesytem metadata.

When d_name_len contains a corrupted value, the pointer calculation
&d.v->d_cf_name_block.d_names[name_len] results in an offset far
outside the dirent structure, triggering KASAN use-after-free erors.

While bch2_dirent_validate() detects such corruption,
bch2_dirent_to_text() may still be called for debug output, so the
accessor functions must handle invalid data gracefully.

Fixes: c21f41f6905be4fc5059a10a5bba94105ba87269 ("bcachefs: bch2_dirent_to_text() shows casefolded dirents")
Reported-by: syzbot+7f176adb30b21606c5fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f176adb30b21606c5fc
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 fs/bcachefs/dirent.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/fs/bcachefs/dirent.c b/fs/bcachefs/dirent.c
index d198001838f3..8be31b41c32b 100644
--- a/fs/bcachefs/dirent.c
+++ b/fs/bcachefs/dirent.c
@@ -58,8 +58,16 @@ static unsigned bch2_dirent_name_bytes(struct bkey_s_c_dirent d)
 
 struct qstr bch2_dirent_get_name(struct bkey_s_c_dirent d)
 {
+	unsigned int name_len, max_len;
+
 	if (d.v->d_casefold) {
-		unsigned name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+		name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+		max_len = bkey_val_bytes(d.k) -
+			offsetof(struct bch_dirent, d_cf_name_block.d_names);
+
+		if (name_len > max_len)
+			return (struct qstr) QSTR_INIT(NULL, 0);
+
 		return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[0], name_len);
 	} else {
 		return (struct qstr) QSTR_INIT(d.v->d_name, bch2_dirent_name_bytes(d));
@@ -68,13 +76,19 @@ struct qstr bch2_dirent_get_name(struct bkey_s_c_dirent d)
 
 static struct qstr bch2_dirent_get_casefold_name(struct bkey_s_c_dirent d)
 {
-	if (d.v->d_casefold) {
-		unsigned name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
-		unsigned cf_name_len = le16_to_cpu(d.v->d_cf_name_block.d_cf_name_len);
-		return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[name_len], cf_name_len);
-	} else {
+	unsigned int name_len, cf_name_len, max_len;
+
+	if (!d.v->d_casefold)
 		return (struct qstr) QSTR_INIT(NULL, 0);
-	}
+
+	name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+	cf_name_len = le16_to_cpu(d.v->d_cf_name_block.d_cf_name_len);
+	max_len = bkey_val_bytes(d.k) - offsetof(struct bch_dirent, d_cf_name_block.d_names);
+
+	if (name_len > max_len || cf_name_len > max_len || name_len + cf_name_len > max_len)
+		return (struct qstr) QSTR_INIT(NULL, 0);
+
+	return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[name_len], cf_name_len);
 }
 
 static inline struct qstr bch2_dirent_get_lookup_name(struct bkey_s_c_dirent d)
@@ -212,11 +226,18 @@ void bch2_dirent_to_text(struct printbuf *out, struct bch_fs *c, struct bkey_s_c
 	struct bkey_s_c_dirent d = bkey_s_c_to_dirent(k);
 	struct qstr d_name = bch2_dirent_get_name(d);
 
+	if (!d_name.name || !d_name.len) {
+		prt_str(out, "(invalid)");
+		return;
+	}
+
 	prt_printf(out, "%.*s", d_name.len, d_name.name);
 
 	if (d.v->d_casefold) {
-		struct qstr d_name = bch2_dirent_get_lookup_name(d);
-		prt_printf(out, " (casefold %.*s)", d_name.len, d_name.name);
+		struct qstr d_cf_name = bch2_dirent_get_lookup_name(d);
+
+		if (d_cf_name.name && d_cf_name.len)
+			prt_printf(out, " (casefold %.*s)", d_name.len, d_name.name);
 	}
 
 	prt_str(out, " ->");
-- 
2.51.0

