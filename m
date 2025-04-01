Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2C202C26
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Apr 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521392; cv=none; b=XGa2Zd/MfCiEsAy9AmU8OrTYvGiHINJasXloe2GwQs28j3/v6qzMgs3mkMfB8Tgf9//hZTGnYJI3wv67rYGw0hR3JZnro/rbEK1dwToHI2vXIcBiOlXGvfc1LXF5wwVACDpjnq3tZG+NoiK/7KJ2d3fYiPtY2i1zsc+BE2xRbhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521392; c=relaxed/simple;
	bh=5/nslLODj2vZJkViJjsPxLNg0iwKhOfjrM1t4Q4wrac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UXVFDN4p9MXz24Z2IB2S3QwLNjCWzAyzdJBfYV5Qei8lRfc/tLFN7xHP5KKAXdlQC02L0htFgpyiOI2Spjj36BnqGORKHVrX2jA5ebAvqa0HqebWU3lcHjbmKLBBo2wwm7KCrl6O/wQ/8lX0wUpnccFSVPw9FaN/uIvLQiEX+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijff8xO4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijff8xO4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so12364071a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Apr 2025 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743521389; x=1744126189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=ijff8xO4U5r1/cSFIoKRsTyZ01YJp9WEjdTBJY+A+yl95yINiAOV2/60GbScIEE+Rn
         OpdRog5yJSSlzwmh9bez9Abf7IXdU6he/Sb54YbjP8ZY4ClPN7Eks2W8wFD8efqNIwnt
         spy9xg+GLL7u9evrB4GcaIsmqf7/Dn7NlK8vps4DgghGCL/fa9SM+ML2jNt108jZ6ny/
         7mLpIX/3Z/CMw40jGN9r+IKQkSqZy/qs2JMTRvG4jtq0JFdj3dCipL+ZLj5wRj3aFFhr
         iadVHb0ILi9pTNgCntUkj2n/8xtQsV32w1gkZWTBBydrm3HN+7g1bJdZgt0gZbkfeg+/
         Rv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521389; x=1744126189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=bGZ9MGNVIh/42H4EZ7np6PoREk2ts3O6pEJj6OEcbk9GXV3XFNGGIwvVfyrYbu+8aB
         Urx9vIL9Oe7bCp+IcQ6cHphggkaerVNsRiInnqlcNrmtKZpHi1o6PbO5z5IsljiSfLDK
         h91YARZ/6PbeVXaURFtxRZQPH+MaXknO9xDf7ux26Gh6ZaOe/tX7j8ECit8Bjb/NAuDI
         eEWUo9tsS+Dyw4SOA4xdKwm1BSYMOnQx0TzMz1Szs9x4CyVA8Wd1EIu4Oj5NJPLjFfzo
         UJI8ovqS/NIq/QIlgU+mP8Diz9QWuLCWOHGiMG6XJmVfaILpvxNBGGD/StjmGLH8TP32
         EwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVXlsGl6lVYdgklV2DVF6J/izP4OABW1o0+mBauFWWiJqcaxn5YBoXaVt7WzOqazm+OCeZH0zmyFRkFWTNBcl6T81WRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM4TFqGAR3EZOj/dMIWhpNn8tQMtPg7s+XeXvDGXxevVcBwpR0
	ueVWr8OR8/CLwYEieRNN9uBBF2qdJklRLCX46joRkc2lG51Kw1d5
X-Gm-Gg: ASbGncukGeCn3n1vCdts9/Nt+r2TvrbmFSUrZaOtnpS/v7NvgL8ZhcHsb7YBXKwD+o0
	FioINcMDs8PTJE4e2IzZv0Ie3Efy0QjSMrVvfHU4CiukOJdYCXfzTRMP3quGUI1pQtMTZD9cS53
	DzeBd4EYH67sCKLgPahaTwVTi20bPtPfPbLe9/YInMnusAMRDsDgbA9aRvZe0ljGoVwuBZekJWn
	MxPSwDRTIn5rq2warrdHqg+kn+9i2BDqJNnEdbhEFmL/4wlH9bu0B9pCPXlLALjkDgC3nGYQE6J
	xDruSETCqy+JvV71o1CY2Kr93aPjKa95GlsZAFX7gX6w
X-Google-Smtp-Source: AGHT+IHbLzLyxoXgCDQb88U11Dt/J3tK3R1kD5HUq7qdWDEwGWlrdnlTlmhdMwaV2IS/+9lAfTNmDw==
X-Received: by 2002:a17:90b:4b06:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30531f7a6cemr15420719a91.6.1743521388814;
        Tue, 01 Apr 2025 08:29:48 -0700 (PDT)
Received: from pop-os.. ([49.207.199.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d430asm11795912a91.35.2025.04.01.08.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:29:48 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	Roman Smirnov <r.smirnov@omp.ru>,
	Edward Adam Davis <eadavis@qq.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jfs-discussion@lists.sourceforge.net,
	syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Subject: [PATCH RESEND] jfs: fix array-index-out-of-bounds read in add_missing_indices
Date: Tue,  1 Apr 2025 20:59:16 +0530
Message-Id: <20250401152916.618963-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stbl is s8 but it must contain offsets into slot which can go from 0 to
127.

Added a bound check for that error and return -EIO if the check fails.
Also make jfs_readdir return with error if add_missing_indices returns
with an error.

Reported-by: syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com./bug?extid=b974bd41515f770c608b
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
 fs/jfs/jfs_dtree.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 93db6eec4465..de33026d18d2 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2613,7 +2613,7 @@ void dtInitRoot(tid_t tid, struct inode *ip, u32 idotdot)
  *	     fsck.jfs should really fix this, but it currently does not.
  *	     Called from jfs_readdir when bad index is detected.
  */
-static void add_missing_indices(struct inode *inode, s64 bn)
+static int add_missing_indices(struct inode *inode, s64 bn)
 {
 	struct ldtentry *d;
 	struct dt_lock *dtlck;
@@ -2622,7 +2622,7 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 	struct lv *lv;
 	struct metapage *mp;
 	dtpage_t *p;
-	int rc;
+	int rc = 0;
 	s8 *stbl;
 	tid_t tid;
 	struct tlock *tlck;
@@ -2647,6 +2647,16 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 
 	stbl = DT_GETSTBL(p);
 	for (i = 0; i < p->header.nextindex; i++) {
+		if (stbl[i] < 0) {
+			jfs_err("jfs: add_missing_indices: Invalid stbl[%d] = %d for inode %ld, block = %lld",
+				i, stbl[i], (long)inode->i_ino, (long long)bn);
+			rc = -EIO;
+
+			DT_PUTPAGE(mp);
+			txAbort(tid, 0);
+			goto end;
+		}
+
 		d = (struct ldtentry *) &p->slot[stbl[i]];
 		index = le32_to_cpu(d->index);
 		if ((index < 2) || (index >= JFS_IP(inode)->next_index)) {
@@ -2664,6 +2674,7 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 	(void) txCommit(tid, 1, &inode, 0);
 end:
 	txEnd(tid);
+	return rc;
 }
 
 /*
@@ -3017,7 +3028,10 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 
 		if (fix_page) {
-			add_missing_indices(ip, bn);
+			if ((rc = add_missing_indices(ip, bn))) {
+				jfs_err("jfs_readdir: add_missing_indices returned %d", rc);
+				goto out;
+			}
 			page_fixed = 1;
 		}
 

base-commit: a8dfb2168906944ea61acfc87846b816eeab882d
-- 
2.34.1

