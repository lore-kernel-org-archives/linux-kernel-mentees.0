Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C48EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 13:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4D1B404F6;
	Mon, 10 Jul 2023 13:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4D1B404F6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VaDMWo/D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zu03z4RMkxkg; Mon, 10 Jul 2023 13:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE126400CF;
	Mon, 10 Jul 2023 13:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE126400CF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB5A3C0072;
	Mon, 10 Jul 2023 13:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10888C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D7D40220
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D7D40220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVX34rnsYZtr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:05:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED430400CF
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED430400CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:05:11 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b700e85950so65920381fa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688994310; x=1691586310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yuCQJnbemlgFFPZWsFNXaAIe6zz+6UmyaU+BFnlr21U=;
 b=VaDMWo/DY3QxQMwYzEnritcrz0veQlEHLTHyVkvopbeWdMui4cbsiCNnQvIPiIY3hP
 Z/mbbhDjDFR7B0/gH2LCsjuHQnqIxPTBEcMPcpOkK2PLGmBAignnwZontk5F/VnjSQ01
 E/rkhubmmmEQyqfyg9gK48abIbrVISNPYhR7GI3kg5QPL/0SPmAs2uHavOqA2XPV5pi7
 LOGah95Gw+C76Ratj1CD/szLsc+LleWRXvQpACYYpa4ZfR7qzO261saerrtoI5We9Iu+
 viYDnFKZGJOD6XI2HeKeysoTkYGhnYFOdotVuIP2DcH0CS/bCx3x3PzgWiPJtiFOnwl6
 BI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688994310; x=1691586310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuCQJnbemlgFFPZWsFNXaAIe6zz+6UmyaU+BFnlr21U=;
 b=fSbjCze0eZPG4WewSDXBfGD+ulhWisxSgv330P7qwTmRxxzx6OICi+qVmK0mIhDqsD
 6S3kONuU6AkhM8A1XeE4RtJjh9LafU5pVZAecxtSvFO5msISjfWv/DXVQa8fjNuujNMs
 YWbus86pzMcVVQlwoCC42hAOa/c+WQ/TAsOPTSrJ62oTJZxNAtF5rY2CTi+Ac5ZcU8G8
 bUyLIzrLrSaM3ed7Uxvv41xYg5lu/nztBaBSIMffqdwKAQpdgcaq2zS5yQzz5kqbJ8oB
 TAKsrhKvxVFosZlPT1uTkNfd2jc66uPjmyKlwYseQntTcd8Wz2uSJ+uUK9e+T8t/+hfN
 Dm+w==
X-Gm-Message-State: ABy/qLaO0UnFeKBfbVuICm0fjvJHUscveD9D/bv9bKUKMTmmCuczWZbf
 9grFvqsi5TMc38rUjr7e8RI=
X-Google-Smtp-Source: APBJJlF7a5vl4MaVsFv0mXytCXE/ZB2j506raAw2PtlG/xixDbkLsgXvaP4GQsxJy/xw5zJFsI8OMQ==
X-Received: by 2002:a2e:9b8f:0:b0:2b6:d57f:d81 with SMTP id
 z15-20020a2e9b8f000000b002b6d57f0d81mr9434546lji.53.1688994309427; 
 Mon, 10 Jul 2023 06:05:09 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:535c:656e:34e4:18d9:8e8c])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c025200b003fbca942499sm10224631wmj.14.2023.07.10.06.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 06:05:08 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v0] selftests/bpf: replace manual array size calc with
 ARRAYSIZE.
Date: Mon, 10 Jul 2023 17:04:48 +0400
Message-Id: <20230710130448.1558118-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

fixes coccinelle warnings due to manual calculation of array size.

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
 tools/testing/selftests/bpf/progs/syscall.c          | 6 +++++-
 tools/testing/selftests/bpf/progs/test_rdonly_maps.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/syscall.c b/tools/testing/selftests/bpf/progs/syscall.c
index e550f728962d..9cc25d93c601 100644
--- a/tools/testing/selftests/bpf/progs/syscall.c
+++ b/tools/testing/selftests/bpf/progs/syscall.c
@@ -27,6 +27,10 @@ struct args {
 	BTF_TYPE_ENC(name, BTF_INFO_ENC(BTF_KIND_INT, 0, 0), sz), \
 	BTF_INT_ENC(encoding, bits_offset, bits)
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
+#endif
+
 static int btf_load(void)
 {
 	struct btf_blob {
@@ -82,7 +86,7 @@ int bpf_prog(struct args *ctx)
 	static __u64 value = 34;
 	static union bpf_attr prog_load_attr = {
 		.prog_type = BPF_PROG_TYPE_XDP,
-		.insn_cnt = sizeof(insns) / sizeof(insns[0]),
+		.insn_cnt = ARRAY_SIZE(insns),
 	};
 	int ret;
 
diff --git a/tools/testing/selftests/bpf/progs/test_rdonly_maps.c b/tools/testing/selftests/bpf/progs/test_rdonly_maps.c
index fc8e8a34a3db..7431936ab26c 100644
--- a/tools/testing/selftests/bpf/progs/test_rdonly_maps.c
+++ b/tools/testing/selftests/bpf/progs/test_rdonly_maps.c
@@ -21,6 +21,10 @@ struct {
 	unsigned sum;
 } res = {};
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
+#endif
+
 SEC("raw_tracepoint/sys_enter:skip_loop")
 int skip_loop(struct pt_regs *ctx)
 {
@@ -64,7 +68,7 @@ int full_loop(struct pt_regs *ctx)
 {
 	/* prevent compiler to optimize everything out */
 	unsigned * volatile p = (void *)&rdonly_values.a;
-	int i = sizeof(rdonly_values.a) / sizeof(rdonly_values.a[0]);
+	int i = ARRAY_SIZE(rdonly_values.a);
 	unsigned iters = 0, sum = 0;
 
 	/* validate verifier can allow full loop as well */
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
