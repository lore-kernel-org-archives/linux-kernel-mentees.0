Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784D2BE7AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246007; cv=none; b=ikCLXQp8sxQebjSSs27N1DOrsrfi6t/dprYKtTw9xqQRZB4d55rucbSX+fbHiwPhydy8l6A4nnZxuvnSZqv8blNMeCdCpBbhSUtLxdDA8RYB3fiQBtcOf7p4M3zTaJfI51Z9KE3uWrim5j1pndfWy7eM2+fghBY+yyJBqtyrXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246007; c=relaxed/simple;
	bh=Wf4TBrAOAA3IG3OdYDh0WfQE4U26yPFHYPSBa9u/sV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ix6QSp/8mj/a+gl6btA394DpTeeTeoWeGFQlBuowiTF/AjaP7nM5/Xs4dXOduu/cEYQxGXuQwujwsqG7myNdHAFz9Kyt58yn9P+qMC0Nie1niqkv3Xlxbwz64eSvDqt2wJVlseelki/MIJiVH/9Dm+ukY3GY2s/w5z6BKjZ9Cyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCSUIfuR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCSUIfuR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2CDF400BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOe99QobZr7y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 08:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C085D4007E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C085D4007E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YCSUIfuR
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C085D4007E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477563bcaacso2192605e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 04 Nov 2025 00:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246002; x=1762850802; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=;
        b=YCSUIfuR/LflO0HDMqirJ2bg7BcgC7k0bfmwpNTsRtYaTKU34T8ZfykYtFItAyDjX0
         JhMJ4XYfba2ti2v71bLL4/e0Jcpw9a9lk8QykMrPJJ/U58uDnleHFF91ppxvCQKAIuhd
         5lJZgwfW1OQln7r8n+ruGE3RdEsPqwwMCspl2QtWyn6vlmxaJ597gCcCiU5/yrDZwwZv
         bUk8gzmLCIW4pOZ5KLEN4nXRP7gvVpSreWggSmx//yQW0fw5hKxUvcSPm9wTpf1CyOuD
         mN7N09uz3Ke23+G8VrbAL01ZwM5CWTapHKBjHfXwzW2un2KLZQULCUMhCycXBUv98mrn
         6ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246002; x=1762850802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=;
        b=HTV4F4Q0qj9o4/wm9IHTylhMKJrcsf2+jt7LdKQjzSy1ByjhP4LWrzAzqKZdH9AMbw
         +6TKJ5s6O5U0GdnEfopmLUc7Sd9+yiAaIlHnS1KUL6FIaQWmfuvhEZ/yLa+qewcWgJEt
         1IYrmb0cCo8DvpTfIEZYF/KYG6LWYUqpm2h/XjEg2glgdRwsaRZNjQOkfe7zkQ7VuK8u
         oE0QCoWE8INEWlaWVqYXhXBaT8xayviP21yoTEE+qAmc4qTwq8f6hOC+HMziw+N/V/JZ
         YRSYOSGV34IIJdkio9IxSrJVgvYkQNPxbZ1syn9ca+LWOrQYKp5A8vp20rBum9NMX+hv
         7V+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWATK3Ygao6llt3fEUE7rzPYrV+CokyAxbfh972BN+eO9e8RXnlYXapZ3ctap8xZcFteWYxzcJfmnn7HEg9V2Af6bbVBw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx7tY7Jc5Xz8fqMJzFB9uSPEXksvD1hSc7fI3zYyqSTxcgsfRd6
	/wo5CispYvDp12RqMlg+wzbNFK/QuxnxTW1CmsyyIwd5COICR1E1EeMx
X-Gm-Gg: ASbGncsBthROoA3q0AWJgNY0zJQjOLERw38yLEP3ZAD7FZmDOCkjbDSgOQngHLO4juB
	yVdnWq7Ejf62R791TgtapEDNje1yqW1fczuiCPI3v4jVURLDQUVp3KM7CIMcRalEFemvV7+wPDI
	2xYdLc3ezM5xa9VR9Yftdun0kJnlkZYCXT2mEBIBO1yq6RXAQDsVJ6oyQP+SwqNcofUAaiXr3FK
	AmWMPyHyWrgZJSsfQ25Q7iLLL29WAr95eUX6ee0husyZtbeJVSfZwfAgi3fYRuj+syfRu8DmHwp
	uWJMYBHCTxv8i9Yn6JKLKmmCWM3WhxjucY3LxWPfFiAffP0zR+6FUoWtX1O2xHKuzmWj+Tum/H1
	QgxKLPhEBkt4aAc5leYDhqFz8E8sJAWa2mKfo6QBaodPxU4f9JHaG27LJkEaE4ZNFV1y/bnvekd
	A4cGzOPq4SreHs7IrstLKI7Q==
X-Google-Smtp-Source: AGHT+IGhgCX2NfeSdDb0gpSYu/I4DorVKH+J4uT9I1EZQvppI43csdNacLNGraQ9BsMWF4m2sbtX8Q==
X-Received: by 2002:a05:600d:4350:b0:477:3543:3a4a with SMTP id 5b1f17b1804b1-47735433f88mr92298435e9.2.1762246001456;
        Tue, 04 Nov 2025 00:46:41 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:46:41 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: [PATCH v3 2/2] f2fs: Add sanity checks before unlinking and loading  inodes
Date: Tue,  4 Nov 2025 10:46:20 +0200
Message-ID: <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762184787.git.zlatistiv@gmail.com>
References: <cover.1762184787.git.zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for inode->i_nlink == 1 for directories during unlink,
as their value is decremented twice, which can trigger a warning in
drop_nlink. In such case mark the filesystem as corrupted and return
from the function call with the relevant failure return value.

Additionally add the check for i_nlink == 1 in
sanity_check_inode in order to detect on-disk corruption early.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 15 +++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..b808e1dc2ae7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..65af1d56a99e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto out;
+		goto corrupted;
+	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
+
+	goto out;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+	f2fs_folio_put(folio, false);
 out:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
-- 
2.51.0

