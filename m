Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC82512DD
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013681; cv=none; b=nRrI5DXRku7CYB6yoH7U7WQ4QWXiEZCZlcfAkXHEwoWs5HnXwSfb1jVBxnGbsitk7ctg0P+cs78ahrWVarytYUJuGVNRGKKROhJ8Fp82irXnMIL6hdbN7ngGaeReERQuVZ6IemWDW+FHh5tjOI7ci0E6cdAaBitD66ZDNyUWKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013681; c=relaxed/simple;
	bh=G15TbEaaORHlH4PKFvQC5S1g2tM1QIEczD+xXH/buq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adbrCqlOVRDBdxfEZF1DGb+QxO092g4wzpUh7VQ8CM0j06S47gDtGJIV+g5DpHlFw5UzRslJFUv1tOZX1OksQ+CNa/pzTL6F3JqEJpLEhSH8YV0V0tnp2Ge7VHIlxoSQet/zi1/v0JOBjcoFKa3C6N4m3UZgDRO3yVZIOQEOVwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGpGGMyh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGpGGMyh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2363497cc4dso19080045ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751013680; x=1751618480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7P03Am8WwxtD8ZLQtp8L4pE4xvZy13+wsAyXWAqk3w=;
        b=dGpGGMyhVWyX0sYhhKoZcLLXnEMSK+2n9yfpmm/UZsq1SCvNlHAeMU2aHj05mllCh9
         EJUHG6gt4/lurnqDV4VvCRveJj9IVISxKjyr7ZensYgD+txCtzzhxje/Qbfr+p5y2OTM
         ADfgTAihd5xSRRtNG8fuhq0d1nUzuZZgi1Eowjoejw6FPqMY2DMf94hhgEb1XVycfdhp
         SaxGqzZJeRgDyMoyKLBs1EoMOAoaPy6vJLcuaiJE7hLXLbGUK+AxQg2xArZ21MxW9QMc
         2kriB/lNi365qD8cm2bCa7Izg4NMg1qOjzNSbzzDQ5v8DjBQBFsJvReZHtSOzwzWx4bR
         vJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751013680; x=1751618480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7P03Am8WwxtD8ZLQtp8L4pE4xvZy13+wsAyXWAqk3w=;
        b=aumtI5S+3S3Mmfr1mcZlZWC1XXnobFxYVWgrih6MIxT5j1DtiOlN6OV1FONGJ8N03I
         9UW8iY+axHpH5WQE4/wX6+Jl3SN2FGnnfjEwf4WLL7vfFIdwQngORE/nMMKeAV68ub/i
         kuQUY+Dx8huWXbi1MyxfrRbx2E/iCW/m2PU2Gj+y80W50hGiSZDD1fF8tw0YiD4Lzsn7
         XLGlIT062bhiMeO9EjlGYiM18vJG4o5aJbU2GLyugwWH0rmyDJCnqOKQk94ayiez2VTg
         JMOYtja+ZCDXouI1tydQRrQ93n7cu8MmpP6bj/dvtEqkJYC8yXdcB/4Oyje8f2bu7+Ep
         XBWA==
X-Forwarded-Encrypted: i=1; AJvYcCXYxGG6uC2/bXLtqCI1b34Sz0MWu/a2K3THrPvEm+hG9qQSKGJcptvyIh/Ya+H9g1WhtTseOKvGUMuROBbcUp/ayrnzkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYk1d18UYk1t6sYJBvRwXGm4XD2er4+fBXqJNIIzV2jKq+c0t
	nS5FDPSo+UScUA41KzhjsI5P8eJ7C2FMKUDqFrRM7WaAXt10iw4Bbzgo
X-Gm-Gg: ASbGnctaTz538ulR9KNYzNEPuCvj6kDtjx9N6h8fxV38DV++XX2OW5WbAgBpErpT5CK
	pDEcE+vh+jRuMMlqxbVA6B8xlYkuqkv3oLXlxKLq401+SbYmg72abc/fOl7/fcgoYYx5Rdx2ryX
	kCYJw87K5WZ0xvT0OLeqN9dLdmLANKuS8OsHqQS52QN3WW+8JqGmZA2ORT2wZ06kZmEzIbxE3US
	o83KiZsdLGlAMP7pgylTwpt9kYi9hLkNd4818SOfSJpT6soqx2g8fZfR2H0ZpbCv3Kbq51XZyE4
	/rynbgse0eBgfx96XnNl5QcsVZwihijA7dAUD6cpEboUww4SXiQyKGIoOLZ1KAbUYTxQQ/Mn0og
	ZXby2
X-Google-Smtp-Source: AGHT+IEhtmnbYvve8P8SDXttYyhI5mB1zS1BNdn1fSZzamgnXBJXcQIUlABy/QdajF1bRdhSmyCINw==
X-Received: by 2002:a17:903:1c6:b0:236:9726:7264 with SMTP id d9443c01a7336-23ac2d8687emr45206315ad.5.1751013679650;
        Fri, 27 Jun 2025 01:41:19 -0700 (PDT)
Received: from archlinux ([136.185.226.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c9cecsm10989485ad.251.2025.06.27.01.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:41:19 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+029d1989099aa5ae3e89@syzkaller.appspotmail.com
Subject: [PATCH] bcachefs: use mustfix to check invalid btree IDs
Date: Fri, 27 Jun 2025 14:10:32 +0530
Message-ID: <20250627084033.614376-2-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checking for invalid IDs was introduced in 9e7cfb35e266 ("bcachefs: Check for invalid btree IDs")
to prevent an invalid shift later, but since 141526548052 ("bcachefs: Bad btree roots are now autofix")
made the parent class btree_root_bkey_invalid FSCK_AUTOFIX, fsck_err_on
no longer works for this check.

Change the condition to use mustfix_fsck_err_on instead.

Reported-by: syzbot+029d1989099aa5ae3e89@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=029d1989099aa5ae3e89
Fixes: 141526548052 ("bcachefs: Bad btree roots are now autofix")

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 fs/bcachefs/recovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/recovery.c b/fs/bcachefs/recovery.c
index d0b7e3a36a54..abcaa0e3e2e6 100644
--- a/fs/bcachefs/recovery.c
+++ b/fs/bcachefs/recovery.c
@@ -489,7 +489,7 @@ static int journal_replay_entry_early(struct bch_fs *c,
 		if (unlikely(!entry->u64s))
 			return 0;
 
-		if (fsck_err_on(entry->btree_id >= BTREE_ID_NR_MAX,
+		if (mustfix_fsck_err_on(entry->btree_id >= BTREE_ID_NR_MAX,
 				c, invalid_btree_id,
 				"invalid btree id %u (max %u)",
 				entry->btree_id, BTREE_ID_NR_MAX))
-- 
2.50.0

