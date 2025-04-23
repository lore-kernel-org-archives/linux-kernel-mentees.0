Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE927F4DB
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Apr 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426248; cv=none; b=GKEW5ZKI1Gx0iA5PB2JYxFV3CsRaYwm9T4gY2yLrWj5wKdVINyV91l4BVF/awKd5HFW3b1iVdoEUKQ7rhc3+dATfiATWYb4tffr8sxgqcdzfRH1YEpWIk0U5gBjnzVaWCm7CzWnuOa6RmuWn0wtW4AzOuHqwfAfK4fBS16FPH7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426248; c=relaxed/simple;
	bh=MzRjrb8d940+qeWbY1aC95yDkgC+f4+azLUdJNM0BVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2fgkLJ0IoZUoiKDBM0Ss7JUtuIYEcaRh7nlqnI+3+GUrgh/+1Yy14NsVPPUkjk9A75doxeNq35WVZsQmcll5+rFDZ8/biAoFhdRJTzmh3iTWct3HjRglnogGNJ1UY5er8w/6d0M6sruR0fQaldXTTD2IyDLfAZ24aT1Hou7jyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AepqYCQq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AepqYCQq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22928d629faso384065ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Apr 2025 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745426246; x=1746031046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xox8BeQm7Kx/G9Wei7lGV+9+maCEi+mrlIS4FPZetcY=;
        b=AepqYCQquYCLmK5camc01/72GjjG3vlW0zqsThjwVnDaVPYaYvQIR0M7DcGNxaRQKP
         UcHhxrFgNfEwk+uDUKGfXsNlGxZiHLi2jZA2e+oaIQ7HPfAbdgel4cAsHRSLlb5U7Czo
         xkX8CGDUMH62JvnBzeSOsVvxqF7Jgr3eIqn6lWpOO5qaGfMWOCU7DQCLGwjQDWsPIKKt
         +zKTb61olw2leoc0IwCDtyfH6ZWJDWy6IemElpknUt2EbgZYNFLxjAvGUMPViwYbHPad
         bhohK5tkoBDFH6MgPUbehqFo91Zps5UBhhKVKK7y6VZu4b8U0ee8tuIb1F7FlB8PDazd
         GgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426246; x=1746031046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xox8BeQm7Kx/G9Wei7lGV+9+maCEi+mrlIS4FPZetcY=;
        b=nlQ5ABQ5Q/Qgr74GYfjd1Dip3nh26aQ6RF0g7TZZGQlqDcMZNVGujJtozarsD7aEDW
         ipMbUAnzL/UgHiqyKKHJgaP4jpmAcjmPJu3aDDw2aFksAUbZ8Yu3hNHR2p5EA7T18nNk
         ETn+3slyyxXu+kEY6AEdpRi5yDDUhYX8SemnxuBeRWHQOwwTgC7/4piaHtHxpxS7FWBz
         /deBZ9l5H9KxM04MpL6XN5ZRqvkDUaryCaLK2JnrIYEKk/7eEjeAqLmUTtMKvxkhiscn
         9cbHX05953YyuyUAECL5vFExDnZe8e+0nbth6gBr8c4QgA2iCG2fBpIDZy17GIutUIb5
         eJGw==
X-Forwarded-Encrypted: i=1; AJvYcCWD4de/mAPF93aY5fDmq0kMUQykcScSR9NMmxwixAb3sDAUdIhEyvhffbAVP7LJ5UIuRgItr1+Ho0Hae2XidafnBF+NyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypm46/bFrV7BPUCBfAyEpEOSYESdpfB/uyVpmrLP8CGbpr4bZ2
	pzj3kf4x4jVaHE3UoPBc8UfPaOLLKsuShpKDPq0kyogccftS8qNB
