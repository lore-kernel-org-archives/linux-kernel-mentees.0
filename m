Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02CB313539
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963535; cv=none; b=G2fOZBOVHK1HNO+DAbuHQ5j4/qoq1r2wXFgTgdt+ADNXneYifWvxwjCcWir083QOlx/dpduq7RLX8dYaMV9n4z02x3E9Isb29ujXRrcn1yVPUJ3ckhyb5gjGVdttc4cCC0XugnaNEPKR4Trz8BNSUIJwHI2DKG6ae0qHsVRCpkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963535; c=relaxed/simple;
	bh=yEU8OlJ4rnmeVIIFVpJYprNmuPl3V5iccAvk0qJgLRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHvH/XuTSblNlgbjBjnGORo4s8hJNQNjEGTEtTee47zk8g7RIk657j061gFH4N1oDjJKYmw/Scfi6Ntfjua6rR1KUOCIhWPnS+6C6opRp9jg3TNhziJQg7HdwzgmMxk03DFYsGp8o9sGb5Gxl+Co3l9qFSQoLzQgt41AJvcfBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0EQVtnw; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0EQVtnw"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656588445B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 12:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyp2Z5TCo12s for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 12:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B00FB8445A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00FB8445A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U0EQVtnw
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B00FB8445A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 12:32:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3df81b1486so82611966b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760963529; x=1761568329; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrHAmJjxM6ewOAgZH2FCw4tTUkBr/4mUYIaDeASxNLM=;
        b=U0EQVtnwYLg4O4h2Nsw7lfaRJm82XwFDw8aQEVwZQwwjS43T/Qr7PPoyfFqtNLF1X7
         kW4HMH0t9S8kY7a72Z0UpPtGiQYBOh27YIgb5GxIaNBYECRaxYRwXJ0Ix7f0ZLgwyBdr
         YCz0gWCQq4HowyjOFPIG+zT7VtBPRh2uZUB+ANvkosUEa6CyAGGU68RGqtles2Ee2Xfq
         cL3ilamW6bVoTBBQugwiaqfKjZC5CSBlw02i9U4elWada4MPCQDtGQ5YWqKXp0Ra4LMd
         0qgYn/uAmWf0B6oBFc+Ny+CRBQu+kmsNXDFkQMUTi5HS1fmHeV7kp7BhaWG/Yf9ua/AW
         TPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963529; x=1761568329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrHAmJjxM6ewOAgZH2FCw4tTUkBr/4mUYIaDeASxNLM=;
        b=fgW+3XXfq1k3alw/2wk7UY7D8Izi4PvtJh2IjDkKYtv0ijareHr39ZNXfFVPVMfN3C
         NJYdRupFjKyWRf7jENJoNa+B98C2L+U2q59q7+nyiYydEnoiSyHPyjf+1MiKi+QXb7jq
         D5Si/vqniQrhxNxs3toXSqcbM0yVNBhZzJI5gXYSQCRBAOLYazBLhz/yvsm/1zKcO7FA
         h5VAM/Ay2/PpVlNQNoR6RM7Wv5d672dbmiLpVB8hpUmIHITpMgXKf8obyydako/DgrQ6
         +raGDBe143JNVfi/59+yUmkpvIeBj1D1xJjB07t7tzI7Hnj8dO3hoSaVjcpdEIz82/Rz
         46Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWYWUEpMUpJ/Y1bqrCl1aT22XG1+AF/m6Rf6ik3wSoyOW54TuCEGK4PE8koMIKUQiin+D77dWU89SxSFRHypgboBkBhgw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxv6Ylj5Kiy2iQTPtAQm6UZHvVglq4vvXFCAfrkDHRgynMXfGIQ
	FjRsxa3XTe1swQgOqICySN5KRQUEeXorw5pp46PpvBJi152n/5MWsIBJ
X-Gm-Gg: ASbGnct2OZArhuEOqbVqmGJHWeneUIWZD+mMVUCDLNjSVZYimeytoQLCxzo0fUYwc9L
	QydZZr90o++f2hHlohoGFfg1w8MkYNpMsJg6HKHWHQsmKGDSwkiDEGYc6Y+hWeI7n1/sV0VrWJc
	r6YVeqgXZxbmj2wBtosuQ0b1jkSHFsaZ//rq7fZO61IKnHDT8gTcP8k+N6Sa8tO3jUY3Zi3mcOp
	x6YRUZK1KMxgcfRYFjMHebcZ4AUpknGVW8+WrpYsGRO3+b1PorK1BLijSr7/zUOA2/0Omtcoll6
	19NG8tRu+pJAsYL8vUcamBzMxqQPlNNuO0VewbzwAM7Rzrs0vB9oZsgVIP3kwBUq9n7zPkjFQbI
	tsT67DZYunAfgYeO45qyKC9rDq0Ipp+dXcVoQX8rKxUdQWElQ31x10ysRqIuU80ZFHyLc7vAEYx
	Qw4NQ=
