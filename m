Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6561C822C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Aug 2024 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723670216; cv=none; b=DEyVhQMWLWCCfu+VCFlmdIknlA+Uh+Iy7JZUaHiEP3hSijHhjPbYcTTdlcc5oFwHXfrYkxWqC5YgIcJRHNmsEayrq2yWroPZBw5buxaQAVwET2KHkBLHhpshcq9mDuk2xn7GVOBjBdSId5agNAQ2ACsSssKXeP1WYNLg5S4Wt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723670216; c=relaxed/simple;
	bh=JJu10rUqvhoONT4FMW2wGNtKYWRXEinTec4MxVTqdmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M+hXFME2D1se9hRw2Rjt4inc865uRrgj5PG13UcRX9gClSiHl/MG2Y8Im/1NDhmObtrrdPPDpvB3kSbJfzROCLZSDx7MNpo2tJbkmJU9y1obvOCOlK9M7aExx/AYLrODMauhFqQc2dp0jhEJAnwK67RnOWaplX2isynTHbvr1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkpEduYc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkpEduYc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2F7608EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Aug 2024 21:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzjS6i1D_2-l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Aug 2024 21:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=djahchankoike@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33AC8608E9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33AC8608E9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jkpEduYc
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 33AC8608E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Aug 2024 21:16:49 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7126c9cb6deso197470b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Aug 2024 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723670208; x=1724275008; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=;
        b=jkpEduYcs+Io3FLZyrzoZvwlAJg7XgT0mTZbRb8PFiY3JNFKt3WMDT1ktS4fFksesX
         4OC5sBUvB74HLYctzNqOPGYNhl6Ce0habDTESTitvv1Qf10NTPIgqhADR1/+675Q07mt
         tyFaTWu752O4cU6ejlOBMze420N+miAtw2O+mw6i42UHVCaajk34w6NLB1QsU2NohpNR
         57+ZZO3fs28uMYUAjvku+oJh7nt4QWpPZ4GDQlgKQWAVTrcWE+4e8tObBmtrv/cl29OM
         EuUZ2U9Iwn6ggg5oJJWueh+hyu8LrZgR9FIcdgRhZwwhOnKy7ATumEV0b4d/XE+MsM9o
         556A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723670208; x=1724275008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=;
        b=U87og6vP+JTIMdxJ1uz/xlhUodlwc2meBddKYXXQ1yJHqz1AmvvcVmDMSCjvgW1wgb
         eS7Y8uoMo1PcP4LQCItH3rqy+oUMkcEROyyd/GNEFBFgeQmn+AdRRs/j1cxpz86tbY5v
         kOaynQAAwXpYbLFErdS7zx6FVhWWP0q6tNfYX8Z88MtkkcacLcP7CSKOrO5TVy+kPM4d
         3o/0RasY7LbA/YdOZST5Tvy0BxPGhz5bynEGumfEtrrF+Jyq/VNr4bTjOp6mWbK/XTh8
         eXJqtCe5kgxroe5WqrDGyE2mDW0Y6v5bXW3kjz/y9m4v2eZ3kMUSiZvl43VTJFO0Zg+W
         tzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK7+rj0lBqayhs03/lUX0bWCu4T7Nf4sfVNqAYvUibfTd/zEspDzy2VripUOYvQ8q6024RbxrniDQDz/WTZ0LYon0QLf5jJuBNTIluxwlxR1NXe9Zu9dHQcz+OmLW+
X-Gm-Message-State: AOJu0Yw6/hBuHplrqn5wYVlziafKk9O/d60zbm0o735gFTsywtDz8Wwz
	DrnpgninsPrJKKleLMXTKBiXgXtNcvqHp0WV7dMdDbOrmlLUcrHV
X-Google-Smtp-Source: AGHT+IF40yt88J2Butglx46sQdOzBwoONfypAPbzL+xZUb9dsPF3jvjvcdDQmIzPIc31FfLEnidnqA==
X-Received: by 2002:aa7:88cc:0:b0:710:5825:5ba0 with SMTP id d2e1a72fcca58-712670ec998mr5006066b3a.3.1723670208263;
        Wed, 14 Aug 2024 14:16:48 -0700 (PDT)
Received: from ddebjk.ddebjk.net ([200.4.98.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef5457sm14738b3a.127.2024.08.14.14.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 14:16:47 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: jaegeuk@kernel.org
Cc: chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Diogo Jahchan Koike <djahchankoike@gmail.com>
Subject: [PATCH] f2fs: fix unreleased reader lock on return
Date: Wed, 14 Aug 2024 18:16:40 -0300
Message-Id: <20240814211640.167728-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix reader lock unreleased in error path.

Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 51f6ffd5f4e2..c9eda5dbd11f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2172,6 +2172,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret) {
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+		f2fs_up_write(&fi->i_gc_rwsem[READ]);
 		goto out;
 	}
 
@@ -2181,6 +2182,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
 		if (IS_ERR(pinode)) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			ret = PTR_ERR(pinode);
 			goto out;
 		}
@@ -2189,6 +2191,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		iput(pinode);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			goto out;
 		}
 
@@ -2202,6 +2205,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			goto out;
 		}
 	}
-- 
2.39.2

