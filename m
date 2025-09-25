Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7C2EC550
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792988; cv=none; b=olTYD72BKz0u/hJszcuS5RLn60TmRM03Ki8MSiRdKUIkDdF2tBWviU53eoA9SMRwXOfixv4+yaa2h1PHSmvaNLktt0wqPoc5BRip4fLD1M8vWgESohBqAGzo6Ms3H7dCebJENDZAaWrL8YKdjbEfFcgSyhkYwM6zIg1abSLFV4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792988; c=relaxed/simple;
	bh=rTyTIq2Gt2gZfhvU599hCfa9TalaA8vvAUh5cmEGHjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQ1mmWAjap56RcjXGfuJtABt6PUXudTSyqB6NO05+ptkTbdWeyr1u8G0wMGKEBlSGKhZhfmLooHMh4MmmR1AHT1bGSshFBWPWxZGrHyTmqXM2to36C4eFHKs/QOWdKoi31Eppl8h11y/jqk4HMq+dKRQygdXlHZzZlZGUIxRWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmsGXHAu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmsGXHAu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4F76141D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLdcD6Fbhaf4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 774376131D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774376131D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lmsGXHAu
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 774376131D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b30409fed8dso12880166b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792983; x=1759397783; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5P9HAgv0spV6XAbBHSQmLkVBFZMqhz0/VJATkPbzJU=;
        b=lmsGXHAu5CHwhKR53ZGNyD0QxkBfeiZUHXfZbXl4ffQxGITMsSRK05tcNQb/3yeE2D
         s+qYpSeZhgVIOz7piyKXJ/UIbjhUYBVVH6O16qTiO0S8wEtFXbYdoK3WgvsLaBUzpulo
         mwrYfTUD+mD7y3vKepP8W9m9zEPiU7LQDvCPSXEvcD0jsdG1bq6GPGKqp7dQMpxrsXKq
         NoeLJ4SG+lPk1XrllDWKILjURaQ+3eGrN3mefQuXzP4yP9T3hYe8oVLA2nZ+xSXt6kek
         p8qFC7GE6jWq7kfGY3uI0nRbOAjo2YTS/HfOe1/FXKFaunLa0ZyIYXLzwSD43baXT1HE
         Wkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792983; x=1759397783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5P9HAgv0spV6XAbBHSQmLkVBFZMqhz0/VJATkPbzJU=;
        b=UnMe9ZWbCiY6iWaGd5S6wo2wE+ykWSQ2ciRjc5xOub90JTIFSZaxpURFl4f4JCVpvj
         cmPDOcAWG+Q9AF6TqWTL2epu5d78q7YWf77pfmWZc7+8IObQ918DbS+zPLkrGiApTm40
         BsvDgwoh7UnWqqtzPEr0cxGyVp14n+BSKIb40yyfpe4NmAGvixuaiCf+/s8cg+A0jIT7
         s1xrtWSfpseyQwTnIeEwhS9f8S1RhcVg+pRf++uqW16L0Ot9WYsdShNhjoj03C6D8xYu
         uoRnz0jwwCbFZFBTgTuwDl/FWIAK6Rqf/OL2SClMykufs+hS2vXk7hk8VN+yqrqiD6IU
         lGKw==
X-Forwarded-Encrypted: i=1; AJvYcCXCrJmCSdOM0tnoLKASip9o+5/f4XW+qpYlJOWPo+8KK1h0y0AIVAwovW35Gu5eoeL9Vac7B9Rg9VbFPSo7x32fw6N7SQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQC+KbJqDtqMhruzWZENOLny6Vwy5p66Emg8SNRfAyXRdLWjAv
	bn+a8n8ipiJIJDlyW+tEVzpJP2jv9dkYeZBaeO22a5CaHSra6A6UFnLQ
X-Gm-Gg: ASbGncvwl0ju5x8y5LoScGP9kunwOQ7pXcakKbehRcCo2J1KUQmCVJVjAKQAd7saAbD
	RjRbkfh1Blq4l18ogam7b1X7KszTnyFYeJQfBYWHkQp1Kj5JCsaaPlZWDqoycO0sdCkvRs1oWeU
	0y6xuxyAKbTMHAPZgmzRHgnp4WVrXLXT5ycB2QrwuKcQifpmRW6yPwJIqSQgz5vnNLFr8Iod5GY
	Weh34m4i6Wh2E1b47dUfoTV0hZkLgzVv7rontzj9YMnAycbXZpLdpNhKnCJNRPEtE5WoyJduTVN
	T/l4jAObKAR0SAd5VXcHxOxjBEHYWmPSCZs7L/lbw/8iScS9484zsj48IfoPS3feJNgWOmjNfEl
	VahmU7ZUNR3O9dVVFUsEsoJgNbgM=
X-Google-Smtp-Source: AGHT+IHcM6qkfDyv/1e8fv53As/ulPyDAGJd3thgnBDOPvu2/mrkEMoViXuKAJywV6PNSzaebMjldQ==
X-Received: by 2002:a17:907:6d11:b0:b1e:cfab:834c with SMTP id a640c23a62f3a-b34b4be4f65mr163980066b.0.1758792983194;
        Thu, 25 Sep 2025 02:36:23 -0700 (PDT)