X-Gm-Gg: ASbGncu050cYe8WTuYFLAXLMUk56hzzg7729XOFVSbfB71xUWrK2wihUJUJBl39lhsa
	/ianI55qEgwBANhFOv+S+leDAQJWPF+KKWkuuUaVaeybx0VjEvb7BNkd17CzGx87fimxRgIFPSy
	itQhF5JuMDrKdWUr7hqo5aGb0AI0X1tyVqcS+NSyP3ALWR/k406Nu1gutgHMwVRBujUBa72hKev
	fm09U19iNlXD5LN76Fq+l7zqRRkJFI5mW40i2vZpPdQQ+xQ9jkWPEyA4O7s4vPWuzMQdeJzyomJ
	lG7EawZksgcBasfCY6E/GEzKHiO57tmCZDZTPwZNQRpwj3nGk/co8cuxgHqwCZNigQnOu8s=
X-Google-Smtp-Source: AGHT+IFIWlrnLy1iSgnthvmblbo//BwO4GthNuy0ZXRjs7CSIzp6yPk4AWDJPUZrMIfpM3lihQ5Xug==
X-Received: by 2002:a17:90b:544c:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-3087bb39781mr29259991a91.4.1745426245823;
        Wed, 23 Apr 2025 09:37:25 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:8f0b:7fe7:7ec6:bfa2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa25e1esm2052136a91.21.2025.04.23.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:37:25 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com,
	kent.overstreet@linux.dev
Cc: bfoster@redhat.com,
	linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] bcachefs: Fix unit-value within btree_bounce_alloc()
Date: Thu, 24 Apr 2025 00:37:18 +0800
Message-ID: <20250423163718.194316-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <000000000000736bd406151001d7@google.com>
References: <000000000000736bd406151001d7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use "kvzalloc()" instead of "kvmalloc()" in btree_bounce_alloc() to
prevent uninit-value issue.

Reported-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=549710bad9c798e25b15
Fixes: cb6fc943b650 ("bcachefs: kill kvpmalloc()")
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
syzbot reported an uninit-value issue. [1]

Though the uninit value was detected in the context of crc32_body(), the
memory was actually allocated in "btree_bounce_alloc()". Use
"kvzalloc()" to allocate the memory can solve the issue, and I've tested
against syzbot. [2]

If there're any further tests needed to be performed, please let me
know. I'll be more than happy to assist you with that, thanks !

