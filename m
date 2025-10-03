Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0A284B3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491985; cv=none; b=gambA6esDmW/jVsUpJB/tKMcdINHoe/nZ9c4WY8sRl61Nq1ZBG0VktdbskMj1KX0Pt93SB+f0zBa4ZtazOaRphZVrB7y5tJaY3arbArBMdGG7RRgfczliZy+UMIA51I1aTf993LAyxWnlQvUYXD/QA8yaRXAXUu20Pp94fhZWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491985; c=relaxed/simple;
	bh=PqpCO1hZ5AzWg8lpqzlwYEmvVQBm7UKwvlNkj9beh4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2+zr5ptfsjTDz6ihhS1ESG5VBlzk4EY3mnSfBeYoFe81rLQE3DOcobP0eGGmzveQptNHFOoZsLcs5bf3PzSSzo96EMwWoEN7Vq3Jc1mUYwlOiqn68LVf3ZLWPtoJ2fg9BpPQcc3xTcLLrOrELdsKNpWpkOFfa283WBPHTMVXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaAoUsn3; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaAoUsn3"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF93B80D46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 11:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6_AZAQpBUCG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 11:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8BA980D72
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BA980D72
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XaAoUsn3
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E8BA980D72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 11:46:22 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so2655069a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759491982; x=1760096782; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kr5m4Q2MhDO3zmxeDrZVa1hCLYfkmOsaOLffDymj6ak=;
        b=XaAoUsn3mROmXNjQQU/5jvtiPbIGpyfgs78ivBn65dibAYT2gW9jFWN0B9s665nrft
         EM+Z9Bw7IHX/Uk4v7sFUc6/qmac7pQSYm4czt9E3Ame4J4YmYmQwvHew9+m7PqtdwalJ
         gbQU82ZUoK4aDPy01rv1DCXGdahwmfHQKFbhQsLgfihF9xbAllstP/jJ6iUj9YOV6DPc
         PrdsHgaDP8nMvA9si2/Z/KUixUy/EHHCJhXOkB3Cc2ppNJCVNydm+MOMDrgW2d6ge5z2
         B3lWP/GXZB3E+3zRP43gq30hpWlaA42aoeLEvYd4/E0YJcwhuStH0cMP/Pw0CvDecE5c
         N4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759491982; x=1760096782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr5m4Q2MhDO3zmxeDrZVa1hCLYfkmOsaOLffDymj6ak=;
        b=ikMqgqO7JTHnCpfayLgoxJSqG8QLjoQb4o6QT6jbWV49V7lHGmMF1el/vJ3AMd+V6R
         w/q47J4DMv9s3xsWhtXV/LivoB/09JiPwUFzUFh+HR55bHZamXAC587DidkN2OMA5mSq
         jKyvrm/rkuvrd/wYNU8sdo8Lq4OP3Bsijhd4ciMnoiuXNqKqMv8z4OYW0WypbmBi07+H
         tU3kWoAz4IGPbrRSwjIwag2dxZ3YAi9Kd76CKs3ZKhMwiBATZ8wjEs9P0zJnAM0LTVy4
         zPojVn1DM+gKECjfB4IH+6gs65hGhlkj+Egfk2iQIg9TNRKcop/iEF0HGYlwzIorWElV
         n8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1gR3zyO5IfG/KgYhgmSF+kQzeN804drqdvZIn6Qf2Ag0X4wFSHahVoOK4c23JaAtZvMdhgOl35IKsIEiMnHusezVrA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwcLBf+Hl4bmFO95S+8xwDY+3aWp8oXKeQVvW5qzDq40gUC713y
	kEpACLo8/3RcxLLo1lsy93CcNgZOSOODlCYJkrGs9ZifWEmDPRKXy7uv
X-Gm-Gg: ASbGncs8ARvMlqqJWddIXzB/VEGc20nnN2kBiuT6zuyQz3h4SFil6ysMZH/Zt1x7Yu5
	Z8Y0ch9RkdlNaYF/lA6FYYFq5kohvmEjpBJuhgSeU30h0CnCJpm0ZRuUpZeUOtPCSreJ5gGxSKS
	ZqDnzy//VfrPj8vpVlATu639mCjDo5mE8GLiVIdUf4C2hESvkHXJGOtE5wXnu1gV37NrOoL6SDl
	O6WyzgWJKUbO8IwUxyfmUHcV+x/zlbbLebPEe6IusKKwdjxIxdgW9HoQQ7VEJdoN7GLR+tZ8y4T
	GuwB9lax1sTRrwqY26zxiQLt+carFm1xxoQDu0yeJCpTiHZJjrMSYdefeiRyeb2iLfg8jdOUPkp
	gCCYWy7Qho2X/+Nr1rDpoRbPbf3PXDxY/t4MR4rxbKg==
X-Google-Smtp-Source: AGHT+IE+B+A6PY10FHNa/K7kwAlpZK7Yj3hJ8GaSS7FT2H3r5Hjjq9oeSORJAi5t9tZGsLPWJ2J+ng==
X-Received: by 2002:a17:90b:4a50:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-339c2724834mr2844413a91.7.1759491982024;
        Fri, 03 Oct 2025 04:46:22 -0700 (PDT)
Received: from fedora ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm7825727a91.23.2025.10.03.04.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 04:46:20 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tiffany Yang <ynaffit@google.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
Date: Fri,  3 Oct 2025 17:15:55 +0530
Message-ID: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
introduced a seqcount to track freeze timing but initialized it as a
plain seqcount_t using seqcount_init().

However, the write-side critical section in cgroup_do_freeze() holds
the css_set_lock spinlock while calling write_seqcount_begin(). On
PREEMPT_RT kernels, spinlocks do not disable preemption, causing the
lockdep assertion for a plain seqcount_t, which checks for preemption
being disabled, to fail.

This triggers the following warning:
  WARNING: CPU: 0 PID: 9692 at include/linux/seqlock.h:221

Fix this by changing the type to seqcount_spinlock_t and initializing
it with seqcount_spinlock_init() to associate css_set_lock with the
seqcount. This allows lockdep to correctly validate that the spinlock
is held during write operations, resolving the assertion failure on all
kernel configurations.

Reported-by: syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=27a2519eb4dad86d0156
Fixes: afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 include/linux/cgroup-defs.h | 2 +-
 kernel/cgroup/cgroup.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 539c64eeef38..933c4487a846 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -435,7 +435,7 @@ struct cgroup_freezer_state {
 	int nr_frozen_tasks;
 
 	/* Freeze time data consistency protection */
-	seqcount_t freeze_seq;
+	seqcount_spinlock_t freeze_seq;
 
 	/*
 	 * Most recent time the cgroup was requested to freeze.
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index ab096b884bbc..fe175326b155 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -5789,7 +5789,7 @@ static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
 	 * if the parent has to be frozen, the child has too.
 	 */
 	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
-	seqcount_init(&cgrp->freezer.freeze_seq);
+	seqcount_spinlock_init(&cgrp->freezer.freeze_seq, &css_set_lock);
 	if (cgrp->freezer.e_freeze) {
 		/*
 		 * Set the CGRP_FREEZE flag, so when a process will be
-- 
2.51.0

