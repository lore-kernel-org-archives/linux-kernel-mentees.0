Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D127934B
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Nov 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764499621; cv=none; b=Gfn2QjjJmJkWOkDTrZRQxFDUuE9fkIo4PrtGkyFltJGABC61Eq4AD1GX084UclkoJfFaS90ZBNVgkwUzL0P6VNSKGLcr1yAzOzRIxPxcLsmzmqvckQYovyUzQnwyXu0utzf8kr3NuV83Mk1sLlAefUoLCocOQUUWtts7L3562Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764499621; c=relaxed/simple;
	bh=rlIrI/UmoKYEL0vlVjf1XS3AzQOskSjVa2f/87hoTwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q0SiTJ3LlONfzZx27zcDpUWbAcIOzbZBaRyjYajdY18VV7RXzPHq5HOGPM8kjMM2QdkFU21UsrUQ+Ey/3SxireZEjFBov3wu9VWYOyrFQ0415IesBnZUKokk3EIxGWXqzvzprOrbE1aG2tlTd4Ft66OaGZB4W5VihWyHk0GndJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH6Gh/u0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH6Gh/u0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297f35be2ffso48435295ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Nov 2025 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764499619; x=1765104419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qTNLxP/M5VH8d16ArvNC5jrTL5Ks/32ppFB8c0OA9Rk=;
        b=gH6Gh/u0L66C57iyBEPJ+UKTuVeO/cjbLsL77eGbGZb27huaXlUZ86Ryh3qD3qzEVj
         iIR4fd4bs61wpmJBfJWEZHSjRUOvwVS9NsxAhHeirhzFAjah8U6szGlkHaaGqe4enQ2o
         2KU7+Zvt7ZDVHJYNNfGePa+cr/VAJyugvoXHSsWjFBqm5mWDgCa3AF1DvCPvmeaeMWIn
         4CvXzfbQ+4Pv+YZQyJqQNM+MZT3v8MxGa3I0HKwmBwOsO8OeOf9MYKaZ/M7hLbSg54+i
         4S//o3coevLRl8MwnyarHFt5PCbTqgK1jMYY5WlXdrglQzdYRYWMfhBTwqDLmfzfFFwM
         E6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764499619; x=1765104419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTNLxP/M5VH8d16ArvNC5jrTL5Ks/32ppFB8c0OA9Rk=;
        b=J+FeCjr5FyOJ7aTDfuELv5y1PNCW6twfF566WD+X53mA1KZvegHpmtaNBPmrMboU+m
         5tGT2yYamCv580qs8ugTrPpoBwux7u5lr0+JrHLdTNMBfc0/5I9EUjkElUPnA813+xTa
         1Oqai6pRm+2KxS1ejVKdWDBXHw34zl2jJVuq/umr+NYVJWiKgyq/Qsw37PYSBwTPK3KA
         j3hM+RBuimRVlaGNZSE1lkGCEsgFaxMamZMcI6ZZjp3VdQOx09uXhmp4ScRnmdXMakRo
         4wHm0PhUr4fs8d+QsNv9Oyr0eqsxWb7XoGSzo2YVSjZne0Y2s6O/3HbHRzAzyU0tlVfD
         9Srg==
X-Forwarded-Encrypted: i=1; AJvYcCUygq++dPwiSDyRKNjSl1uHY2cP8qD0/oCveAw/A96eTTrL85I260Y6O/sglPErc1dwaVxATzGNiRIG1VTiyaQLMrLd3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDFtJxdgCIgp3kas8NRyqiw0Xe2uVHE1O39ZXsj0YMEOlWg+iM
	sTcSw3d2ymBNWNQBDdGNco0s0f0nrY3vbrT+SApY4l7z0m53xZIEid9K
X-Gm-Gg: ASbGnctAllcbqj18zm+yPCcjV9Lk1fkJz/efn9kolg8a6taO1/LC/zgRmA6RfAmBgX8
	+aULhjQb513sAdTIwYteYysLU+NCFvYDT+IXQiCOMFN2gSmE2UycxVKPZAZnbLqKiEYcXMY6wwQ
	rcmBM4rzxMakChMliC0WoMJdDFBN6s4/Q0H7PeHOLs/IcZMvscoRv6/oJz83hTZti0q/ft2e/WU
	c9pzcCO3m0/RMd0Q8BO6Jjn4sIVuOI6aot+QlR/2C3U+URVaGyDe5NPW8aGRYpt/2hxBDihtec2
	7/xztdQRMIGKGAUOfwSLAJyTaOzdkevNrZlRwoB11R1dEVFgF1NjPum6UBaqC4S6eO0SCsaEAWX
	FxE4ckstrDwpotFHSd1308YMI3LEy3TqS0LUzV9LKC0pYDukmnJdfHhNy+SLJL1S6dhiftmKSjr
	f/U9AHLmuRtFpg/iAtRwPxim5H9YU=
X-Google-Smtp-Source: AGHT+IERaLvmsksXdm4uqqeOPDAGOjVLAPcWW+DVufQ2i3ULjffRh0sjXfMbZt3b4sdgIKb56s8bhw==
X-Received: by 2002:a17:903:2b07:b0:290:c94b:8381 with SMTP id d9443c01a7336-29b6c3db606mr396664675ad.7.1764499618952;
        Sun, 30 Nov 2025 02:46:58 -0800 (PST)
Received: from localhost.localdomain ([114.79.136.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb471c6sm91492475ad.79.2025.11.30.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 02:46:58 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] fs: ocfs2: fix kernel BUG in ocfs2_find_victim_chain
Date: Sun, 30 Nov 2025 16:16:37 +0530
Message-Id: <20251130104637.264258-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a kernel BUG in ocfs2_find_victim_chain() because the
`cl_next_free_rec` field of the allocation chain list is 0, triggring the
BUG_ON(!cl->cl_next_free_rec) condition and panicking the kernel.

To fix this, `cl_next_free_rec` is checked inside the caller of
ocfs2_find_victim_chain() i.e. ocfs2_claim_suballoc_bits() and if it is
equal to 0, ocfs2_error() is called, to log the corruption and force the
filesystem into read-only mode, to prevent further damage.

Reported-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=96d38c6e1655c1420a72
Tested-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 fs/ocfs2/suballoc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index 6ac4dcd54588..84bb2d11c2aa 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -1993,6 +1993,13 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
 
 	cl = (struct ocfs2_chain_list *) &fe->id2.i_chain;
 
+	if (le16_to_cpu(cl->cl_next_free_rec) == 0) {
+		status = ocfs2_error(ac->ac_inode->i_sb,
+				     "Chain allocator dinode %llu has 0 chains\n",
+				     (unsigned long long)le64_to_cpu(fe->i_blkno));
+		goto bail;
+	}
+
 	victim = ocfs2_find_victim_chain(cl);
 	ac->ac_chain = victim;
 

base-commit: 939f15e640f193616691d3bcde0089760e75b0d3
-- 
2.34.1

