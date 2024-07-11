Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9620B3A260
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720672167; cv=none; b=Rc1lULz33hBzVIXQxrfi46VC8GFzEHqHHL4A4F28RJha4qj3w5N62OWHutFHt7NvpVeR2FvyemrYvVP8fq1n3jt1y6BWdapqqWd4RteE0VmAzV5Q6cmoEe0VdV7O51UtuMQ8v8fzH3RpsOXgF098TVX9spk8oYxguFvq84TYKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720672167; c=relaxed/simple;
	bh=t1Uux8oEDRjkQ1yaLaSr6zlDLKDvyg7LrLpCDTcxao4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QPZLPmb5/bwodwTKmAQrg05nzRUJtTPbFmvRdFdZuaaNLu69SA0hT0kr3DUmlM58IzAsvu5i0MeaUcMdhr/+8XZEfTSK1RcjY7VJ5FdHGHnpBOfXmEhnM6U8fUTVS5nEYe4aIcuVxECGmNnPGIPCOTURIRQbvpSFkKAXVaJ0PZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMUCegQ8; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMUCegQ8"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AA3413DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 04:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke-EYhZA9y27 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 04:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E2434139F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2434139F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VMUCegQ8
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0E2434139F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 04:29:24 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-70847d0cb1fso113644a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720672164; x=1721276964; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm5wKSqcAJyUHz8lRZSzAcGOp5jdkpoDCLTobJAaN2E=;
        b=VMUCegQ8YDVqwMP1xvhiyCv7u6q9XqzSfgUHcazeP8OL7u0x+a/OWo0slfwLBsn0pS
         k9sCY23a3I25MStVv+mw7Kyb4Vt67hA2SYR0e8HNXQ9XVWmuHjXuCSWTOq/4Wc0+ykbU
         OEQpJInBrzKrRQqn1QUknwxPNUF+HCc55pEv2IEIebl6F4GQ0V4KdjkNOWPFMWLHOIbP
         lwoj/QKkCIWf7IkXpDtQUS0/KmBDC4iBQZEyyBJYei1XEmzim44y5GAgLflqZLchDg5f
         VSvHJ6TCIP2DrBfHVZpdDpoZVZ/jwLlLa7scB5k24yKZcU6g2d2U1uSXplR0sdGm15xQ
         t01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720672164; x=1721276964;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm5wKSqcAJyUHz8lRZSzAcGOp5jdkpoDCLTobJAaN2E=;
        b=c4uMVRcCbZv0Q6U9bGakwhXfJPLTJ+Cp/O3Vdso/NLx5WAe93n3MVmTsHhMnd/2PLJ
         dH62pGpQDmbEUTO5qW6fnAt5LNq3YHdF/rDYx0gUUHrY5pNMDdMmZSNt3fBMKx8Uo/HZ
         3hLFv+AtksBGAna8Fr5sWdHsO4joGvAJ4RlQz3CIHKpalDQla7Uss1UhQNJfb9+cBUBk
         hQ62HIb2fsnjjm4N13OcOtqndcG5wAw3LpJ6pyB92IQztLRDEHEROqp9JcyPQYOnhM1v
         76qycWZuKGQw6OY+J5Z5LTNLrWCLMhgXOm2N4vA7tcjQAQnEMQZQZ8LjomEBnD0gcGFt
         laAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWcBteDwHO/l7yrr1VfC6c2JiYI9zsZTVaJZub/Wxxi8Fz9Kz57SJeS3MqXjL/VqbVBdzp6se0uM5VExHvwMUIgI3u03UV6RHfwwbwoVOuek+p8SHIqvGJEDDpBMfI
X-Gm-Message-State: AOJu0YwqmV4AfooT5vedfkZ0hDOs+OxW+L3fPK6avNKiEvCfJK1ZoEgk
	C+4xXsaOwZzdk4/qH8I2t4vELAvvnkGKSi6EebAZoHNZNQ1HDb1g
X-Google-Smtp-Source: AGHT+IGgEU91R8zFIOKM0r/MONCxqdOFQvD5dhzSPqMckp8oZPJ65oonJxNJYPaD7L9TGhNZnTPHCg==
X-Received: by 2002:a05:6871:54c:b0:25e:1ca6:6d09 with SMTP id 586e51a60fabf-25eae76455amr6319946fac.8.1720672163638;
        Wed, 10 Jul 2024 21:29:23 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa2a1e76sm1520640fac.50.2024.07.10.21.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 21:29:23 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Wed, 10 Jul 2024 21:29:21 -0700
Subject: [PATCH v2] btrfs: Fix slab-use-after-free Read in add_ra_bio_pages
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-bug11-v2-1-e7bc61f32e5d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKBfj2YC/13MQQ7CIBCF4as0sxbDkCa0rryH6WJAoJPYYqAST
 cPdxS5d/i8v3w7ZJXYZLt0OyRXOHNcW6tSBnWkNTvC9NSipeqlRCvMKiIIGsjiQN1r10L7P5Dy
 /D+c2tZ45bzF9Drbgb/0XCorGkFRq1N4YO17DQvw427jAVGv9AhUwBrCaAAAA
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, skhan@linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720672162; l=1993;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=t1Uux8oEDRjkQ1yaLaSr6zlDLKDvyg7LrLpCDTcxao4=;
 b=Ydee9F0C2BZyLYbU961DAb4oTQybaAXaVrKguzna5nItNECSYvuCipHlPkeSYRpdTvhzf7AtV
 Zh2UhB0tjFHCDTu8Mo8oRwAfpeRo4rutm+njiteOHhJIKNfUfxQ1JWX
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

We are accessing the start and len field in em after it is free'd.

This patch moves the line accessing the free'd values in em before
they were free'd so we won't access free'd memory.

Reported-by: syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=853d80cba98ce1157ae6
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following error:
BUG: KASAN: slab-use-after-free in add_ra_bio_pages.constprop.0.isra.0+0xf03/0xfb0 fs/btrfs/compression.c:529

This is because we are reading the values from em right after freeing it
before through free_extent_map(em).

This patch moves the line accessing the free'd values in em before
they were free'd so we won't access free'd memory.

Fixes: 6a4049102055 ("btrfs: subpage: make add_ra_bio_pages() compatible")
---
Changes in v2:
- Adapt Qu's suggestion to move the read-after-free line before freeing
- Cc stable kernel
- Link to v1: https://lore.kernel.org/r/20240710-bug11-v1-1-aa02297fbbc9@gmail.com
---
 fs/btrfs/compression.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 6441e47d8a5e..f271df10ef1c 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -514,6 +514,8 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 			put_page(page);
 			break;
 		}
+		add_size = min(em->start + em->len, page_end + 1) - cur;
+
 		free_extent_map(em);
 
 		if (page->index == end_index) {
@@ -526,7 +528,6 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 			}
 		}
 
-		add_size = min(em->start + em->len, page_end + 1) - cur;
 		ret = bio_add_page(orig_bio, page, add_size, offset_in_page(cur));
 		if (ret != add_size) {
 			unlock_extent(tree, cur, page_end, NULL);

---
base-commit: 563a50672d8a86ec4b114a4a2f44d6e7ff855f5b
change-id: 20240710-bug11-a8ac18afb724

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

