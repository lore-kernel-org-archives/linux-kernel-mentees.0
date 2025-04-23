Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22C256C6C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Apr 2025 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745375831; cv=none; b=PkAbv6AK+RbCrRxcZPccAz5fpaqJlzEkGT2sUBzDYi4Di3/KM5Ki13VK8j+LI60DuIp6CtP65YPANurRSMgp/D899Q6lC7pBoYr+lIVcS0w/tLfcQ3Y9RAUMDu0GpOfXSbCDFllW6ezMddJEc48WOEIYr8IGPssJBSLWrCngEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745375831; c=relaxed/simple;
	bh=fbNJO/O8ZLr6gQ8KnxRAu8G94Pvwxa4PHtk3nXXv9JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5uQAvCYRhlCyXZZH/frDzHdJbvJpVbd6liT/8C9UWBnjNFZUn2O+XmwD/YSieMVZRXIN0+sXl3khiYRV1sFi4agSB+1o71FXtBhUlYgdAhMAoQYoWwU+dvkLrXBTGCXRzLeigEVA3GP+NL/Es3WuEY5CvFInO6qbY4V1X2erGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcCNlIYw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcCNlIYw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225df540edcso5758315ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 19:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745375829; x=1745980629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0covPsBk60C+c98aMqlqjUhpT0cBbCDGGXnljyb2rE=;
        b=UcCNlIYww4pqmYqpBBPiGL4V0fxeEq4wa01d06qQQXt5CMsk5tqNJMJnpmMdAtT1Uf
         xhXhgTXFoNnl6WGjHW1UqaSbpAmPj1IgpfI4dHPsqtL7+bAjJkBzult6VX1fgB0MO9x6
         0zIvTU9EUUplsBx7TuboXIftXP9/v/0eYPPN2Mxx3xIa3nvjl4HjIjILEjpUdu+qwMUc
         bIKmFzE7sI8Op6BM2Dl221ey7wFj1dNQqqsIJQOPnaxMEkJeiL0eeRJc1UX3+Dfx2D7F
         GBOHmeExCJ0KAYJcjHmupY7C+xtsv5cRQOi8w5TVLIqkAt6vCkd/PMe82l9H+SmETkNT
         qtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745375829; x=1745980629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0covPsBk60C+c98aMqlqjUhpT0cBbCDGGXnljyb2rE=;
        b=r94Vhmvla9mtvntvR/01EWAqTwPJizmeA7mQfIMwAmhcLKk6zlPsUJmng76A9VVyTe
         rQJwWqgaypVnpsKVPxTM1W7HzGIS6AW4tFN+uCEniQAE/9PyqFMB+u6d6kN21yRJOpjT
         Nk/Uu4bqlFuut7VJT0c6yQMuS1gnjPhk0YNFozXHjQ+h22AJ+5ATIM0WBPyyixTiBqIe
         Dt2MwYZF+B0ltd/x89TP0Ls0oeWu9kCwMDvTi2F9fFjXD7+OuboR2cvFkP3OEuXu50MY
         4ipn94cyufm3CnAE10hfM+sHPH2hZY33PmVTd2nhNejwqDQ86e5dndQLpXaF9pvdhTrP
         lRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVocrAirwsEY9AA4O3k0NNhBAcb+pZmTDA4SBEGMt5RqeJV1xM/j88WEzAKOCshimbyeQ8fxcCkgsW6hHbXCPsKxOWqNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylykFbgbT3w1etQ1Tte0uIHZXuR3k9UHGheM7B/LdNE7Vq5VIS
	5lJi+2uIo034/ON8w0CafYCnIwgjHkUGat5slji+NJvXeQJlgkFg
X-Gm-Gg: ASbGncuBS9m7udA8eZsv3aDjY4rlihb3n5VS6PigiXJgiSI/U2HY7yrekzdBwRa7nRb
	rvhKtBakl4HND8T7Knqx+gW5bUrxVzXVXGJ/fAQeGSPHDruQEsLsS88TNTySC+pCSoTtc7HusOY
	A2j9h9x+OXMW9t4VTBvmv8me/xvm5U0XWddDJ1h2qYLgyy8fS3P52axUrjJ+0znIPHo2UI6jUMX
	D04Xhhp4IjsKBn8nZQVIqe92//8CC0u6chvyGDom2BIQt8l6k1khzp69+SGz63p32emhcVMCilv
	3Aw6OeC91c7kF+sSPFKztslk9Jg2cxkGIT68xVv1+G+Yze9NvbGZCWhSwuxdKVUnyxmsZeY=
