Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442E1A3179
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664387; cv=none; b=nIkDpJxtqoP1HSJ+sxzJ0uFppDOFR+1O2zMDuoFy67FiwLQCjEVRh1HRrib51NALVEo+DIU6wXyH3KDbiNVOybbnlqE08VgkkvktTcdH1PKYZM6f1OGUPdyN+58OUd484ENab3WWa5eeOpeDaGNy+P1f8bLRFPQYgBTpj+01Bk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664387; c=relaxed/simple;
	bh=WIwRUSH7l4qlGCKFZPYl8/u8vLgqjJN71XMPndirieA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mhgKPYQSUbiZjtXkVNFaTzWyiwf3eJooFtwtEUXx/NIRa/xyK6BmTlS4b8C3Jic5lCFV3+WA9jnCvLZ+YufUhQL1fGSmsVRU9hs4K7H5q7hRvZOEnkFGniv0dEEu0mo52OIajz/EbT9QD826C33aFKcxJd9ZQVd1+Z9CbMH5x9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=fTlJfQq2; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="fTlJfQq2"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7ba49f92362so822410b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 10:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763664384; x=1764269184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DECYox+CapSATqMptNWT/nLrZzGas6t+p+j6f8U0w64=;
        b=fTlJfQq2SenvZMNL7QpskHncTYz4TVHDvZj7L/898bmApTnSaICGfkQD2PdMsXckcF
         DzSK4YPp5BZoQC8DUt4/LqCEnIyV0bDgI9v79RWgxpgCt4AvCBsMLgpouoVhr9+YM7L0
         MugaLMcjvJswxoLMPwmlZws1N4tE83GcbMS1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664384; x=1764269184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DECYox+CapSATqMptNWT/nLrZzGas6t+p+j6f8U0w64=;
        b=e1PepArXbRcV5rlIu1j0/XshO7YLIgGIAJzQIQYoN/sYoicSiu6NDTJUjFLy13/TMt
         RBv1qYiCJR/uvqvB1COodsIeCLTbXnacB35ign4PU7s3Hyqg0lVJLe+bZt2NLcZbSSXX
         /3oGUOUcfqKRGpEq2MDEzGT0O/cb8Ub2kXWAJkRdhF9NetbQ75OrRFuML7vd9ZC0jbyA
         S2REp6EP7XD2OKxkb8dHP0CGAsFcrDBZCLCTV8VUMdi33xhU7GX8/zpdXBFWJ5X+mPld
         343giUaNobFx5XfZ4Jxg4hm2sy9BiTw2z/ll2L5wjg7hrnl3v/HZNzMEpuYU5ruYH1RJ
         OfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJk0syUKM7SYYqffnn0qFOwjUV2FDl5EzlYXLodhCILESGDEViXnrcDXGUUic7BlFuUdqg+CkDFXT/Jf599dzOphGtpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN8aDvZ9gqgz4Mi6JKIt5FK6uI8A8JjiygudY9mLPHBiZh5DMc
	fK8KEj5iZ9vyscXj1fEEEQEe3kwAxqKQipMMvNrvugtarYTpLPumrz8js7pxDIRMtUQ=
X-Gm-Gg: ASbGncsAdEqBWqwazYe3AMdNr6Jsy6g/DqLe5mpDRo1GJuvydHTF1bnVEn8NxS7pp0Z
	UslnPOE85ts//M/SqzJj6z/L/OZzK1S9jrhogbqY0ZZiTqUC0rvn66flMxCFFdrwVhxfxmY8P9b
	lgz7e4POpL/O4fpfNI2Py7fj1BPlcVi+Zt4vjUjjuCdD+xFTONig5JYB/L8+6NozrROuKrDUges
	2OANfu87xx1jKvGNij+BNEB3dDVhPoIW/RUKD9jlVl+UVAlMh+mUw4XVUuy9EKiUHtvkes7pkzl
	asJ7pOWFngXQDTz2FWy2QPtayLw2iQNcMXQg1ZGiw81Df4MOXB/txtqBQNTagcEkk4KauXOj+ZP
	E10qWASx4YOA01mCnb9GwYypV4URfsS46AoAQ4yj4UNpmd/AfE5v6POGT9cVD8nl4ADfmczTzxX
	l9Bm1GPAI2qOLE1y288kh2e2upi/XpjYddmkcOiOF0+q/YlYzqKcuHuP0=
X-Google-Smtp-Source: AGHT+IHYPJDcnzHOf+yWRwdg9QPX8Vu/d+tWBeV5wmp+wzw4tQt7hYjMbzzdxhsRpJSxJlxFF8PFgA==
X-Received: by 2002:a05:6a00:23d5:b0:7a2:7f45:5898 with SMTP id d2e1a72fcca58-7c41d71b660mr3815269b3a.3.1763664383889;
        Thu, 20 Nov 2025 10:46:23 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:5f:c291:79a8:a36:eba6:e322])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f095c237sm3562119b3a.45.2025.11.20.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 10:46:23 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	willy@infradead.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Subject: [PATCH v2] hfsplus: fix uninit-value in hfsplus_cat_build_record
Date: Fri, 21 Nov 2025 00:16:10 +0530
Message-Id: <20251120184610.28563-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

The root cause is in hfsplus_cat_build_record(), which builds catalog
entries using the union hfsplus_cat_entry. This union contains three
members with significantly different sizes:

  struct hfsplus_cat_folder folder;    (88 bytes)
  struct hfsplus_cat_file file;        (248 bytes)
  struct hfsplus_cat_thread thread;    (520 bytes)

The function was only zeroing the specific member being used (folder or
file), not the entire union. This left significant uninitialized data:

  For folders: 520 - 88  = 432 bytes uninitialized
  For files:   520 - 248 = 272 bytes uninitialized

This uninitialized data was then written to disk via hfs_brec_insert(),
read back through the loop device, and eventually copied to userspace
via filemap_read(), resulting in a leak of kernel stack memory.
Fix this by zeroing the entire union before initializing the specific
member. This ensures no uninitialized bytes remain.

Reported-by: syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
Changes in v2:
- Corrected format of Fixes tag 
- Removed extra blank line before Signed-off-by
 fs/hfsplus/catalog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
index 02c1eee4a4b8..4d42e7139f3b 100644
--- a/fs/hfsplus/catalog.c
+++ b/fs/hfsplus/catalog.c
@@ -111,7 +111,8 @@ static int hfsplus_cat_build_record(hfsplus_cat_entry *entry,
 		struct hfsplus_cat_folder *folder;
 
 		folder = &entry->folder;
-		memset(folder, 0, sizeof(*folder));
+		/* Zero the entire union to avoid leaking uninitialized data */
+		memset(entry, 0, sizeof(*entry));
 		folder->type = cpu_to_be16(HFSPLUS_FOLDER);
 		if (test_bit(HFSPLUS_SB_HFSX, &sbi->flags))
 			folder->flags |= cpu_to_be16(HFSPLUS_HAS_FOLDER_COUNT);
@@ -130,7 +131,8 @@ static int hfsplus_cat_build_record(hfsplus_cat_entry *entry,
 		struct hfsplus_cat_file *file;
 
 		file = &entry->file;
-		memset(file, 0, sizeof(*file));
+		/* Zero the entire union to avoid leaking uninitialized data */
+		memset(entry, 0, sizeof(*entry));
 		file->type = cpu_to_be16(HFSPLUS_FILE);
 		file->flags = cpu_to_be16(HFSPLUS_FILE_THREAD_EXISTS);
 		file->id = cpu_to_be32(cnid);
-- 
2.34.1