X-Google-Smtp-Source: AGHT+IHeviqrSd93w8iK4mCEl/S4LfRu1LVX2pbSgOi06QmgOak3XwTymoUDcoiO7hQie9VFAZ5kLw==
X-Received: by 2002:a17:906:641:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b65c8b81515mr400301266b.6.1760963528918;
        Mon, 20 Oct 2025 05:32:08 -0700 (PDT)
Received: from bhk ([165.50.81.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm787095166b.73.2025.10.20.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:32:08 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	ameryhung@gmail.com,
	toke@redhat.com
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v4] selftests/bpf: Change variable types for -Wsign-compare
Date: Mon, 20 Oct 2025 14:31:33 +0100
Message-ID: <20251020133156.215326-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow up patch for commit 495d2d8133fd("selftests/bpf: Attempt
to build BPF programs with -Wsign-compare") from Alexei Starovoitov[1]
to be able to enable -Wsign-compare C compilation flag for clang since
-Wall doesn't add it and BPF programs are built with clang.This has the
benefit to catch problematic comparisons in future tests as quoted from
the commit message:"
  int i = -1;
  unsigned int j = 1;
  if (i < j) // this is false.

  long i = -1;
  unsigned int j = 1;
  if (i < j) // this is true.

C standard for reference:

- If either operand is unsigned long the other shall be converted to 
unsigned long.

- Otherwise, if one operand is a long int and the other unsigned int,
then if a long int can represent all the values of an unsigned int,
the unsigned int shall be converted to a long int;
otherwise both operands shall be converted to unsigned long int.

- Otherwise, if either operand is long, the other shall be 
converted to long.

- Otherwise, if either operand is unsigned, the other shall be
converted to unsigned.

Unfortunately clang's -Wsign-compare is very noisy.
It complains about (s32)a == (u32)b which is safe and doen't
have surprising behavior."

This specific patch supresses the following warnings when
-Wsign-compare is enabled:

1 warning generated.

progs/bpf_iter_bpf_percpu_array_map.c:35:16: warning: comparison of 
integers of different signs: 'int' and 'const volatile __u32' 
(aka 'const volatile unsigned int') [-Wsign-compare]
   35 |         for (i = 0; i < num_cpus; i++) {
      |                     ~ ^ ~~~~~~~~

1 warning generated.

progs/bpf_qdisc_fifo.c:93:2: warning: comparison of integers of 
different signs: 'int' and '__u32' 
(aka 'unsigned int') [-Wsign-compare]
   93 |         bpf_for(i, 0, sch->q.qlen) {
      |         ^       ~     ~~~~~~~~~~~

Should be noted that many more similar changes are still needed in order
to be able to enable the -Wsign-compare flag since -Werror is enabled and
would cause compilation of bpf selftests to fail.

[1].
Link:https://github.com/torvalds/linux/commit/495d2d8133fd1407519170a5238f455abbd9ec9b

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes from v3:

-Downsized the patch as suggested by vivek yadav[2].

-Changed the commit message as suggested by Daniel Borkmann[3].

Link:https://lore.kernel.org/all/20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com/#r

Changes from v2:

-Split up the patch into a patch series as suggested by vivek

-Include only changes to variable types with no casting by my mentor
david

-Removed the -Wsign-compare in Makefile to avoid compilation errors
until adding casting for rest of comparisons.

Link:https://lore.kernel.org/bpf/20250924195731.6374-1-mehdi.benhadjkhelifa@gmail.com/T/#u

Changes from v1:

- Fix CI failed builds where it failed due to do missing .c and
.h files in my patch for working in mainline.

Link:https://lore.kernel.org/bpf/20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com/T/#u

[2]:https://lore.kernel.org/all/CABPSWR7_w3mxr74wCDEF=MYYuG2F_vMJeD-dqotc8MDmaS_FpQ@mail.gmail.com/
[3]:https://lore.kernel.org/all/5ad26663-a3cc-4bf4-9d6f-8213ac8e8ce6@iogearbox.net/
 .../testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c | 2 +-
 tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
index 9fdea8cd4c6f..0baf00463f35 100644
--- a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
+++ b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
@@ -24,7 +24,7 @@ int dump_bpf_percpu_array_map(struct bpf_iter__bpf_map_elem *ctx)
 	__u32 *key = ctx->key;
 	void *pptr = ctx->value;
 	__u32 step;
-	int i;
+	__u32 i;
 
 	if (key == (void *)0 || pptr == (void *)0)
 		return 0;
diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c b/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c
index 1de2be3e370b..7a639dcb23a9 100644
--- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c
+++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c
@@ -88,7 +88,7 @@ void BPF_PROG(bpf_fifo_reset, struct Qdisc *sch)
 {
 	struct bpf_list_node *node;
 	struct skb_node *skbn;
-	int i;
+	__u32 i;
 
 	bpf_for(i, 0, sch->q.qlen) {
 		struct sk_buff *skb = NULL;
-- 
2.51.1.dirty

