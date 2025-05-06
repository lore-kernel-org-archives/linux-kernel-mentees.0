Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEE23A9A8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 May 2025 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552038; cv=none; b=bjFDHYi0kMdRKDqIY1N2O89G1cJGDAGqB1QRqKmtSQkxctC2v9FdGItdfHGLz1ByTLtSoRPufFvMDxIL6P8rrIsLaqZSzACbBuqjpW4Ojor4ohWj6qH05kgT+LlgpdrssbWOFQyjryqH/n4lwEBae+knDtFRgZgdNSCy0U7ND1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552038; c=relaxed/simple;
	bh=9t0gJnfvzzPMhEJzmLgkw3xQ+EL9m22qmpZ3J+xXgN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbuEqPZjpWXFBj11wQ8Y6X0ooML2GLg+pqgzm5stHxas4yLl/SMULn7m+5Tvew/enTFOl2bJVO4h1y3QpCXZzItGRnn5KYixfhfrjh6Baq4bFMatbx0ux/PYUe7D6si29kRvA/qkz9onV0jZef8mKpWS1ylgv+cOGdnXvSTO8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVECirPP; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVECirPP"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso5515065a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 May 2025 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746552036; x=1747156836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCzSiv2LQpckhD0M0yqvrpeHbcSq2tmauRhmbhTcKao=;
        b=HVECirPPL+9I/F0wmC2YiKwJtyD80iUrm6FsJkyGTLdZoWp9n1YwLKWcAmmzDGBg19
         Xp6xsXww+zsElx+H9Z4LaTsrUL4I/PSEdPt8Kt19FWOjYi4pKXOzYm7IylRCByX3CLXT
         znwzO21t6steiM4M0U250TBi/HEm1PkfsVsJuHEwjmGW8v5HJlHKJQuiqLt0vHecPS4f
         8MJ7qGqMk9cerbC5HGdudzj9NgE1emtob7Wq2BwAdS58huTSic/o6M1tc8abZ2BW9Xzd
         Qhlo2hJqUUB+iQY1RyIhGRXjF/+smaNIKapxqRTgIwnnaLQO6ncds6jZyqTptx7ikbxw
         kVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552036; x=1747156836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCzSiv2LQpckhD0M0yqvrpeHbcSq2tmauRhmbhTcKao=;
        b=TCkcc/mnvnC9tcuZlxlof/5OiFhRWAYbVH1yIPNjn5oL7oavTcOE+IrfTH5HADJ230
         cP9B2/A+y1r27ZwjsSL5JPyn0E59cXT7+LLRfwKz+fh4CuNk+qCc1qk7S74un3mYIzc9
         R6VK6V2YV+bl1u5COLxm7Pplj2d+yxjDbFK8LV65mFzqrymjbNeLdV9DjfnhdelqQih9
         cXvaKouTc3gxv9LRulPW0AS28pDD0x+CGbSJn8VHG0hMtQ15DZw28aOFtn5weF5ajaPK
         w6n3Y6kQZcu2rKbIkS606fy10CxmANBJfwbCEb/HxVfSeoXcoeRosMqKd3pvYjs4c2P6
         jV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIain+RtfgMm0Vs8RvgtkzToY5Cv8OwFwNrbOL8FPpNb/0Wlq5ayDyRVlRxZ5luE/GXoDPHPQNFGRzsHDjQ1vz7Jr3WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwC5Ra59ulrpfzT/ryBI0zA24hM3Kb7TJpUm2RGqGzG4/4RrIJX
	QnTYKuPwx8HUv1cJQ/EmTAVjOeCkUktI1RbAxVJT10qdILwvdhFp
X-Gm-Gg: ASbGncsK24JwEU0PPNkkptJlQkHz6HPVjU5dqyL9IjFrYlxyZKTjk6LNioUmxRBjv5D
	+iuITPYWymIetuQPP1d0eWgbNdg99aefIceJ+nC+8BU/14lVLjotbVflOqVj1uFNVY7kRgOlPsN
	SI0PCQ789yM9u95XcAUqMv8GTyHd1XBUOrKTV3sB4ZFbB95PyaP3Bl9o+JYhyjchpsoJfBnTGBT
	S/8SvuuKTu7RRPA9r4VMRQNjs4xGfyPHPwXNFojFnB3YSvABKqOSoO/u0ZJk+NFXewGtOe9Bm9x
	MnzsBJChkMWL52FrqlHMGajRnijTkLHnUEjF3P8ZNQvAItgjFF5twaZpbgpyLEspgbe1YzUi4/E
	O5+L3ow==
