Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A81EBA1C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Mar 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742903091; cv=none; b=aZgANb7R+M4bLqV2f85tUOxhIZ7nDvQZ5EkzYnwlZueiRPWiulMDEY8K0THCvRSVq5JmVPl1PfccZCf4Q4WQBFJzpsnd/4LH+kpLPEINQDES2Pi4NEamme0XXvSRGxyOLZ5/q33faB5tetwfZn4XdHtpegmG+b6uTvXvUYMwdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742903091; c=relaxed/simple;
	bh=5/nslLODj2vZJkViJjsPxLNg0iwKhOfjrM1t4Q4wrac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jenCxJiglCKAmvhg6V9JX/5koMi1FfM2yHq1WUeWRwX6zDKjMdOlVSF/jfeam4oyoz6OspFUfvEZRivp8O9J7tO4mkZwZSe1Xglb8t0WbJVDZWbYDOKebngKhEBq3H/K3IN/VUrZpWcneSog0tjTSgWtOAhgz4kFiLk98TcltP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIMcVbtK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIMcVbtK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22622ddcc35so37346415ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Mar 2025 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742903089; x=1743507889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=VIMcVbtK2QgEkif5kwUxJLFqsL7AJMSsT1WbYrRDr8ddzZsJVFR2uOLVuIlJWM0j22
         saljqxk02sG7ZhnZD51dvWW6RX2/URNVifJX6tDt1DRrQzyDHfJugq92Lw8NgkW+g8O+
         JfFa+Azi/uJvAUsYVYT6VAGxbZ3jnmSdx/3vVd4Zr7yeM4MBI8BSTKW/xpjDBaaPDHw0
         8caK7MFfs3IJIvLE8clZU6URVGygAx8lC6NUnCreKMTPm9Pa4IfyrSyOfKOG4/kSYAnh
         MmAZKflKLXk1Tvm9Y7Rw3AtgutE3g2sQdECbkJD1YQBXbnF5IUjZTSKkIiR7u/CPDo98
         0PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903089; x=1743507889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=TGBhPHod7+n/2ClfrjNNFQdpARsx2476D+MxbubZX8NgHu7+kq2z5rJOcEaPMBrF93
         4Sp8GwoegV/XeypCOO4NWxPdrMcLtDBgpB5iEuRSjVzrJY7X8eLW4TFsqQOau/XgUdfM
         eVYB2FDNxZhU9hBZYN5MUwyuN19sR5SePSpuxiw8WlYDHT5u45IdhtXpR6qYrPu9Q08W
         JkKUy/JUgduyGcY/U5w5WDGoaXuByr5vP+zfr1E5wyFzvtc27H5BKr3yliK661KflPBm
         6bNiaQffFLukbKJirTL+xee8J1E/jsiuII+ZejvvrfHijiDAsESZzIGdBfuCFbr/kuE2
         8HBw==
X-Forwarded-Encrypted: i=1; AJvYcCXlF6oJYhq8717zHQFkp8rE9z0LIzzkEZZUM3Etv709F0HePPQ63BZxE0/70zGZaD+5EG026u/CUHeSQCoQsmELIaLQEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbC2/OF6sMztmH3bg4zca1wvARRzn0gdhV4rCe6/geRpfQY3zX
	pU/kGAmQ6qUkBbDKBD05RBWG85wFknzW4WKi5ro/VV48x/W0ZJHD
X-Gm-Gg: ASbGnctw6BMA2lChtCCyhXZjUEO1Zv96mdVzi/XQ6JgabggLJKsw1XB/Iwr5/3aiyUD
	HmlFZAVYf0BM5DfVKfr4qoBntwTMslX/ObaHcWMvtPfA1A9P4t+ZCK/Wp59oW5QgubqcJUMCJu6
	/P+aD5GYZKLgRafVhfQZCXUavvuly7urlAwH7SYxYEEDxfWHuyE3OGuD2KNXl6laHjFo+uJo+3R
	MPd08QYtmEVAgsLyG+C2mMoClGRpHJmUQ+syC/sMN/TD83J9Vp4G/w3fXUq7cIWCoqM5BXGwa6S
	3WRAmVTerhAlS4k1fvyPKA8cv6ZCwgutN5rNAebtdDs6
X-Google-Smtp-Source: AGHT+IEd5TqM3Ur2SeElmap55MkC4ZerI/76IhMaZUOxyVFkeLtvIZ9DW1PcVzamcoXnxNeG2XeM8Q==
X-Received: by 2002:a05:6a21:999a:b0:1f5:67c2:e3eb with SMTP id adf61e73a8af0-1fe43439eb8mr27780478637.41.1742903089202;
        Tue, 25 Mar 2025 04:44:49 -0700 (PDT)
Received: from pop-os.. ([49.207.209.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd54fasm9824703b3a.49.2025.03.25.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:44:48 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	Roman Smirnov <r.smirnov@omp.ru>,
	Edward Adam Davis <eadavis@qq.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Subject: [PATCH] jfs: fix array-index-out-of-bounds read in add_missing_indices
Date: Tue, 25 Mar 2025 17:13:39 +0530
Message-Id: <20250325114339.412100-1-duttaditya18@gmail.com>
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

