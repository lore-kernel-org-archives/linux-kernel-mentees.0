Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1A296D3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722599; cv=none; b=TdkH5dF7jAeJp/NN25NTkt5wXTU8zcLRyZ9LrF3doF9XxXHKmvfIFvngslxgYGdTgGf3w3dYxCEiva9VHWMMaf/LoZLe4jLHsco2a6waxiccOYhMjbiz58fQXWIcGqFZXEFR+ba9EdgpcJfKS/kdst+lL5WFzoxeR/vCRic3Krs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722599; c=relaxed/simple;
	bh=1MnuAkRdhCY1WfObz2NT8vubDqZjZ18y0GbOgq9+SWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTunjmnx7tZ83t7O01/QRzr6s2F7BBsU4VVSDpYGIa/FQNIEnEQn6JLYTfG8EY5JoUFC8/9UMks/LX+r495KgcdZUnbOYMojyJTtM++nr5MHPR722TfAkgzvNJizTGcwZ1oJ4Ho3z4WWZ9J/wwHTTalXblP/R7AqVJ5WX0d9dDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOgfJ5V6; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOgfJ5V6"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2709D41A92
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BC6NkrWicD4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Apr 2025 13:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D1CE41A8E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D1CE41A8E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UOgfJ5V6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D1CE41A8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:09:57 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so5566922a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744722597; x=1745327397; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROffXuJEF8DX7Dlw1Sl0/VWDxHt96RQSrGxvBnC8v/I=;
        b=UOgfJ5V6TIL0tefMnwVTft9wf9sYrO7DBulZz/XnX0yXF7DZtEEcjKrsPwTevpXLGI
         frw2cKH9QVCZIM6dDs2haw2bDGAERdF7C4MHxJNeW4SczgHlYUcCFFhhlt68Ug2AqpHM
         DKW4eFCR58PdEutXJALTfYSSn9Af5Mezo85NHIems75Py4H+cq7PVl9AZx0QeQcL2Ylu
         /i8ZdFXhgzWxjilOAp0d6YMQEiD93ZBUH22zIFd4Mvbrty6lj8kxbR3eUTmXrWQHFVTM
         pl02oBreTmVN+XT9+LfVBw4gCPXxK4na+XalTThtkSSfq/4x+eovpCqMYw92umvdwbw4
         chMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722597; x=1745327397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROffXuJEF8DX7Dlw1Sl0/VWDxHt96RQSrGxvBnC8v/I=;
        b=LEzRbKOydna/y3/Zym6aaKa4QH7pSJa2HMYc652smCGGJS/sknJDHbvk3JXn0R/UeQ
         tnceaO0Dv7C++YUwUyECcX9K+7heiTHEdVJckhI81OmmUnvZrWHTtXZQgGqNPeKLrFHh
         WlGaO6PlgCJyDEPcR2ER7NfkKT1RO27N3YFywyZvQ+UQVNLK7XkXqiQmozhhL4NkIYyP
         HnRkxgOO5cqbGVxeoxf3z6z0ix+y46DqHQ+LgPvMIlgbTg2Z5R4MeHyLH5LiEqXKcAJa
         ndD5fraXLrqogmBrtQ4e4dYMsHSTV0ISf+UCWndwO4aSlnG5eYgMt+vnaoYZqEDnfQCi
         vNhA==
X-Forwarded-Encrypted: i=1; AJvYcCUEhCAl/abXHxm84I2NxVbACVrywBMj3GbyllkZrEmH7tlTvtO/M3W2k2YWWofAnMKnTHxVEmgrsRfFw4PvwYPwhqfYvw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyzaV9ThHq7Z6dGIS32XUyNpoyhkt44Y8OqEHZmXYqz+tDCiWtT
	yzZKNQE2BRPp1xbGBkOLChVs3Ya30n5isJLk9k3j9tMdOFHK6oKF
X-Gm-Gg: ASbGncvABevLtZ8doc9MWJDu8Xwom9ziyZt1yrdqPeFAJI9nlCFQTT2Vx1wIpGUqqcd
	lbMtvTXf+vBMak+yMtWTxmy2W705C2vuovHhiduVIpOVdtKtyrVOW0yqgJFM63uJyv/f1bz4cA2
	eG3ilxkiuLuZYp9vaoBo5Q0PloB9MBAdR+Dfqi44Tjg8wEjX426hXEtYd2MqkZYzTW6bRUT3/CN
	GBetuQWyRamL6QpeoKSrdfW6s7ILaL5FpGHGZHEdnyR5DFIxedHxDiqODzKDq0CxisXE1UwMnFp
	tnTCwR7tBs8FUuCvAWmy2328Wi8C88H4EOx1yHXI
X-Google-Smtp-Source: AGHT+IGrbakp3gdJT5engsJp7bS+mmyQ7Q/b+yLZmtwIiI2SeohFbA98WC/ZpRR+orkfQ0nPSrONVQ==
X-Received: by 2002:a17:90b:5190:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-3082367ccebmr25337882a91.24.1744722596523;
        Tue, 15 Apr 2025 06:09:56 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac5:3d50:16b4::243:2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10dc4bsm13165254a91.1.2025.04.15.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:09:55 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH] bpf: Remove tracing program restriction on map types
Date: Tue, 15 Apr 2025 18:39:07 +0530
Message-ID: <20250415130910.2326537-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 96da3f7d489d11b43e7c1af90d876b9a2492cca8 ]

The hash map is now fully converted to bpf_mem_alloc. Its implementation is not
allocating synchronously and not calling call_rcu() directly. It's now safe to
use non-preallocated hash maps in all types of tracing programs including
BPF_PROG_TYPE_PERF_EVENT that runs out of NMI context.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Link: https://lore.kernel.org/bpf/20220902211058.60789-13-alexei.starovoitov@gmail.com
Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 kernel/bpf/verifier.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7049a85a78ab..77a75ccaae5e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11700,35 +11700,6 @@ static int check_map_prog_compatibility(struct bpf_verifier_env *env,
 
 {
 	enum bpf_prog_type prog_type = resolve_prog_type(prog);
-	/*
-	 * Validate that trace type programs use preallocated hash maps.
-	 *
-	 * For programs attached to PERF events this is mandatory as the
-	 * perf NMI can hit any arbitrary code sequence.
-	 *
-	 * All other trace types using preallocated hash maps are unsafe as
-	 * well because tracepoint or kprobes can be inside locked regions
-	 * of the memory allocator or at a place where a recursion into the
-	 * memory allocator would see inconsistent state.
-	 *
-	 * On RT enabled kernels run-time allocation of all trace type
-	 * programs is strictly prohibited due to lock type constraints. On
-	 * !RT kernels it is allowed for backwards compatibility reasons for
-	 * now, but warnings are emitted so developers are made aware of
-	 * the unsafety and can fix their programs before this is enforced.
-	 */
-	if (is_tracing_prog_type(prog_type) && !is_preallocated_map(map)) {
-		if (prog_type == BPF_PROG_TYPE_PERF_EVENT) {
-			verbose(env, "perf_event programs can only use preallocated hash map\n");
-			return -EINVAL;
-		}
-		if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
-			verbose(env, "trace type programs can only use preallocated hash map\n");
-			return -EINVAL;
-		}
-		WARN_ONCE(1, "trace type BPF program uses run-time allocation\n");
-		verbose(env, "trace type programs with run-time allocated hash maps are unsafe. Switch to preallocated hash maps.\n");
-	}
 
 	if (map_value_has_spin_lock(map)) {
 		if (prog_type == BPF_PROG_TYPE_SOCKET_FILTER) {
-- 
2.49.0

