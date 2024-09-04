Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AE1E6329
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477682; cv=none; b=LGVSJ7UxRWL72QQEpCP62Nk3G99pUsvyS2gPadnGKmRyW/8RzpwI2+pfqb2NeD2rt6YL8rr9rycm3GjCfGhUnRbiG41JeIT0XA6/WVyN3eNGRTSK9sU5c2iFF2uFWBWBES0CZvk54eAeY7f2XFzCQ5bH9oKeN0Sw2YioGs3Nm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477682; c=relaxed/simple;
	bh=pGa7u7ieb4EUdWX9xTK0+u0ZbSur2prvixiWQUtZWCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=envwawy2koowORLzOvl+0AmOdC7sFvoIDCdZZArwl+m4+0m6tR5SCiknmeNVC4qaUnUJ2W0izFzcFAsQV6De+P16SblGVQrCWoxC64wf5NTK+hwOeQtV+qTMC9AVArLuJGTgM9iydtHc8DpOINEwdmc4jxIJOA6zYAMrUeK4zzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAimvNpi; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAimvNpi"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5F6606E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 19:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H-8QK-GtMdR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Sep 2024 19:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=bottaawesome633@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17B06606D5
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B06606D5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAimvNpi
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 17B06606D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 19:21:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42c94eb9822so10055525e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 04 Sep 2024 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725477677; x=1726082477; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdqAsVpkuRSY1jXdBBvUbDMsUymqTBzc3tB6AHQ0SKk=;
        b=lAimvNpiQmSvDdXWdWEtz2I4JfT3qF2sJELvOw1Kb16cTsuTrhrerXqTxLqPAsJ0B6
         m2NIxnUR8GSa3pyoyfsxDX6SypTSybMmOm4gWtzbuaS9xtzu/iATVLmZXsHkjD7IDFDP
         UzJIe4KDA1TWlkQ7dnARLCNdcl8TpE0zL0BBkIVHID6oP/GtiJClxB1qegNICllyhJtm
         AsOhcJPprWSWcNLMCEYAdNLSjWsCY63SPttoxXjspa5t5JTH6JcOLzHs+7wuqvDwSQeU
         B62IQeuK9bYIUWUzNb7pbqcKHfy2LnUZPjAVhtN9VhGPkCpGW+is4tUPvRq2UPmgQxPm
         JAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477677; x=1726082477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdqAsVpkuRSY1jXdBBvUbDMsUymqTBzc3tB6AHQ0SKk=;
        b=PhjWfOIQUDXbtBXqRsRIs/yulT0Dpb8wE/W9fTRZZR/4DDgECrj71LbzlJPYvehtfC
         XXidxzX71sNc5uSRH5FXfSC63MdG9CiZ1OPgXXNDhvfIrj9401YSkj6b4tV+/jA94iCD
         J/3qZ+oswJLnnXnRkrt9S5wx+eSCHgiQtI/d6DDzH5vsSSOwrY87HKG0BghZUeWZvZCo
         nrWXLvrqZUhnrywNlqI8ZluMdRIpyWv9BhiYp1bnzrZlAuSgvr1TY2Et6rq7Ti2FaE02
         tjSwV/l78NLxwGxX/Fu02I6khAfzOZJVTIsY9u0IINdVVUUaq+BKT3g4VmIf+zdS8DGR
         ztyw==
X-Forwarded-Encrypted: i=1; AJvYcCXKYR/lcAeNZi7IXTKVVlL0x9F/w5XdMT2aEX5pq5BwMGWsf+PKcP5YCuJjpqAV6QOvra1qyEW1M0Rgk7Q0RZQCyXDBQg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy7d4yvxIAxiSYW57fmc37ogPApGi10pYhVQW5dveb9ulcmFZlm
	hxM1LfvQ5HazBjs3AZVBF7bd1DULKwheJGTvJDmh1Pbr03ne82F2
X-Google-Smtp-Source: AGHT+IHTb1whdWr/g0jbtW7if8TSwPVnmMfUSQZRg5D6dFL9c+je/dwYxXcBhENiIMVvHQn3ZgS46A==
X-Received: by 2002:a05:600c:3582:b0:42b:9260:235f with SMTP id 5b1f17b1804b1-42c7b5b4b72mr92303965e9.19.1725477676576;
        Wed, 04 Sep 2024 12:21:16 -0700 (PDT)
