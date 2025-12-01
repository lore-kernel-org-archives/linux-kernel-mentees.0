Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59927283FCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624568; cv=none; b=QxNiFU17TGUbB3wkix0FYHpHIzUZjvXZFDyeBsrwvs/ZFLip1G74COn7wjxpZfJZ1zvvApGCyQh3LTFvlERa9XNolTjiERiD5NuURJTkZC76wm3bZ7L7/wQGuW/zlTfL4M+2Hx9vT/t69QSIzFBJ+eYlEbFpmgiSJZhr9v1eLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624568; c=relaxed/simple;
	bh=OHacAfIyeO5JPAiH83V5PfherCAW10QkpHeTsDtRm/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZvRkDEdm8LVxibzM+9yebVEHS1CEqdN2OVHilNRjwZbFYNNjLHu+mikU03o0lIyohoYHXN1RGlhnB9PB2ZqT8ReIKvSK11TRpmHxMyaYzI0SUzYM1U0UJdBJ2dE1GzJanjJhXTuWLjXvZOvSbng0Du8MEeCLllZ/FHWWOczQQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOGhFbR8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOGhFbR8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C5680798
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4DHwyqrRXks for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 21:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EB988070B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB988070B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FOGhFbR8
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0EB988070B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:24 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6430437203cso751436a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764624563; x=1765229363; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhLRJqiJP7YUf8BkFXMNu5F1Fow6nH74qHWkckyQhp8=;
        b=FOGhFbR8gHk55UeGoM3pbIcZvVH9lSPiKnGP69yerEXytlWaFx1EmqS3sRnuOwSIOu
         108eBQqsv3uInPe0GMPJ6RH/2xukFuqRMx5nVS6SaIe0bImebfVS2d0DQ0iZfxWch2qg
         ViOlXl7oU7bH1VO3NFu0RuHWTxsPZbJQFeiFI4bicIRHN87ZVKbJDRYUKfHbKyuQznM8
         7Yl00N2RnlpmTk6oncz9Liass+kV7/ATiXHLB4zcagViXIAihiD8SsWJXQXlhIA1CFoA
         U+wi114ukd/b/ALOTW/luXNXrf2A18ftBWa6GxcmXTPQYOGOp0zxTi3nEoIxjSHB5vYp
         d8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764624563; x=1765229363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhLRJqiJP7YUf8BkFXMNu5F1Fow6nH74qHWkckyQhp8=;
        b=euwcrg5+81e1uXQEn4kDfgUzJ2l34e7n49BnpCrO8vQw9QY7RU826Xprd2YFZyuAsu
         eFiDZLM/MsaENp7rw5JRFZRjEPKXG9Lkqm/ed/jTFayi0MfBl7TpbGkxj2xq/EVk2wAl
         RHovwy2OaMsM3i4c9MWg0RUQRIx4h7hDAdHV2ttSgn/20fQNOK2TtKh6J8mGoUuhfiEb
         MsTwOXNIc5zSbjkrpUO+uOROzvp9htPeVxmYuhE0Q5z8MTrb9LKQZCFZISOrNQuVBA7S
         WQHagWcSxpSiREAYgObsqbQzUQ5H1iD1rBBAEJYIePD46p5JeR6U4gskMisx6yO+gOn4
         eZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWQM0R0wOlbS3FSEfShgB/19w4hLDDYfSWCoU/+7Z3U07WBljbvLD9BOqtKOyyf7XS6OoTo4FWcpK27GIojOTy2C+BfQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxDcEjpx0WqxpMSpALZA/UsewDT5Rr7mWQl43HHPeHg8L3O+vQ8
	Jv62BtRhl1DXBOoGJx4829bKrPeYZ+duQOvo89QUA3hEwV27HTAudA8S