X-Google-Smtp-Source: AGHT+IGsvGP5RH8UNJyAmbvgKpNx3TEl7JMeLI+5MkobhhMwpUTlsPDqtk9r7R8FG/hRcWDmkSJmCw==
X-Received: by 2002:a17:903:1b6f:b0:215:9eac:1857 with SMTP id d9443c01a7336-22da317abf2mr19665905ad.5.1745375829230;
        Tue, 22 Apr 2025 19:37:09 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:c11b:5090:296c:1c32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe0679sm92646925ad.249.2025.04.22.19.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 19:37:08 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	shaggy@kernel.org,
	syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] fs/buffer: Handle non folio buffer case for drop_buffer()
Date: Wed, 23 Apr 2025 10:37:03 +0800
Message-ID: <20250423023703.632613-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <66fcb7f9.050a0220.f28ec.04e8.GAE@google.com>
References: <66fcb7f9.050a0220.f28ec.04e8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the folio doesn't have any buffers, "folio_buffers(folio)" will
return NULL, causing "buffer_busy(bh)" to dereference a null pointer.
Handle the case and jump to detach the folio if there's no buffer within
it.

Reported-by: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de1498ff3a934ac5e8b4
Fixes: 6439476311a64 ("fs: Convert drop_buffers() to use a folio")
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
syzbot reported a null pointer dereference issue. [1]

If the folio be sent into "drop_buffer()" doesn't have any buffers,
assigning "bh = head" will make "bh" to NULL, and the following
operation of cleaning the buffer will encounter null pointer
dereference.

I checked other use cases of "folio_buffers()", e.g. the one used in
"buffer_check_dirty_writeback()" [2]. They generally use the same
approach to check whether a folio_buffers() return NULL.

I'm not sure whether it's normal for a non-buffer folio to reach inside
"drop_buffers()", if it's not maybe we have to dig more into the problem
and find out where did the buffers of folio get freed or corrupted, let
me know if that's needed and what can I test to help. I'm new to fs
correct me if I'm wrong I'll be happy to learn, and know more about
what's the expected behavior or correct behavior for a folio, thanks !

[1]:
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: null-ptr-deref in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: null-ptr-deref in buffer_busy fs/buffer.c:2881 [inline]
BUG: KASAN: null-ptr-deref in drop_buffers+0x6f/0x710 fs/buffer.c:2893
Read of size 4 at addr 0000000000000060 by task kswapd0/74

CPU: 0 UID: 0 PID: 74 Comm: kswapd0 Not tainted 6.12.0-rc1-syzkaller-00031-ge32cde8d2bd7 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_report+0xe8/0x550 mm/kasan/report.c:491
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 buffer_busy fs/buffer.c:2881 [inline]
 drop_buffers+0x6f/0x710 fs/buffer.c:2893
 try_to_free_buffers+0x295/0x5f0 fs/buffer.c:2947
 shrink_folio_list+0x240c/0x8cc0 mm/vmscan.c:1432
 evict_folios+0x549b/0x7b50 mm/vmscan.c:4583
 try_to_shrink_lruvec+0x9ab/0xbb0 mm/vmscan.c:4778
 shrink_one+0x3b9/0x850 mm/vmscan.c:4816
 shrink_many mm/vmscan.c:4879 [inline]
 lru_gen_shrink_node mm/vmscan.c:4957 [inline]
 shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
 kswapd_shrink_node mm/vmscan.c:6765 [inline]
 balance_pgdat mm/vmscan.c:6957 [inline]
 kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

[2]:https://elixir.bootlin.com/linux/v6.14.3/source/fs/buffer.c#L97

Best regards,
I Hsin Cheng
---
 fs/buffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/buffer.c b/fs/buffer.c
index cc8452f60251..29fd17f78265 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2883,6 +2883,8 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 	struct buffer_head *head = folio_buffers(folio);
 	struct buffer_head *bh;
 
+	if (!head)
+		goto detach_folio;
 	bh = head;
 	do {
 		if (buffer_busy(bh))
@@ -2897,6 +2899,7 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 			__remove_assoc_queue(bh);
 		bh = next;
 	} while (bh != head);
+detach_folio:
 	*buffers_to_free = head;
 	folio_detach_private(folio);
 	return true;
-- 
2.43.0

