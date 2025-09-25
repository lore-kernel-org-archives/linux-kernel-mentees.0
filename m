Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4F2EBDC5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792983; cv=none; b=FDxH6pygREQrXHhgcrN1btju/cUnh6rNwSEdj1wzZ4bmFtRq/Mvt/Nti+QHUbBT4XZfWnNVZOd/tmmdC/E93K0vvASuCFqoSkL0L3GqhlmOfO2BNcOpLdWWcNawh5ACEfcnDtZe2jphR73F9djeS7P8lsJINQsGsy8xcl+HCOL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792983; c=relaxed/simple;
	bh=2mG7qJ2Y78I9Q0KSuXQ2NjcyY7f58p+CSBWSScj2RH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sy3zivm84WxKDOSEMN4ZiA6ouuGa8Z+TKYP4PrEzxWUCOP4w9fpgC7nBP7HzJpr6MvSQYXAmubXkYijHuLJGFU0lLV5bsIzX4lXcUdUupfVQND5lIA+1VqaobUYwUZEVftIQ65s1YSID05LK75EVI9in0oUm7L3Sy8HY+IPgzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzO/Pvz3; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzO/Pvz3"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1969040BE6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ3vJkOqbHo3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E0EC40B6D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0EC40B6D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YzO/Pvz3
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E0EC40B6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:20 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62fe4a1d872so83682a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792979; x=1759397779; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NO0ayIYXnbf5RnG1Y4914ZaMA9kHmb//RoVl9SUlrOU=;
        b=YzO/Pvz3kn0Pw7WjNqvZ3tbNT+isQ6JEoMa7EbGUDmdFivKgLaC2SvCyzWzSZEDAks
         FztKBV7F4FFWt9Tjip5tbY5l3LwSsLqlQ5S2XjVX5hy7UuvNIrE6pamAkzANe72ri220
         JgmWon33xlLY0UbLoZsbS8ZQ10Tm4OtCT+bwWSC9nsLwU+fwmFeY+/VONEIGVH6swB69
         bqMC/JPZNMBhswDce4s1Qgb3vguJmNkEV+fK+Exc7khftwr44tYvQcWVQUFuucCNKo1T
         uIRXw1upcNy2oMJ28KUuAICn+fqnO8xaNRShrJA1R+C1y6+AgeCDlggGvIxEV3/6R7jm
         Pg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792979; x=1759397779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO0ayIYXnbf5RnG1Y4914ZaMA9kHmb//RoVl9SUlrOU=;
        b=nhFvGRF6ShBWAUAO0vBgJfcgVTgBcibkrXqprZnGOpR9k5aQHD00GgsJEWkl4Luj6f
         7l7bnM5hpH5djc5fxKbL6Ps8J63Ng3rAuqETU/LCRp/60LYxmZUGDOdVJO+/9xdt7SwA
         pRwumv68DDCu4xdJBfOudMe6jpFRkbjvWhHapzqIZovzxP8rPGS+NK0oyaCTwCDzDzjR
         0EmWxX5uLkD8t4BxwOXM+zEqdj6ZYfN3RslhM9Tyv/0gwZhCc0JNJNEh3howswuWok6o
         G7WE+EFqzKUcw5iRyov5ocFe3INNkqhBQbpAWCdwpniSTNY5urJkC0s7EGjz0b1Z9qoC
         KMMg==
X-Forwarded-Encrypted: i=1; AJvYcCXNSD1jXVkT2IPvtwMDiGmSICBwPPWvARs9/wwHNzetvDYdNhmmajhkxJjNRo9t8Og0TRY6CS430Z6w5uq4YpTyxxHmaQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywyw9bBgOW7LRA4ZbCmKvBkeY/LMoq4BoNm7FV6LDyf5h0R1JDu
	y91al21fnoKx0/9MjZQpfrdrjYUElugKUKnAuV0/KwprGOfmomwSVU3p
X-Gm-Gg: ASbGnctk+/BeTXV0PKgrwhJwrwwN+5h4qP5TBYEhCx70Ks6hyHMhTEffp0vgX1s/6p8
	Q0kxDdZqWCtjF5L7PQS7Acbea1DtudkQrn0DLtAsZxC02/iO8iub7ZIjevmw8hsjoJpQkjNFoXu
	U2BwY//B92xPNIZ5+QjvC20rSuhyMQR+b7y9q1dXzcFVyskIyIl+TtMd+rnyMSTmmHVIO3UpKwE
	PtDuB1EMC0UFE9v53RSIz3GHVMdIJ4BoVS4dZNArxyOPP/3AeVJvDSZxPJzQzG9pZ9NYCRVDN2y
	S8HL91sx/S3IhLbJRGzaRqi8mTDxUf+ukyPAjcmqyBPS4G5CVjOjbIoe0q3lMYcFQ9no25I7geG
	GjksSrpjCGUjhl73cuksDNser3/o=
