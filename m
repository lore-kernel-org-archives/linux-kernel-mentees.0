Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28281D54E2
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604289; cv=none; b=eZq0tXZipauAsfpS3mi/itP0YybpI2LHDRvECUV+6QKR+sTC0Ud3ZsXiwzRYMcyonBagWuq9HMDrzYUsw0fT+AiOSY9ege0D0XGEJDBCJcHmbJ3EHZlo1IqK3V9v+jbZ7M7MF8/jUwgLTREsGYQI3ulX3VJ2ZO/3HoojvKE36s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604289; c=relaxed/simple;
	bh=h2x6vdv/JzyV9NCqHup4antc8GUh2Fc+FuFK5KC/RRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QM+WTRgDBCYADdnofoKS8vI2sTB7/gPp/zAvdZOFxN7mOO3vLJOHekZwiicBJdSZFFyLsawdoH6+RrwIimvieE0FBBP/04qVqNDCShEHI/ExE93JZSmRVZNNT8mCbFje4AXF/9VVJnEPhmlMdT++9L4QDb/ngNaWmZrrjUuKUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwafUI0B; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwafUI0B"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748fe69a7baso3099741b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604287; x=1754209087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4w3nvIifgn0iSMKuiOg/hmSn/FEUf3sNnbRx7riRRJg=;
        b=BwafUI0BJm3lVvHwisiAJfdE2jZ0F04qHp9GdzyzTh4GO8LUaXJArlQk6pKFKrIqq2
         PaYM4qmSbRat6reT9UqNv7ZiM/7iT3GqbPCFhMBVICslL/+E8JJGJd35xQT5XlYnUh4N
         2z0wTl2ksxtUnGnjlUoui94YcroWGo0R2qK3zpC9xvmtYHFI4s2EdoxqNeXDPxnVNckz
         64ZKFWWTwcn5fNUNy5pFmhGh4d9R7s3L5Ln5VF+wd4Yq/GA403EsvCe+UcD8iA9oY998
         dODErJ5nA0Bav2RN/or6EcTZ2Ek914GqlmM3Qx+TlaLroSPRCdIm1Bl3ccW9xXYn7J8n
         7F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604287; x=1754209087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4w3nvIifgn0iSMKuiOg/hmSn/FEUf3sNnbRx7riRRJg=;
        b=mcEdfDx67MxWf6HLK1hRasvdT6L1/GPIbE1mbSPp+FDPWuVPzVIlXUJpeBeQK+VcAW
         kjx8J6D4wK7wAekRw76UZtuclkzugasgAsId5kZiRtCm1HYGu1XqHVUplYBBNJezmG7f
         BJVgjIk/FyavZ5HlX+rg/0Q5kFqqnngw+oP8zd+JexiPfZgctHUS3R65sIzVE8fasSs8
         BqXxuJbvSGgybUwuszhT+uTmare+ZQ8Icv7wnROAZMFNjnPPvxazbuvYUbqlnxJDWUEo
         2XzpmiNXp2N7TIDF12hj1CDdwPtyGOB9iTaxwqZW/fP2eg7VsSafE0AKi1BDa3WDC8JT
         sn5A==
X-Forwarded-Encrypted: i=1; AJvYcCWeGHIkPnPKYqWqnP0K4isqu7RxhHFNJPXczG1j0l9+mciq6yvTHTuyZWNBZ9Rx4kdXx/9ljkmx4z/f/8t9yKH9WAeYqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDNJtx6UUXd6Z9xZ9LnB67WN82anfgP3cMPiJCaqpVscdZ9DVv
	F47XAjH7ZZDK8fq+yf5laeFuXcd9b5QEXZhfvLKjyUu8gskfhbfoGd+V