X-Gm-Gg: ASbGnct9hGSkVuNIY7DvYYt/yZ8FpJ6NvA/9yqTH1GRWFvOMkL5POVqrlaOZXVNa02+
	Xvs5UXmCYGP3cmf4Qch1ytsgeKxOOINdbx7XaXMRmJ2LaKvD7rgSZxRn8b4OnZMlIt67QLK3EKo
	7da1+n/3E0wgruOAEI4gFlH4XqVhkpMLFr0+wEaWy7e0wgn+97tWynb9xcq2E9hzQFUVLDsj1Li
	sfXc/qBp12OSoh9a4BqgTLJpjSGxYE8L59or1ePR5RxWYUEASOyQpnVNIQRiClMSlEulRmwLlpi
	1FcNqN5lf/P0TcnmNa9oipr9z/fb2udL9nLN+0rbJzrQ/XMhNbrF16DaIS1+vuiquqHP8IKo6+/
	s56xu+/Lgch3SpGK+bZPEBaGWxBjxATLbblSsTRoZpV4UZ/f+mTM0k15rvqack2XsWqZxp7jone
	/AUtbsqirpAmLTdQ==
X-Google-Smtp-Source: AGHT+IHTR6TMIRL8Gy6fWSoJPxXo+FyHwv0N4OoyTuMM3fnw1YXGzI2yUlsj0aEIj3kgGeRaqGBUTQ==
X-Received: by 2002:a05:6402:2106:b0:645:3dce:b53b with SMTP id 4fb4d7f45d1cf-6455a063751mr19485790a12.5.1764624562788;
        Mon, 01 Dec 2025 13:29:22 -0800 (PST)
Received: from bhk ([165.50.39.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6475104fd7asm13519497a12.23.2025.12.01.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 13:29:22 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	jack@suse.cz,
	sandeen@redhat.com,
	brauner@kernel.org,
	Slava.Dubeyko@ibm.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
	stable@vger.kernel.org,
	syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Subject: [PATCH v3 1/2] hfs: ensure sb->s_fs_info is always cleaned up
Date: Mon,  1 Dec 2025 23:23:06 +0100
Message-ID: <20251201222843.82310-2-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201222843.82310-1-mehdi.benhadjkhelifa@gmail.com>
References: <20251201222843.82310-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hfs was converted to the new mount api a bug was introduced by
changing the allocation pattern of sb->s_fs_info. If setup_bdev_super()
fails after a new superblock has been allocated by sget_fc(), but before
hfs_fill_super() takes ownership of the filesystem-specific s_fs_info
data it was leaked.

Fix this by freeing sb->s_fs_info in hfs_kill_super().

Cc: stable@vger.kernel.org
Fixes: ffcd06b6d13b ("hfs: convert hfs to use the new mount api")
Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
Tested-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 fs/hfs/mdb.c   | 35 ++++++++++++++---------------------
 fs/hfs/super.c | 10 +++++++++-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 53f3fae60217..f28cd24dee84 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -92,7 +92,7 @@ int hfs_mdb_get(struct super_block *sb)
 		/* See if this is an HFS filesystem */
 		bh = sb_bread512(sb, part_start + HFS_MDB_BLK, mdb);
 		if (!bh)
-			goto out;
+			return -EIO;
 
 		if (mdb->drSigWord == cpu_to_be16(HFS_SUPER_MAGIC))
 			break;
@@ -102,13 +102,14 @@ int hfs_mdb_get(struct super_block *sb)
 		 * (should do this only for cdrom/loop though)
 		 */
 		if (hfs_part_find(sb, &part_start, &part_size))
-			goto out;
+			return -EIO;
 	}
 
 	HFS_SB(sb)->alloc_blksz = size = be32_to_cpu(mdb->drAlBlkSiz);
 	if (!size || (size & (HFS_SECTOR_SIZE - 1))) {
 		pr_err("bad allocation block size %d\n", size);
-		goto out_bh;
+		brelse(bh);
+		return -EIO;
 	}
 
 	size = min(HFS_SB(sb)->alloc_blksz, (u32)PAGE_SIZE);
@@ -125,14 +126,16 @@ int hfs_mdb_get(struct super_block *sb)
 	brelse(bh);
 	if (!sb_set_blocksize(sb, size)) {
 		pr_err("unable to set blocksize to %u\n", size);
-		goto out;
+		return -EIO;
 	}
 
 	bh = sb_bread512(sb, part_start + HFS_MDB_BLK, mdb);
 	if (!bh)
-		goto out;
-	if (mdb->drSigWord != cpu_to_be16(HFS_SUPER_MAGIC))
-		goto out_bh;
+		return -EIO;
+	if (mdb->drSigWord != cpu_to_be16(HFS_SUPER_MAGIC)) {
+		brelse(bh);
+		return -EIO;
+	}
 
 	HFS_SB(sb)->mdb_bh = bh;
 	HFS_SB(sb)->mdb = mdb;
@@ -174,7 +177,7 @@ int hfs_mdb_get(struct super_block *sb)
 
 	HFS_SB(sb)->bitmap = kzalloc(8192, GFP_KERNEL);
 	if (!HFS_SB(sb)->bitmap)
-		goto out;
+		return -EIO;
 
 	/* read in the bitmap */
 	block = be16_to_cpu(mdb->drVBMSt) + part_start;
@@ -185,7 +188,7 @@ int hfs_mdb_get(struct super_block *sb)
 		bh = sb_bread(sb, off >> sb->s_blocksize_bits);
 		if (!bh) {
 			pr_err("unable to read volume bitmap\n");
-			goto out;
+			return -EIO;
 		}
 		off2 = off & (sb->s_blocksize - 1);
 		len = min((int)sb->s_blocksize - off2, size);
@@ -199,12 +202,12 @@ int hfs_mdb_get(struct super_block *sb)
 	HFS_SB(sb)->ext_tree = hfs_btree_open(sb, HFS_EXT_CNID, hfs_ext_keycmp);
 	if (!HFS_SB(sb)->ext_tree) {
 		pr_err("unable to open extent tree\n");
-		goto out;
+		return -EIO;
 	}
 	HFS_SB(sb)->cat_tree = hfs_btree_open(sb, HFS_CAT_CNID, hfs_cat_keycmp);
 	if (!HFS_SB(sb)->cat_tree) {
 		pr_err("unable to open catalog tree\n");
-		goto out;
+		return -EIO;
 	}
 
 	attrib = mdb->drAtrb;
@@ -229,12 +232,6 @@ int hfs_mdb_get(struct super_block *sb)
 	}
 
 	return 0;