X-Google-Smtp-Source: AGHT+IFcnR5gTR85p+BlxVEOcybegmh+GfLMUZ4D5kZ2mKlKRnee2ReBmVH6S4TJGltLMviu79axPw==
X-Received: by 2002:a17:90b:2fc4:b0:2ff:71ad:e84e with SMTP id 98e67ed59e1d1-30aac184a94mr399906a91.10.1746552035988;
        Tue, 06 May 2025 10:20:35 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:fd5a:1123:ed06:e2ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae4f94e3sm24200a91.5.2025.05.06.10.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:20:35 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com
Cc: shaggy@kernel.org,
	ghanshyam1898@gmail.com,
	r.smirnov@omp.ru,
	eadavis@qq.com,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] jfs: Use zero initializer for btstack
Date: Wed,  7 May 2025 01:20:26 +0800
Message-ID: <20250506172026.8825-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68197d2b.050a0220.23d401.2859.GAE@google.com>
References: <68197d2b.050a0220.23d401.2859.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use C's designated zero initializer for the initialization of local
variable "btstack" to prevent KMSCAN from raising uninit-value error for
it.

Reported-by: syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ba5f49027aace342d24d
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
syzbot reported an uninit-value issue. [1]

We can fix this bug with the patch changes, but there's still other bug
in the code as we can see from syzbot's reply[2]. The reproducer doesn't
trigger this issue locally, I'm guessing it's the original issue why the
code jump into "BT_STACK_DUMP", it implies some memory is corrupted.

If you have any suggestion on how to reproduce that bug or look into it,
please let me know, I'll be happy to help.

Btw, I think maybe the btstack can have its own initializer macro? it'll
be more readable and maintainable for future changes if needed.

[1]:
BUG: KMSAN: uninit-value in BT_STACK_DUMP+0x5e5/0x600 fs/jfs/jfs_btree.h:136
 BT_STACK_DUMP+0x5e5/0x600 fs/jfs/jfs_btree.h:136
 dtSearch+0x393f/0x3d30 fs/jfs/jfs_dtree.c:774
 jfs_lookup+0x179/0x590 fs/jfs/namei.c:1461
 lookup_one_qstr_excl_raw+0x204/0x5b0 fs/namei.c:1689
 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_unlinkat+0x2e3/0xe50 fs/namei.c:4631
 __do_sys_unlink fs/namei.c:4689 [inline]
 __se_sys_unlink fs/namei.c:4687 [inline]
 __x64_sys_unlink+0x71/0xb0 fs/namei.c:4687
 x64_sys_call+0x29de/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable nd created at:
 __filename_parentat+0x4c/0x990 fs/namei.c:2726
 filename_parentat fs/namei.c:2749 [inline]
 do_unlinkat+0xe3/0xe50 fs/namei.c:4618

CPU: 1 UID: 0 PID: 5791 Comm: syz-executor444 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025

[2]:
Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: use-after-free in dtSearch

loop0: detected capacity change from 0 to 32768
=====================================================
BUG: KMSAN: use-after-free in UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
BUG: KMSAN: use-after-free in dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
BUG: KMSAN: use-after-free in dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
 dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
 dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 jfs_lookup+0x18b/0x5a0 fs/jfs/namei.c:1461
 lookup_one_qstr_excl_raw+0x204/0x5b0 fs/namei.c:1689
 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_unlinkat+0x2e3/0xe50 fs/namei.c:4631
 __do_sys_unlink fs/namei.c:4689 [inline]
 __se_sys_unlink fs/namei.c:4687 [inline]
 __x64_sys_unlink+0x71/0xb0 fs/namei.c:4687
 x64_sys_call+0x29de/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_free_hook mm/slub.c:2324 [inline]
 slab_free mm/slub.c:4656 [inline]
 kmem_cache_free+0x286/0xf00 mm/slub.c:4758
 __d_free+0x43/0x60 fs/dcache.c:336
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0xa5a/0x21e0 kernel/rcu/tree.c:2824
 rcu_core_si+0x12/0x20 kernel/rcu/tree.c:2841
 handle_softirqs+0x166/0x6e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x66/0x180 kernel/softirq.c:680
 irq_exit_rcu+0x12/0x20 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x84/0x90 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1f/0x30 arch/x86/include/asm/idtentry.h:702

