Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7B233713
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  9 May 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802355; cv=none; b=a/JfSVof/ECeKQv/R9S/0C9UZs2dfWpnI5o5xVNNlLMfm2hdgOHa7yj0DcmUOiriBgiBfYBCi+Q2fBwXSSZyAZDsHYM90xtVqz1oOoyiUWgWg88pL2QNb/iA6JzChKW4dgxWXjIZvWw98Src6wisU4Ylxmn/v50/YA+1n2y3uF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802355; c=relaxed/simple;
	bh=M71JOYxuwkOpXuaS4Iu5AZ5zNo5wpVYXyJ+VPswlN14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtZQR2wMzdS1Sv7DqeZ8BlwyiFUXt9mEPMHFYqGyPyseu7zE+KuvL7J1pkQYkh/rhzsaNLD5Z39PyY51UIFKOadZs2+Dj2Ad+ALSfdkK+KyZup7ZzdnWfrSJPR9oT1udCazs7ZkIcCqBLwg2sDmozldLw6+k4DUoQBikmMIf2HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNSgOuDd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNSgOuDd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22fa47f295aso13792195ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 09 May 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746802352; x=1747407152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImGiMazoa45oFRSN8yAbHrvyPx09ppUIV2YCRGpQKUU=;
        b=iNSgOuDdXw0hsCTq/JQRN8rYO4BDQAktoe9w//Vaqd47WLoGwx8P8PpqLanzdTp3Jz
         zMWfIxcY53Duq/yqPmUozHL3RzlHfOWvYVF952mPq4ciRmHpVThIf1msoDXEan2mhQ+M
         uVBdhWRFso4SiuSTDwg0MbVmNXVQVVPNTMJZW5/ZqZ68YRhetn/Sbhe9NRBHQmPdNI+h
         RQzmmaITnc8xKAiuBqAFYmABugSixGqMeYg0nZn+hJASl1gFxoxXQiRyAfF9sRfzeCQH
         pwkDq44pjL4n1H+4CvFWTdrH0n8iJlOT1ZvvPRcThFg+R/Lxoc5DQMN+cqkZ4r1HDtI+
         Spow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802352; x=1747407152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImGiMazoa45oFRSN8yAbHrvyPx09ppUIV2YCRGpQKUU=;
        b=uH2mH5NcVE3ZULov6KxVKgcsubded02wUQkAoNi58r6m5AZ+hdzujuBkCvJDFqxNz7
         werW94+ne0Rd1fw6LJsTqv8MexBGYw+o3J/d7/MyVbtfjax6iywtcHiHaLwrC4yIejFz
         RBqFbSvQv/4D37Xq1XDMw/spnKpAKJ50OWsDczW8OHzII3e7dpnEoqOwv7BRyrsBB2iQ
         eDEDlTAYxkCgtqRNkxU+gSj65Io3R6w8fqnbGi1Fp4LuS9CtYJXpPxQY6www2k5ZwWpO
         9uQ0mQc4uHULxYZL3I0ClzJzA6bDiunoD7QaYEHU25tSM1oU+RWvptaOr2uHP7lN0pUT
         YnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCFl+pCuFqW8VOO76ieWHmA7cqT2g20SEboEdlQsJQiKlI/bv73kY+LgQeJnj1OJ/1WMzvaLPnd7mzKStnVogZ1s8Hew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxKWLuOIY0tw3RsgOPpgoR+OAFjv2wdF1iQI0s+iABuGK+nPoV
	wqJm8bpD0ZtY9ic2tMbV3jsSFZpKKZwNM+Q4gAJvIx1LuPrxoG31
X-Gm-Gg: ASbGncu00CQIugf4L5PqMYKKQOfk8gVXeu86RWN7+yB5KoaMLNI/hcXBl3QEGueibCs
	6fZIhjZ8AsV8oeUUKL7juRaAMVJ+BCv0UNhGvrAdA10LMPgam7uFwYhCaKG4vR8zW/QWQsZlL5M
	m/mXevFdW/0BRQVvi7aIle/AW3I41wkmwzuSfjDBdDBBO93+Futp8oX20BQMsswWLOJHpP/Qi0v
	tK+EnYq+HaNBEvk3j8DnFtJtDOElS0RqoOaORDMHJrmw+Q+GZDYd5buSDB4LCqVmPtkCS0Bv3zr
	Bm+zNsWPURyepMdLjgaj+mqMSLgI+2cwDEcjC1mkLKT4BO+NxpjvkPrzhMiPgqi+jW1AZPE=
