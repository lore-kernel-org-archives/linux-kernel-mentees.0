Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45E2E9ED6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792974; cv=none; b=EvVW9w6LBGALl00ctft4vI5LDD8LTx/p0EGLVEY5PAKxByKgoD1KW8GyD4NcsKqdi4+ouZcXO3QQof9Fj142EdK4F7hK0/46Ebfel5N/GApi5rpOVMAVf99zFGiFHrzYqpsvrJn+bRRCtB93Vk3gEXIiFAEVu83HJRSNEmWjfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792974; c=relaxed/simple;
	bh=rvmn/9fNBwLXiR/naWUZlKBH+/yw0HMGHd9myyptFrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVPD/KKK2da1yhure5Oi90u95bjm2pwu1e/0gxqE7UhIrOWDfRXsh8Q3T6SGD9wJngwnCMFqfNNvGPfeK0QAy9lFHKzOgGdsqpPztOBJ3s4t6vdhu79mc4e5ZSRRE8e7F5ZElEF7YBl3roy1zJTXbhrsgfWJenAsDkpqO10H9S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sogk52Xm; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sogk52Xm"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DF0640BE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gajor8qvCrcR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CB2A40BAE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB2A40BAE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sogk52Xm
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8CB2A40BAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-633b4861b79so88995a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792969; x=1759397769; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrLk5BVUfi64hDu8MSXp4iRz7KC+EB7RrIoytg966TM=;
        b=Sogk52XmYOlJ4nPzoCcoFrUuPOu/7UD4jTE5pH8n5qtdpyWcfkca15lDlYwUXOuAkW
         +WklAeDjOxD8pr7/oOli+ZJhqpJzs0wBwIqtnnbD76g1QHdnpRET0JGMFzDc1459N/Pw
         MxgYgat5GlKlvTSksTNLwInPNhZ49okwfeLAAhr1ylSFJkw8tgxzWhVlcssHbLSNAcvg
         Tx9RfDeW5MzgMtMBdwWFqtdSBNgAVbeCusPOJg98qgBLVlMPzlvnsANXdSsOEhs0Bktt
         fdrlrLuTelduvvzMUQ5xc8siV2hy2XDSWcKyZOMO9dYuPaR6/STp35FqyE5o+CxV9KAB
         0lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792969; x=1759397769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrLk5BVUfi64hDu8MSXp4iRz7KC+EB7RrIoytg966TM=;
        b=H+3VIL2eL3vzABgApOT5MZ5eFnmwPPi6QLtI2dujZ9NptBNLidA8eKPaNFL20s5SXP
         m/xaijW3M79R7TcMe1rGoFpuj2oBIDWwtqioBRxYcO77dSSYv0knhmeF7jQit3oDrnbK
         Nnv2HrgEfoTFVklAoklqwgEs3xB7pTWTZw17qpXvVPEkq1p0cJTXjfn+AoaZJLAIShFB
         vmZS6czfhZ5/gIp3ypwxtHzAwrPgAy046CMemHwhucg1d0ehBPPu8qrBeU2MiwoipZ2w
         D2v0ZSR7jJEdgcMPm2PVHOLtiGw4c+wzz3dO5MZPTr+BPrXJGxhcRE3p9ydEfCdEQkIc
         kVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXElgcrZfMpJ0SpQAivAYQ+yFk/d552/AKOS25KA1X0zt8wp5xguVxgWpIkAXeqzZJ1FLb6O7OVNQrfSksJemVfpo8b7Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwhEY9X9v2uAT/zcbY99jGuS+YsiYE9wpjxCAdTrtqSJptGXuYb
	6mt+kqVdh83A/yzjKzy1kOzJocy817Mj9V2tsT/V5GPpXibofNeD/28L
X-Gm-Gg: ASbGnctwZi3JTH+kPf8t91zzfJ++A6oTGT3JiXDDuL42RJ4DvMGOoTu93+KaHnw4jmQ
	rNIYlrBn0f2ZD1CpaTapQ4c9WnjmlXE13eL3Cwb/JdtWj2GelzialpA6rA02CQdlwkr+dqzpCJp
	zPBJg5d6CrcGMcECtF+FAs5QzefyUWSvMlatGPOlMh1aIfER+hZ8RPWfM6yfrnv7cTbZkf4NlY/
	SesBFCuA4mGLPhd3Tm4X//1+mD4mJDiVC7bqjEfs3xydSJttNRmIHEUVCEryy2rDgV5h9taRwZ3
	8AoIrGmqvOvp/zDedb95Z2y2IrNpTfei/fw2XfZB0BlfsfHFwMlsSSOTufkd106pJtPLZ2dlc9/
	LWQ57xFIY8WOMay4K60KfW2jA4jblCyL2m9nA8A==
X-Google-Smtp-Source: AGHT+IEn+TRY3f3rNpLqKcwo/IFO0X1TqRBrGc61qVTD+XlR37lk96NhcpagZXDaWeHbktL+5wxb3A==
X-Received: by 2002:a05:6402:4389:b0:628:d1b5:d207 with SMTP id 4fb4d7f45d1cf-6349f9d26b0mr1238596a12.2.1758792969099;
        Thu, 25 Sep 2025 02:36:09 -0700 (PDT)
Received: from bhk ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm941225a12.24.2025.09.25.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:36:08 -0700 (PDT)
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
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	linux@jordanrome.com,
	ameryhung@gmail.com,
	toke@redhat.com,
	houtao1@huawei.com,
	emil@etsalapatis.com,
	yatsenko@meta.com,
	isolodrai@meta.com,
	a.s.protopopov@gmail.com,
	dxu@dxuuu.xyz,
	memxor@gmail.com,
	vmalik@redhat.com,
	bigeasy@linutronix.de,
	tj@kernel.org,
	gregkh@linuxfoundation.org,
	paul@paul-moore.com,
	bboscaccy@linux.microsoft.com,
	James.Bottomley@HansenPartnership.com,
	mrpre@163.com,
	jakub@cloudflare.com
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v3 0/3] selftests/bpf: Prepare to add -Wsign-compare for bpf selftests
Date: Thu, 25 Sep 2025 11:35:38 +0100
Message-ID: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is preparing to add the -Wsign-compare C compilation flag to
the Makefile for bpf selftests as requested by a TODO to help avoid
implicit type conversions and have predictable behavior.

Changelog:

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

Mehdi Ben Hadj Khelifa (3):
  selftests/bpf: Prepare to add -Wsign-compare for bpf tests
  selftests/bpf: Prepare to add -Wsign-compare for bpf tests
  selftests/bpf: Prepare to add -Wsign-compare for bpf tests

 tools/testing/selftests/bpf/progs/test_global_func11.c       | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func12.c       | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func13.c       | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func9.c        | 2 +-
 tools/testing/selftests/bpf/progs/test_map_init.c            | 2 +-
 tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c   | 2 +-
 .../selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c      | 2 +-
 tools/testing/selftests/bpf/progs/test_skb_ctx.c             | 2 +-
 tools/testing/selftests/bpf/progs/test_snprintf.c            | 2 +-
 tools/testing/selftests/bpf/progs/test_sockmap_strp.c        | 2 +-
 tools/testing/selftests/bpf/progs/test_tc_tunnel.c           | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp.c                 | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp_dynptr.c          | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp_loop.c            | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp_noinline.c        | 4 ++--
 tools/testing/selftests/bpf/progs/uprobe_multi.c             | 4 ++--
 .../selftests/bpf/progs/uprobe_multi_session_recursive.c     | 5 +++--
 .../selftests/bpf/progs/verifier_iterating_callbacks.c       | 2 +-
 18 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.51.0