Received: from localhost.localdomain ([156.197.26.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba57bb20sm189366175e9.4.2024.09.04.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:21:16 -0700 (PDT)
From: Ahmed Ehab <bottaawesome633@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] Refactor switch_mm_cid() to avoid unnecessary checks
Date: Thu,  5 Sep 2024 01:18:17 +0300
Message-ID: <20240904221817.56664-1-bottaawesome633@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue is that we check if we are switching from {kernel,user} to
{kernel, user} multiple times unnecessarily.

To fix this, refactor switch_mm_cid() and break it into multiple methods
to handle the cases of switching from {kernel,user} to {kernel, user}.
Hence, we avoid any redundant checks.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408270455.R85TrPfw-lkp@intel.com/
Signed-off-by: Ahmed Ehab <bottaawesome633@gmail.com>
---
 kernel/sched/core.c  | 15 +++++---
 kernel/sched/sched.h | 84 +++++++++++++++++++++++++++-----------------
 2 files changed, 62 insertions(+), 37 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f3951e4a55e5..900c5a763e0a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5155,9 +5155,15 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		enter_lazy_tlb(prev->active_mm, next);
 
 		next->active_mm = prev->active_mm;
-		if (prev->mm)                           // from user
+		if (prev->mm) {                           // from user
 			mmgrab_lazy_tlb(prev->active_mm);
+			switch_mm_cid_from_user_to_kernel(rq, prev, next);
+		}
 		else
+			/*
+			 * kernel -> kernel transition does not change rq->curr->mm
+			 * state. It stays NULL.
+			 */
 			prev->active_mm = NULL;
 	} else {                                        // to user
 		membarrier_switch_mm(rq, prev->active_mm, next->mm);
@@ -5176,12 +5182,11 @@ context_switch(struct rq *rq, struct task_struct *prev,
 			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
 			rq->prev_mm = prev->active_mm;
 			prev->active_mm = NULL;
-		}
+			switch_mm_cid_from_kernel_to_user(rq, prev, next);
+		} else
+			switch_mm_cid_from_user_to_user(rq, prev, next);
 	}
 
-	/* switch_mm_cid() requires the memory barriers above. */
-	switch_mm_cid(rq, prev, next);
-
 	prepare_lock_switch(rq, next, rf);
 
 	/* Here we just switch the register state and the stack. */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4c36cc680361..c01ca8962518 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3524,38 +3524,6 @@ static inline void switch_mm_cid(struct rq *rq,
 	 *
 	 * Should be adapted if context_switch() is modified.
 	 */
-	if (!next->mm) {                                // to kernel
-		/*
-		 * user -> kernel transition does not guarantee a barrier, but
-		 * we can use the fact that it performs an atomic operation in
-		 * mmgrab().
-		 */
-		if (prev->mm)                           // from user
-			smp_mb__after_mmgrab();
-		/*
-		 * kernel -> kernel transition does not change rq->curr->mm
-		 * state. It stays NULL.
-		 */
-	} else {                                        // to user
-		/*
-		 * kernel -> user transition does not provide a barrier
-		 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
-		 * Provide it here.
-		 */
-		if (!prev->mm) {                        // from kernel
-			smp_mb();
-		} else {				// from user
-			/*
-			 * user->user transition relies on an implicit
-			 * memory barrier in switch_mm() when
-			 * current->mm changes. If the architecture
-			 * switch_mm() does not have an implicit memory
-			 * barrier, it is emitted here.  If current->mm
-			 * is unchanged, no barrier is needed.
-			 */
-			smp_mb__after_switch_mm();
-		}
-	}
 	if (prev->mm_cid_active) {
 		mm_cid_snapshot_time(rq, prev->mm);
 		mm_cid_put_lazy(prev);
@@ -3565,8 +3533,60 @@ static inline void switch_mm_cid(struct rq *rq,
 		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next->mm);
 }
 
+static inline void switch_mm_cid_from_user_to_kernel(struct rq *rq,
+						     struct task_struct *prev,
+						     struct task_struct *next)
+
+{
+	/**
+	 * user -> kernel transition does not guarantee a barrier, but
+	 * we can use the fact that it performs an atomic operation in
+	 * mmgrab().
+	 */
+	smp_mb__after_mmgrab();
+	switch_mm_cid(rq, prev, next);
+
+}
+
+static inline void switch_mm_cid_from_kernel_to_user(struct rq *rq,
+						     struct task_struct *prev,
+						     struct task_struct *next)
+
+{
+	/*
+	 * kernel -> user transition does not provide a barrier
+	 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
+	 * Provide it here.
+	 */
+	smp_mb();
+	switch_mm_cid(rq, prev, next);
+
+}
+
+
+static inline void switch_mm_cid_from_user_to_user(struct rq *rq,
+						   struct task_struct *prev,
+						   struct task_struct *next)
+
+{
+	/*
+	 * user->user transition relies on an implicit
+	 * memory barrier in switch_mm() when
+	 * current->mm changes. If the architecture
+	 * switch_mm() does not have an implicit memory
+	 * barrier, it is emitted here.  If current->mm
+	 * is unchanged, no barrier is needed.
+	 */
+	smp_mb__after_switch_mm();
+	switch_mm_cid(rq, prev, next);
+
+}
+
 #else /* !CONFIG_SCHED_MM_CID: */
 static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
+static inline void switch_mm_cid_from_user_to_user(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
+static inline void switch_mm_cid_from_user_to_kernel(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
+static inline void switch_mm_cid_from_kernel_to_user(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
 static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
 static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
 static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
-- 
2.46.0