X-Google-Smtp-Source: AGHT+IHYUmxzR1Yu/2w3wevxOB1mOg8Z2DV7RYLUmcLlF7yCewQCTLaElTtIQZX2nGkUjhCQQPz75Q==
X-Received: by 2002:a17:902:d581:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22fc8b0b618mr48030205ad.6.1746802351691;
        Fri, 09 May 2025 07:52:31 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:9e12:1c37:6e8f:31af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75450b6sm18125355ad.49.2025.05.09.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:52:31 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com
Cc: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] ext4: Prevent to write when SB_FREEZE_COMPLETE
Date: Fri,  9 May 2025 22:52:24 +0800
Message-ID: <20250509145224.471782-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6711ae3d.050a0220.1e4b4d.000a.GAE@google.com>
References: <6711ae3d.050a0220.1e4b4d.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When superblock is still in state of SB_FREEZE_COMPLETE, prevent to
emit actual write operation. Wait until it's unfrozen.

Reported-by: syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b75d75f957975f3d40e3
Fixes: 0a1b2f5ea987 ("ext4: add ext4_emergency_state() helper function")
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
syzbot reported the following issue. [1]

Write pages got emitted with fs superblock state still
SB_FREEZE_COMPLETE. Take an early prevention to stop actually emit any
write operation and return an EIO.

The patch fix the issue and tested against syzbot, however there might
be deeper cause of this issue, maybe ext4_writepages() shouldn't even be
called when the state of superblock is SB_FREE_COMPLETE ? if that's the
case maybe there's memory corruption or something else, I'll be happy to
help to look into it. Just let me know what is expected and maybe more
tests should be done ?

[1]:
WARNING: CPU: 1 PID: 2903 at fs/ext4/ext4_jbd2.c:76 ext4_journal_check_start+0x1f8/0x250 fs/ext4/ext4_jbd2.c:76
Modules linked in:
CPU: 1 UID: 0 PID: 2903 Comm: kworker/u8:6 Not tainted 6.12.0-rc3-syzkaller-00087-gc964ced77262 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: writeback wb_workfn (flush-7:2)
RIP: 0010:ext4_journal_check_start+0x1f8/0x250 fs/ext4/ext4_jbd2.c:76
Code: 5c 41 5d 41 5e 41 5f e9 c1 ca 97 09 e8 01 71 3c ff 41 bf fb ff ff ff eb e2 e8 f4 70 3c ff 90 0f 0b 90 eb d1 e8 e9 70 3c ff 90 <0f> 0b 90 43 80 7c 25 00 00 0f 85 03 ff ff ff e9 06 ff ff ff 89 d9
RSP: 0018:ffffc90009d46c40 EFLAGS: 00010293
RAX: ffffffff82587667 RBX: 0000000000000004 RCX: ffff88802f5a5a00
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: 0000000000000001 R08: ffffffff82587564 R09: 1ffff1100f968870
R10: dffffc0000000000 R11: ffffed100f968871 R12: dffffc0000000000
R13: 1ffff1100f9684c7 R14: ffff88807cb42000 R15: ffff88807cb42638
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f60253c26c0 CR3: 000000007ba9e000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __ext4_journal_start_sb+0x181/0x600 fs/ext4/ext4_jbd2.c:105
 __ext4_journal_start fs/ext4/ext4_jbd2.h:326 [inline]
 ext4_do_writepages+0x112c/0x3d20 fs/ext4/inode.c:2707
 ext4_writepages+0x213/0x3c0 fs/ext4/inode.c:2813
 do_writepages+0x35f/0x870 mm/page-writeback.c:2683
 __writeback_single_inode+0x14f/0x10d0 fs/fs-writeback.c:1658
 writeback_sb_inodes+0x80c/0x1370 fs/fs-writeback.c:1954
 wb_writeback+0x41b/0xbd0 fs/fs-writeback.c:2134
 wb_do_writeback fs/fs-writeback.c:2281 [inline]
 wb_workfn+0x410/0x1090 fs/fs-writeback.c:2321
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa65/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f2/0x390 kernel/kthread.c:389
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Best regards,
I Hsin Cheng.
---
 fs/ext4/ext4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 5a20e9cd7184..4ccb417f55b4 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2257,7 +2257,7 @@ static inline int ext4_emergency_ro(struct super_block *sb)
 
 static inline int ext4_emergency_state(struct super_block *sb)
 {
-	if (unlikely(ext4_forced_shutdown(sb)))
+	if (unlikely(ext4_forced_shutdown(sb)) || sb->s_writers.frozen == SB_FREEZE_COMPLETE)
 		return -EIO;
 	if (unlikely(ext4_emergency_ro(sb)))
 		return -EROFS;
-- 
2.43.0