X-Gm-Gg: ASbGnctYptZVSykRtK6cUMt/NCs10dEcX5+dRo/AC5SCrjSzdBjXXuehUIn09MfWCQp
	AH141RU4Zh30vjCHYWvKVSa+yjspDf9P7/gPYvUXJZ9oEYxASkzugv8945nL+MU3RBjSWPKl1YL
	ER+qjAbRUJ9MmfY6j8AmmqbgP9yGQuCVd9EiN7gfm/prAQ7uq1ut8Xo9fHS/2dzmqVzvkjXqnDT
	owYM6TMptxAukP1YV428SiZEPkqEaC4/sWFhjCDBYECktjd0wCKQn+eU3Tsh29PJL4KBQ9m+5sD
	1K9cw1l464H5fCqnRjTCh+I1OtlnjWfxF7FJCenFGf+i+06pCGeJtJxpJVkatKZcBt9XpczsyoU
	iInRE0gaKE49Nu449OVfbDDC244tOUGE=
X-Google-Smtp-Source: AGHT+IERtAcA1hASNVnSuyLgCZuySFIDgpHVod4VMFHMhTbjWTMV5KfmnnO/eqKIF5S6h8aYQR0OlQ==
X-Received: by 2002:a05:6a00:1741:b0:736:4644:86ee with SMTP id d2e1a72fcca58-763343da65dmr10726993b3a.14.1753604286599;
        Sun, 27 Jul 2025 01:18:06 -0700 (PDT)
Received: from archlinux ([205.254.163.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640863503csm3085296b3a.5.2025.07.27.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:18:06 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] bpf: fix various typos in verifier.c comments
Date: Sun, 27 Jul 2025 13:47:54 +0530
Message-ID: <20250727081754.15986-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several minor typos in comments within the BPF verifier.
No changes in functionality.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 kernel/bpf/verifier.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e2fcea860755..4f13cce28815 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4518,7 +4518,7 @@ static int backtrack_insn(struct bpf_verifier_env *env, int idx, int subseq_idx,
  *   . if (scalar cond K|scalar)
  *   .  helper_call(.., scalar, ...) where ARG_CONST is expected
  *   backtrack through the verifier states and mark all registers and
- *   stack slots with spilled constants that these scalar regisers
+ *   stack slots with spilled constants that these scalar registers
  *   should be precise.
  * . during state pruning two registers (or spilled stack slots)
  *   are equivalent if both are not precise.
@@ -18450,7 +18450,7 @@ static void clean_verifier_state(struct bpf_verifier_env *env,
 /* the parentage chains form a tree.
  * the verifier states are added to state lists at given insn and
  * pushed into state stack for future exploration.
- * when the verifier reaches bpf_exit insn some of the verifer states
+ * when the verifier reaches bpf_exit insn some of the verifier states
  * stored in the state lists have their final liveness state already,
  * but a lot of states will get revised from liveness point of view when
  * the verifier explores other branches.
@@ -19166,7 +19166,7 @@ static bool is_iter_next_insn(struct bpf_verifier_env *env, int insn_idx)
  * terminology) calls specially: as opposed to bounded BPF loops, it *expects*
  * states to match, which otherwise would look like an infinite loop. So while
  * iter_next() calls are taken care of, we still need to be careful and
- * prevent erroneous and too eager declaration of "ininite loop", when
+ * prevent erroneous and too eager declaration of "infinite loop", when
  * iterators are involved.
  *
  * Here's a situation in pseudo-BPF assembly form:
@@ -19208,7 +19208,7 @@ static bool is_iter_next_insn(struct bpf_verifier_env *env, int insn_idx)
  *
  * This approach allows to keep infinite loop heuristic even in the face of
  * active iterator. E.g., C snippet below is and will be detected as
- * inifintely looping:
+ * infinitely looping:
  *
  *   struct bpf_iter_num it;
  *   int *p, x;
@@ -24449,7 +24449,7 @@ static int compute_scc(struct bpf_verifier_env *env)
 	 *        if pre[i] == 0:
 	 *            recur(i)
 	 *
-	 * Below implementation replaces explicit recusion with array 'dfs'.
+	 * Below implementation replaces explicit recursion with array 'dfs'.
 	 */
 	for (i = 0; i < insn_cnt; i++) {
 		if (pre[i])
-- 
2.50.1