Received: from bhk ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm941225a12.24.2025.09.25.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:36:22 -0700 (PDT)
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
Subject: [PATCH v3 3/3] selftests/bpf: Prepare to add -Wsign-compare for bpf tests
Date: Thu, 25 Sep 2025 11:35:41 +0100
Message-ID: <20250925103559.14876-4-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Change only variable types for correct sign comparisons

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_xdp_dynptr.c          | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp_loop.c            | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp_noinline.c        | 4 ++--
 tools/testing/selftests/bpf/progs/uprobe_multi.c             | 4 ++--
 .../selftests/bpf/progs/uprobe_multi_session_recursive.c     | 5 +++--
 .../selftests/bpf/progs/verifier_iterating_callbacks.c       | 2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c b/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
index 67a77944ef29..12ad0ec91021 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
@@ -89,7 +89,7 @@ static __always_inline int handle_ipv4(struct xdp_md *xdp, struct bpf_dynptr *xd
 	struct vip vip = {};
 	int dport;
 	__u32 csum = 0;
-	int i;
+	size_t i;
 
 	__builtin_memset(eth_buffer, 0, sizeof(eth_buffer));
 	__builtin_memset(iph_buffer_tcp, 0, sizeof(iph_buffer_tcp));
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_loop.c b/tools/testing/selftests/bpf/progs/test_xdp_loop.c
index 93267a68825b..e9b7bbff5c23 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_loop.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_loop.c
@@ -85,7 +85,7 @@ static __always_inline int handle_ipv4(struct xdp_md *xdp)
 	struct vip vip = {};
 	int dport;
 	__u32 csum = 0;
-	int i;
+	size_t i;
 
 	if (iph + 1 > data_end)
 		return XDP_DROP;
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c b/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
index fad94e41cef9..85ef3c0a3e20 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
@@ -372,7 +372,7 @@ bool encap_v4(struct xdp_md *xdp, struct ctl_value *cval,
 
 	next_iph_u16 = (__u16 *) iph;
 	__pragma_loop_unroll_full
-	for (int i = 0; i < sizeof(struct iphdr) >> 1; i++)
+	for (size_t i = 0; i < sizeof(struct iphdr) >> 1; i++)
 		csum += *next_iph_u16++;
 	iph->check = ~((csum & 0xffff) + (csum >> 16));
 	if (bpf_xdp_adjust_head(xdp, (int)sizeof(struct iphdr)))
@@ -423,7 +423,7 @@ int send_icmp_reply(void *data, void *data_end)
 	iph->check = 0;
 	next_iph_u16 = (__u16 *) iph;
 	__pragma_loop_unroll_full
-	for (int i = 0; i < sizeof(struct iphdr) >> 1; i++)
+	for (size_t i = 0; i < sizeof(struct iphdr) >> 1; i++)
 		csum += *next_iph_u16++;
 	iph->check = ~((csum & 0xffff) + (csum >> 16));
 	return swap_mac_and_send(data, data_end);
diff --git a/tools/testing/selftests/bpf/progs/uprobe_multi.c b/tools/testing/selftests/bpf/progs/uprobe_multi.c
index 44190efcdba2..f99957773c3a 100644
--- a/tools/testing/selftests/bpf/progs/uprobe_multi.c
+++ b/tools/testing/selftests/bpf/progs/uprobe_multi.c
@@ -20,13 +20,13 @@ __u64 uretprobe_multi_func_3_result = 0;
 
 __u64 uprobe_multi_sleep_result = 0;
 
-int pid = 0;
+__u32 pid = 0;
 int child_pid = 0;
 int child_tid = 0;
 int child_pid_usdt = 0;
 int child_tid_usdt = 0;
 
-int expect_pid = 0;
+__u32 expect_pid = 0;
 bool bad_pid_seen = false;
 bool bad_pid_seen_usdt = false;
 
diff --git a/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c b/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c
index 8fbcd69fae22..017f1859ebe8 100644
--- a/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c
+++ b/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c
@@ -3,6 +3,7 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 #include <stdbool.h>
+#include <stddef.h>
 #include "bpf_kfuncs.h"
 #include "bpf_misc.h"
 
@@ -10,8 +11,8 @@ char _license[] SEC("license") = "GPL";
 
 int pid = 0;
 
-int idx_entry = 0;
-int idx_return = 0;
+size_t idx_entry = 0;
+size_t idx_return = 0;
 
 __u64 test_uprobe_cookie_entry[6];
 __u64 test_uprobe_cookie_return[3];
diff --git a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
index 75dd922e4e9f..72f9f8c23c93 100644
--- a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
+++ b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
@@ -593,7 +593,7 @@ int loop_inside_iter_volatile_limit(const void *ctx)
 {
 	struct bpf_iter_num it;
 	int *v, sum = 0;
-	__u64 i = 0;
+	__s32 i = 0;
 
 	bpf_iter_num_new(&it, 0, ARR2_SZ);
 	while ((v = bpf_iter_num_next(&it))) {
-- 
2.51.0

