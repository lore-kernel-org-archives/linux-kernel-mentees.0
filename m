Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C4B3101C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341005; cv=none; b=VAecRSfMyIe/5wBLaRfYuIoq6xx1UEGFEI5jAG15u596Nfv79WrZE9pTJ3y4UFqSaALjkD8MAzYTPimPgbvSzXxfX00AyjHnpJXvUWAvgJNgLUY2tWzvWoKZEXz3YPuKYJ2VTe0SuCdbaL73IJdO4vINEVIPjBKl4JYVzZEzYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341005; c=relaxed/simple;
	bh=hstc0vY91gKGBMtCAdJ8eBxi8EGOtO55dsqiQicv5j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1DWU0tcvBSuopWawHWfX7cIR9i4YZVZEgtVHvLKYSDAjsi95m8+KxPW2i2iRYdUrqPwlMo6Qc/WB8QvmCrjlEuhMDE/V/+DrldYWDOqb0MlTMYrucyUm4kF1smWKyBkUloDnM/ViNXh8I8uvl0o+yKUs2AjT1VqY0LxbVBDNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co15Jfib; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co15Jfib"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DA561112
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPbn3T0DAFpu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 11:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E11C6110E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E11C6110E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Co15Jfib
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7E11C6110E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:10:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47114a40161so16977325e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 05 Nov 2025 03:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341000; x=1762945800; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=;
        b=Co15JfibhK9UqNQVUrYYAwg1LjrQyb2Hf+f9bKeU1yw06DiI8lCEVxdMuxCAS+Fc4L
         Jqp9qo84SIDgBcSUqTNELo9vLrev8D6D5svKYbaIIMNNLOdh3lgkAKyoDcB+785pCdl5
         vYIHyW/tAwi0S+Skw7OZpe1ziCqAHa9SCF84neC6nSTwVKl9kYzvNzgnjO7GgI7VxCNt
         BNN22CNcR/Pqhq81SjMgtHx1oUCYyB/8+4XWiJ11mEDhKM83zV+2B3IHXVVl367O1uU1
         EfXiFnRxjFkTOG38JLpmLAyiwqkZI3zJ4lX0cdvzlGq90CSfkj+fTrdWMR4s7BTkDe0V
         WHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341000; x=1762945800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=;
        b=YlfuB2fBNabDHohdcqPZoHEnbiNhY3C36/9wWB6K8K7OoKOWoF048VZYjTnSeTTK/z
         drwfKZWX0BXJXBAltUEjq96zzF9fR4n27S9ayIYnYMa3Wi8HLHeTL4JRXRJR4NQe5aOM
         jaJqderVvzMYQeyMdfPxOGi0jpgH+BqW52ldqv2TyePhGFE4NyQucGZ2vjeJXcmGh/w4
         H0+d8IlbP3h1fwZj7rF1IaHlgGhjYTz3dUUkmPPbttlr7cgCuoFZTziyLQl8A7++cEeh
         wPBLj4tueEATW0gybAdRbH/sfpul0fWw4q6Ugdrr40iEIqWwCp96ofO8EkMI30Z951wm
         xJGA==
X-Forwarded-Encrypted: i=1; AJvYcCXvCn/BXJ0nL+v4z6sTLzeUF9q/4dOqEssE5Cr7pPMhIrIZXenljXNKEQIIoIQbNHt97HJCMtw0nG7s0R+cBetoqkeegg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwgoRshZrnJ+KBQTJbOucFWZ4EtN8SzoG9KcxrLO9+0yBE6rAIT
	Vbc7vZe1avbTD+QusBBx/o3QyavwI/Fz2PUn4OH8iAJr1ea3K3WSaOCq
X-Gm-Gg: ASbGnctq6lDIat/xOaUIeDXzzUJlJH1qhRTQeC8Kk6WyWRBaDXfoCFPvDGqZ1JdE1iQ
	inwNNVjDc+9Hm03ErUwMDCFNI661LCGScpzrPIn22GUfmQRrOidfStCLrpYjd1u2SWRDSeENx7Q
	3Usr2eHU8YXAek6xH0So1OlK+7AacO358FXOO8Gcges89UYBVMAmlzW7boXjiLz34Sq0+FNc6Ot
	iVhmZm3LSE6qCsyYcmhvIaI7hCpX2rYcgLe8JGvpBpSc20nPtY6hqbotOB8fGsBBqju2D/zsD5E
	lHh9hhJoF1KAmBGTESB1nHnDmODtmrl8tYvBFXtGiBtUBU/WE/h7+j/HE2cZcEDk2gY3XhhL48T
	TgHKGddFfGrMDg695nGCEHkyUuHb8oKFmnxIUoRkeBJkQVUkMLFTw7zmSoZxM2+mxzYAtBoY4Dq
	jdXuJGkQL8tWs=
X-Google-Smtp-Source: AGHT+IFgNrtalxzChmeyomCPGlCrqR2rqh01/vklcS8njZxeR/kapLNbNRzhAZqZQMVsHdryQdmTfA==
X-Received: by 2002:a05:600c:4583:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-4775cdc8ea6mr25282445e9.17.1762340999987;
        Wed, 05 Nov 2025 03:09:59 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:09:58 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	stable@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: [PATCH v4 2/2] f2fs: Add sanity checks before unlinking and loading  inodes
Date: Wed,  5 Nov 2025 13:09:43 +0200
Message-ID: <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
References: <cover.1762339963.git.zlatistiv@gmail.com>
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
 fs/f2fs/namei.c | 17 ++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..e2405b79b3cc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(sbi, "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..849cfdc57b30 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -570,12 +570,13 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	}
 
 	if (unlikely(inode->i_nlink == 0)) {
-		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto out;
+		goto corrupted;
+	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(sbi, "%s: directory inode (ino=%lx) has a single i_nlink",
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
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	f2fs_folio_put(folio, false);
 out:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
-- 
2.51.0