CPU: 0 UID: 0 PID: 6979 Comm: syz.0.35 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8-dirty #0 PREEMPT(undef)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025

Best regards,
I Hsin Cheng
---
 fs/jfs/jfs_dtree.c |  6 +++---
 fs/jfs/jfs_xtree.c | 14 +++++++-------
 fs/jfs/namei.c     | 14 +++++++-------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 93db6eec4465..87025d832758 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2083,7 +2083,7 @@ int dtDelete(tid_t tid,
 	struct metapage *mp, *imp;
 	dtpage_t *p;
 	int index;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct dt_lock *dtlck;
 	struct tlock *tlck;
 	struct lv *lv;
@@ -2716,7 +2716,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 	dtpage_t *p;
 	int index;
 	s8 *stbl;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int i, next;
 	struct ldtentry *d;
 	struct dtslot *t;
@@ -4237,7 +4237,7 @@ int dtModify(tid_t tid, struct inode *ip,
 	struct metapage *mp;
 	dtpage_t *p;
 	int index;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct tlock *tlck;
 	struct dt_lock *dtlck;
 	struct lv *lv;
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5ee618d17e77..dd0e542a4978 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -123,7 +123,7 @@ int xtLookup(struct inode *ip, s64 lstart,
 	     s64 llen, int *pflag, s64 * paddr, s32 * plen, int no_check)
 {
 	int rc = 0;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int cmp;
 	s64 bn;
 	struct metapage *mp;
@@ -520,7 +520,7 @@ int xtInsert(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	int cmp;
@@ -1344,7 +1344,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index, nextindex, len;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	s64 xaddr;
@@ -1503,7 +1503,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index0, index, newindex, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad, *lxad, *rxad;
 	int xflag;
@@ -1949,7 +1949,7 @@ int xtAppend(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn, xaddr;
 	int index, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	int cmp;
@@ -2196,7 +2196,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	xad_t *xad;
 	s64 xoff, xaddr;
 	int xlen, len, freexlen;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct btframe *parent;
 	struct tblock *tblk = NULL;
 	struct tlock *tlck = NULL;
@@ -2744,7 +2744,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 {
 	s64 bn;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int cmp;
 	int index;
 	int locked_leaves = 0;
diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index 65a218eba8fa..d04c752823ea 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -67,7 +67,7 @@ static int jfs_create(struct mnt_idmap *idmap, struct inode *dip,
 	struct inode *ip = NULL;	/* child directory inode */
 	ino_t ino;
 	struct component_name dname;	/* child directory name */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 	struct tblock *tblk;
 
@@ -200,7 +200,7 @@ static struct dentry *jfs_mkdir(struct mnt_idmap *idmap, struct inode *dip,
 	struct inode *ip = NULL;	/* child directory inode */
 	ino_t ino;
 	struct component_name dname;	/* child directory name */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 	struct tblock *tblk;
 
@@ -791,7 +791,7 @@ static int jfs_link(struct dentry *old_dentry,
 	struct inode *ip = d_inode(old_dentry);
 	ino_t ino;
 	struct component_name dname;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 
 	jfs_info("jfs_link: %pd %pd", old_dentry, dentry);
@@ -883,7 +883,7 @@ static int jfs_symlink(struct mnt_idmap *idmap, struct inode *dip,
 	ino_t ino = 0;
 	struct component_name dname;
 	u32 ssize;		/* source pathname size */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *ip;
 	s64 xlen = 0;
 	int bmask = 0, xsize;
@@ -1069,7 +1069,7 @@ static int jfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		      struct dentry *old_dentry, struct inode *new_dir,
 		      struct dentry *new_dentry, unsigned int flags)
 {
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	ino_t ino;
 	struct component_name new_dname;
 	struct inode *new_ip;
@@ -1356,7 +1356,7 @@ static int jfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 		     struct dentry *dentry, umode_t mode, dev_t rdev)
 {
 	struct jfs_inode_info *jfs_ip;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct component_name dname;
 	ino_t ino;
 	struct inode *ip;
@@ -1448,7 +1448,7 @@ static int jfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 static struct dentry *jfs_lookup(struct inode *dip, struct dentry *dentry, unsigned int flags)
 {
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	ino_t inum;
 	struct inode *ip;
 	struct component_name key;
-- 
2.43.0

