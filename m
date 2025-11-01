Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6BC2F659C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001832; cv=none; b=a8h/MynFRp7KCmgiXon8+4dq3BM6o1IJF7LkkWeRPniN77fGd+w7+sqxQnsKAONQthYexDWEPZml6shafoRoeytNcnHWC2iq+GMOGO9TofMsbveBgEt8YBV85/UNwHZ4q/hQQ+SsLhZGsZkmao6XtC/721QYoRVW00mLbqedBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001832; c=relaxed/simple;
	bh=AsORuNq9QEoETuNPsp+K3BhhFHPTpvIBWJR3uME9i68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZNpbfMcAXP9IpKs+qQALln97BcCO95tOb5CHOlPwBOKzEw5kZmyBoGU6ygcfYtzSZK1aRLHEDq0HJwLVKOIc/orGfPFSomrCO2doBz3ndeFcH0p2b3YOuxM1fXwg70hJ/UpJiNrLjFpoSJKji1nlSEeEsV+2cKQv+V52nfOywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P32w/EMc; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P32w/EMc"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5DE84D9C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrP9a0hZ69mE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Nov 2025 12:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD30984D87
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD30984D87
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P32w/EMc
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BD30984D87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-429c2f6a580so1166022f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 01 Nov 2025 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762001827; x=1762606627; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=;
        b=P32w/EMc7QkA0prQC4uEBicR3HaPvecSay3zMfcb43nnQ2x1YgN6MuYrPP55vuQsas
         /bGCuKQxzTgAkvVk5oHBOg+ENMa7/sPRPjb5czOuzBD8Q8UYljUmmLvYvahZkdHlErgI
         fO66rFgHIi01Z++82evdFJ7wSA1IgOeWI6aX6814nVvkLuAqO9wmR92vVKF5IzPSVywr
         TMTdwGu2EsssGeKz4ynPvfbtSYuM6zLBWfEHIJaRJ49B117czdNHBrrIRLQxya5MIVGT
         L3HCxhEy/NMSxmFrwVfu/fR4f8F3ybxQRk6bvEALYjCkkM+jwl6zaHwsxDl0fSLx75sa
         bf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762001827; x=1762606627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=;
        b=Ew3Hefd4izNz2j+5O7e9tUCI9XvDh7KeWGy7Hq/+2nCXDxqJQw32+XrFEm/6CDOt5N
         E01xY5a9QFXHuBf8loXoQaSSNDlr7ud3wl++dwkygXSAQJxLe8PrjUEaZ31Mb5U0iAcA
         L809McIwNW4BfXmrLupNGxxZ5dB7d/uQe5bVrG7i6HyHac+1LaTZMZmes8EoMJT29bA/
         dP1tXCf5M5RJJ3LuGLbMlr1OHBGmC58S2NZwDDa7cp0ksomqFdVkof8VQ19n7nYtlpB9
         /2A04/+g6eB+JS3YLbcuOTq1nEh4ydepGzDuZrKjNelDMYKfCeVgvIRrZTgWY2YnkmEL
         LRIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHSGMMb1nznnqIGzWvTWeuRi/+hnBt1YlohAuQxR3wL1FYryjnyeRuDYF8gwmcDp5qfvCtAEqAHCfjy/RX11/Zg4Xx6g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzm8EnBxsDJeKW5B5vQi+gEI32yADhz7m3AhOi87LCeVbdR25yl
	CWxZtvguxZOFOSaxUGW8yzVJzf6Z1jFBEB0hH9kCsDu8l8HOdZcDEp4u
X-Gm-Gg: ASbGnctzqzn1l/XzqTeF2gGcTITxY6nL3dP3RV4FfRhXPMD6PdetTOReTCxop7KXEKV
	+biZ3LW/iV0Djv1rjIqwm9fA5oO+c65c4D+CKd8ub+eM4bdd2MD/sMHiT1IIB8jJ81vqcCFwL+t
	uMZ29/t+yjiVBg7f31wy/8BCW3EmEEQ2rv6A8azLrtOKzvKn53MoEpng7GVy9bx65ZfTnm9hICN
	5n8RMgTztjd5nVqthQMb8eWyM1/pTTk4uKSdveMVsMUJIDxFZ8xm1/ALMdz/WozZoX6d1AWu9D9
	WhWw25a0dcHOsMSKcQGVifzzbFLnFnMm3/xiocQSO0pnCXUo7jhPaij2Cc8dLYn4UpOjAFS8BzP
	A35w6EwQZyUU5a8D/gXdEXstavW9xXhxWW9FeWI25ygFGSnE1oPgFgJZFVTzHmOc/buqChWUNr+
	0Na9Ed2Cxp5+rguYEasjl4Vlnc0nz2WRcN
X-Google-Smtp-Source: AGHT+IHvGjk8Ah1Fx4qTSdPIY7y0Q5flgx6ul0HOMtKhPjD29is/NlNCRvL/ugm2YCTq2bo/oqsYFQ==
X-Received: by 2002:a05:6000:43c5:20b0:429:b857:6fb7 with SMTP id ffacd0b85a97d-429bd6ac095mr5276612f8f.52.1762001827234;
        Sat, 01 Nov 2025 05:57:07 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 05:57:06 -0700 (PDT)
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
Subject: [PATCH v2 2/2] f2fs: Add sanity checks before unlinking and loading  inodes
Date: Sat,  1 Nov 2025 14:56:16 +0200
Message-ID: <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761993022.git.zlatistiv@gmail.com>
References: <cover.1761993022.git.zlatistiv@gmail.com>
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

Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
sanity_check_inode in order to detect on-disk corruption early.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/inode.c | 10 ++++++++++
 fs/f2fs/namei.c | 15 +++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..089cbf3646f0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (unlikely(inode->i_nlink == 0)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..d13077bad482 100644
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
+	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
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