[1]:
BUG: KMSAN: uninit-value in crc32_body lib/crc32.c:110 [inline]
BUG: KMSAN: uninit-value in crc32_le_generic lib/crc32.c:179 [inline]
BUG: KMSAN: uninit-value in __crc32c_le_base+0x43c/0xd80 lib/crc32.c:201
 crc32_body lib/crc32.c:110 [inline]
 crc32_le_generic lib/crc32.c:179 [inline]
 __crc32c_le_base+0x43c/0xd80 lib/crc32.c:201
 chksum_update+0x5b/0xd0 crypto/crc32c_generic.c:88
 crypto_shash_update+0x79/0xa0 crypto/shash.c:52
 crc32c+0xba/0x170 lib/libcrc32c.c:47
 bch2_checksum_update+0x106/0x1d0 fs/bcachefs/checksum.c:83
 bch2_checksum+0x3c5/0x7c0 fs/bcachefs/checksum.c:216
 __bch2_btree_node_write+0x528c/0x67c0 fs/bcachefs/btree_io.c:2151
 bch2_btree_node_write+0xa5/0x2e0 fs/bcachefs/btree_io.c:2288
 btree_node_write_if_need fs/bcachefs/btree_io.h:153 [inline]
 __btree_node_flush+0x4d0/0x640 fs/bcachefs/btree_trans_commit.c:229
 bch2_btree_node_flush0+0x35/0x60 fs/bcachefs/btree_trans_commit.c:238
 journal_flush_pins+0xce6/0x1780 fs/bcachefs/journal_reclaim.c:553
 __bch2_journal_reclaim+0xd88/0x1610 fs/bcachefs/journal_reclaim.c:685
 bch2_journal_reclaim_thread+0x18e/0x760 fs/bcachefs/journal_reclaim.c:727
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was stored to memory at:
 memcpy_u64s_small fs/bcachefs/util.h:511 [inline]
 bkey_p_copy fs/bcachefs/bkey.h:46 [inline]
 bch2_sort_keys+0x1b4d/0x2cb0 fs/bcachefs/bkey_sort.c:194
 __bch2_btree_node_write+0x3acd/0x67c0 fs/bcachefs/btree_io.c:2100
 bch2_btree_node_write+0xa5/0x2e0 fs/bcachefs/btree_io.c:2288
 btree_node_write_if_need fs/bcachefs/btree_io.h:153 [inline]
 __btree_node_flush+0x4d0/0x640 fs/bcachefs/btree_trans_commit.c:229
 bch2_btree_node_flush0+0x35/0x60 fs/bcachefs/btree_trans_commit.c:238
 journal_flush_pins+0xce6/0x1780 fs/bcachefs/journal_reclaim.c:553
 __bch2_journal_reclaim+0xd88/0x1610 fs/bcachefs/journal_reclaim.c:685
 bch2_journal_reclaim_thread+0x18e/0x760 fs/bcachefs/journal_reclaim.c:727
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was created at:
 __kmalloc_large_node+0x231/0x370 mm/slub.c:3994
 __do_kmalloc_node mm/slub.c:4027 [inline]
 __kmalloc_node+0xb10/0x10c0 mm/slub.c:4046
 kmalloc_node include/linux/slab.h:648 [inline]
 kvmalloc_node+0xc0/0x2d0 mm/util.c:634
 kvmalloc include/linux/slab.h:766 [inline]
 btree_bounce_alloc fs/bcachefs/btree_io.c:118 [inline]
 bch2_btree_node_read_done+0x4e68/0x75e0 fs/bcachefs/btree_io.c:1185
 btree_node_read_work+0x8a5/0x1eb0 fs/bcachefs/btree_io.c:1324
 bch2_btree_node_read+0x3d42/0x4b50
 __bch2_btree_root_read fs/bcachefs/btree_io.c:1748 [inline]
 bch2_btree_root_read+0xa6c/0x13d0 fs/bcachefs/btree_io.c:1772
 read_btree_roots+0x454/0xee0 fs/bcachefs/recovery.c:457
 bch2_fs_recovery+0x7b6a/0x93e0 fs/bcachefs/recovery.c:785
 bch2_fs_start+0x7b2/0xbd0 fs/bcachefs/super.c:1043
 bch2_fs_open+0x152a/0x15f0 fs/bcachefs/super.c:2105
 bch2_mount+0x90d/0x1d90 fs/bcachefs/fs.c:1906
 legacy_get_tree+0x114/0x290 fs/fs_context.c:662
 vfs_get_tree+0xa7/0x570 fs/super.c:1779
 do_new_mount+0x71f/0x15e0 fs/namespace.c:3352
 path_mount+0x742/0x1f20 fs/namespace.c:3679
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x725/0x810 fs/namespace.c:3875
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:3875
 x64_sys_call+0x2bf4/0x3b50 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcf/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

[2]:
https://lore.kernel.org/all/000000000000736bd406151001d7@google.com/T/#m748384a36239a7f66e63cfde949e3db6bf14d5c6

syzbot reply me with:
Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com
Tested-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com

Tested on:

commit:         614da38e Merge tag 'hid-for-linus-2024051401' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10be763f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=49342144b6a907af
dashboard link: https://syzkaller.appspot.com/bug?extid=549710bad9c798e25b15
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b99a6f980000

Note: testing is done by a robot and is best-effort only.

Best regards,
I Hsin Cheng
---
 fs/bcachefs/btree_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_io.c b/fs/bcachefs/btree_io.c
index debb0edc3455..dc00c5273ffe 100644
--- a/fs/bcachefs/btree_io.c
+++ b/fs/bcachefs/btree_io.c
@@ -115,7 +115,7 @@ static void *btree_bounce_alloc(struct bch_fs *c, size_t size,
 	BUG_ON(size > c->opts.btree_node_size);
 
 	*used_mempool = false;
-	p = kvmalloc(size, __GFP_NOWARN|GFP_NOWAIT);
+	p = kvzalloc(size, __GFP_NOWARN|GFP_NOWAIT);
 	if (!p) {
 		*used_mempool = true;
 		p = mempool_alloc(&c->btree_bounce_pool, GFP_NOFS);
-- 
2.43.0