X-Google-Smtp-Source: AGHT+IFkTu6BAV9MTy9Y6rsh5K7Jn/6CmW5NkfDaEMgjEkpbreaY6/Rf17vMqmExro0hPJr0iXu7CA==
X-Received: by 2002:a50:cc47:0:b0:62f:a79a:f61f with SMTP id 4fb4d7f45d1cf-6349f6d3d08mr947935a12.0.1758792978630;
        Thu, 25 Sep 2025 02:36:18 -0700 (PDT)
Received: from bhk ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm941225a12.24.2025.09.25.02.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:36:17 -0700 (PDT)
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
Subject: [PATCH v3 2/3] selftests/bpf: Prepare to add -Wsign-compare for bpf tests
Date: Thu, 25 Sep 2025 11:35:40 +0100
Message-ID: <20250925103559.14876-3-mehdi.benhadjkhelifa@gmail.com>
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
 .../testing/selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c | 2 +-
 tools/testing/selftests/bpf/progs/test_skb_ctx.c                | 2 +-
 tools/testing/selftests/bpf/progs/test_snprintf.c               | 2 +-
 tools/testing/selftests/bpf/progs/test_sockmap_strp.c           | 2 +-
 tools/testing/selftests/bpf/progs/test_tc_tunnel.c              | 2 +-
 tools/testing/selftests/bpf/progs/test_xdp.c                    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c b/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c
index dc6e43bc6a62..bf3ac5c2938c 100644
--- a/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c
+++ b/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c
@@ -100,7 +100,7 @@ int xdp_ingress_v6(struct xdp_md *xdp)
 	off += sizeof(struct tcphdr);
 
 	/* max number of bytes of options in tcp header is 40 bytes */
-	for (int i = 0; i < tcp_hdr_opt_max_opt_checks; i++) {
+	for (__u32 i = 0; i < tcp_hdr_opt_max_opt_checks; i++) {
 		err = parse_hdr_opt(&ptr, &off, &hdr_bytes_remaining, &server_id);
 
 		if (err || !hdr_bytes_remaining)
diff --git a/tools/testing/selftests/bpf/progs/test_skb_ctx.c b/tools/testing/selftests/bpf/progs/test_skb_ctx.c
index a724a70c6700..7939a2edc414 100644
--- a/tools/testing/selftests/bpf/progs/test_skb_ctx.c
+++ b/tools/testing/selftests/bpf/progs/test_skb_ctx.c
@@ -11,7 +11,7 @@ SEC("tc")
 int process(struct __sk_buff *skb)
 {
 	__pragma_loop_unroll_full
-	for (int i = 0; i < 5; i++) {
+	for (__u32 i = 0; i < 5; i++) {
 		if (skb->cb[i] != i + 1)
 			return 1;
 		skb->cb[i]++;
diff --git a/tools/testing/selftests/bpf/progs/test_snprintf.c b/tools/testing/selftests/bpf/progs/test_snprintf.c
index 8fda07544023..1aa4835da71a 100644
--- a/tools/testing/selftests/bpf/progs/test_snprintf.c
+++ b/tools/testing/selftests/bpf/progs/test_snprintf.c
@@ -4,7 +4,7 @@
 #include <linux/bpf.h>
 #include <bpf/bpf_helpers.h>
 
-__u32 pid = 0;
+int pid = 0;
 
 char num_out[64] = {};
 long num_ret = 0;
diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_strp.c b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
index dde3d5bec515..e9675c45d8ef 100644
--- a/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
+++ b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
@@ -2,7 +2,7 @@
 #include <linux/bpf.h>
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_endian.h>
-int verdict_max_size = 10000;
+__u32 verdict_max_size = 10000;
 struct {
 	__uint(type, BPF_MAP_TYPE_SOCKMAP);
 	__uint(max_entries, 20);
diff --git a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
index 404124a93892..c7e2d4571a2b 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
@@ -80,7 +80,7 @@ static __always_inline void set_ipv4_csum(struct iphdr *iph)
 {
 	__u16 *iph16 = (__u16 *)iph;
 	__u32 csum;
-	int i;
+	size_t i;
 
 	iph->check = 0;
 
diff --git a/tools/testing/selftests/bpf/progs/test_xdp.c b/tools/testing/selftests/bpf/progs/test_xdp.c
index 8caf58be5818..ce2a9ae26088 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp.c
@@ -89,7 +89,7 @@ static __always_inline int handle_ipv4(struct xdp_md *xdp)
 	struct vip vip = {};
 	int dport;
 	__u32 csum = 0;
-	int i;
+	size_t i;
 
 	if (iph + 1 > data_end)
 		return XDP_DROP;
-- 
2.51.0

