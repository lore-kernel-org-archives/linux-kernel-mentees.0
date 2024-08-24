Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89047DA63
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 19:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724528011; cv=none; b=F896jykvpneZrlslx7LL3E6xZPlxqGF9eK6BX3KKpKGjkjrNl6u/kdJFtzo7jnywyl/VPBtOLLo8+IawTSuzs1uEN6fXdbCLgWqiPoNV2jSvVkSpZVYs0pZHJ77p0oc9UN9mLgiurVLq10m2S/Xx3RwbQ/oi0FLsAPnaS7dgdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724528011; c=relaxed/simple;
	bh=UrsrTfkR5KwMJIV9SUPInKX/BgKuG0SUpUsdaykmmtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fE3OBMZca2HnsytavX60sojS/k1PUM2HXfbB1psZXym/KMVGVEePDJl6Q+iCGWG1n2LyZNeiPANwv+UpFFhxzFLNgGh214o7LhODYB8jO44nLTKv2aaHkCtMquggjiYnho4iq7UqKPCcgmSDtdxsSO0LmI/DWW2WjVmoEuxJNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQJIFjVd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQJIFjVd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A04340345
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 19:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKBQlztPczaj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 19:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=bottaawesome633@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED0224033D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0224033D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GQJIFjVd
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED0224033D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 19:33:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-429e29933aaso24103575e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724528006; x=1725132806; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXWVbBm2YGflm2QAsnwv8TFXxPetn70j5XC6l6mW/uI=;
        b=GQJIFjVdAz3UXaNUxs6az/S1mwjmDkXn/5wT/G9FKdiq04KacWQOnE5hlym9RtaVh7
         a9malfgBtghUD/7HYgiHjly9W3VSdJ1FjSmtdsntnTwaCGiQYAfmqNDXKGgambk2qojD
         W1fozXDqPtLoaHyweyf6PGuQXsCc5SG6gDwJhbN3QIUymjYDg/aasCmCwQ3KnRsV4xnn
         ThEnJbdEGnedw+uKNF+NXycOmqHUMfaU5CCh6KOk/bNKQumvUiWs9FwLo/Nc6DH09MYj
         WwTLapV72CKhNTMAiFW37yNKBqtuwyVjYn8ouAaIZv1O1JuAg5BQY9TCGRnDlY23NgD2
         zWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724528006; x=1725132806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXWVbBm2YGflm2QAsnwv8TFXxPetn70j5XC6l6mW/uI=;
        b=vKaRKhhY58V5nYC7q2WuqEeLCqu81rwi2Zl8Y5ygyRm44Ym1jr7/+SWi0cszKurd6h
         DFPpXDMbNOf9uvG10EsyTzBVkyJw6utTVERRSj5dE1TaBbR7PfAA0OAJCmZ/alBaJHXZ
         xozXHzRksIkZjsCG8jm+waUOHyCnAAzuOCQ6fE4Fpti/IxI/8WpUqpDI42iZgODyOehF
         Jnk9N6wNmkak7f62goaW2g8uwzCSo65+ly72fVeYca3be3Xd+m5eDfH1olIgyvWlHGNG
         h8xPi2qHUpv9MIsHm7fff+XO/PQkuugrJAgDRm6BP3fUd7H7Oo52FdTsPL+MtI0NlLY6
         TT+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPSZZVLCNzPFv5janQOyHIwBV+EPy6NeyvwumKosjRhkVZAjiujM2Y19N+KCuuFKcxGP/Obi2w24yX0Rt2GkJOvv+uog==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyNfaQVRhEliko6JVcX4RSia7RUl9Hx6JThPxAhzeuSzFVr5Ot2
	1wEeiSV8YQUi0a/iuqIBImT86GAqafyogkBnYon4RAkxAqS+WrDS
X-Google-Smtp-Source: AGHT+IHDhrwrtvMjHgyDaao+xJsyjyyNVaarUe1ry0M+ESCuF1DnDIuJz2el8LQOfiYNFl+u1otDJw==
X-Received: by 2002:a05:6000:18e:b0:366:f041:935d with SMTP id ffacd0b85a97d-373118ef46bmr3668768f8f.60.1724528005278;
        Sat, 24 Aug 2024 12:33:25 -0700 (PDT)
Received: from localhost.localdomain ([156.197.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308157c55sm7155197f8f.46.2024.08.24.12.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 12:33:24 -0700 (PDT)
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
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Refactor switch_mm_cid() to avoid unnecessary checks
Date: Sun, 25 Aug 2024 01:31:32 +0300
Message-ID: <20240824223132.11925-1-bottaawesome633@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue is that we are checking if we are switching from {kerel,user}
to {kernel, user} multiple times unnecessarily.

To fix this, refactor switch_mm_cid() and break it into multiple methods
to hand the cases of switching from {kernel,user} to {kernel, user}.
Hence, we avoid any redundant checks.

Signed-off-by: Ahmed Ehab <bottaawesome633@gmail.com>
---
 kernel/sched/core.c  | 15 +++++---
 kernel/sched/sched.h | 86 ++++++++++++++++++++++++++------------------
 2 files changed, 62 insertions(+), 39 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f3951e4a55e5..abfa73f9c845 100644
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
index 4c36cc680361..27fa050b81f5 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -5,6 +5,7 @@
 #ifndef _KERNEL_SCHED_SCHED_H
 #define _KERNEL_SCHED_SCHED_H
 
+#include "asm-generic/barrier.h"
 #include <linux/sched/affinity.h>
 #include <linux/sched/autogroup.h>
 #include <linux/sched/cpufreq.h>
@@ -3515,8 +3516,8 @@ static inline int mm_cid_get(struct rq *rq, struct mm_struct *mm)
 }
 
 static inline void switch_mm_cid(struct rq *rq,
-				 struct task_struct *prev,
-				 struct task_struct *next)
+		struct task_struct *prev,
+		struct task_struct *next)
 {
 	/*
 	 * Provide a memory barrier between rq->curr store and load of
@@ -3524,38 +3525,6 @@ static inline void switch_mm_cid(struct rq *rq,
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
@@ -3565,6 +3534,55 @@ static inline void switch_mm_cid(struct rq *rq,
 		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next->mm);
 }
 
+static inline void switch_mm_cid_from_user_to_kernel(struct rq *rq,
+		struct task_struct *prev,
+		struct task_struct *next)
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
+		struct task_struct *prev,
+		struct task_struct *next)
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
+		struct task_struct *prev,
+		struct task_struct *next)
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
 static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
-- 
2.46.0