-
-out_bh:
-	brelse(bh);
-out:
-	hfs_mdb_put(sb);
-	return -EIO;
 }
 
 /*
@@ -359,8 +356,6 @@ void hfs_mdb_close(struct super_block *sb)
  * Release the resources associated with the in-core MDB.  */
 void hfs_mdb_put(struct super_block *sb)
 {
-	if (!HFS_SB(sb))
-		return;
 	/* free the B-trees */
 	hfs_btree_close(HFS_SB(sb)->ext_tree);
 	hfs_btree_close(HFS_SB(sb)->cat_tree);
@@ -373,6 +368,4 @@ void hfs_mdb_put(struct super_block *sb)
 	unload_nls(HFS_SB(sb)->nls_disk);
 
 	kfree(HFS_SB(sb)->bitmap);
-	kfree(HFS_SB(sb));
-	sb->s_fs_info = NULL;
 }
diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 47f50fa555a4..df289cbdd4e8 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -431,10 +431,18 @@ static int hfs_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void hfs_kill_super(struct super_block *sb)
+{
+	struct hfs_sb_info *hsb = HFS_SB(sb);
+
+	kill_block_super(sb);
+	kfree(hsb);
+}
+
 static struct file_system_type hfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "hfs",
-	.kill_sb	= kill_block_super,
+	.kill_sb	= hfs_kill_super,
 	.fs_flags	= FS_REQUIRES_DEV,
 	.init_fs_context = hfs_init_fs_context,
 };
-- 
2.52.0

