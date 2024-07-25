Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139B176224
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906459; cv=none; b=Z7Yrys8Df/WH2ucSVkg9M6PgdIOJ3/iB5+S6QUVHQVoJ/8GYU0X84xPW8NRRYQT/TP5PpvhNno5KDKaScU1pz1PMZ90r6QaaP2M2KgEAWgorNiKspZSGYicBNJ/YMaWONPhOjTN3v4FLDizpFWoy1lAQ4NUXxQj9zNgowZdt7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906459; c=relaxed/simple;
	bh=4pLSKsSIlFe0Boofv8OmOs+lznm8wsBMDVlE8ew8Ag0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GByEtuZUWZDzHt0o+6Vd3RI7llSBRre70zS5fXnuOiz9TsXGoGt+5taEFcQ2jZw9EbpaHTStFhQNYzs+MgMrhZ2D5kToH4OvWCw8MbiMN/emzsbq3odb0uMudIyTSaq+z5jI57UbO3wX7WKd7TrurvPVEZoz7VLA0MqMJ4qvac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz4OET+Y; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz4OET+Y"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 992F340903
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 11:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGrpkEHH2RG2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 11:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74EC240902
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74EC240902
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wz4OET+Y
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 74EC240902
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 11:20:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3683178b226so472499f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721906454; x=1722511254; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5co6LslmYIo4HQfh6P0CfIggT1PGKK0tJqwvRnY71Ik=;
        b=Wz4OET+YGIBLp6jKO2GWvsraOoeWWMYFvO/eaxqHTmwQ5CIq7Rrp/fdI3abM8C0ZGc
         VOzgi9pW8Q+nKM9F2YJ9YyiptMAgMpRsAXkdhe8NYtWtcxpgSd87V9kOjK7uL7+hQoWJ
         AnsLMF+zgvqWFyp8vfbGrzqZlCEAy60pksjRb+Kf3Wk03FoqQdvtzZQXfneGKMFNmhy+
         vL1VL5lYVV1a0qsL3T+aE7I9O1xGLEyijf3BQ467uEzroiQc8rx3VWF+1Yhdmm8eS1tx
         2CgSIlq2nSogIF9m5/Fdp6199B9m6gIkcipUtnPc5b+zEHfQ4Xx53nv9OeLzf2klifMj
         Mssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906454; x=1722511254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5co6LslmYIo4HQfh6P0CfIggT1PGKK0tJqwvRnY71Ik=;
        b=HtfZX3ghQVg4ji3t9ZfuuItzrD2QdbcNe+rFVN9BGs5Wu0kYQkQIs7OOlli0g7TcoR
         2HRoL0NJp5eWwb2hKa+B7pyfQra51JiJ/dGCUQXhzYi8m2URY++eSln7SC/AKa/zo4uy
         XNXErOUg4Wf9s465PNN0MDCVmfi5m9yiMaSvKTf1UprLAGm3cHq/muRB2nSbCY7z8kxy
         yuuVEbrvxCoUW+Z+0w1r38SOOyc9kR46mWhnRT9t5zFktLG9RRFS40kMZ9uMaSvjBd2y
         PvpaRUiQdHZFAocdOBXt7jYk5nit2ZSE8a+5y3r/3qd/B2+FvWyB3qe5IGSlnnPChPkY
         Gm5g==
X-Gm-Message-State: AOJu0Yz42rK3MK3phoyTOIYYEE/x1RyETJRnCEDFrmgRzSbcNiu7whTQ
	avAHiQzLaGJ7kwiMxLtoQA0wGKk/Df9r/jPMdR8YyXahz5u9gf9o
X-Google-Smtp-Source: AGHT+IGcxg8RUbMwA0gj9w3ZyO5OTBoq5GmbMpklGggcrtVih0Fx9xSEVTyhCo9zI35eIFDwd5yQqw==
X-Received: by 2002:a5d:63c1:0:b0:368:77f9:fb34 with SMTP id ffacd0b85a97d-36b363894d7mr1220005f8f.15.1721906453714;
        Thu, 25 Jul 2024 04:20:53 -0700 (PDT)
Received: from laptop.home (83.50.134.37.dynamic.jazztel.es. [37.134.50.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fcb78sm1824738f8f.53.2024.07.25.04.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:20:53 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: stable@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	syzbot+d0ab8746c920a592aeab@syzkaller.appspotmail.com
Subject: [PATCH 6.1.y] f2fs: avoid dead loop in f2fs_issue_checkpoint()
Date: Thu, 25 Jul 2024 13:19:33 +0200
Message-Id: <20240725111933.77493-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

[ Upstream commit 5079e1c0c879311668b77075de3e701869804adf ]

generic/082 reports a bug as below:

__schedule+0x332/0xf60
schedule+0x6f/0xf0
schedule_timeout+0x23b/0x2a0
wait_for_completion+0x8f/0x140
f2fs_issue_checkpoint+0xfe/0x1b0
f2fs_sync_fs+0x9d/0xb0
sync_filesystem+0x87/0xb0
dquot_load_quota_sb+0x41b/0x460
dquot_load_quota_inode+0xa5/0x130
dquot_quota_on+0x4b/0x60
f2fs_quota_on+0xe3/0x1b0
do_quotactl+0x483/0x700
__x64_sys_quotactl+0x15c/0x310
do_syscall_64+0x3f/0x90
entry_SYSCALL_64_after_hwframe+0x72/0xdc

The root casue is race case as below:

Thread A			Kworker			IRQ
- write()
: write data to quota.user file

				- writepages
				 - f2fs_submit_page_write
				  - __is_cp_guaranteed return false
				  - inc_page_count(F2FS_WB_DATA)
				 - submit_bio
- quotactl(Q_QUOTAON)
 - f2fs_quota_on
  - dquot_quota_on
   - dquot_load_quota_inode
    - vfs_setup_quota_inode
    : inode->i_flags |= S_NOQUOTA
							- f2fs_write_end_io
							 - __is_cp_guaranteed return true
							 - dec_page_count(F2FS_WB_CP_DATA)
    - dquot_load_quota_sb
     - f2fs_sync_fs
      - f2fs_issue_checkpoint
       - do_checkpoint
        - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA)
        : loop due to F2FS_WB_CP_DATA count is negative

Calling filemap_fdatawrite() and filemap_fdatawait() to keep all data
clean before quota file setup.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
(cherry picked from commit 5079e1c0c879311668b77075de3e701869804adf)
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Reported-by: syzbot+d0ab8746c920a592aeab@syzkaller.appspotmail.com
---
 fs/f2fs/super.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6bd8c231069a..2d586a6bfe5f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2824,15 +2824,26 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 		return -EBUSY;
 	}
 
+	if (path->dentry->d_sb != sb)
+		return -EXDEV;
+
 	err = f2fs_quota_sync(sb, type);
 	if (err)
 		return err;
 
-	err = dquot_quota_on(sb, type, format_id, path);
+	inode = d_inode(path->dentry);
+
+	err = filemap_fdatawrite(inode->i_mapping);
 	if (err)
 		return err;
 
-	inode = d_inode(path->dentry);
+	err = filemap_fdatawait(inode->i_mapping);
+	if (err)
+		return err;
+
+	err = dquot_quota_on(sb, type, format_id, path);
+	if (err)
+		return err;
 
 	inode_lock(inode);
 	F2FS_I(inode)->i_flags |= F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
-- 
2.39.2

